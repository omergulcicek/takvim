-- Süper Lig 8 Kasım placeholder (12:00) saatleri netleştirildi; Galatasaray - Amed SK 7 Kasım 19:00'a alındı.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

UPDATE public.events
SET
  start_date = ('2026-11-07 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-07 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Amed SK'
  AND start_date = ('2026-11-08 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-08 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-08 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Çorum FK - Fenerbahçe'
  AND start_date = ('2026-11-08 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-08 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-08 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Alanyaspor - Trabzonspor'
  AND start_date = ('2026-11-08 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-08 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-11-08 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Gençlerbirliği'
  AND start_date = ('2026-11-08 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
