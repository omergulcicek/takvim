-- Barcelona 6 - 2 Racing Santander (La Liga) — FT düzeltme (erken 4-2 yazılmıştı)

UPDATE public.events
SET
  title = 'Barcelona 6 - 2 Racing Santander',
  description = NULLIF(E'João Cancelo 8''
Raphinha 25'' (Penaltı), 42'', 67'' (Penaltı)
Asier Villalibre 36'' (kk)
Gabriel Jesus 79''

Maguette Gueye 30''
Yassir Zabiri 65''', '')
WHERE title = 'Barcelona - Racing Santander'
   OR title = 'Barcelona 4 - 2 Racing Santander'
   OR title = 'Barcelona 6 - 2 Racing Santander';
