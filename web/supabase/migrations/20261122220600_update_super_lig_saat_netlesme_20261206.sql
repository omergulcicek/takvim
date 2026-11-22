-- 6 Aralık 2026 Süper Lig maçlarının kesin saatleri (ESPN, FotMob, Livescore aynı)

UPDATE public.events
SET
  start_date = ('2026-12-06 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-12-06 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Samsunspor'
  AND start_date = ('2026-12-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-12-06 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-12-06 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Çorum FK'
  AND start_date = ('2026-12-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
