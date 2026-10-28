-- Real Madrid 2 - 1 Inter (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Real Madrid 2 - 1 Inter',
  description = NULLIF(E'Kylian Mbappé 14''
Federico Valverde 23''

Carlos Augusto 76''', '')
WHERE title = 'Real Madrid - Inter'
   OR title = 'Real Madrid 2 - 1 Inter';
