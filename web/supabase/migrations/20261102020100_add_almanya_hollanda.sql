-- Uluslar Ligi: Almanya - Hollanda (16 Kasım 2026, 22:45)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Almanya - Hollanda',
    'Uluslar Ligi lig aşaması — 6. hafta',
    ('2026-11-16 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-16 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Almanya - Hollanda'
      AND e.start_date = ('2026-11-16 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('milli-takimlar')
ON CONFLICT DO NOTHING;
