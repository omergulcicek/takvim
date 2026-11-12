-- Premier Lig: Nottingham Forest - Chelsea (27 Kasım 2026, 23:00)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Nottingham Forest - Chelsea',
    NULL,
    ('2026-11-27 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-27 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Nottingham Forest - Chelsea'
      AND e.start_date = ('2026-11-27 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;
