-- Amed SK 3 - 2 Beşiktaş (Süper Lig)

UPDATE public.events
SET
  title = 'Amed SK 3 - 2 Beşiktaş',
  description = NULLIF(E'Gift Orban 13''
Dia Saba 22''
Furkan Soyalp 59''
Amadou Cissé 84'' (Kırmızı kart)

Dusan Vlahovic 55''
Orkun Kökçü 90+8'' (Penaltı)', '')
WHERE title = 'Amed SK - Beşiktaş'
   OR title = 'Amed SK 3 - 2 Beşiktaş';
