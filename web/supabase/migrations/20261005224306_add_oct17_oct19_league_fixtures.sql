-- 17–19 Ekim: Premier Lig ve La Liga (takip kulüpleri)

-- Everton - Chelsea (Premier Lig, 17 Eki 14:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Everton - Chelsea',
    NULL,
    ('2026-10-17 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-17 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Everton - Chelsea'
      AND e.start_date = ('2026-10-17 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Brentford - Liverpool (Premier Lig, 17 Eki 17:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Brentford - Liverpool',
    NULL,
    ('2026-10-17 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-17 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Brentford - Liverpool'
      AND e.start_date = ('2026-10-17 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Manchester City - Ipswich (Premier Lig, 17 Eki 17:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Manchester City - Ipswich',
    NULL,
    ('2026-10-17 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-17 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Manchester City - Ipswich'
      AND e.start_date = ('2026-10-17 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Real Betis - Barcelona (La Liga, 17 Eki 19:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Real Betis - Barcelona',
    NULL,
    ('2026-10-17 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-17 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Real Betis - Barcelona'
      AND e.start_date = ('2026-10-17 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Leeds United - Manchester United (Premier Lig, 18 Eki 16:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Leeds United - Manchester United',
    NULL,
    ('2026-10-18 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-18 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Leeds United - Manchester United'
      AND e.start_date = ('2026-10-18 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Nottingham Forest - Arsenal (Premier Lig, 18 Eki 18:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Nottingham Forest - Arsenal',
    NULL,
    ('2026-10-18 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-18 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Nottingham Forest - Arsenal'
      AND e.start_date = ('2026-10-18 18:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Real Madrid - Sevilla (La Liga, 18 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Real Madrid - Sevilla',
    NULL,
    ('2026-10-18 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-18 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Real Madrid - Sevilla'
      AND e.start_date = ('2026-10-18 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Tottenham - Coventry (Premier Lig, 19 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Tottenham - Coventry',
    NULL,
    ('2026-10-19 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-19 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Tottenham - Coventry'
      AND e.start_date = ('2026-10-19 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;
