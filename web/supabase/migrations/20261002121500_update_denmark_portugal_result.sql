-- Danimarka 2 - 4 Portekiz (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Danimarka 2 - 4 Portekiz',
  description = NULLIF(E'Mikkel Damsgaard 23''
Rasmus Højlund 53''

João Cancelo 13''
Gonçalo Ramos 25''
Vitinha 67''
João Félix 87''', '')
WHERE title = 'Danimarka - Portekiz'
   OR title = 'Danimarka 2 - 4 Portekiz';
