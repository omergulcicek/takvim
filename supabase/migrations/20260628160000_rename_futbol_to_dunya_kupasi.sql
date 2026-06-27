-- Futbol kategorisini Dünya Kupası olarak yeniden adlandır; alt subject kaldır.

UPDATE public.categories
SET
  name = 'Dünya Kupası',
  slug = 'dunya-kupasi',
  "desc" = '2026 FIFA Dünya Kupası maçları; skor ve gol dakikaları.'
WHERE slug = 'futbol';

UPDATE public.events e
SET subject_id = NULL
FROM public.categories c
WHERE e.category_id = c.id
  AND c.slug = 'dunya-kupasi';

DELETE FROM public.subjects s
USING public.categories c
WHERE s.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND s.name = '2026 FIFA Dünya Kupası';
