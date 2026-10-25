-- Manchester United 0 - 3 Bournemouth (Premier Lig) sonucu ve goller
UPDATE public.events
SET
  title = 'Manchester United 0 - 3 Bournemouth',
  description = NULLIF(E'Rayan 38''\nMarcus Tavernier 43''\nEvanilson 71''', '')
WHERE title = 'Manchester United - Bournemouth'
   OR title = 'Manchester United 0 - 3 Bournemouth';
