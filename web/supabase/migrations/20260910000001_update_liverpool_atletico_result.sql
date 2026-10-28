-- Liverpool 2 - 1 Atlético Madrid (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Liverpool 2 - 1 Atlético Madrid',
  description = NULLIF(E'Dominik Szoboszlai 40''
Alexis Mac Allister 50''

Marcos Llorente 17''', '')
WHERE title = 'Liverpool - Atlético Madrid'
   OR title = 'Liverpool 2 - 1 Atlético Madrid';
