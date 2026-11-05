-- Avrupa kupaları sonuçları (5 Kasım 2026): Celtic - Beşiktaş ve Trabzonspor - Freiburg

UPDATE public.events
SET
  title = 'Celtic 3 - 2 Beşiktaş',
  description = NULLIF(E'Callum Osmand 62''
Camilo Durán 78'', 87''

Junior Olaïtan 54''
Orkun Kökçü 85''', '')
WHERE title = 'Celtic - Beşiktaş'
   OR title = 'Celtic 3 - 2 Beşiktaş';

UPDATE public.events
SET
  title = 'Trabzonspor 0 - 1 Freiburg',
  description = NULLIF(E'Lukas Kübler 14''', '')
WHERE title = 'Trabzonspor - Freiburg'
   OR title = 'Trabzonspor 0 - 1 Freiburg';
