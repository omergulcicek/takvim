-- Real Madrid 4 - 1 Rayo Vallecano (La Liga)

UPDATE public.events
SET
  title = 'Real Madrid 4 - 1 Rayo Vallecano',
  description = NULLIF(E'Kylian Mbappé 14'' (Penaltı), 90+1''
Álvaro Carreras 17''
Jude Bellingham 35''

Sergio Camello 51''', '')
WHERE title = 'Real Madrid - Rayo Vallecano'
   OR title = 'Real Madrid 4 - 1 Rayo Vallecano';
