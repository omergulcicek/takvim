-- İngiltere 2 - 3 İspanya (Uluslar Ligi)

UPDATE public.events
SET
  title = 'İngiltere 2 - 3 İspanya',
  description = NULLIF(E'Anthony Gordon 36''
Harry Kane 40''

Lamine Yamal 2''
Álex Baena 60''
Mikel Oyarzabal 74''', '')
WHERE title = 'İngiltere - İspanya'
   OR title = 'İngiltere 2 - 3 İspanya';
