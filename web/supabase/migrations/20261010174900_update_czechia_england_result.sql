-- Çekya 0 - 2 İngiltere (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Çekya 0 - 2 İngiltere',
  description = NULLIF(E'Pavel Šulc 25'' (Kırmızı kart)

Anthony Gordon 47''
Harry Kane 69''', '')
WHERE title = 'Çekya - İngiltere'
   OR title = 'Çekya 0 - 2 İngiltere';
