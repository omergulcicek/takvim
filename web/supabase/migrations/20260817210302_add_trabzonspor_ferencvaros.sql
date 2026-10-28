-- Avrupa Ligi play-off: Trabzonspor - Ferencváros (iki ayak).

WITH leg1 AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Trabzonspor - Ferencváros',
    'Avrupa Ligi play-off turu ilk maç',
    ('2026-08-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Trabzonspor - Ferencváros'
      AND e.start_date = ('2026-08-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT leg1.id, c.id
FROM leg1
CROSS JOIN public.categories c
WHERE c.slug = 'trabzonspor'
ON CONFLICT DO NOTHING;

WITH leg2 AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Ferencváros - Trabzonspor',
    'Avrupa Ligi play-off turu rövanş maçı',
    ('2026-08-27 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-27 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Ferencváros - Trabzonspor'
      AND e.start_date = ('2026-08-27 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT leg2.id, c.id
FROM leg2
CROSS JOIN public.categories c
WHERE c.slug = 'trabzonspor'
ON CONFLICT DO NOTHING;
