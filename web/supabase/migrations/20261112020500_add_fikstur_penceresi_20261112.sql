-- Fikstür penceresi (12 - 26 Kas 2026): Takvim'de eksik olan kapsam içi maçlar eklenir.
-- Kaynak: ESPN (başlama saatleri UTC'den Europe/Istanbul'a çevrildi). FotMob ve LiveScore'dan teyit alınamadı.

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    -- Şampiyonlar Ligi 5. hafta (25 Kasım)
    ('Sabah - Barcelona',               'Şampiyonlar Ligi lig aşaması — 5. hafta'::text, '2026-11-25 20:45:00', ARRAY['sampiyonlar-ligi','la-liga']),
    ('Paris Saint-Germain - Roma',      'Şampiyonlar Ligi lig aşaması — 5. hafta', '2026-11-25 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Lille - Bayern Münih',            'Şampiyonlar Ligi lig aşaması — 5. hafta', '2026-11-25 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Shakhtar Donetsk - Fenerbahçe',   'Şampiyonlar Ligi lig aşaması — 5. hafta', '2026-11-25 23:00:00', ARRAY['sampiyonlar-ligi','fenerbahce']),
    ('Club Brugge - Liverpool',         'Şampiyonlar Ligi lig aşaması — 5. hafta', '2026-11-25 23:00:00', ARRAY['sampiyonlar-ligi','premier-lig']),
    ('Sporting CP - Manchester United', 'Şampiyonlar Ligi lig aşaması — 5. hafta', '2026-11-25 23:00:00', ARRAY['sampiyonlar-ligi','premier-lig']),
    ('Inter - VfB Stuttgart',           'Şampiyonlar Ligi lig aşaması — 5. hafta', '2026-11-25 23:00:00', ARRAY['sampiyonlar-ligi']),
    -- Avrupa Ligi (26 Kasım)
    ('Beşiktaş - Hapoel Be''er Sheva',  NULL, '2026-11-26 20:45:00', ARRAY['besiktas'])
),
inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    s.title,
    s.descr,
    (s.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul'),
    (s.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  FROM src s
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = s.title
      AND e.start_date = (s.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id, title
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT i.id, c.id
FROM inserted i
JOIN src s ON s.title = i.title
JOIN public.categories c ON c.slug = ANY (s.cats)
ON CONFLICT DO NOTHING;
