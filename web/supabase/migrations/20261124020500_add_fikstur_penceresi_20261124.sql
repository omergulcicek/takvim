-- Fikstür penceresi (24 Kas - 8 Ara 2026): Takvim'de eksik olan kapsam içi maçlar eklenir.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    ('AEK Athens - Galatasaray',        'Şampiyonlar Ligi lig aşaması — 6. hafta'::text, '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi','galatasaray']),
    ('Aston Villa - Paris Saint-Germain', 'Şampiyonlar Ligi lig aşaması — 6. hafta', '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Barcelona - Manchester City',     'Şampiyonlar Ligi lig aşaması — 6. hafta', '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi','la-liga','premier-lig']),
    ('Bayern Münih - Slavia Prague',    'Şampiyonlar Ligi lig aşaması — 6. hafta', '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Manchester United - RB Leipzig',  'Şampiyonlar Ligi lig aşaması — 6. hafta', '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi','premier-lig']),
    ('Roma - Sporting CP',              'Şampiyonlar Ligi lig aşaması — 6. hafta', '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Napoli - Club Brugge',            'Şampiyonlar Ligi lig aşaması — 6. hafta', '2026-12-08 23:00:00', ARRAY['sampiyonlar-ligi'])
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
