-- Elche 2 - 3 Real Madrid (La Liga)

UPDATE public.events
SET
  title = 'Elche 2 - 3 Real Madrid',
  description = NULLIF(E'Abiel Osorio 71''
Fernando Niño 83''

Matías Dituro 25'' (kk)
Kylian Mbappé 33''
Carlos Espí 90+1''', '')
WHERE title = 'Elche - Real Madrid'
   OR title = 'Elche 2 - 3 Real Madrid';
