-- Fransa 4 - 1 Belçika (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Fransa 4 - 1 Belçika',
  description = NULLIF(E'Désiré Doué 77''
Rayan Cherki 81''
Michael Olise 88'', 90+1''

Dodi Lukébakio 35''', '')
WHERE title = 'Fransa - Belçika'
   OR title = 'Fransa 4 - 1 Belçika';
