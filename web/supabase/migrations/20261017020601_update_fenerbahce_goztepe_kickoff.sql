-- Fenerbahçe - Göztepe kickoff: 01.11 12:00 placeholder → 31.10 19:00

UPDATE public.events
SET
  start_date = ('2026-10-31 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-31 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Fenerbahçe - Göztepe'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
