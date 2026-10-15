-- Konyaspor - Galatasaray kickoff: 01.11 12:00 placeholder → 30.10 20:00

UPDATE public.events
SET
  start_date = ('2026-10-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Konyaspor - Galatasaray'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
