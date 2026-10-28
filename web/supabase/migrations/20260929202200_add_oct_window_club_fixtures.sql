-- 10–13 Ekim: Premier Lig, La Liga ve Şampiyonlar Ligi 2. hafta (takip kulüpleri)

-- Arsenal - Leeds United (Premier Lig, 10 Eki 14:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Arsenal - Leeds United',
    NULL,
    ('2026-10-10 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-10 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Arsenal - Leeds United'
      AND e.start_date = ('2026-10-10 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Chelsea - Bournemouth (Premier Lig, 10 Eki 17:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Chelsea - Bournemouth',
    NULL,
    ('2026-10-10 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-10 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Chelsea - Bournemouth'
      AND e.start_date = ('2026-10-10 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Manchester United - Tottenham (Premier Lig, 10 Eki 19:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Manchester United - Tottenham',
    NULL,
    ('2026-10-10 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-10 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Manchester United - Tottenham'
      AND e.start_date = ('2026-10-10 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Barcelona - Getafe (La Liga, 10 Eki 19:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Barcelona - Getafe',
    NULL,
    ('2026-10-10 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-10 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Barcelona - Getafe'
      AND e.start_date = ('2026-10-10 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Real Madrid - Villarreal (La Liga, 10 Eki 22:00; bitiş 23:55)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Real Madrid - Villarreal',
    NULL,
    ('2026-10-10 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-10 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Real Madrid - Villarreal'
      AND e.start_date = ('2026-10-10 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Liverpool - Manchester City (Premier Lig, 11 Eki 18:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Liverpool - Manchester City',
    NULL,
    ('2026-10-11 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-11 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Liverpool - Manchester City'
      AND e.start_date = ('2026-10-11 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Arsenal - Lille (Şampiyonlar Ligi 2. hafta, 13 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Arsenal - Lille',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-13 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Arsenal - Lille'
      AND e.start_date = ('2026-10-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Atlético Madrid - Manchester United (Şampiyonlar Ligi 2. hafta, 13 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Atlético Madrid - Manchester United',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-13 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Atlético Madrid - Manchester United'
      AND e.start_date = ('2026-10-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Galatasaray - Barcelona (Şampiyonlar Ligi 2. hafta, 13 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Galatasaray - Barcelona',
    'Şampiyonlar Ligi lig aşaması — 2. hafta',
    ('2026-10-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-13 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Galatasaray - Barcelona'
      AND e.start_date = ('2026-10-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('galatasaray', 'la-liga', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
