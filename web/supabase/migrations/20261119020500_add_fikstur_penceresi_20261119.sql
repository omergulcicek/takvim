-- Fikstür penceresi (19 Kas - 3 Ara 2026): Takvim'de eksik olan kapsam içi maç eklenir.
-- Kaynaklar: ESPN + FotMob (başlama saati iki kaynakta aynı: 2026-12-03 20:00 UTC = 23:00 TR).

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Tottenham - Fulham',
    NULL,
    ('2026-12-03 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-12-03 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Tottenham - Fulham'
      AND e.start_date = ('2026-12-03 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('premier-lig')
ON CONFLICT DO NOTHING;

-- Düzeltme: bitiş 01:00 olmalı (00:00'a denk gelmediği için 23:55 kuralı uygulanmaz).
UPDATE public.events
SET end_date = ('2026-12-03 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Tottenham - Fulham'
  AND start_date = ('2026-12-03 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
