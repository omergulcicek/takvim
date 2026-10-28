-- İspanya 4 - 1 Hırvatistan (Uluslar Ligi)

UPDATE public.events
SET
  title = 'İspanya 4 - 1 Hırvatistan',
  description = NULLIF(E'Lamine Yamal 2'', 63''
Marc Pubill 31''
Nico Williams 89''

Dion Drena Beljo 28''', '')
WHERE title = 'İspanya - Hırvatistan'
   OR title = 'İspanya 4 - 1 Hırvatistan';
