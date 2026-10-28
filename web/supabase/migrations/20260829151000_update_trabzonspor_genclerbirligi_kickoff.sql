-- Trabzonspor - Gençlerbirliği (Süper Lig 4. hafta): TFF 6 Eylül 20:00

UPDATE public.events
SET
  start_date = ('2026-09-06 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-09-06 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Gençlerbirliği'
  AND start_date = ('2026-09-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
