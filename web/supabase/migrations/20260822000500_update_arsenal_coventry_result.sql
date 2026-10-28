-- Arsenal 3 - 0 Coventry (Premier Lig)

UPDATE public.events
SET
  title = 'Arsenal 3 - 0 Coventry',
  description = NULLIF(E'Kai Havertz 15''
Bukayo Saka 23''
Martin Ødegaard 49''', '')
WHERE title = 'Arsenal - Coventry'
   OR title = 'Arsenal 3 - 0 Coventry';
