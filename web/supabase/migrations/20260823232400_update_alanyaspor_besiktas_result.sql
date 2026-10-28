-- Alanyaspor 1 - 0 Beşiktaş (Süper Lig)

UPDATE public.events
SET
  title = 'Alanyaspor 1 - 0 Beşiktaş',
  description = NULLIF(E'Nuno Lima 73''', '')
WHERE title = 'Alanyaspor - Beşiktaş'
   OR title = 'Alanyaspor 1 - 0 Beşiktaş';
