-- Süper Lig 4. hafta: TFF UEFA sonrası kickoff güncellemesi

UPDATE public.events
SET
  start_date = ('2026-09-04 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-04 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
WHERE title = 'Başakşehir - Galatasaray'
  AND start_date = ('2026-09-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-09-05 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-05 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
WHERE title = 'Fenerbahçe - Beşiktaş'
  AND start_date = ('2026-09-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
