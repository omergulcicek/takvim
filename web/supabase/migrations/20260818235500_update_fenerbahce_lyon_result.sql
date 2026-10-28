-- Fenerbahçe 1 - 1 Lyon (Şampiyonlar Ligi play-off ilk maç)

UPDATE public.events
SET
  title = 'Fenerbahçe 1 - 1 Lyon',
  description = NULLIF(E'Mason Greenwood 47''

Loïs Openda 40''', '')
WHERE title = 'Fenerbahçe - Lyon'
   OR title = 'Fenerbahçe 1 - 1 Lyon';
