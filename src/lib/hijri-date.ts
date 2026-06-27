import { format, isSameMonth, isSameYear } from 'date-fns'
import { tr } from 'date-fns/locale'

import type { CalendarSystem, HijriRule } from '@/lib/queries/events'

export type HijriDateFields = {
  calendarSystem: CalendarSystem | null
  hijriMonth: number | null
  hijriDay: number | null
  hijriEndMonth: number | null
  hijriEndDay: number | null
  hijriRule: HijriRule | null
}

const HIJRI_MONTH_NAMES: Record<number, string> = {
  1: 'Muharrem',
  2: 'Safer',
  3: 'Rebiülevvel',
  4: 'Rebiülahir',
  5: 'Cemaziyelevvel',
  6: 'Cemaziyelahir',
  7: 'Receb',
  8: 'Şaban',
  9: 'Ramazan',
  10: 'Şevval',
  11: 'Zilkade',
  12: 'Zilhicce',
}

function hijriMonthName(month: number): string {
  return HIJRI_MONTH_NAMES[month] ?? String(month)
}

export function formatHijriLabel(fields: HijriDateFields): string | null {
  if (fields.calendarSystem !== 'hijri') return null

  if (fields.hijriRule === 'first_friday_of_month' && fields.hijriMonth != null) {
    return `Hicri ${hijriMonthName(fields.hijriMonth)} ayının ilk Cuma gecesi`
  }

  if (fields.hijriMonth == null || fields.hijriDay == null) return null

  const startMonth = hijriMonthName(fields.hijriMonth)
  const hasEnd =
    fields.hijriEndDay != null &&
    (fields.hijriEndMonth == null || fields.hijriEndMonth === fields.hijriMonth)

  if (hasEnd && fields.hijriEndDay !== fields.hijriDay) {
    return `Hicri ${fields.hijriDay}–${fields.hijriEndDay} ${startMonth}`
  }

  if (
    fields.hijriEndMonth != null &&
    fields.hijriEndDay != null &&
    fields.hijriEndMonth !== fields.hijriMonth
  ) {
    return `Hicri ${fields.hijriDay} ${startMonth} – ${fields.hijriEndDay} ${hijriMonthName(fields.hijriEndMonth)}`
  }

  return `Hicri ${fields.hijriDay} ${startMonth}`
}

function formatGregorianDay(date: Date): string {
  return format(date, 'd MMMM yyyy', { locale: tr })
}

function formatGregorianRange(start: Date, end: Date): string {
  if (isSameDayEquivalent(start, end)) {
    return formatGregorianDay(start)
  }

  if (isSameMonth(start, end) && isSameYear(start, end)) {
    return `${format(start, 'd', { locale: tr })}–${format(end, 'd MMMM yyyy', { locale: tr })}`
  }

  if (isSameYear(start, end)) {
    return `${format(start, 'd MMMM', { locale: tr })} – ${format(end, 'd MMMM yyyy', { locale: tr })}`
  }

  return `${formatGregorianDay(start)} – ${formatGregorianDay(end)}`
}

function isSameDayEquivalent(a: Date, b: Date): boolean {
  return (
    a.getFullYear() === b.getFullYear() &&
    a.getMonth() === b.getMonth() &&
    a.getDate() === b.getDate()
  )
}

export function formatEventDateWithHijri(
  dateStart: Date,
  dateEnd: Date,
  isMultiDay: boolean,
  hijri: HijriDateFields | null,
): string {
  const gregorian = isMultiDay
    ? formatGregorianRange(dateStart, dateEnd)
    : formatGregorianDay(dateStart)

  const hijriLabel = hijri ? formatHijriLabel(hijri) : null
  if (!hijriLabel) return gregorian

  return `${gregorian} - ${hijriLabel}`
}
