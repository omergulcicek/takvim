-- 14–15 Ekim: Şampiyonlar Ligi 2. hafta, Avrupa Ligi 2. hafta, Konferans Ligi 1. hafta

-- LASK Linz - Liverpool (Şampiyonlar Ligi, 14 Eki 19:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'LASK Linz - Liverpool',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-14 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-14 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'LASK Linz - Liverpool'
      AND e.start_date = ('2026-10-14 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Roma - Real Madrid (Şampiyonlar Ligi, 14 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Roma - Real Madrid',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-14 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Roma - Real Madrid'
      AND e.start_date = ('2026-10-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Aston Villa - Fenerbahçe (Şampiyonlar Ligi, 14 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Aston Villa - Fenerbahçe',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-14 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Aston Villa - Fenerbahçe'
      AND e.start_date = ('2026-10-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('fenerbahce', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Manchester City - Paris Saint-Germain (Şampiyonlar Ligi, 14 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Manchester City - Paris Saint-Germain',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-14 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Manchester City - Paris Saint-Germain'
      AND e.start_date = ('2026-10-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Hoffenheim - Beşiktaş (Avrupa Ligi, 15 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Hoffenheim - Beşiktaş',
    'Avrupa Ligi lig aşaması — 2. hafta',
    ('2026-10-15 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-15 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Hoffenheim - Beşiktaş'
      AND e.start_date = ('2026-10-15 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'besiktas'
ON CONFLICT DO NOTHING;

-- KuPS Kuopio - Trabzonspor (Konferans Ligi, 15 Eki 19:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'KuPS Kuopio - Trabzonspor',
    'Konferans Ligi lig aşaması — 1. hafta',
    ('2026-10-15 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-15 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'KuPS Kuopio - Trabzonspor'
      AND e.start_date = ('2026-10-15 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'trabzonspor'
ON CONFLICT DO NOTHING;
