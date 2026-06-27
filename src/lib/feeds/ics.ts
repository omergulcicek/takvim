import { addDays, startOfDay } from 'date-fns'

import type { CalendarEvent } from '@/components/month-calendar'
import { getSiteHostname, getSiteUrl } from '@/lib/site-url'

function escapeIcsText(value: string): string {
  return value
    .replace(/\\/g, '\\\\')
    .replace(/\n/g, '\\n')
    .replace(/;/g, '\\;')
    .replace(/,/g, '\\,')
}

function formatIcsUtcStamp(date: Date): string {
  return date
    .toISOString()
    .replace(/[-:]/g, '')
    .replace(/\.\d{3}Z$/, 'Z')
}

function formatIcsDate(date: Date): string {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  return `${year}${month}${day}`
}

function formatIcsDateTime(date: Date): string {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  const seconds = String(date.getSeconds()).padStart(2, '0')
  return `${year}${month}${day}T${hours}${minutes}${seconds}`
}

function foldIcsLine(line: string): string {
  const maxLength = 75
  if (line.length <= maxLength) return line

  const chunks: string[] = [line.slice(0, maxLength)]
  let offset = maxLength
  while (offset < line.length) {
    chunks.push(` ${line.slice(offset, offset + maxLength - 1)}`)
    offset += maxLength - 1
  }
  return chunks.join('\r\n')
}

function buildDescription(event: CalendarEvent): string | null {
  const parts: string[] = []
  if (event.description) {
    parts.push(event.description)
  }
  if (event.categoryName) {
    parts.push(`Kategori: ${event.categoryName}`)
  }
  if (event.sourceUrl) {
    parts.push(`Kaynak: ${event.sourceUrl}`)
  }
  return parts.length > 0 ? parts.join('\n\n') : null
}

function calendarEventToLines(
  event: CalendarEvent,
  hostname: string,
  dtStamp: string,
): string[] {
  const lines = ['BEGIN:VEVENT']
  lines.push(`UID:${escapeIcsText(`${event.id}@${hostname}`)}`)
  lines.push(`DTSTAMP:${dtStamp}`)
  lines.push(`SUMMARY:${escapeIcsText(event.title)}`)

  const description = buildDescription(event)
  if (description) {
    lines.push(`DESCRIPTION:${escapeIcsText(description)}`)
  }

  if (event.location) {
    lines.push(`LOCATION:${escapeIcsText(event.location)}`)
  }

  if (event.sourceUrl) {
    lines.push(`URL:${escapeIcsText(event.sourceUrl)}`)
  }

  if (event.categoryName) {
    lines.push(`CATEGORIES:${escapeIcsText(event.categoryName)}`)
  }

  if (event.allDay) {
    const rangeStart = startOfDay(event.displayStart ?? event.start)
    const rangeEnd = startOfDay(event.displayEnd ?? event.end)
    const dtEndExclusive = addDays(rangeEnd, 1)
    lines.push(`DTSTART;VALUE=DATE:${formatIcsDate(rangeStart)}`)
    lines.push(`DTEND;VALUE=DATE:${formatIcsDate(dtEndExclusive)}`)
  } else {
    lines.push(`DTSTART;TZID=Europe/Istanbul:${formatIcsDateTime(event.start)}`)
    lines.push(`DTEND;TZID=Europe/Istanbul:${formatIcsDateTime(event.end)}`)
  }

  lines.push('END:VEVENT')
  return lines
}

export function serializeCalendarFeed(
  events: CalendarEvent[],
  calName: string,
): string {
  const hostname = getSiteHostname()
  const dtStamp = formatIcsUtcStamp(new Date())
  const siteUrl = getSiteUrl()

  const lines = [
    'BEGIN:VCALENDAR',
    'VERSION:2.0',
    'CALSCALE:GREGORIAN',
    'METHOD:PUBLISH',
    `PRODID:-//${hostname}//Takvim//TR`,
    `X-WR-CALNAME:${escapeIcsText(calName)}`,
    `X-WR-TIMEZONE:Europe/Istanbul`,
    'BEGIN:VTIMEZONE',
    'TZID:Europe/Istanbul',
    'X-LIC-LOCATION:Europe/Istanbul',
    'BEGIN:STANDARD',
    'TZOFFSETFROM:+0300',
    'TZOFFSETTO:+0300',
    'TZNAME:+03',
    'DTSTART:19700101T000000',
    'END:STANDARD',
    'END:VTIMEZONE',
  ]

  for (const event of events) {
    lines.push(...calendarEventToLines(event, hostname, dtStamp))
  }

  lines.push(`SOURCE:${escapeIcsText(siteUrl)}`)
  lines.push('REFRESH-INTERVAL;VALUE=DURATION:PT6H')
  lines.push('X-PUBLISHED-TTL:PT6H')
  lines.push('END:VCALENDAR')

  return lines.map(foldIcsLine).join('\r\n') + '\r\n'
}

export function buildFeedFilename(
  categorySlugs: string[] | 'all',
): string {
  if (categorySlugs === 'all') return 'all.ics'
  if (categorySlugs.length === 1) return `${categorySlugs[0]}.ics`
  return 'subscribe.ics'
}

export function createCalendarFeedResponse(
  events: CalendarEvent[],
  calName: string,
  filename: string,
): Response {
  const body = serializeCalendarFeed(events, calName)
  return new Response(body, {
    headers: {
      'Content-Type': 'text/calendar; charset=utf-8',
      'Content-Disposition': `inline; filename="${filename}"`,
      'Cache-Control': 'public, max-age=3600',
    },
  })
}
