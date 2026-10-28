-- Fenerbahçe 1 - 2 Beşiktaş (Süper Lig)

UPDATE public.events
SET
  title = 'Fenerbahçe 1 - 2 Beşiktaş',
  description = NULLIF(E'Milan Skriniar 26''

Rıdvan Yılmaz 38''
Dusan Vlahovic 53''', '')
WHERE title = 'Fenerbahçe - Beşiktaş'
   OR title = 'Fenerbahçe 1 - 2 Beşiktaş';
