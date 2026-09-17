-- Millî takım: Uluslar Ligi (17 Eyl–1 Eki penceresi, net kickoff)
-- UEFA 20:45 CET → 21:45 Europe/Istanbul
-- Not: Hazırlık maçları yalnızca Türkiye için eklenir (Brezilya dostlukları yok)

-- 1. hafta
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Portekiz - Galler',
    'Uluslar Ligi lig aşaması — 1. hafta',
    ('2026-09-24 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-24 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Portekiz - Galler'
      AND e.start_date = ('2026-09-24 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Hollanda - Almanya',
    'Uluslar Ligi lig aşaması — 1. hafta',
    ('2026-09-24 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-24 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Hollanda - Almanya'
      AND e.start_date = ('2026-09-24 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Türkiye - Fransa',
    'Uluslar Ligi lig aşaması — 1. hafta',
    ('2026-09-25 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-25 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Türkiye - Fransa'
      AND e.start_date = ('2026-09-25 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'İngiltere - İspanya',
    'Uluslar Ligi lig aşaması — 1. hafta',
    ('2026-09-26 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-26 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'İngiltere - İspanya'
      AND e.start_date = ('2026-09-26 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

-- 2. hafta
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Almanya - Yunanistan',
    'Uluslar Ligi lig aşaması — 2. hafta',
    ('2026-09-27 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-27 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Almanya - Yunanistan'
      AND e.start_date = ('2026-09-27 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Norveç - Portekiz',
    'Uluslar Ligi lig aşaması — 2. hafta',
    ('2026-09-27 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-27 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Norveç - Portekiz'
      AND e.start_date = ('2026-09-27 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Belçika - Fransa',
    'Uluslar Ligi lig aşaması — 2. hafta',
    ('2026-09-28 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-28 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Belçika - Fransa'
      AND e.start_date = ('2026-09-28 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Türkiye - İtalya',
    'Uluslar Ligi lig aşaması — 2. hafta',
    ('2026-09-28 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-28 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Türkiye - İtalya'
      AND e.start_date = ('2026-09-28 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'İspanya - Hırvatistan',
    'Uluslar Ligi lig aşaması — 2. hafta',
    ('2026-09-29 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-29 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'İspanya - Hırvatistan'
      AND e.start_date = ('2026-09-29 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Çekya - İngiltere',
    'Uluslar Ligi lig aşaması — 2. hafta',
    ('2026-09-29 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-29 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Çekya - İngiltere'
      AND e.start_date = ('2026-09-29 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

-- 3. hafta (pencere sonu: 1 Eki dahil)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Almanya - Sırbistan',
    'Uluslar Ligi lig aşaması — 3. hafta',
    ('2026-10-01 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-01 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Almanya - Sırbistan'
      AND e.start_date = ('2026-10-01 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Danimarka - Portekiz',
    'Uluslar Ligi lig aşaması — 3. hafta',
    ('2026-10-01 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-01 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Danimarka - Portekiz'
      AND e.start_date = ('2026-10-01 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;
