-- Sunderland 0 - 2 Arsenal (Premier Lig)

UPDATE public.events
SET
  title = 'Sunderland 0 - 2 Arsenal',
  description = NULLIF(E'Reinildo Mandava 90+6'' (Kırmızı kart)

Bruno Guimarães 58''
Bukayo Saka 90+7'' (Penaltı)', '')
WHERE title = 'Sunderland - Arsenal'
   OR title = 'Sunderland 0 - 2 Arsenal';
