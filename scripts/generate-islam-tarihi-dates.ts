#!/usr/bin/env node
/**
 * İslam Tarihi event_gregorian_dates SQL üretir (2026–2035).
 * pnpm exec tsx scripts/generate-islam-tarihi-dates.ts
 */
import { writeFileSync } from 'node:fs'

import {
  findHijriOccurrenceInGregorianYear,
  turkeyTimestamptzRange,
} from '../src/lib/hijri-calendar.ts'

const EVENTS: Array<{ title: string; hm: number; hd: number }> = [
  {
    title: 'Bedir Savaşı',
    hm: 9,
    hd: 17,
  },
  {
    title: 'Uhud Savaşı',
    hm: 10,
    hd: 7,
  },
  {
    title: "Mekke'nin Fethi",
    hm: 9,
    hd: 20,
  },
  {
    title: 'Veda Haccı',
    hm: 12,
    hd: 9,
  },
  {
    title: "Hz. Muhammed'in Vefatı",
    hm: 3,
    hd: 12,
  },
  {
    title: 'Kerbela',
    hm: 1,
    hd: 10,
  },
  {
    title: 'Hendek Savaşı',
    hm: 11,
    hd: 5,
  },
  {
    title: 'Hudeybiye Antlaşması',
    hm: 11,
    hd: 6,
  },
  {
    title: "Hayber'in Fethi",
    hm: 1,
    hd: 7,
  },
  {
    title: "Hz. Ömer'in Şehadeti",
    hm: 12,
    hd: 26,
  },
  {
    title: "Kudüs'ün Geri Alınması (1187)",
    hm: 7,
    hd: 27,
  },
]

const START_YEAR = 2026
const END_YEAR = 2035

const lines: string[] = [
  '-- Miladi tarih override\'ları (2026–2035, Diyanet anchor + Hicri dönüşüm).',
  '-- scripts/generate-islam-tarihi-dates.ts ile üretilmiştir.',
  '',
]

for (const event of EVENTS) {
  lines.push(`-- ${event.title}`)
  for (let year = START_YEAR; year <= END_YEAR; year++) {
    const parts = findHijriOccurrenceInGregorianYear(year, event.hm, event.hd)
    if (!parts) {
      console.error(`No date for ${event.title} in ${year}`)
      continue
    }
    const range = turkeyTimestamptzRange(parts)
    const escapedTitle = event.title.replace(/'/g, "''")
    lines.push(
      `INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)`,
    )
    lines.push(
      `SELECT e.id, ${year}, '${range.startDate}'::timestamptz, '${range.endDate}'::timestamptz, '${range.occurrenceDate}'::timestamptz`,
    )
    lines.push(`FROM public.events e`)
    lines.push(`JOIN public.categories c ON c.id = e.category_id`)
    lines.push(
      `WHERE c.slug = 'islam-tarihi' AND e.title = '${escapedTitle}'`,
    )
    lines.push(
      `ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;`,
    )
    lines.push('')
  }
}

const outPath = new URL(
  '../supabase/migrations/20260627210000_add_islam_tarihi_dates.generated.sql',
  import.meta.url,
)
writeFileSync(outPath, lines.join('\n'))
console.log(`Wrote ${outPath.pathname}`)
