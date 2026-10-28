-- Barcelona 2 - 0 Athletic Bilbao (La Liga)

UPDATE public.events
SET
  title = 'Barcelona 2 - 0 Athletic Bilbao',
  description = NULLIF(E'Raphinha 37''
Fermín López 82''', '')
WHERE title = 'Barcelona - Athletic Bilbao'
   OR title = 'Barcelona 2 - 0 Athletic Bilbao';
