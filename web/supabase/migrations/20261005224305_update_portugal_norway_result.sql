-- Portekiz 2 - 1 Norveç (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Portekiz 2 - 1 Norveç',
  description = NULLIF(E'João Cancelo 38''
Gonçalo Ramos 79''
Francisco Conceição 86'' (Kırmızı kart)

Kristoffer Ajer 36''', '')
WHERE title = 'Portekiz - Norveç'
   OR title = 'Portekiz 2 - 1 Norveç';
