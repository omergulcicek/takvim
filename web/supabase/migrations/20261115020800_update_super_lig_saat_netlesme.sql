-- Süper Lig 14. hafta (29-30 Kasım) placeholder saatleri netleştirildi (ESPN + FotMob aynı).
-- Göztepe-Trabzonspor ve Beşiktaş-Galatasaray 30 Kasım'a alındı.

UPDATE public.events
SET
  start_date = ('2026-11-29 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-29 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Fenerbahçe - Erzurumspor FK'
  AND start_date = ('2026-11-29 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-30 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-30 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Göztepe - Trabzonspor'
  AND start_date = ('2026-11-29 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-30 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-30 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Galatasaray'
  AND start_date = ('2026-11-29 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
