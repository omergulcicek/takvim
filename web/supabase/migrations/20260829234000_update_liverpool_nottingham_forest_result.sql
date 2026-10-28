-- Liverpool 2 - 2 Nottingham Forest (Premier Lig)

UPDATE public.events
SET
  title = 'Liverpool 2 - 2 Nottingham Forest',
  description = NULLIF(E'Alexander Isak 60''
Víctor Muñoz 82''

Dan Ndoye 24''
Morgan Gibbs-White 70'' (Penaltı)', '')
WHERE title = 'Liverpool - Nottingham Forest'
   OR title = 'Liverpool 2 - 2 Nottingham Forest';
