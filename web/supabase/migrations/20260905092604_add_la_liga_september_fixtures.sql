-- La Liga: Real Madrid / Barcelona Eylül maçları (onaylı kickoff)

-- Real Madrid - Rayo Vallecano (12 Eyl 21:00 İspanya = 22:00 TR)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Real Madrid - Rayo Vallecano',
    NULL,
    ('2026-09-12 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-12 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Real Madrid - Rayo Vallecano'
      AND e.start_date = ('2026-09-12 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Levante - Barcelona (13 Eyl 16:15 İspanya = 17:15 TR)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Levante - Barcelona',
    NULL,
    ('2026-09-13 17:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-13 17:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Levante - Barcelona'
      AND e.start_date = ('2026-09-13 17:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Elche - Real Madrid (15 Eyl 21:30 İspanya = 22:30 TR)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Elche - Real Madrid',
    NULL,
    ('2026-09-15 22:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-15 22:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Elche - Real Madrid'
      AND e.start_date = ('2026-09-15 22:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Barcelona - Racing Santander (16 Eyl 21:30 İspanya = 22:30 TR)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Barcelona - Racing Santander',
    NULL,
    ('2026-09-16 22:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-16 22:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Barcelona - Racing Santander'
      AND e.start_date = ('2026-09-16 22:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;
