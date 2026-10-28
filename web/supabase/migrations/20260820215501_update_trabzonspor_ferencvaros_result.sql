-- Trabzonspor 0 - 1 Ferencváros (Avrupa Ligi play-off ilk maç)

UPDATE public.events
SET
  title = 'Trabzonspor 0 - 1 Ferencváros',
  description = NULLIF(E'Kristoffer Zachariassen 17''', '')
WHERE title = 'Trabzonspor - Ferencváros'
   OR title = 'Trabzonspor 0 - 1 Ferencváros';
