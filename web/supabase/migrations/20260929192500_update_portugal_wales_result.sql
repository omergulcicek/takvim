-- Portekiz 1 - 0 Galler (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Portekiz 1 - 0 Galler',
  description = NULLIF(E'João Félix 22''', '')
WHERE title = 'Portekiz - Galler'
   OR title = 'Portekiz 1 - 0 Galler';
