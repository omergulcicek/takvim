-- Arsenal 2 - 1 Leeds United (Premier Lig)

UPDATE public.events
SET
  title = 'Arsenal 2 - 1 Leeds United',
  description = NULLIF(E'Riccardo Calafiori 62''
Bruno Guimarães 70''

James Justin 55''', '')
WHERE title = 'Arsenal - Leeds United'
   OR title = 'Arsenal 2 - 1 Leeds United';
