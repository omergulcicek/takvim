-- Sporting CP 3 - 1 Galatasaray (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Sporting CP 3 - 1 Galatasaray',
  description = NULLIF(E'Geny Catamo 27''
Luis Suárez 57'' (Penaltı)
Rodrigo Zalazar 63''

Gonçalo Inácio 5'' (kk)', '')
WHERE title = 'Sporting CP - Galatasaray'
   OR title = 'Sporting CP 3 - 1 Galatasaray';
