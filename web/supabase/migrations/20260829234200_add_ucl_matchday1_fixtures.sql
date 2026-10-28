-- Şampiyonlar Ligi 2026/27 lig aşaması — 1. hafta (takip kulüpleri, 8–10 Eylül)

-- Real Madrid - Inter
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Real Madrid - Inter', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-08 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-08 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Real Madrid - Inter'
      AND e.start_date = ('2026-09-08 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;

-- Manchester City - Porto
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Manchester City - Porto', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-08 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-08 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Manchester City - Porto'
      AND e.start_date = ('2026-09-08 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;

-- Barcelona - Feyenoord
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Barcelona - Feyenoord', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-09 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-09 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Barcelona - Feyenoord'
      AND e.start_date = ('2026-09-09 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;

-- Liverpool - Atlético Madrid
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Liverpool - Atlético Madrid', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-09 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-09 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Liverpool - Atlético Madrid'
      AND e.start_date = ('2026-09-09 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;

-- Napoli - Arsenal
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Napoli - Arsenal', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-09 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-09 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Napoli - Arsenal'
      AND e.start_date = ('2026-09-09 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;

-- Sporting CP - Galatasaray
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Sporting CP - Galatasaray', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-09 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-09 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Sporting CP - Galatasaray'
      AND e.start_date = ('2026-09-09 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('galatasaray', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;

-- Fenerbahçe - Roma
WITH ins AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Fenerbahçe - Roma', 'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-10 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-10 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Fenerbahçe - Roma'
      AND e.start_date = ('2026-09-10 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins.id, c.id FROM ins CROSS JOIN public.categories c
WHERE c.slug IN ('fenerbahce', 'sampiyonlar-ligi') ON CONFLICT DO NOTHING;
