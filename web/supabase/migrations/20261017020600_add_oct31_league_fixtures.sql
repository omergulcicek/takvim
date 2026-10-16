-- 31 Ekim Premier Lig (Chelsea, Manchester City, Tottenham) ve La Liga (Barcelona)

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Chelsea - Manchester United', '2026-10-31 15:30:00'),
    ('Manchester City - Brighton', '2026-10-31 18:00:00'),
    ('Tottenham - Crystal Palace', '2026-10-31 20:30:00')
),
inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    f.title,
    NULL,
    (f.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul'),
    (f.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  FROM fixtures f
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.events e
    WHERE e.title = f.title
      AND e.start_date = (f.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'premier-lig'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Barcelona - Alavés',
    NULL,
    ('2026-10-31 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-31 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Barcelona - Alavés'
      AND e.start_date = ('2026-10-31 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'la-liga'
ON CONFLICT DO NOTHING;
