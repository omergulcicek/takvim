-- Real Madrid 1 - 0 Villarreal (La Liga)

UPDATE public.events
SET
  title = 'Real Madrid 1 - 0 Villarreal',
  description = NULLIF(E'Yan Diomande 62''
Vinícius Júnior 72'' (Kırmızı kart)', '')
WHERE title = 'Real Madrid - Villarreal'
   OR title = 'Real Madrid 1 - 0 Villarreal';
