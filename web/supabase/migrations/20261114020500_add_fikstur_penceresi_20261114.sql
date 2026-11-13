-- Fikstür penceresi (2026-11-14 → 2026-11-28): eksik iki lig maçı eklenir.
-- Kaynaklar: ESPN + FotMob (kickoff iki kaynakta aynı).

WITH src(title, descr, kickoff, cats) AS (
  VALUES
    ('Manchester United - Brentford', NULL, '2026-11-28 18:00:00', ARRAY['premier-lig']),
    ('Real Madrid - Alavés',          NULL, '2026-11-28 23:00:00', ARRAY['la-liga'])
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
