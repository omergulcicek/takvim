-- Brentford 3 - 0 Chelsea (Premier Lig)

UPDATE public.events
SET
  title = 'Brentford 3 - 0 Chelsea',
  description = NULLIF(E'Jaidon Anthony 61''
Igor Thiago 83''
Fábio Carvalho 90+4''', '')
WHERE title = 'Brentford - Chelsea'
   OR title = 'Brentford 3 - 0 Chelsea';
