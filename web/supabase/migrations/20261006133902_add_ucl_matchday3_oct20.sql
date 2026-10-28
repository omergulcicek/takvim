-- Şampiyonlar Ligi 2026/27 lig aşaması — 3. hafta (20 Ekim, takip kulüpleri)

-- Fenerbahçe - Slavia Prague (20 Eki 19:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Fenerbahçe - Slavia Prague',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-20 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-20 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Fenerbahçe - Slavia Prague'
      AND e.start_date = ('2026-10-20 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('fenerbahce', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Liverpool - Villarreal (20 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Liverpool - Villarreal',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-20 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Liverpool - Villarreal'
      AND e.start_date = ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Manchester City - AEK Athens (20 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Manchester City - AEK Athens',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-20 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Manchester City - AEK Athens'
      AND e.start_date = ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Paris Saint-Germain - Barcelona (20 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Paris Saint-Germain - Barcelona',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-20 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Paris Saint-Germain - Barcelona'
      AND e.start_date = ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
