-- Tottenham 2 - 3 Aston Villa (Premier Lig)

UPDATE public.events
SET
  title = 'Tottenham 2 - 3 Aston Villa',
  description = NULLIF(E'Conor Gallagher 86''
Jan Paul van Hecke 90+8''

Johan Manzambi 45+4''
Nicolas Jackson 67''
Emiliano Buendía 79''', '')
WHERE title = 'Tottenham - Aston Villa'
   OR title = 'Tottenham 2 - 3 Aston Villa';
