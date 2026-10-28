-- Beşiktaş 3 - 0 Kauno Žalgiris (Avrupa Ligi play-off ilk maç)

UPDATE public.events
SET
  title = 'Beşiktaş 3 - 0 Kauno Žalgiris',
  description = NULLIF(E'Hyeon-gyu Oh 6''
Amir Murillo 12''
Orkun Kökçü 60'' (Penaltı)', '')
WHERE title = 'Beşiktaş - Kauno Žalgiris'
   OR title = 'Beşiktaş 3 - 0 Kauno Žalgiris';
