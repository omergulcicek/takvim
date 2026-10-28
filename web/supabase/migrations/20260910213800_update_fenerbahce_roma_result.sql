-- Fenerbahçe 1 - 1 Roma (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Fenerbahçe 1 - 1 Roma',
  description = NULLIF(E'Archie Brown 48''

Bryan Cristante 39''', '')
WHERE title = 'Fenerbahçe - Roma'
   OR title = 'Fenerbahçe 1 - 1 Roma';
