-- Arsenal 2 - 1 Chelsea (Premier Lig)

UPDATE public.events
SET
  title = 'Arsenal 2 - 1 Chelsea',
  description = NULLIF(E'Kai Havertz 25''
Martin Odegaard 50''

Morgan Rogers 2''', '')
WHERE title = 'Arsenal - Chelsea'
   OR title = 'Arsenal 2 - 1 Chelsea';
