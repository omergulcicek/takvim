-- Tottenham 0 - 0 Everton (Premier Lig)

UPDATE public.events
SET
  title = 'Tottenham 0 - 0 Everton',
  description = NULL
WHERE title = 'Tottenham - Everton'
   OR title = 'Tottenham 0 - 0 Everton';
