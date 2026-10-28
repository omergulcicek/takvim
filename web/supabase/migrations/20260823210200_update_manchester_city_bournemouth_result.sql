-- Manchester City 2 - 1 Bournemouth (Premier Lig)

UPDATE public.events
SET
  title = 'Manchester City 2 - 1 Bournemouth',
  description = NULLIF(E'Marc Guéhi 84''
Joško Gvardiol 90+1''

Marcus Tavernier 26''', '')
WHERE title = 'Manchester City - Bournemouth'
   OR title = 'Manchester City 2 - 1 Bournemouth';
