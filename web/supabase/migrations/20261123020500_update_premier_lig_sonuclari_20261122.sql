-- Premier Lig: Liverpool 4 - 0 Manchester United (22 Kasım 2026) sonucu ve goller
-- Not: Leny Yoro kırmızı kartı (8') tek kaynakta göründüğü için doğrulanamadı, yazılmadı.

UPDATE public.events
SET
  title = 'Liverpool 4 - 0 Manchester United',
  description = NULLIF(E'Dominik Szoboszlai 10''
Florian Wirtz 13''
Rio Ngumoha 66''
Víctor Muñoz 82''', '')
WHERE title = 'Liverpool - Manchester United'
   OR title = 'Liverpool 4 - 0 Manchester United';
