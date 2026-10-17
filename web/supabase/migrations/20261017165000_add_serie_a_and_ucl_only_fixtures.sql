-- Serie A kategorisi; UCL-only maçlar ve büyüklerin kendi aralarındaki Serie A maçları.

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'Serie A',
  'serie-a',
  'Inter, Juventus, Milan, Napoli ve Roma''nın kendi aralarındaki Serie A maçları.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

-- Roma - Slovan Bratislava (Şampiyonlar Ligi 3. hafta, 20 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Roma - Slovan Bratislava',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-20 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Roma - Slovan Bratislava'
      AND e.start_date = ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Napoli - Bodø/Glimt (Şampiyonlar Ligi 3. hafta, 20 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Napoli - Bodø/Glimt',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-20 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Napoli - Bodø/Glimt'
      AND e.start_date = ('2026-10-20 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Inter - Shakhtar Donetsk (Şampiyonlar Ligi 3. hafta, 21 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Inter - Shakhtar Donetsk',
    'Şampiyonlar Ligi lig aşaması — 3. hafta',
    ('2026-10-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-21 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Inter - Shakhtar Donetsk'
      AND e.start_date = ('2026-10-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

-- Napoli - Roma (Serie A, 24 Eki 19:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Napoli - Roma',
    NULL,
    ('2026-10-24 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-24 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Napoli - Roma'
      AND e.start_date = ('2026-10-24 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('serie-a')
ON CONFLICT DO NOTHING;

-- Milan - Inter (Serie A, 31 Eki 22:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Milan - Inter',
    NULL,
    ('2026-10-31 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-31 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Milan - Inter'
      AND e.start_date = ('2026-10-31 22:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('serie-a')
ON CONFLICT DO NOTHING;
