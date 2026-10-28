-- Samsunspor 0 - 2 Fenerbahçe (Süper Lig)

UPDATE public.events
SET
  title = 'Samsunspor 0 - 2 Fenerbahçe',
  description = NULLIF(E'Vedat Muriqi 3''
Oğuz Aydın 49''', '')
WHERE title = 'Samsunspor - Fenerbahçe'
   OR title = 'Samsunspor 0 - 2 Fenerbahçe';
