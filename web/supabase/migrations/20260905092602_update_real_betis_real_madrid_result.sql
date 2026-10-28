-- Real Betis 1 - 0 Real Madrid (La Liga)

UPDATE public.events
SET
  title = 'Real Betis 1 - 0 Real Madrid',
  description = NULLIF(E'Troy Parrott 81''', '')
WHERE title = 'Real Betis - Real Madrid'
   OR title = 'Real Betis 1 - 0 Real Madrid';
