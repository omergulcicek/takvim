-- Newcastle United 2 - 2 Liverpool (Premier Lig)

UPDATE public.events
SET
  title = 'Newcastle United 2 - 2 Liverpool',
  description = NULLIF(E'Anthony Elanga 5''
Joe Willock 57''

Cody Gakpo 55''
Dominik Szoboszlai 90+9'' (Penaltı)', '')
WHERE title = 'Newcastle United - Liverpool'
   OR title = 'Newcastle United 2 - 2 Liverpool';
