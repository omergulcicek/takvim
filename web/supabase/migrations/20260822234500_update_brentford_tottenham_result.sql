-- Brentford 3 - 0 Tottenham (Premier Lig)

UPDATE public.events
SET
  title = 'Brentford 3 - 0 Tottenham',
  description = NULLIF(E'Keane Lewis-Potter 12''
Vitaly Janelt 33''
Michael Kayode 49''', '')
WHERE title = 'Brentford - Tottenham'
   OR title = 'Brentford 3 - 0 Tottenham';
