-- Leeds United 1 - 1 Manchester United (Premier Lig)

UPDATE public.events
SET
  title = 'Leeds United 1 - 1 Manchester United',
  description = NULLIF(E'Dominic Calvert-Lewin 51''

Bryan Mbeumo 35''', '')
WHERE title = 'Leeds United - Manchester United'
   OR title = 'Leeds United 1 - 1 Manchester United';
