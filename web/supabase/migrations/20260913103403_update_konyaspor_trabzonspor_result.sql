-- Konyaspor 1 - 0 Trabzonspor (Süper Lig)

UPDATE public.events
SET
  title = 'Konyaspor 1 - 0 Trabzonspor',
  description = NULLIF(E'Rajmund Toth 2''', '')
WHERE title = 'Konyaspor - Trabzonspor'
   OR title = 'Konyaspor 1 - 0 Trabzonspor';
