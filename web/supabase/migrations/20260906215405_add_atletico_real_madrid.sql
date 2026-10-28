-- La Liga: Atlético Madrid - Real Madrid (20 Eyl 16:15 İspanya = 17:15 TR)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Atlético Madrid - Real Madrid',
    NULL,
    ('2026-09-20 17:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-20 17:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Atlético Madrid - Real Madrid'
      AND e.start_date = ('2026-09-20 17:15:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga')
ON CONFLICT DO NOTHING;
