-- Kauno Žalgiris 1 - 0 Beşiktaş (Avrupa Ligi play-off rövanş; toplam 1-3 Beşiktaş)

UPDATE public.events
SET
  title = 'Kauno Žalgiris 1 - 0 Beşiktaş',
  description = NULLIF(E'Renan Oliveira 64''', '')
WHERE title = 'Kauno Žalgiris - Beşiktaş'
   OR title = 'Kauno Žalgiris 1 - 0 Beşiktaş';
