-- 12 Aralık maçları eklendi: Liverpool - Leeds United, Manchester City - Chelsea, Málaga - Barcelona, Eyüpspor - Galatasaray.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

WITH inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Liverpool - Leeds United', NULL,
    ('2026-12-12 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-12 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM takvim.events e WHERE e.title = 'Liverpool - Leeds United'
    AND e.start_date = ('2026-12-12 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN takvim.categories c
WHERE c.slug IN ('premier-lig') ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Manchester City - Chelsea', NULL,
    ('2026-12-12 20:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-12 20:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM takvim.events e WHERE e.title = 'Manchester City - Chelsea'
    AND e.start_date = ('2026-12-12 20:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN takvim.categories c
WHERE c.slug IN ('premier-lig') ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Málaga - Barcelona', NULL,
    ('2026-12-12 20:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-12 20:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM takvim.events e WHERE e.title = 'Málaga - Barcelona'
    AND e.start_date = ('2026-12-12 20:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN takvim.categories c
WHERE c.slug IN ('la-liga') ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Eyüpspor - Galatasaray', NULL,
    ('2026-12-12 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-12 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (SELECT 1 FROM takvim.events e WHERE e.title = 'Eyüpspor - Galatasaray'
    AND e.start_date = ('2026-12-12 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN takvim.categories c
WHERE c.slug IN ('galatasaray') ON CONFLICT DO NOTHING;
