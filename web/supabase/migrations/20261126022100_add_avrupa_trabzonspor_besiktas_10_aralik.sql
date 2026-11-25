-- Trabzonspor - Jablonec (Konferans Ligi) ve Bayer Leverkusen - Beşiktaş (Avrupa Ligi), 10 Aralık 2026
-- Saat tek kaynaktan (ESPN) geldiği için 12:00 placeholder; netleşince güncellenecek.

WITH inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Trabzonspor - Jablonec', 'Konferans Ligi lig aşaması — 5. hafta',
    ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM takvim.events e
    WHERE e.title = 'Trabzonspor - Jablonec'
      AND e.start_date = ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN takvim.categories c
WHERE c.slug IN ('trabzonspor')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Bayer Leverkusen - Beşiktaş', NULL,
    ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM takvim.events e
    WHERE e.title = 'Bayer Leverkusen - Beşiktaş'
      AND e.start_date = ('2026-12-10 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'))
  RETURNING id
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN takvim.categories c
WHERE c.slug IN ('besiktas')
ON CONFLICT DO NOTHING;
