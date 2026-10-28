-- Uluslar Ligi lig aşaması — 4. hafta (5 Eki): Fransa–Belçika, İtalya–Türkiye

WITH fransa_belcika AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Fransa - Belçika',
    'Uluslar Ligi lig aşaması — 4. hafta',
    ('2026-10-05 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-05 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title IN ('Fransa - Belçika', 'Fransa 0 - 0 Belçika')
      AND e.start_date = ('2026-10-05 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT fransa_belcika.id, c.id
FROM fransa_belcika
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH italya_turkiye AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'İtalya - Türkiye',
    'Uluslar Ligi lig aşaması — 4. hafta',
    ('2026-10-05 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-05 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title IN ('İtalya - Türkiye', 'İtalya 0 - 0 Türkiye')
      AND e.start_date = ('2026-10-05 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT italya_turkiye.id, c.id
FROM italya_turkiye
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;
