-- Lyon 1 - 2 Fenerbahçe (Şampiyonlar Ligi play-off rövanş)

UPDATE public.events
SET
  title = 'Lyon 1 - 2 Fenerbahçe',
  description = NULLIF(E'Malick Fofana 61''

Vedat Muriqi 24''
Archie Brown 28''', '')
WHERE title = 'Lyon - Fenerbahçe'
   OR title = 'Lyon 1 - 2 Fenerbahçe';
