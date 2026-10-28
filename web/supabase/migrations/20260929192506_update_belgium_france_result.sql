-- Belçika 0 - 1 Fransa (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Belçika 0 - 1 Fransa',
  description = NULLIF(E'Michael Olise 88''', '')
WHERE title = 'Belçika - Fransa'
   OR title = 'Belçika 0 - 1 Fransa';
