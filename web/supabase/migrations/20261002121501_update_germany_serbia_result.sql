-- Almanya 2 - 0 Sırbistan (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Almanya 2 - 0 Sırbistan',
  description = NULLIF(E'Tom Bischof 39''
Florian Wirtz 61''', '')
WHERE title = 'Almanya - Sırbistan'
   OR title = 'Almanya 2 - 0 Sırbistan';
