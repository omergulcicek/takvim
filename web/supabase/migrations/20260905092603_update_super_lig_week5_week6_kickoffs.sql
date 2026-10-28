-- Süper Lig 5–6. hafta: TFF onaylı kickoff güncellemesi

UPDATE public.events
SET
  start_date = ('2026-09-11 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-11 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Erzurumspor FK'
  AND start_date = ('2026-09-13 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-09-12 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-12 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Konyaspor - Trabzonspor'
  AND start_date = ('2026-09-13 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-09-13 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-13 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Kocaelispor'
  AND start_date = ('2026-09-13 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-09-14 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-14 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Gaziantep FK - Fenerbahçe'
  AND start_date = ('2026-09-13 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-09-19 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-19 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Galatasaray'
  AND start_date = ('2026-09-20 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
