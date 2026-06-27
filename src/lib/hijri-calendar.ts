import { addDays } from 'date-fns'
import { toGregorian } from 'hijri-converter'

import { DIYANET_HIJRI_ANCHORS, type DianetHijriAnchor } from '@/lib/diyanet-hijri-anchors'

export type GregorianParts = {
  gy: number
  gm: number
  gd: number
}

export type TurkeyTimestamptzRange = {
  startDate: string
  endDate: string
  occurrenceDate: string
}

const anchorsByAhMonth = new Map<string, DianetHijriAnchor[]>()

for (const anchor of DIYANET_HIJRI_ANCHORS) {
  const key = `${anchor.ah}-${anchor.hm}`
  const list = anchorsByAhMonth.get(key) ?? []
  list.push(anchor)
  anchorsByAhMonth.set(key, list)
}

function partsToUtcDate({ gy, gm, gd }: GregorianParts): Date {
  return new Date(Date.UTC(gy, gm - 1, gd, 0, 0, 0))
}

function hijriMonthLength(ah: number, hm: number): number {
  const start = toGregorian(ah, hm, 1)
  const nextHm = hm === 12 ? 1 : hm + 1
  const nextAh = hm === 12 ? ah + 1 : ah
  const next = toGregorian(nextAh, nextHm, 1)
  const startDate = partsToUtcDate(start)
  const nextDate = partsToUtcDate(next)
  return Math.round((nextDate.getTime() - startDate.getTime()) / 86_400_000)
}

function resolveFromDiyanetAnchors(
  ah: number,
  hm: number,
  hd: number,
): GregorianParts | null {
  const monthAnchors = anchorsByAhMonth.get(`${ah}-${hm}`)
  if (monthAnchors?.length) {
    const anchor = monthAnchors.reduce((best, current) =>
      Math.abs(current.hd - hd) < Math.abs(best.hd - hd) ? current : best,
    )
    const anchorDate = partsToUtcDate(anchor)
    const resolved = addDays(anchorDate, hd - anchor.hd)
    return {
      gy: resolved.getUTCFullYear(),
      gm: resolved.getUTCMonth() + 1,
      gd: resolved.getUTCDate(),
    }
  }

  for (let month = hm - 1; month >= 1; month--) {
    const earlierAnchors = anchorsByAhMonth.get(`${ah}-${month}`)
    if (!earlierAnchors?.length) continue

    const anchor = earlierAnchors.find((entry) => entry.hd === 1) ?? earlierAnchors[0]
    let dayOffset = hd - 1
    for (let walk = month; walk < hm; walk++) {
      dayOffset += hijriMonthLength(ah, walk)
    }
    const anchorDate = partsToUtcDate(anchor)
    const resolved = addDays(anchorDate, dayOffset - (anchor.hd - 1))
    return {
      gy: resolved.getUTCFullYear(),
      gm: resolved.getUTCMonth() + 1,
      gd: resolved.getUTCDate(),
    }
  }

  return null
}

export function hijriToGregorianParts(
  ah: number,
  hm: number,
  hd: number,
): GregorianParts {
  const fromAnchors = resolveFromDiyanetAnchors(ah, hm, hd)
  if (fromAnchors) return fromAnchors
  return toGregorian(ah, hm, hd)
}

export function findHijriOccurrenceInGregorianYear(
  gregorianYear: number,
  hijriMonth: number,
  hijriDay: number,
): GregorianParts | null {
  const minAh = gregorianYear - 623
  const maxAh = gregorianYear - 577

  for (let ah = minAh; ah <= maxAh; ah++) {
    const parts = hijriToGregorianParts(ah, hijriMonth, hijriDay)
    if (parts.gy === gregorianYear) return parts
  }
  return null
}

export function turkeyTimestamptzRange(
  parts: GregorianParts,
): TurkeyTimestamptzRange {
  const pad = (value: number) => String(value).padStart(2, '0')
  const startDate = `${parts.gy}-${pad(parts.gm)}-${pad(parts.gd)} 21:00:00+00`

  const endUtc = addDays(partsToUtcDate(parts), 1)
  const endDate = `${endUtc.getUTCFullYear()}-${pad(endUtc.getUTCMonth() + 1)}-${pad(endUtc.getUTCDate())} 17:59:59+00`

  return {
    startDate,
    endDate,
    occurrenceDate: startDate,
  }
}
