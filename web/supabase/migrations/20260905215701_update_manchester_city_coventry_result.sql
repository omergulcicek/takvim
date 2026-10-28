-- Manchester City 1 - 0 Coventry (Premier Lig)

UPDATE public.events
SET
  title = 'Manchester City 1 - 0 Coventry',
  description = NULLIF(E'Erling Haaland 26''', '')
WHERE title = 'Manchester City - Coventry'
   OR title = 'Manchester City 1 - 0 Coventry';
