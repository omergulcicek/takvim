-- Fikstür penceresi (9-23 Kasım 2026): eksik Premier Lig maçı Tottenham - Ipswich
-- Kaynaklar: ESPN + FotMob (başlama saati iki kaynakta aynı: 18:00 TR)

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Tottenham - Ipswich',
    NULL,
    ('2026-11-21 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-11-21 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Tottenham - Ipswich'
      AND e.start_date = ('2026-11-21 18:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;
