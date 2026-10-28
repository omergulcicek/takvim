-- Brighton 3 - 0 Arsenal (Premier Lig)

UPDATE public.events
SET
  title = 'Brighton 3 - 0 Arsenal',
  description = NULLIF(E'Pascal Gross 31''
Charalampos Kostoulas 45''
Chema Andrés 57''', '')
WHERE title = 'Brighton - Arsenal'
   OR title = 'Brighton 3 - 0 Arsenal';
