-- Hasan el-Benna, Seyyid Kutub, Ömer Nasuhi Bilmen, Elmalılı Muhammed Hamdi Yazır
WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        'Hasan el-Benna',
        'Mısırlı din adamı, yazar ve İhvan-ı Müslimin''in kurucusu. İslam dünyasında modern siyasi İslam düşüncesinin öncü isimlerinden biridir.',
        'https://tr.wikipedia.org/wiki/Hasan_el-Benna'
      ),
      (
        'Seyyid Kutub',
        'Mısırlı yazar, edebiyat eleştirmeni ve İslam düşünürü. "Fi Zilalil-Kur''an" tefsiri ve "Cahiliye" kavramıyla İslam düşüncesinde derin iz bırakmıştır.',
        'https://tr.wikipedia.org/wiki/Seyyid_Kutub'
      ),
      (
        'Ömer Nasuhi Bilmen',
        'Türk alim, hukukçu ve yazar. "Hukuk-ı İslâmiye ve İstinbat-ı Füruat-ı Fıkhıyye" (Büyük İslam İlmihali) eseriyle tanınır.',
        'https://tr.wikipedia.org/wiki/%C3%96mer_Nasuhi_Bilmen'
      ),
      (
        'Elmalılı Muhammed Hamdi Yazır',
        'Türk âlim ve müfessir. Kur''an-ı Kerim''e yazdığı "Hak Dini Kur''an Dili" tefsiriyle Türk İslam ilmihali ve tefsir geleneğinde önemli bir yer edinmiştir.',
        'https://tr.wikipedia.org/wiki/Elmal%C4%B1l%C4%B1_Muhammed_Hamdi_Yaz%C4%B1r'
      )
  ) AS v(name, description, source_url)
  RETURNING id, name
)
INSERT INTO public.events (
  category_id,
  title,
  start_date,
  end_date,
  is_all_day,
  status,
  recurrence,
  subject_id,
  kind
)
SELECT
  cat.id,
  e.title,
  e.start_date::timestamptz,
  e.end_date::timestamptz,
  true,
  'published',
  'yearly',
  inserted.id,
  e.kind
FROM cat
JOIN inserted ON true
JOIN (
  VALUES
    ('Hasan el-Benna', 'Hasan el-Benna: Doğum Yıl Dönümü', '1906-10-13 21:00:00+00', '1906-10-14 20:59:59+00', 'birth'),
    ('Hasan el-Benna', 'Hasan el-Benna: Vefat Yıl Dönümü', '1949-02-11 21:00:00+00', '1949-02-12 20:59:59+00', 'death'),
    ('Seyyid Kutub', 'Seyyid Kutub: Doğum Yıl Dönümü', '1906-10-08 21:00:00+00', '1906-10-09 20:59:59+00', 'birth'),
    ('Seyyid Kutub', 'Seyyid Kutub: Vefat Yıl Dönümü', '1966-08-28 21:00:00+00', '1966-08-29 20:59:59+00', 'death'),
    ('Ömer Nasuhi Bilmen', 'Ömer Nasuhi Bilmen: Doğum Yıl Dönümü', '1884-10-29 21:00:00+00', '1884-10-30 20:59:59+00', 'birth'),
    ('Ömer Nasuhi Bilmen', 'Ömer Nasuhi Bilmen: Vefat Yıl Dönümü', '1971-12-14 21:00:00+00', '1971-12-15 20:59:59+00', 'death'),
    ('Elmalılı Muhammed Hamdi Yazır', 'Elmalılı Muhammed Hamdi Yazır: Doğum Yıl Dönümü', '1878-09-04 21:00:00+00', '1878-09-05 20:59:59+00', 'birth'),
    ('Elmalılı Muhammed Hamdi Yazır', 'Elmalılı Muhammed Hamdi Yazır: Vefat Yıl Dönümü', '1942-05-26 21:00:00+00', '1942-05-27 20:59:59+00', 'death')
) AS e(subject_name, title, start_date, end_date, kind)
  ON inserted.name = e.subject_name;
