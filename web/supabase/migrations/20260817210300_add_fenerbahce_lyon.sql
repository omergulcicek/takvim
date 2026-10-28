-- Şampiyonlar Ligi play-off: Fenerbahçe - Lyon (iki ayak).

WITH leg1 AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Fenerbahçe - Lyon',
    'Şampiyonlar Ligi play-off turu ilk maç',
    ('2026-08-18 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-18 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Fenerbahçe - Lyon'
      AND e.start_date = ('2026-08-18 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT leg1.id, c.id
FROM leg1
CROSS JOIN public.categories c
WHERE c.slug IN ('fenerbahce', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

WITH leg2 AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Lyon - Fenerbahçe',
    'Şampiyonlar Ligi play-off turu rövanş maçı',
    ('2026-08-26 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-26 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Lyon - Fenerbahçe'
      AND e.start_date = ('2026-08-26 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT leg2.id, c.id
FROM leg2
CROSS JOIN public.categories c
WHERE c.slug IN ('fenerbahce', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
