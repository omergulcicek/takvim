-- Almanya 0 - 1 Yunanistan (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Almanya 0 - 1 Yunanistan',
  description = NULLIF(E'Dimitrios Kourbelis 74''', '')
WHERE title = 'Almanya - Yunanistan'
   OR title = 'Almanya 0 - 1 Yunanistan';
