-- Kategori isim ve slug güncellemeleri.

UPDATE public.categories
SET
  name = 'Milli ve Kültürel Günler',
  slug = 'milli-ve-kulturel-gunler',
  "desc" = 'Türkiye''de kutlanan milli anma günleri, kültürel bayramlar ve farkındalık haftaları.'
WHERE slug = 'kultur-gunleri';

UPDATE public.categories
SET
  name = 'İslam Alimleri',
  slug = 'islam-alimleri',
  "desc" = 'İslam alimleri, müfessirler ve İslam düşünürlerinin doğum ve vefat yıl dönümleri.'
WHERE slug = 'onemli-sahsiyetler';

UPDATE public.categories
SET
  name = 'Savaş ve Fetihler',
  slug = 'savas-ve-fetihler',
  "desc" = 'Selçuklu''dan Kurtuluş Savaşı''na meydan muharebeleri, fetihler, kuşatmalar ve seferler.'
WHERE slug = 'savaslar';
