-- Real Madrid 4 - 1 Sevilla (La Liga)

UPDATE public.events
SET
  title = 'Real Madrid 4 - 1 Sevilla',
  description = NULLIF(E'Arda Güler 30''
Kylian Mbappé 37'', 63'' (Penaltı)
Yan Diomande 82''

Manu Bueno 80''', '')
WHERE title = 'Real Madrid - Sevilla'
   OR title = 'Real Madrid 4 - 1 Sevilla';
