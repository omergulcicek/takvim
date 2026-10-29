-- Fikstür penceresi (30 Eki - 13 Kas 2026): Uluslar Ligi lig aşaması 5. hafta, Takvim'de eksik olan kapsam içi millî takım maçları eklenir.
-- Kaynaklar: ESPN + FotMob (başlama saatleri iki kaynakta aynı).

WITH src (title, descr, kickoff, cats) AS (
  VALUES
    ('Türkiye - Belçika',   'Uluslar Ligi lig aşaması — 5. hafta', '2026-11-12 20:00:00', ARRAY['milli-takimlar']),
    ('Çekya - İspanya',     'Uluslar Ligi lig aşaması — 5. hafta', '2026-11-12 22:45:00', ARRAY['milli-takimlar']),
    ('İngiltere - Hırvatistan', 'Uluslar Ligi lig aşaması — 5. hafta', '2026-11-12 22:45:00', ARRAY['milli-takimlar']),
    ('İtalya - Fransa',     'Uluslar Ligi lig aşaması — 5. hafta', '2026-11-12 22:45:00', ARRAY['milli-takimlar']),
    ('Sırbistan - Almanya', 'Uluslar Ligi lig aşaması — 5. hafta', '2026-11-13 22:45:00', ARRAY['milli-takimlar'])
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
