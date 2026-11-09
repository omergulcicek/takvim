-- Şampiyonlar Ligi 2026/27 lig aşaması — 5. hafta (24 Kasım, takip kulüpleri)
-- Kaynaklar: ESPN ve Flashscore (saatler aynı). Kulüp kategorileri: takip edilen kulüp + sampiyonlar-ligi (Napoli yalnızca UCL kulübü).

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Galatasaray - Aston Villa', 'Şampiyonlar Ligi lig aşaması — 5. hafta', ('2026-11-24 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'), ('2026-11-24 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours', false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Galatasaray - Aston Villa' AND e.start_date = ('2026-11-24 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('galatasaray', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Arsenal - Borussia Dortmund', 'Şampiyonlar Ligi lig aşaması — 5. hafta', ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'), ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours', false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Arsenal - Borussia Dortmund' AND e.start_date = ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('sampiyonlar-ligi', 'premier-lig')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Manchester City - Napoli', 'Şampiyonlar Ligi lig aşaması — 5. hafta', ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'), ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours', false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Manchester City - Napoli' AND e.start_date = ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('sampiyonlar-ligi', 'premier-lig')
ON CONFLICT DO NOTHING;

WITH inserted AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT 'Real Madrid - PSV Eindhoven', 'Şampiyonlar Ligi lig aşaması — 5. hafta', ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'), ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours', false, 'published', 'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Real Madrid - PSV Eindhoven' AND e.start_date = ('2026-11-24 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id FROM inserted CROSS JOIN public.categories c
WHERE c.slug IN ('sampiyonlar-ligi', 'la-liga')
ON CONFLICT DO NOTHING;
