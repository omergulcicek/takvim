import { addDays, startOfDay } from 'date-fns'

import type { CalendarEvent } from '@/components/month-calendar'
import {
  findHijriOccurrenceInGregorianYear,
  turkeyTimestamptzRange,
} from '@/lib/hijri-calendar'
import type { HijriDateFields } from '@/lib/hijri-date'
import type {
  CategoryRef,
  EventGregorianDateRow,
  EventRow,
  Recurrence,
  SubjectRef,
} from '@/lib/queries/events'

function hijriFieldsFromRow(row: EventRow): HijriDateFields | null {
  if (row.calendar_system !== 'hijri') return null
  return {
    calendarSystem: row.calendar_system,
    hijriMonth: row.hijri_month,
    hijriDay: row.hijri_day,
    hijriEndMonth: row.hijri_end_month,
    hijriEndDay: row.hijri_end_day,
    hijriRule: row.hijri_rule,
  }
}

// Kaynak tarihler Türkiye saatine (UTC+3) göre yazılmıştır.
export const EVENT_SOURCE_UTC_OFFSET_MINUTES = 180

export const RECURRENCE_WINDOW_YEARS_BEFORE = 2
export const RECURRENCE_WINDOW_YEARS_AFTER = 5

function extractCategory(category: EventRow['category']): CategoryRef | null {
  if (!category) return null
  if (Array.isArray(category)) return category[0] ?? null
  return category
}

function extractSubject(subject: EventRow['subject']): SubjectRef | null {
  if (!subject) return null
  if (Array.isArray(subject)) return subject[0] ?? null
  return subject
}

function extractGregorianDates(
  dates: EventRow['gregorian_dates'],
): EventGregorianDateRow[] {
  if (!dates) return []
  return Array.isArray(dates) ? dates : [dates]
}

export function wallClockParts(date: Date) {
  const shifted = new Date(
    date.getTime() + EVENT_SOURCE_UTC_OFFSET_MINUTES * 60_000,
  )
  return {
    year: shifted.getUTCFullYear(),
    month: shifted.getUTCMonth(),
    day: shifted.getUTCDate(),
    hours: shifted.getUTCHours(),
    minutes: shifted.getUTCMinutes(),
    seconds: shifted.getUTCSeconds(),
  }
}

function turkeySingleDayEnd(start: Date): Date {
  const { year, month, day } = wallClockParts(start)
  return new Date(Date.UTC(year, month, day, 20, 59, 59))
}

function wallClockDate(date: Date): Date {
  const { year, month, day, hours, minutes, seconds } = wallClockParts(date)
  return new Date(year, month, day, hours, minutes, seconds)
}

function isMultiDayAllDayRange(
  row: EventRow,
  rangeStart: Date,
  rangeEnd: Date,
): boolean {
  if (!(row.is_all_day ?? false)) return false

  const startDay = startOfDay(wallClockDate(rangeStart))
  const endDay = startOfDay(wallClockDate(rangeEnd))
  if (startDay.getTime() >= endDay.getTime()) return false

  // Bayram gibi Hicri bitiş günü tanımlı çok günlü olaylar takvimde tüm günlerde görünür.
  return row.hijri_end_month != null && row.hijri_end_day != null
}

function resolveRangeEnd(
  rangeStart: Date,
  rangeEnd: string | null | undefined,
  row: EventRow,
): Date {
  if (rangeEnd) return new Date(rangeEnd)

  if (
    row.hijri_month != null &&
    row.hijri_day != null &&
    row.hijri_end_month != null &&
    row.hijri_end_day != null &&
    row.hijri_end_month === row.hijri_month
  ) {
    const daySpan = row.hijri_end_day - row.hijri_day
    if (daySpan > 0) {
      const endWall = addDays(startOfDay(wallClockDate(rangeStart)), daySpan)
      return new Date(
        Date.UTC(
          endWall.getFullYear(),
          endWall.getMonth(),
          endWall.getDate(),
          20,
          59,
          59,
        ),
      )
    }
  }

  return rangeStart
}

function computeChipDurationMs(
  chipStart: Date,
  rangeStart: Date,
  rangeEnd: Date,
  hasOccurrence: boolean,
  row: EventRow,
) {
  if (isMultiDayAllDayRange(row, rangeStart, rangeEnd)) {
    return Math.max(0, rangeEnd.getTime() - chipStart.getTime())
  }

  if (hasOccurrence) {
    return turkeySingleDayEnd(chipStart).getTime() - chipStart.getTime()
  }

  return Math.max(0, rangeEnd.getTime() - chipStart.getTime())
}

function buildCalendarEvent(
  row: EventRow,
  chipStart: Date,
  chipDurationMs: number,
  displayRangeStart: Date,
  displayRangeEnd: Date,
  category: CategoryRef | null,
  subject: SubjectRef | null,
  occurrenceKey: string,
): CalendarEvent {
  const { month, day, hours, minutes, seconds } = wallClockParts(chipStart)
  const occStart = new Date(
    wallClockParts(chipStart).year,
    month,
    day,
    hours,
    minutes,
    seconds,
  )
  const occEnd = new Date(occStart.getTime() + chipDurationMs)

  return {
    id: occurrenceKey,
    title: row.title,
    start: occStart,
    end: occEnd,
    displayStart: wallClockDate(displayRangeStart),
    displayEnd: wallClockDate(displayRangeEnd),
    allDay: row.is_all_day ?? false,
    categorySlug: category?.slug ?? null,
    categoryName: category?.name ?? null,
    categoryDesc: category?.desc ?? null,
    description: row.description ?? subject?.description ?? null,
    location: row.location,
    sourceUrl: row.source_url ?? subject?.source_url ?? null,
    hijri: hijriFieldsFromRow(row),
  }
}

