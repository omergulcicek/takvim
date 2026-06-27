import { describe, expect, it } from 'vitest'

import { findHijriOccurrenceInGregorianYear } from '@/lib/hijri-calendar'

describe('hijri-calendar', () => {
  it('aligns Ramazan events with Diyanet Ramazan başlangıcı in 2026', () => {
    expect(findHijriOccurrenceInGregorianYear(2026, 9, 1)).toEqual({
      gy: 2026,
      gm: 2,
      gd: 18,
    })
    expect(findHijriOccurrenceInGregorianYear(2026, 9, 17)).toEqual({
      gy: 2026,
      gm: 3,
      gd: 6,
    })
  })

  it('aligns Kerbela with Diyanet Aşure in 2026', () => {
    expect(findHijriOccurrenceInGregorianYear(2026, 1, 10)).toEqual({
      gy: 2026,
      gm: 6,
      gd: 24,
    })
  })

  it('aligns Veda Haccı with Kurban arefesi in 2026', () => {
    expect(findHijriOccurrenceInGregorianYear(2026, 12, 9)).toEqual({
      gy: 2026,
      gm: 5,
      gd: 25,
    })
  })
})
