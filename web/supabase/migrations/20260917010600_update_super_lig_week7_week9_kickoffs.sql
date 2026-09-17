-- Süper Lig 7–9. hafta: TFF onaylı kickoff (placeholder 12:00 düzeltmesi)
-- Kaynak: https://www.milliyet.com.tr/skorer/super-ligde-7-16-hafta-programlari-belli-oldu-7660940

-- 7. hafta
UPDATE public.events
SET
  start_date = ('2026-10-09 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-09 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Kasımpaşa'
  AND start_date = ('2026-10-11 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-10 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-10 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Samsunspor - Trabzonspor'
  AND start_date = ('2026-10-11 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-10 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-10 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Ç. Rizespor - Fenerbahçe'
  AND start_date = ('2026-10-11 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-11 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-11 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Kocaelispor'
  AND start_date = ('2026-10-11 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- 8. hafta
UPDATE public.events
SET
  start_date = ('2026-10-17 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-17 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Gençlerbirliği - Galatasaray'
  AND start_date = ('2026-10-18 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-17 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-17 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Fenerbahçe - Alanyaspor'
  AND start_date = ('2026-10-18 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-19 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-19 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Beşiktaş'
  AND start_date = ('2026-10-18 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- 9. hafta
UPDATE public.events
SET
  start_date = ('2026-10-26 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-26 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Ç. Rizespor - Trabzonspor'
  AND start_date = ('2026-10-25 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-26 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-26 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Beşiktaş - Başakşehir'
  AND start_date = ('2026-10-25 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-26 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-26 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Fenerbahçe'
  AND start_date = ('2026-10-25 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
