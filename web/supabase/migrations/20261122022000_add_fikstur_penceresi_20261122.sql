-- Fikstür penceresi (22 Kas - 6 Ara 2026): Takvim'de eksik olan kapsam içi maçlar eklenir.
-- Kaynaklar: ESPN + resmî/haber sayfaları (başlama saatleri iki kaynakta aynı).

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    -- Premier Lig
    ('Tottenham - Arsenal',        NULL::text, '2026-12-06 19:30:00', ARRAY['premier-lig']),
    -- La Liga
    ('Athletic Club - Real Madrid', NULL,      '2026-12-06 18:15:00', ARRAY['la-liga'])
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
