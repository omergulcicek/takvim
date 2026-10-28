-- Fikstür penceresi (28 Eki - 11 Kas 2026): Takvim'de eksik olan kapsam içi maçlar eklenir.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    -- Premier Lig
    ('Leeds United - Tottenham',        NULL::text, '2026-11-07 15:30:00', ARRAY['premier-lig']),
    ('Arsenal - Hull City',             NULL, '2026-11-07 18:00:00', ARRAY['premier-lig']),
    ('Nottingham Forest - Manchester City', NULL, '2026-11-07 20:30:00', ARRAY['premier-lig']),
    ('Crystal Palace - Liverpool',      NULL, '2026-11-08 17:00:00', ARRAY['premier-lig']),
    ('Sunderland - Chelsea',            NULL, '2026-11-08 17:00:00', ARRAY['premier-lig']),
    ('Manchester United - Aston Villa', NULL, '2026-11-08 19:30:00', ARRAY['premier-lig']),
    -- La Liga
    ('Valencia - Real Madrid',          NULL, '2026-11-07 23:00:00', ARRAY['la-liga']),
    ('Atlético Madrid - Barcelona',     NULL, '2026-11-08 23:00:00', ARRAY['la-liga']),
    -- Şampiyonlar Ligi
    ('Galatasaray - VfB Stuttgart',     NULL, '2026-11-03 20:45:00', ARRAY['sampiyonlar-ligi','galatasaray']),
    ('Atlético Madrid - Bayern Münih',  NULL, '2026-11-03 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Barcelona - Aston Villa',         NULL, '2026-11-03 23:00:00', ARRAY['sampiyonlar-ligi','la-liga']),
    ('Feyenoord - Inter',               NULL, '2026-11-03 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('Manchester United - Roma',        NULL, '2026-11-03 23:00:00', ARRAY['sampiyonlar-ligi','premier-lig']),
    ('Villarreal - Paris Saint-Germain', NULL, '2026-11-03 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('AEK Athens - Real Madrid',        NULL, '2026-11-04 20:45:00', ARRAY['sampiyonlar-ligi','la-liga']),
    ('Fenerbahçe - Liverpool',          NULL, '2026-11-04 20:45:00', ARRAY['sampiyonlar-ligi','fenerbahce','premier-lig']),
    ('Porto - Napoli',                  NULL, '2026-11-04 23:00:00', ARRAY['sampiyonlar-ligi']),
    ('RB Leipzig - Manchester City',    NULL, '2026-11-04 23:00:00', ARRAY['sampiyonlar-ligi','premier-lig']),
    ('Slavia Prague - Arsenal',         NULL, '2026-11-04 23:00:00', ARRAY['sampiyonlar-ligi','premier-lig']),
    -- Avrupa Ligi
    ('Celtic - Beşiktaş',               NULL, '2026-11-05 23:00:00', ARRAY['besiktas'])
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
