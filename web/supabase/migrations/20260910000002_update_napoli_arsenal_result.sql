-- Napoli 0 - 1 Arsenal (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Napoli 0 - 1 Arsenal',
  description = NULLIF(E'Martin Ødegaard 75''', '')
WHERE title = 'Napoli - Arsenal'
   OR title = 'Napoli 0 - 1 Arsenal';
