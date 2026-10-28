-- Manchester City - Sunderland: kickoff 19 Eyl 17:00 → 20 Eyl 16:00 (Premier Lig)

UPDATE public.events
SET
  start_date = ('2026-09-20 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-20 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Manchester City - Sunderland'
   OR title = 'Manchester City 0 - 0 Sunderland';
