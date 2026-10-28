-- İngiltere 3 - 0 Çekya (Uluslar Ligi)

UPDATE public.events
SET
  title = 'İngiltere 3 - 0 Çekya',
  description = NULLIF(E'Vladimír Coufal 27'' (kk)
Harry Kane 40'', 57''', '')
WHERE title = 'İngiltere - Çekya'
   OR title = 'İngiltere 3 - 0 Çekya';
