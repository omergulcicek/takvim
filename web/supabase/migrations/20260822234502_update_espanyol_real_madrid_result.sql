-- Espanyol 1 - 1 Real Madrid (La Liga)

UPDATE public.events
SET
  title = 'Espanyol 1 - 1 Real Madrid',
  description = NULLIF(E'Álex Calatrava 30''

Jude Bellingham 9''', '')
WHERE title = 'Espanyol - Real Madrid'
   OR title = 'Espanyol 1 - 1 Real Madrid';
