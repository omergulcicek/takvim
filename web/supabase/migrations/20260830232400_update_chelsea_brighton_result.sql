-- Chelsea 4 - 3 Brighton (Premier Lig)

UPDATE public.events
SET
  title = 'Chelsea 4 - 3 Brighton',
  description = NULLIF(E'Romeo Lavia 4''
Pedro Neto 14''
João Pedro 32''
Cole Palmer 74''

Malick Yalcouyé 35''
João Pedro 63'' (kk)
Pascal Gross 90+6''', '')
WHERE title = 'Chelsea - Brighton'
   OR title = 'Chelsea 4 - 3 Brighton';
