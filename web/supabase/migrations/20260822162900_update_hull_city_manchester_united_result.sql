-- Hull City 2 - 0 Manchester United (Premier Lig)

UPDATE public.events
SET
  title = 'Hull City 2 - 0 Manchester United',
  description = NULLIF(E'Semi Ajayi 17''
Nobel Mendy 38''', '')
WHERE title = 'Hull City - Manchester United'
   OR title = 'Hull City 2 - 0 Manchester United';
