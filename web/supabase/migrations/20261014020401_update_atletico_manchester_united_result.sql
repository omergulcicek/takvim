-- Atlético Madrid 2 - 0 Manchester United (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Atlético Madrid 2 - 0 Manchester United',
  description = NULLIF(E'Pablo Barrios 1''
Ademola Lookman 79''

Leny Yoro 74'' (Kırmızı kart)', '')
WHERE title = 'Atlético Madrid - Manchester United'
   OR title = 'Atlético Madrid 2 - 0 Manchester United';
