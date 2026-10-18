-- Fenerbahçe 3 - 0 Alanyaspor (Süper Lig)

UPDATE public.events
SET
  title = 'Fenerbahçe 3 - 0 Alanyaspor',
  description = NULLIF(E'Romelu Lukaku 40''
Kerem Aktürkoğlu 71''
Vedat Muriqi 87''', '')
WHERE title = 'Fenerbahçe - Alanyaspor'
   OR title = 'Fenerbahçe 3 - 0 Alanyaspor';
