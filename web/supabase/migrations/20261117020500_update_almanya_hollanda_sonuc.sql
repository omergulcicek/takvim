-- Almanya 5 - 0 Hollanda (Uluslar Ligi, 6. hafta) sonucu ve goller

UPDATE public.events
SET
  title = 'Almanya 5 - 0 Hollanda',
  description = NULLIF(E'Derry Scherhant 41''
Florian Wirtz 60'', 71''
Nico Schlotterbeck 65''
Brajan Gruda 77''', '')
WHERE title = 'Almanya - Hollanda'
   OR title = 'Almanya 5 - 0 Hollanda';
