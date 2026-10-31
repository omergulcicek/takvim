-- Fikstür penceresi (1-15 Kasım 2026): Takvim'de eksik olan kapsam içi maçlar eklenir.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    -- Konferans Ligi
    ('Trabzonspor - Freiburg',  NULL::text, '2026-11-05 20:45:00', ARRAY['trabzonspor']),
    -- Uluslar Ligi
    ('Portekiz - Danimarka',    'Uluslar Ligi lig aşaması — 5. hafta', '2026-11-14 22:45:00', ARRAY['milli-takimlar']),
    ('Fransa - Türkiye',        'Uluslar Ligi lig aşaması — 6. hafta', '2026-11-15 22:45:00', ARRAY['milli-takimlar']),
    ('İspanya - İngiltere',     'Uluslar Ligi lig aşaması — 6. hafta', '2026-11-15 22:45:00', ARRAY['milli-takimlar'])
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
