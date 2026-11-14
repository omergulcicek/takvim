-- Fikstür penceresi: 29 Kasım Premier Lig ve La Liga maçları (ESPN + FotMob saatleri aynı).

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    'Everton - Liverpool',
    NULL,
    ('2026-11-29 15:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-29 15:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Everton - Liverpool'
      AND e.start_date = ('2026-11-29 15:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    'Sunderland - Tottenham',
    NULL,
    ('2026-11-29 17:05:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-29 17:05:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Sunderland - Tottenham'
      AND e.start_date = ('2026-11-29 17:05:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    'Arsenal - Manchester City',
    NULL,
    ('2026-11-29 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-29 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Arsenal - Manchester City'
      AND e.start_date = ('2026-11-29 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    'Deportivo A Coruña - Barcelona',
    NULL,
    ('2026-11-29 18:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-29 18:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Deportivo A Coruña - Barcelona'
      AND e.start_date = ('2026-11-29 18:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;
