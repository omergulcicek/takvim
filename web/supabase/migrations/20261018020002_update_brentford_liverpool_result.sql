-- Brentford 1 - 2 Liverpool (Premier Lig)

UPDATE public.events
SET
  title = 'Brentford 1 - 2 Liverpool',
  description = NULLIF(E'Keane Lewis-Potter 44''
Yehor Yarmoliuk 45+8'' (Kırmızı kart)
Vitaly Janelt 90+2'' (Kırmızı kart)

Víctor Muñoz 62''
Alexander Isak 70''', '')
WHERE title = 'Brentford - Liverpool'
   OR title = 'Brentford 1 - 2 Liverpool';
