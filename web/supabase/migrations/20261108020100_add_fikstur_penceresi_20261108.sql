-- Fikstür penceresi (8 - 22 Kas 2026): Takvim'de eksik olan kapsam içi maçlar eklenir.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    -- Premier Lig
    ('Manchester City - Fulham',   NULL::text, '2026-11-21 15:30:00', ARRAY['premier-lig']),
    ('Chelsea - Leeds United',     NULL, '2026-11-21 18:00:00', ARRAY['premier-lig']),
    ('Newcastle United - Arsenal', NULL, '2026-11-21 20:30:00', ARRAY['premier-lig']),
    ('Liverpool - Manchester United', NULL, '2026-11-22 19:30:00', ARRAY['premier-lig']),
    -- La Liga
    ('Real Madrid - Celta Vigo',   NULL, '2026-11-21 23:00:00', ARRAY['la-liga']),
    ('Barcelona - Villarreal',     NULL, '2026-11-22 16:00:00', ARRAY['la-liga'])
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
