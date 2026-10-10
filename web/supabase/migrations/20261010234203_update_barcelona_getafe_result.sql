-- Barcelona 3 - 0 Getafe (La Liga) — FT

UPDATE public.events
SET
  title = 'Barcelona 3 - 0 Getafe',
  description = NULLIF(E'Anthony Gordon 2''
Gabriel Jesus 30''
Jules Koundé 73''', '')
WHERE title = 'Barcelona - Getafe'
   OR title = 'Barcelona 3 - 0 Getafe';
