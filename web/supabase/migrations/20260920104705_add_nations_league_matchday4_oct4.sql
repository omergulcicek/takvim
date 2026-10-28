-- Uluslar Ligi lig aşaması — 4. hafta (4 Eki): Portekiz–Norveç, Yunanistan–Almanya

WITH portekiz_norvec AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Portekiz - Norveç',
    'Uluslar Ligi lig aşaması — 4. hafta',
    ('2026-10-04 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-04 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title IN ('Portekiz - Norveç', 'Portekiz 0 - 0 Norveç')
      AND e.start_date = ('2026-10-04 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT portekiz_norvec.id, c.id
FROM portekiz_norvec
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH yunanistan_almanya AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Yunanistan - Almanya',
    'Uluslar Ligi lig aşaması — 4. hafta',
    ('2026-10-04 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-04 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title IN ('Yunanistan - Almanya', 'Yunanistan 0 - 0 Almanya')
      AND e.start_date = ('2026-10-04 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT yunanistan_almanya.id, c.id
FROM yunanistan_almanya
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;
