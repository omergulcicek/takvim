import { describe, expect, it } from 'vitest'

import type { CalendarEvent } from '@/components/month-calendar'
import { serializeCalendarFeed } from '@/lib/feeds/ics'

describe('serializeCalendarFeed', () => {
  it('emits a valid all-day event block', () => {
    const events: CalendarEvent[] = [
      {
        id: 'event-2026',
        title: 'Test Günü',
        start: new Date(2026, 0, 1),
        end: new Date(2026, 0, 1, 23, 59, 59),
        allDay: true,
        categorySlug: 'dini-gunler',
        categoryName: 'Dini Günler',
        description: 'Açıklama satırı',
        location: null,
        sourceUrl: 'https://example.com/kaynak',
      },
    ]

    const ics = serializeCalendarFeed(events, 'Dini Günler')

    expect(ics).toContain('BEGIN:VCALENDAR')
    expect(ics).toContain('X-WR-CALNAME:Dini Günler')
    expect(ics).toContain('UID:event-2026@')
    expect(ics).toContain('SUMMARY:Test Günü')
    expect(ics).toContain('DTSTART;VALUE=DATE:20260101')
    expect(ics).toContain('DTEND;VALUE=DATE:20260102')
    expect(ics).toContain('CATEGORIES:Dini Günler')
    expect(ics).toContain('END:VCALENDAR')
  })
})
