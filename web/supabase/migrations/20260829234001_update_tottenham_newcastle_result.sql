-- Tottenham 0 - 2 Newcastle United (Premier Lig)

UPDATE public.events
SET
  title = 'Tottenham 0 - 2 Newcastle United',
  description = NULLIF(E'Anthony Elanga 62''
Yoane Wissa 72''', '')
WHERE title = 'Tottenham - Newcastle United'
   OR title = 'Tottenham 0 - 2 Newcastle United';
