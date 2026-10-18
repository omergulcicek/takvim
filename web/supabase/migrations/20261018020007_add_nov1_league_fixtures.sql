-- 1 Kasım fikstürleri: Liverpool - Arsenal, Racing Santander - Real Madrid, Juventus - Napoli

-- Liverpool - Arsenal (Premier Lig)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Liverpool - Arsenal',
    NULL,
    ('2026-11-01 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-01 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Liverpool - Arsenal'
      AND e.start_date = ('2026-11-01 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Racing Santander - Real Madrid (La Liga)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Racing Santander - Real Madrid',
    NULL,
    ('2026-11-01 18:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-01 18:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Racing Santander - Real Madrid'
      AND e.start_date = ('2026-11-01 18:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;

-- Juventus - Napoli (Serie A)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Juventus - Napoli',
    NULL,
    ('2026-11-01 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-01 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Juventus - Napoli'
      AND e.start_date = ('2026-11-01 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('serie-a')
ON CONFLICT DO NOTHING;
