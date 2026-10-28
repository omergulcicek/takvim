-- Uluslar Ligi lig aşaması — 4. hafta (6 Eki): Hırvatistan–İspanya, İngiltere–Çekya

WITH hirvatistan_ispanya AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Hırvatistan - İspanya',
    'Uluslar Ligi lig aşaması — 4. hafta',
    ('2026-10-06 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-06 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title IN ('Hırvatistan - İspanya', 'Hırvatistan 0 - 0 İspanya')
      AND e.start_date = ('2026-10-06 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT hirvatistan_ispanya.id, c.id
FROM hirvatistan_ispanya
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;

WITH ingiltere_cekya AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'İngiltere - Çekya',
    'Uluslar Ligi lig aşaması — 4. hafta',
    ('2026-10-06 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-10-06 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title IN ('İngiltere - Çekya', 'İngiltere 0 - 0 Çekya')
      AND e.start_date = ('2026-10-06 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ingiltere_cekya.id, c.id
FROM ingiltere_cekya
CROSS JOIN public.categories c
WHERE c.slug = 'milli-takimlar'
ON CONFLICT DO NOTHING;
