-- Premier Lig — 24 Ekim (takip edilen kulüpler)

-- Aston Villa - Manchester City (24 Eki 14:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Aston Villa - Manchester City',
    NULL,
    ('2026-10-24 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-24 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Aston Villa - Manchester City'
      AND e.start_date = ('2026-10-24 14:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Arsenal - Everton (24 Eki 17:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Arsenal - Everton',
    NULL,
    ('2026-10-24 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-24 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Arsenal - Everton'
      AND e.start_date = ('2026-10-24 17:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Chelsea - Tottenham (24 Eki 19:30)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Chelsea - Tottenham',
    NULL,
    ('2026-10-24 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-24 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Chelsea - Tottenham'
      AND e.start_date = ('2026-10-24 19:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;
