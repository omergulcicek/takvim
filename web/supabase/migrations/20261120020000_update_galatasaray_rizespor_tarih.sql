-- Galatasaray - Ç. Rizespor (Süper Lig): maç 6 Aralık 12:00 placeholder yerine 4 Aralık 20:00'a alındı
-- (ESPN ve FotMob 4 Aralık 17:00 UTC olarak eşleşiyor)

UPDATE public.events
SET
  start_date = ('2026-12-04 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date   = ('2026-12-04 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Ç. Rizespor'
  AND start_date = ('2026-12-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
