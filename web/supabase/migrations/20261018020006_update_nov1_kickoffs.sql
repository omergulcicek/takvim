-- 1 Kasım Süper Lig maçlarının kesinleşen başlama saatleri

UPDATE public.events
SET
  start_date = ('2026-11-01 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-11-01 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Kasımpaşa - Beşiktaş'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-01 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-11-01 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Gaziantep FK'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
