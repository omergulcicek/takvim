-- Crystal Palace 1 - 4 Manchester City (Premier Lig)

UPDATE public.events
SET
  title = 'Crystal Palace 1 - 4 Manchester City',
  description = NULLIF(E'Erling Haaland 17'', 84''
Rayan Cherki 54'', 59''
Gianluigi Donnarumma 56'' (kk)', '')
WHERE title = 'Crystal Palace - Manchester City'
   OR title = 'Crystal Palace 1 - 4 Manchester City';
