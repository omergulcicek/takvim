-- 2 Aralık 2026 Premier Lig ve La Liga maçları (fikstür penceresi 18 Kasım - 2 Aralık)
-- Kaynaklar: ESPN ve FotMob (saatler iki kaynakta aynı)

WITH m(home_away, kickoff, slug) AS (
  VALUES
    ('Chelsea - Crystal Palace',        '2026-12-02 22:30:00', 'premier-lig'),
    ('Liverpool - Sunderland',          '2026-12-02 22:30:00', 'premier-lig'),
    ('Manchester City - Leeds United',  '2026-12-02 22:30:00', 'premier-lig'),
    ('Brentford - Arsenal',             '2026-12-02 23:15:00', 'premier-lig'),
    ('Newcastle United - Manchester United', '2026-12-02 23:15:00', 'premier-lig'),
    ('Real Sociedad - Real Madrid',     '2026-12-02 21:00:00', 'la-liga'),
    ('Barcelona - Atlético Madrid',     '2026-12-02 23:30:00', 'la-liga')
),
inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    m.home_away,
    NULL,
    (m.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul'),
    (m.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  FROM m
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = m.home_away
      AND e.start_date = (m.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id, title
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
JOIN m ON m.home_away = inserted.title
JOIN public.categories c ON c.slug = m.slug
ON CONFLICT DO NOTHING;
