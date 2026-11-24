-- Şampiyonlar Ligi 6. hafta, 9 Aralık maçları (kapsam içi takımlar)

WITH m(title, kickoff, slugs) AS (
  VALUES
    ('Arsenal - Real Madrid',       '2026-12-09 23:00:00'::timestamp, ARRAY['premier-lig','la-liga','sampiyonlar-ligi']),
    ('Borussia Dortmund - Inter',   '2026-12-09 23:00:00'::timestamp, ARRAY['sampiyonlar-ligi']),
    ('LASK - Fenerbahçe',           '2026-12-09 23:00:00'::timestamp, ARRAY['fenerbahce','sampiyonlar-ligi']),
    ('Liverpool - FC Porto',        '2026-12-09 23:00:00'::timestamp, ARRAY['premier-lig','sampiyonlar-ligi'])
),
inserted AS (
  INSERT INTO takvim.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    m.title,
    'Şampiyonlar Ligi lig aşaması — 6. hafta',
    (m.kickoff AT TIME ZONE 'Europe/Istanbul'),
    (m.kickoff AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false, 'published', 'none'
  FROM m
  WHERE NOT EXISTS (
    SELECT 1 FROM takvim.events e
    WHERE e.title = m.title AND e.start_date = (m.kickoff AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id, title
)
INSERT INTO takvim.event_categories (event_id, category_id)
SELECT i.id, c.id
FROM inserted i
JOIN m ON m.title = i.title
JOIN takvim.categories c ON c.slug = ANY (m.slugs)
ON CONFLICT DO NOTHING;
