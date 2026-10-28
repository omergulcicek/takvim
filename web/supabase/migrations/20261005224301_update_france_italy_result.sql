-- Fransa 1 - 1 İtalya (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Fransa 1 - 1 İtalya',
  description = NULLIF(E'Michael Olise 55''
Dayot Upamecano 85'' (Kırmızı kart)

Alessandro Bastoni 68''', '')
WHERE title = 'Fransa - İtalya'
   OR title = 'Fransa 1 - 1 İtalya';
