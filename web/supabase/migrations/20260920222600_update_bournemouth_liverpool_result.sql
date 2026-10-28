-- Bournemouth 0 - 1 Liverpool (Premier Lig)

UPDATE public.events
SET
  title = 'Bournemouth 0 - 1 Liverpool',
  description = NULLIF(E'Alexander Isak 57''', '')
WHERE title = 'Bournemouth - Liverpool'
   OR title = 'Bournemouth 0 - 1 Liverpool';
