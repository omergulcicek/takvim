-- İspanya 3 - 1 Çekya (Uluslar Ligi)

UPDATE public.events
SET
  title = 'İspanya 3 - 1 Çekya',
  description = NULLIF(E'Lamine Yamal 6''
Rodri 35''
Mikel Merino 89''

Jiri Sláma 69''
Ladislav Krejcí 85'' (Kırmızı kart)', '')
WHERE title = 'İspanya - Çekya'
   OR title = 'İspanya 3 - 1 Çekya';
