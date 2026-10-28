-- Atlético Madrid 2 - 1 Real Madrid (La Liga)

UPDATE public.events
SET
  title = 'Atlético Madrid 2 - 1 Real Madrid',
  description = NULLIF(E'Alejandro Grimaldo 53'' (Penaltı)
Jonathan David 59''

Dean Huijsen 52'' (Kırmızı kart)
Antonio Rüdiger 89''', '')
WHERE title = 'Atlético Madrid - Real Madrid'
   OR title = 'Atlético Madrid 2 - 1 Real Madrid';
