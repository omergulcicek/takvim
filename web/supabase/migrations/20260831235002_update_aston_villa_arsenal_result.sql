-- Aston Villa 0 - 1 Arsenal (Premier Lig)

UPDATE public.events
SET
  title = 'Aston Villa 0 - 1 Arsenal',
  description = NULLIF(E'Bukayo Saka 59''', '')
WHERE title = 'Aston Villa - Arsenal'
   OR title = 'Aston Villa 0 - 1 Arsenal';
