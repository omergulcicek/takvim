-- 15 Kasım Uluslar Ligi sonuçları: Fransa 2 - 1 Türkiye, İspanya 2 - 3 İngiltere

UPDATE public.events
SET
  title = 'Fransa 2 - 1 Türkiye',
  description = NULLIF(E'Emirhan Topçu 49'' (Kendi Kalesine)
Junior Kroupi 80''

Abdülkerim Bardakçı 90''', '')
WHERE title = 'Fransa - Türkiye'
   OR title = 'Fransa 2 - 1 Türkiye';

UPDATE public.events
SET
  title = 'İspanya 2 - 3 İngiltere',
  description = NULLIF(E'Mikel Oyarzabal 65'' (Penaltı)
Nico Williams 75''

Harry Kane 45'' (Penaltı)
Ezri Konsa 53''
Ben White 57''
Elliot Anderson 63'' (Kırmızı kart)', '')
WHERE title = 'İspanya - İngiltere'
   OR title = 'İspanya 2 - 3 İngiltere';
