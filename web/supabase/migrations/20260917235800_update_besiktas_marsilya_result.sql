-- Beşiktaş 4 - 1 Marsilya (Avrupa Ligi lig aşaması — 1. hafta) — FT

UPDATE public.events
SET
  title = 'Beşiktaş 4 - 1 Marsilya',
  description = NULLIF(E'İlhan Fakılı 15''
Václav Cerný 56''
Amir Murillo 59''
Ernest Poku 81''

Keyliane Abdallah 29''', '')
WHERE title = 'Beşiktaş - Marsilya'
   OR title = 'Beşiktaş 4 - 1 Marsilya';
