-- Dünya Kupası kategorisini Millî Takımlar olarak yeniden adlandır

UPDATE public.categories
SET
  name = 'Millî Takımlar',
  slug = 'milli-takimlar',
  "desc" = 'Dünya Kupası, Uluslar Ligi, Copa América ve benzeri büyük millî takım organizasyonları.'
WHERE slug = 'dunya-kupasi';
