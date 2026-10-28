-- Espanyol 1 - 2 Real Madrid (La Liga) — düzeltme: önceki 1-1 kaydı maç bitmeden yazılmıştı

UPDATE public.events
SET
  title = 'Espanyol 1 - 2 Real Madrid',
  description = NULLIF(E'Álex Calatrava 30''

Jude Bellingham 9''
Carlos Espí 90''', '')
WHERE title = 'Espanyol - Real Madrid'
   OR title = 'Espanyol 1 - 1 Real Madrid'
   OR title = 'Espanyol 1 - 2 Real Madrid';
