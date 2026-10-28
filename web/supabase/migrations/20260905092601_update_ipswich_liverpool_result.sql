-- Ipswich 0 - 2 Liverpool (Premier Lig)

UPDATE public.events
SET
  title = 'Ipswich 0 - 2 Liverpool',
  description = NULLIF(E'Alexander Isak 6'', 9''', '')
WHERE title = 'Ipswich - Liverpool'
   OR title = 'Ipswich 0 - 2 Liverpool';
