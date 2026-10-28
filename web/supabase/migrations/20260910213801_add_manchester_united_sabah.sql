-- Şampiyonlar Ligi: Manchester United - Sabah (10 Eyl 22:00 TR = 21:00 CET)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Manchester United - Sabah',
    'Şampiyonlar Ligi lig aşaması — 1. hafta',
    ('2026-09-10 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-10 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Manchester United - Sabah'
      AND e.start_date = ('2026-09-10 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
