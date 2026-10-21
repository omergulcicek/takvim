-- Nottingham Forest 0 - 1 Arsenal (Premier Lig)

UPDATE public.events
SET
  title = 'Nottingham Forest 0 - 1 Arsenal',
  description = NULLIF(E'Noni Madueke 80''', '')
WHERE title = 'Nottingham Forest - Arsenal'
   OR title = 'Nottingham Forest 0 - 1 Arsenal';
