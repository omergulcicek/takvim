-- Barcelona 1 - 2 Real Madrid (La Liga) sonucu ve goller
UPDATE public.events
SET
  title = 'Barcelona 1 - 2 Real Madrid',
  description = NULLIF(E'Raphinha 61''\n\nKylian Mbappé 41'', 87''', '')
WHERE title = 'Barcelona - Real Madrid'
   OR title = 'Barcelona 1 - 2 Real Madrid';
