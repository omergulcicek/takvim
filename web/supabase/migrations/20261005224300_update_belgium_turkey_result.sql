-- Belçika 3 - 0 Türkiye (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Belçika 3 - 0 Türkiye',
  description = NULLIF(E'Kevin De Bruyne 10'', 59''
Romelu Lukaku 76''', '')
WHERE title = 'Belçika - Türkiye'
   OR title = 'Belçika 3 - 0 Türkiye';
