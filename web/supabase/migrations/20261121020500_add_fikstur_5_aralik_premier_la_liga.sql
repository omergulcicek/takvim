-- 5 Aralık 2026 Premier Lig ve La Liga maçları (ESPN + FotMob doğrulamalı)

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Chelsea - Liverpool', NULL,
    ('2026-12-05 15:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-05 15:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM public.events e WHERE e.title = 'Chelsea - Liverpool'
    AND e.start_date = ('2026-12-05 15:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig') ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Manchester United - Coventry City', NULL,
    ('2026-12-05 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-05 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM public.events e WHERE e.title = 'Manchester United - Coventry City'
    AND e.start_date = ('2026-12-05 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig') ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Brentford - Manchester City', NULL,
    ('2026-12-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM public.events e WHERE e.title = 'Brentford - Manchester City'
    AND e.start_date = ('2026-12-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig') ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Barcelona - Celta Vigo', NULL,
    ('2026-12-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM public.events e WHERE e.title = 'Barcelona - Celta Vigo'
    AND e.start_date = ('2026-12-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('la-liga') ON CONFLICT DO NOTHING;
