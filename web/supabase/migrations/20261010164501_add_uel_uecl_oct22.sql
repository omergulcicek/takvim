-- Avrupa Ligi / Konferans Ligi — 22 Ekim (Beşiktaş, Trabzonspor)

-- Beşiktaş - Crystal Palace (Avrupa Ligi lig aşaması 3. hafta, 22 Eki 22:00)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Beşiktaş - Crystal Palace',
    'Avrupa Ligi lig aşaması — 3. hafta',
    ('2026-10-22 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-22 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Beşiktaş - Crystal Palace'
      AND e.start_date = ('2026-10-22 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('besiktas')
ON CONFLICT DO NOTHING;

-- Trabzonspor - Heart of Midlothian (Konferans Ligi lig aşaması 2. hafta, 22 Eki 19:45)
WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Trabzonspor - Heart of Midlothian',
    'Konferans Ligi lig aşaması — 2. hafta',
    ('2026-10-22 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-22 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Trabzonspor - Heart of Midlothian'
      AND e.start_date = ('2026-10-22 19:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('trabzonspor')
ON CONFLICT DO NOTHING;
