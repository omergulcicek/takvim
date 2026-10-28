-- Fulham 2 - 3 Chelsea (Premier Lig)

UPDATE public.events
SET
  title = 'Fulham 2 - 3 Chelsea',
  description = NULLIF(E'Josh King 23''
Gonzalo Garcia 54''

Joao Pedro 1''
Morgan Rogers 41''
Cole Palmer 49''', '')
WHERE title = 'Fulham - Chelsea'
   OR title = 'Fulham 2 - 3 Chelsea';
