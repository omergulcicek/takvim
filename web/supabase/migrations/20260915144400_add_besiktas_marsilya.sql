-- Avrupa Ligi lig aşaması 1. hafta: Beşiktaş - Marsilya (17 Eyl 22:00 TR)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Beşiktaş - Marsilya',
    'Avrupa Ligi lig aşaması — 1. hafta',
    ('2026-09-17 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-17 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Beşiktaş - Marsilya'
      AND e.start_date = ('2026-09-17 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'besiktas'
ON CONFLICT DO NOTHING;
