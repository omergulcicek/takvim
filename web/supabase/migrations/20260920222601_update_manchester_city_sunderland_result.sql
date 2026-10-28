-- Manchester City 5 - 3 Sunderland (Premier Lig)

UPDATE public.events
SET
  title = 'Manchester City 5 - 3 Sunderland',
  description = NULLIF(E'Enzo Fernández 9''
Rayan Cherki 29''
Antoine Semenyo 43'', 57''
Erling Haaland 81''

Brian Brobbey 12'', 33'', 59''', '')
WHERE title = 'Manchester City - Sunderland'
   OR title = 'Manchester City 5 - 3 Sunderland';
