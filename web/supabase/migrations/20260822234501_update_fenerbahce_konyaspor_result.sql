-- Fenerbahçe 4 - 2 Konyaspor (Süper Lig)

UPDATE public.events
SET
  title = 'Fenerbahçe 4 - 2 Konyaspor',
  description = NULLIF(E'Vedat Muriqi 7''
Mason Greenwood 20''
Marco Asensio 33''
Mason Greenwood 49''

Ebrima Colley 11''
Deniz Türüç 90+4''', '')
WHERE title = 'Fenerbahçe - Konyaspor'
   OR title = 'Fenerbahçe 4 - 2 Konyaspor';
