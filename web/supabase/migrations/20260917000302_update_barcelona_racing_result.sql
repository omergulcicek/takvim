-- Barcelona 4 - 2 Racing Santander (La Liga)

UPDATE public.events
SET
  title = 'Barcelona 4 - 2 Racing Santander',
  description = NULLIF(E'João Cancelo 8''
Raphinha 25'' (Penaltı), 42''
Asier Villalibre 36'' (kk)

Maguette Gueye 30''
Yassir Zabiri 65''', '')
WHERE title = 'Barcelona - Racing Santander'
   OR title = 'Barcelona 4 - 2 Racing Santander';
