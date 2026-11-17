-- Galler 2 - 3 Portekiz (UEFA Uluslar Ligi) sonucu ve goller
-- Kaynaklar: ESPN ve FotMob (skor, goller ve Pedro Neto 74' kırmızı kart ikisinde de aynı)

UPDATE public.events
SET
  title = 'Galler 2 - 3 Portekiz',
  description = NULLIF(E'David Brooks 13''
Sorba Thomas 40''

Bruno Fernandes 11''
Pedro Neto 43''
Carlos Forbs 70''
Pedro Neto 74'' (Kırmızı kart)', '')
WHERE title = 'Galler - Portekiz'
   OR title = 'Galler 2 - 3 Portekiz';
