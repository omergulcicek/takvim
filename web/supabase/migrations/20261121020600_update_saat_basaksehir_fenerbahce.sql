-- Başakşehir - Fenerbahçe: 6 Aralık 12:00 placeholder yerine kesin tarih/saat 5 Aralık 19:00 (ESPN + FotMob)

UPDATE public.events
SET
  start_date = ('2026-12-05 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-12-05 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Başakşehir - Fenerbahçe'
  AND start_date = ('2026-12-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
