-- Uluslar Ligi 3. hafta (pencere: 19 Eyl–3 Eki) — net kickoff
-- UEFA 20:45 CET → 21:45 TR; Hırvatistan–İngiltere 18:00 CET → 19:00 TR

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Fransa - İtalya',
    'Uluslar Ligi lig aşaması — 3. hafta',
    ('2026-10-02 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-02 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Fransa - İtalya'
      AND e.start_date = ('2026-10-02 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Belçika - Türkiye',
    'Uluslar Ligi lig aşaması — 3. hafta',
    ('2026-10-02 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-02 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Belçika - Türkiye'
      AND e.start_date = ('2026-10-02 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Hırvatistan - İngiltere',
    'Uluslar Ligi lig aşaması — 3. hafta',
    ('2026-10-03 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-03 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Hırvatistan - İngiltere'
      AND e.start_date = ('2026-10-03 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'İspanya - Çekya',
    'Uluslar Ligi lig aşaması — 3. hafta',
    ('2026-10-03 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-03 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'İspanya - Çekya'
      AND e.start_date = ('2026-10-03 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;
