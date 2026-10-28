-- Norveç 1 - 2 Portekiz (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Norveç 1 - 2 Portekiz',
  description = NULLIF(E'Erling Haaland 51''

João Félix 17''
Gonçalo Ramos 54''', '')
WHERE title = 'Norveç - Portekiz'
   OR title = 'Norveç 1 - 2 Portekiz';
