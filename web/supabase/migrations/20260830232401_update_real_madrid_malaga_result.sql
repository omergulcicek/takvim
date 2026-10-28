-- Real Madrid 4 - 0 Malaga (La Liga)

UPDATE public.events
SET
  title = 'Real Madrid 4 - 0 Malaga',
  description = NULLIF(E'Jude Bellingham 19''
Kylian Mbappé 30''
Arda Güler 90+1''

Alfonso Herrero 26'' (kk)', '')
WHERE title = 'Real Madrid - Malaga'
   OR title = 'Real Madrid 4 - 0 Malaga';
