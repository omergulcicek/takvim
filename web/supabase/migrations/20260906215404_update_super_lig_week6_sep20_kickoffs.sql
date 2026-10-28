-- Süper Lig 6. hafta: TFF onaylı 20 Eylül kickoff güncellemesi

UPDATE public.events
SET
  start_date = ('2026-09-20 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-20 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Fenerbahçe - Eyüpspor'
  AND start_date = ('2026-09-20 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-09-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Amed SK - Beşiktaş'
  AND start_date = ('2026-09-20 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
