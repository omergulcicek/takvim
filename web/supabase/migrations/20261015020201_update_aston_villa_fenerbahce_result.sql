-- Aston Villa 6 - 0 Fenerbahçe (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Aston Villa 6 - 0 Fenerbahçe',
  description = NULLIF(E'Johan Manzambi 12''
Nicolas Jackson 31'', 39''
Ross Barkley 68'' (Penaltı), 72''
Tammy Abraham 90''', '')
WHERE title = 'Aston Villa - Fenerbahçe'
   OR title = 'Aston Villa 6 - 0 Fenerbahçe';
