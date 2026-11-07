-- Süper Lig 21-22 Kasım maçlarının kesin tarih ve saatleri (12:00 placeholder netleşti).
-- ESPN + FotMob iki kaynakta aynı. Galatasaray - Samsunspor 22 Kasım değil, 21 Kasım'da oynanıyor.

UPDATE public.events
SET
  start_date = ('2026-11-21 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-21 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Samsunspor'
  AND start_date = ('2026-11-22 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-21 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-21 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Kocaelispor - Fenerbahçe'
  AND start_date = ('2026-11-22 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-22 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-22 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Konyaspor - Beşiktaş'
  AND start_date = ('2026-11-22 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-22 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-22 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Eyüpspor'
  AND start_date = ('2026-11-22 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
