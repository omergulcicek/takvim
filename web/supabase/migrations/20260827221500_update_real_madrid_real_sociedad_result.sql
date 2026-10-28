-- Real Madrid 4 - 1 Real Sociedad (La Liga)

UPDATE public.events
SET
  title = 'Real Madrid 4 - 1 Real Sociedad',
  description = NULLIF(E'Kylian Mbappé 40'', 60'', 80''
Vinícius Júnior 68''

Luka Sučić 44''', '')
WHERE title = 'Real Madrid - Real Sociedad'
   OR title = 'Real Madrid 4 - 1 Real Sociedad';
