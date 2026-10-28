-- Hollanda 1 - 1 Almanya (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Hollanda 1 - 1 Almanya',
  description = NULLIF(E'Cody Gakpo 90+2''

Felix Nmecha 32''', '')
WHERE title = 'Hollanda - Almanya'
   OR title = 'Hollanda 1 - 1 Almanya';
