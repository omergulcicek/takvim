-- Tottenham 3 - 1 Coventry (Premier Lig) maç sonucu ve goller
UPDATE public.events
SET
  title = 'Tottenham 3 - 1 Coventry',
  description = NULLIF(E'James Maddison 14''\nOmar Marmoush 58''\nBen Davies 90+6''\n\nJack Rudoni 49''', '')
WHERE title = 'Tottenham - Coventry'
   OR title = 'Tottenham 3 - 1 Coventry';
