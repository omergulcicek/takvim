-- Manchester City 3 - 2 Ipswich (Premier Lig)

UPDATE public.events
SET
  title = 'Manchester City 3 - 2 Ipswich',
  description = NULLIF(E'Phil Foden 19''
Erling Haaland 34'', 69''

Daizen Maeda 21''
Zian Flemming 90'' (Penaltı)', '')
WHERE title = 'Manchester City - Ipswich'
   OR title = 'Manchester City 3 - 2 Ipswich';
