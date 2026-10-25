-- Liverpool 2 - 0 Brighton (Premier Lig) sonucu ve goller
UPDATE public.events
SET
  title = 'Liverpool 2 - 0 Brighton',
  description = NULLIF(E'Pascal Gross 17'' (Kendi Kalesine)\nAlexander Isak 21''', '')
WHERE title = 'Liverpool - Brighton'
   OR title = 'Liverpool 2 - 0 Brighton';
