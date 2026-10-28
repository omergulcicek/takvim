-- La Liga: Sevilla - Barcelona (19 Eyl 21:00 İspanya = 22:00 TR)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Sevilla - Barcelona',
    NULL,
    ('2026-09-19 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-19 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Sevilla - Barcelona'
      AND e.start_date = ('2026-09-19 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;