function makeGregorianYearlyOccurrence(
  row: EventRow,
  chipStart: Date,
  durationMs: number,
  displayRangeStart: Date,
  displayRangeEnd: Date,
  category: CategoryRef | null,
  subject: SubjectRef | null,
  targetYear: number,
): CalendarEvent {
  const { month, day, hours, minutes, seconds } = wallClockParts(chipStart)
  const occStart = new Date(targetYear, month, day, hours, minutes, seconds)
  const occEnd = new Date(occStart.getTime() + durationMs)

  return {
    id: `${row.id}-${targetYear}`,
    title: row.title,
    start: occStart,
    end: occEnd,
    displayStart: wallClockDate(displayRangeStart),
    displayEnd: wallClockDate(displayRangeEnd),
    allDay: row.is_all_day ?? false,
    categorySlug: category?.slug ?? null,
    categoryName: category?.name ?? null,
    categoryDesc: category?.desc ?? null,
    description: row.description ?? subject?.description ?? null,
    location: row.location,
    sourceUrl: row.source_url ?? subject?.source_url ?? null,
  }
}

function expandGregorianEvent(row: EventRow): CalendarEvent[] {
  if (!row.start_date) return []

  const rangeStart = new Date(row.start_date)
  const rangeEnd = resolveRangeEnd(rangeStart, row.end_date, row)
  const chipStart = row.occurrence_date
    ? new Date(row.occurrence_date)
    : rangeStart
  const durationMs = computeChipDurationMs(
    chipStart,
    rangeStart,
    rangeEnd,
    row.occurrence_date != null,
    row,
  )
  const category = extractCategory(row.category)
  const subject = extractSubject(row.subject)
  const recurrence: Recurrence =
    row.recurrence === 'none' ? 'none' : 'yearly'

  if (recurrence === 'none') {
    return [
      buildCalendarEvent(
        row,
        chipStart,
        durationMs,
        rangeStart,
        rangeEnd,
        category,
        subject,
        row.id,
      ),
    ]
  }

  const currentYear = new Date().getFullYear()
  const occurrences: CalendarEvent[] = []
  for (
    let year = currentYear - RECURRENCE_WINDOW_YEARS_BEFORE;
    year <= currentYear + RECURRENCE_WINDOW_YEARS_AFTER;
    year++
  ) {
    occurrences.push(
      makeGregorianYearlyOccurrence(
        row,
        chipStart,
        durationMs,
        rangeStart,
        rangeEnd,
        category,
        subject,
        year,
      ),
    )
  }
  return occurrences
}

function expandHijriEvent(row: EventRow): CalendarEvent[] {
  const category = extractCategory(row.category)
  const subject = extractSubject(row.subject)
  const currentYear = new Date().getFullYear()
  const minYear = currentYear - RECURRENCE_WINDOW_YEARS_BEFORE
  const maxYear = currentYear + RECURRENCE_WINDOW_YEARS_AFTER

  const overrideByYear = new Map(
    extractGregorianDates(row.gregorian_dates).map((entry) => [
      entry.gregorian_year,
      entry,
    ]),
  )

  const occurrences: CalendarEvent[] = []

  for (let year = minYear; year <= maxYear; year++) {
    const override = overrideByYear.get(year)
    let rangeStart: Date
    let rangeEnd: Date
    let chipStart: Date
    let hasOccurrence: boolean

    if (override) {
      rangeStart = new Date(override.start_date)
      rangeEnd = resolveRangeEnd(rangeStart, override.end_date, row)
      chipStart = override.occurrence_date
        ? new Date(override.occurrence_date)
        : rangeStart
      hasOccurrence = override.occurrence_date != null
    } else if (
      row.hijri_month != null &&
      row.hijri_day != null &&
      row.hijri_rule == null
    ) {
      const parts = findHijriOccurrenceInGregorianYear(
        year,
        row.hijri_month,
        row.hijri_day,
      )
      if (!parts) continue

      const range = turkeyTimestamptzRange(parts)
      rangeStart = new Date(range.startDate)
      rangeEnd = resolveRangeEnd(rangeStart, range.endDate, row)
      chipStart = new Date(range.occurrenceDate)
      hasOccurrence = true
    } else {
      continue
    }

    const durationMs = computeChipDurationMs(
      chipStart,
      rangeStart,
      rangeEnd,
      hasOccurrence,
      row,
    )

    occurrences.push(
      buildCalendarEvent(
        row,
        chipStart,
        durationMs,
        rangeStart,
        rangeEnd,
        category,
        subject,
        `${row.id}-${year}`,
      ),
    )
  }

  return occurrences
}

export function expandEvent(row: EventRow): CalendarEvent[] {
  if (row.calendar_system === 'hijri' || row.recurrence === 'hijri_yearly') {
    return expandHijriEvent(row)
  }

  return expandGregorianEvent(row)
}
