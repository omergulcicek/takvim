-- Hazırlık kuralı: yalnızca Türkiye — Avustralya–Brezilya dostluk maçlarını kaldır

DELETE FROM public.event_categories
WHERE event_id IN (
  SELECT id FROM public.events
  WHERE title = 'Avustralya - Brezilya'
    AND start_date IN (
      ('2026-09-25 13:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
      ('2026-09-29 13:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
);

DELETE FROM public.events
WHERE title = 'Avustralya - Brezilya'
  AND start_date IN (
    ('2026-09-25 13:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-09-29 13:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  );
