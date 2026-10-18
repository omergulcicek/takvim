-- Everton 0 - 2 Chelsea (Premier Lig)

UPDATE public.events
SET
  title = 'Everton 0 - 2 Chelsea',
  description = NULLIF(E'Pedro Neto 46'', 90''', '')
WHERE title = 'Everton - Chelsea'
   OR title = 'Everton 0 - 2 Chelsea';
