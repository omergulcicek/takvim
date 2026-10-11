-- Premier Lig 25 Ekim: Liverpool - Brighton, Manchester United - Bournemouth (17:00 TR)

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Liverpool - Brighton', '2026-10-25 17:00:00'),
    ('Manchester United - Bournemouth', '2026-10-25 17:00:00')
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
