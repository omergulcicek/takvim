-- Şampiyonlar Ligi 2026/27 lig aşaması — 3. hafta (21 Ekim, takip kulüpleri)

-- Como - Manchester United (21 Eki 19:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Como - Manchester United',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-21 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-21 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Como - Manchester United'
      AND e.start_date = ('2026-10-21 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Lille - Galatasaray (21 Eki 19:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Lille - Galatasaray',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-21 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-21 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Lille - Galatasaray'
      AND e.start_date = ('2026-10-21 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('galatasaray', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Bayern Münih - Arsenal (21 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Bayern Münih - Arsenal',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-21 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Bayern Münih - Arsenal'
      AND e.start_date = ('2026-10-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Real Madrid - RB Leipzig (21 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Real Madrid - RB Leipzig',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-21 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Real Madrid - RB Leipzig'
      AND e.start_date = ('2026-10-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
