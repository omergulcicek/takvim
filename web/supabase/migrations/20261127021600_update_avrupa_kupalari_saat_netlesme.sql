-- 10 Aralık 2026 maçlarının kesin başlama saatleri (12:00 placeholder yerine)

-- Trabzonspor - Jablonec: 20:45 (TR), bitiş +2 saat
UPDATE takvim.events
SET
  start_date = ('2026-12-10 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-12-10 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Jablonec'
  AND start_date = ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- Bayer Leverkusen - Beşiktaş: 23:00 (TR), bitiş 01:00
UPDATE takvim.events
SET
  start_date = ('2026-12-10 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-12-10 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Bayer Leverkusen - Beşiktaş'
  AND start_date = ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
