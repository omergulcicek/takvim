-- Süper Lig 3. hafta: TFF programına göre kickoff saatleri (12:00 placeholder → net saat)

UPDATE public.events
SET
  start_date = ('2026-08-29 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-29 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Göztepe'
  AND start_date = ('2026-08-30 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-08-30 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-30 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Samsunspor - Fenerbahçe'
  AND start_date = ('2026-08-30 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-08-31 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-31 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Çorum FK'
  AND start_date = ('2026-08-30 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-08-31 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-31 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Amed SK - Trabzonspor'
  AND start_date = ('2026-08-30 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
