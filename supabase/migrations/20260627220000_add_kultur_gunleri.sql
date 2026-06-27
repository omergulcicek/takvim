-- Kültürel Günler kategorisi ve 6 Miladi yıllık kayıt.
-- Tarihler MEB Belirli Gün ve Haftalar Çizelgesi (RG-18/1/2023-32077) ve resmî kaynaklara göre.
-- occurrence_date: takvimde chip günü; start_date/end_date: UI'da gösterilen aralık.

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'Kültürel Günler',
  'kultur-gunleri',
  'Türkiye''de kutlanan kültürel bayramlar, geleneksel günler ve farkındalık haftaları.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'kultur-gunleri'
)
INSERT INTO public.events (
  category_id,
  title,
  description,
  source_url,
  start_date,
  end_date,
  occurrence_date,
  is_all_day,
  status,
  recurrence
)
SELECT
  cat.id,
  v.title,
  v.description,
  v.source_url,
  v.start_date::timestamptz,
  v.end_date::timestamptz,
  v.occurrence_date::timestamptz,
  true,
  'published',
  'yearly'
FROM cat
CROSS JOIN (
  VALUES
    (
      'Nevruz Bayramı',
      'Baharın gelişini ve doğanın uyanışını simgeleyen, Orta Asya kökenli binlerce yıllık bir kültürel bayramdır. Türkiye''de 21 Mart''ta kutlanır; sembolik ateş yakma, halay ve bahar sofrası gibi geleneklerle anılır. 2010''da UNESCO tarafından İnsanlığın Somut Olmayan Kültürel Mirası listesine alınmıştır.',
      'https://tr.wikipedia.org/wiki/Nevruz',
      '2000-03-20 21:00:00+00',
      '2000-03-21 20:59:59+00',
      NULL
    ),
    (
      'Orman Haftası',
      'Orman bilincini artırmak ve ağaçlandırma çalışmalarını teşvik etmek amacıyla her yıl 21–26 Mart tarihleri arasında kutlanan farkındalık haftasıdır. Okul ve kurumlarda ağaç dikme, orman gezileri ve çevre eğitimi etkinlikleri düzenlenir.',
      'https://tr.wikipedia.org/wiki/Orman_Haftas%C4%B1',
      '2000-03-20 21:00:00+00',
      '2000-03-26 17:59:59+00',
      NULL
    ),
    (
      'Yerli Malı Haftası',
      'Türkiye''de yerli üretimi desteklemek ve tüketiciyi yerli mal kullanmaya teşvik etmek amacıyla her yıl 12–18 Aralık tarihleri arasında kutlanan farkındalık haftasıdır. Resmî adıyla Tutum, Yatırım ve Türk Malları Haftası; okul ve kurumlarda yerli ürün tanıtımı etkinlikleriyle anılır.',
      'https://www.meb.gov.tr/belirli-gun-ve-haftalar-cizelgesi/duyuru/11814',
      '2000-12-11 21:00:00+00',
      '2000-12-18 17:59:59+00',
      NULL
    ),
    (
      'İstiklâl Marşı''nın Kabulü',
      'Türk milletinin bağımsızlık mücadelesinde moral kaynağı olan İstiklâl Marşı''nın Türkiye Büyük Millet Meclisi tarafından kabul edildiği gündür. Mehmet Akif Ersoy''un kaleme aldığı marş, 12 Mart 1921''de resmî marş ilan edilmiştir.',
      'https://tr.wikipedia.org/wiki/%C4%B0stikl%C3%A2l_Mar%C5%9F%C4%B1',
      '2000-03-11 21:00:00+00',
      '2000-03-12 20:59:59+00',
      NULL
    ),
    (
      'Şehitler Günü',
      'Çanakkale Cephesi''nde şehit düşen Mehmetçiklerin anıldığı, Türk milletinin vatan uğruna canını feda eden evlatlarını andığı gündür. 18 Mart 1915''te Deniz Zaferi''nin kutlandığı gün olarak her yıl anma törenleriyle idrak edilir.',
      'https://tr.wikipedia.org/wiki/%C5%9Eehitler_G%C3%BCn%C3%BC',
      '2000-03-17 21:00:00+00',
      '2000-03-18 20:59:59+00',
      NULL
    ),
    (
      'Mevlana Haftası',
      'Mevlana Celaleddin-i Rumi''nin hoşgörü, sevgi ve birlik mesajlarını yaşatmak amacıyla her yıl 7–17 Aralık tarihleri arasında kutulanan kültürel haftadır. Konya''da Şeb-i Arus törenleri ve sema gösterileriyle anılır; Mevlana''nın vuslat yıl dönümü 17 Aralık''a denk gelir.',
      'https://tr.wikipedia.org/wiki/Mevlana_Haftas%C4%B1',
      '2000-12-06 21:00:00+00',
      '2000-12-17 17:59:59+00',
      NULL
    )
) AS v(title, description, source_url, start_date, end_date, occurrence_date)
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events e
  WHERE e.category_id = cat.id
    AND e.title = v.title
);
