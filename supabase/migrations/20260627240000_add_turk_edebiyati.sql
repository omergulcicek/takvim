-- Türk Edebiyatı kategorisi ve 20 yazar; doğum/vefat yıl dönümleri.
-- Tarihler tr.wikipedia infobox verilerine göre (Miladi).

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'Türk Edebiyatı',
  'turk-edebiyati',
  'Türk edebiyatının önemli şair, romancı ve yazarları; doğum ve vefat yıl dönümleri.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'turk-edebiyati'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        'Halide Edib Adıvar',
        'Türk yazar, siyasetçi ve feminist. "Sinekli Bakkal" ve "Ateşten Gömlek" romanlarıyla Türk edebiyatının önde gelen kadın yazarlarındandır.',
        'https://tr.wikipedia.org/wiki/Halide_Edip_Ad%C4%B1var'
      ),
      (
        'Yahya Kemal Beyatlı',
        'Türk şair. "Akşam" ve "Sessiz Gemi" gibi şiirleriyle Türk şiirinin en büyük ustalarından biri kabul edilir.',
        'https://tr.wikipedia.org/wiki/Yahya_Kemal_Beyatl%C4%B1'
      ),
      (
        'Reşat Nuri Güntekin',
        'Türk romancı ve oyun yazarı. "Çalıkuşu" romanıyla tanınır; Anadolu insanını ve kadın sorunlarını işleyen eserleriyle Türk edebiyatında önemli bir yer edinmiştir.',
        'https://tr.wikipedia.org/wiki/Re%C5%9Fat_Nuri_G%C3%BCntekin'
      ),
      (
        'Yakup Kadri Karaosmanoğlu',
        'Türk yazar ve gazeteci. "Yaban", "Kiralık Konak" ve "Ankara" romanlarıyla Cumhuriyet dönemi Türk edebiyatının önemli isimlerindendir.',
        'https://tr.wikipedia.org/wiki/Yakup_Kadri_Karaosmano%C4%9Flu'
      ),
      (
        'Ahmet Hamdi Tanpınar',
        'Türk şair, romancı ve edebiyat tarihçisi. "Huzur" romanı ve "Saatleri Ayarlama Enstitüsü" ile Türk edebiyatının en özgün modernist yazarlarından biridir.',
        'https://tr.wikipedia.org/wiki/Ahmet_Hamdi_Tanp%C4%B1nar'
      ),
      (
        'Nâzım Hikmet',
        'Türk şair, oyun yazarı ve romancı. Serbest nazımın Türkiye''deki öncüsü; "Memleketimden İnsan Manzaraları" ve "835 Satır" gibi eserleriyle dünya edebiyatında tanınır.',
        'https://tr.wikipedia.org/wiki/N%C3%A2z%C4%B1m_Hikmet'
      ),
      (
        'Sait Faik Abasıyanık',
        'Türk öykücü ve şair. İstanbul ve Adalar''ın günlük yaşamını anlatan öyküleriyle Türk hikâye edebiyatının en özgün seslerinden biridir.',
        'https://tr.wikipedia.org/wiki/Sait_Faik_Abas%C4%B1yan%C4%B1k'
      ),
      (
        'Sabahattin Ali',
        'Türk yazar ve şair. "Kürk Mantolu Madonna" ve "Kuyucaklı Yusuf" romanlarıyla Türk edebiyatının en sevilen yazarlarındandır.',
        'https://tr.wikipedia.org/wiki/Sabahattin_Ali'
      ),
      (
        'Cahit Sıtkı Tarancı',
        'Türk şair. "Otuz Beş Yaş" şiiriyle tanınır; duyarlı ve lirik şiirleriyle Türk edebiyatında kalıcı bir yer edinmiştir.',
        'https://tr.wikipedia.org/wiki/Cahit_S%C4%B1tk%C4%B1_Taranc%C4%B1'
      ),
      (
        'Orhan Veli Kanık',
        'Türk şair. Garip akımının kurucularından; günlük dili şiire taşıyarak Türk şiirinde devrim yaratmıştır.',
        'https://tr.wikipedia.org/wiki/Orhan_Veli_Kan%C4%B1k'
      ),
      (
        'Haldun Taner',
        'Türk oyun yazarı ve gazeteci. "Keşanlı Ali Destanı" ve "Eşeğin Gölgesi" gibi oyunlarıyla Türk tiyatrosunun önemli isimlerindendir.',
        'https://tr.wikipedia.org/wiki/Haldun_Taner'
      ),
      (
        'Aziz Nesin',
        'Türk mizah yazarı ve hikâyeci. "Şimdiki Çocuklar Harika" ve "Yaşar Ne Yaşar Ne Yaşamaz" gibi eserleriyle Türk mizah edebiyatının en üretken yazarlarındandır.',
        'https://tr.wikipedia.org/wiki/Aziz_Nesin'
      ),
      (
        'Behçet Necatigil',
        'Türk şair ve oyun yazarı. "Kapalı Çarşı" ve "Eski Toprak" gibi şiirleriyle Türk şiirinin en önemli isimlerinden biridir.',
        'https://tr.wikipedia.org/wiki/Beh%C3%A7et_Necatigil'
      ),
      (
        'Yaşar Kemal',
        'Türk yazar. "İnce Memed" ve "Yer Demir Gök Bakır" romanlarıyla Çukurova''nın destansı anlatımını dünya edebiyatına taşımıştır.',
        'https://tr.wikipedia.org/wiki/Ya%C5%9Far_Kemal'
      ),
      (
        'Attila İlhan',
        'Türk şair, romancı ve senaryo yazarı. "Sokaktaki Adam" ve "Duvar" gibi eserleriyle Türk edebiyatının çok yönlü isimlerindendir.',
        'https://tr.wikipedia.org/wiki/Attila_%C4%B0lhan'
      ),
      (
        'Cemal Süreya',
        'Türk şair. İkinci Yeni akımının önde gelen temsilcilerinden; imgelerle dolu, yoğun şiirleriyle tanınır.',
        'https://tr.wikipedia.org/wiki/Cemal_S%C3%BCreya'
      ),
      (
        'Gülten Akın',
        'Türk şair. "Kızım İşte Adın" ve "Beni Öp Sonra Doğur Beni" gibi şiirleriyle Türk kadın şiirinin öncü isimlerindendir.',
        'https://tr.wikipedia.org/wiki/G%C3%BClten_Ak%C4%B1n'
      ),
      (
        'Sezai Karakoç',
        'Türk şair, yazar ve düşünür. "Mona Roza" şiiri ve "Diriliş" dergisiyle Türk edebiyatı ve düşünce hayatında derin iz bırakmıştır.',
        'https://tr.wikipedia.org/wiki/Sezai_Karako%C3%A7'
      ),
      (
        'Oğuz Atay',
        'Türk yazar. "Tutunamayanlar" romanıyla Türk edebiyatının en özgün ve etkili eserlerinden birini kaleme almıştır.',
        'https://tr.wikipedia.org/wiki/O%C4%9Fuz_Atay'
      ),
      (
        'Cahit Zarifoğlu',
        'Türk şair, yazar ve eleştirmen. "Yedi Güzel" ve "Sonsuzluk Kervanı" gibi eserleriyle Türk İslam edebiyatının önemli isimlerindendir.',
        'https://tr.wikipedia.org/wiki/Cahit_Zarifo%C4%9Flu'
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
    ('Halide Edib Adıvar', 'Halide Edib Adıvar: Doğum Yıl Dönümü', '1882-06-10 21:00:00+00', '1882-06-11 20:59:59+00', 'birth'),
    ('Halide Edib Adıvar', 'Halide Edib Adıvar: Vefat Yıl Dönümü', '1964-01-08 21:00:00+00', '1964-01-09 20:59:59+00', 'death'),
    ('Yahya Kemal Beyatlı', 'Yahya Kemal Beyatlı: Doğum Yıl Dönümü', '1884-12-01 21:00:00+00', '1884-12-02 20:59:59+00', 'birth'),
    ('Yahya Kemal Beyatlı', 'Yahya Kemal Beyatlı: Vefat Yıl Dönümü', '1958-09-30 21:00:00+00', '1958-10-01 20:59:59+00', 'death'),
    ('Reşat Nuri Güntekin', 'Reşat Nuri Güntekin: Doğum Yıl Dönümü', '1889-10-31 21:00:00+00', '1889-11-01 20:59:59+00', 'birth'),
    ('Reşat Nuri Güntekin', 'Reşat Nuri Güntekin: Vefat Yıl Dönümü', '1956-12-06 21:00:00+00', '1956-12-07 20:59:59+00', 'death'),
    ('Yakup Kadri Karaosmanoğlu', 'Yakup Kadri Karaosmanoğlu: Doğum Yıl Dönümü', '1889-03-26 21:00:00+00', '1889-03-27 20:59:59+00', 'birth'),
    ('Yakup Kadri Karaosmanoğlu', 'Yakup Kadri Karaosmanoğlu: Vefat Yıl Dönümü', '1974-12-12 21:00:00+00', '1974-12-13 20:59:59+00', 'death'),
    ('Ahmet Hamdi Tanpınar', 'Ahmet Hamdi Tanpınar: Doğum Yıl Dönümü', '1901-06-22 21:00:00+00', '1901-06-23 20:59:59+00', 'birth'),
    ('Ahmet Hamdi Tanpınar', 'Ahmet Hamdi Tanpınar: Vefat Yıl Dönümü', '1962-01-23 21:00:00+00', '1962-01-24 20:59:59+00', 'death'),
    ('Nâzım Hikmet', 'Nâzım Hikmet: Doğum Yıl Dönümü', '1902-01-14 21:00:00+00', '1902-01-15 20:59:59+00', 'birth'),
    ('Nâzım Hikmet', 'Nâzım Hikmet: Vefat Yıl Dönümü', '1963-06-02 21:00:00+00', '1963-06-03 20:59:59+00', 'death'),
    ('Sait Faik Abasıyanık', 'Sait Faik Abasıyanık: Doğum Yıl Dönümü', '1906-11-17 21:00:00+00', '1906-11-18 20:59:59+00', 'birth'),
    ('Sait Faik Abasıyanık', 'Sait Faik Abasıyanık: Vefat Yıl Dönümü', '1954-04-10 21:00:00+00', '1954-04-11 20:59:59+00', 'death'),
    ('Sabahattin Ali', 'Sabahattin Ali: Doğum Yıl Dönümü', '1907-02-24 21:00:00+00', '1907-02-25 20:59:59+00', 'birth'),
    ('Sabahattin Ali', 'Sabahattin Ali: Vefat Yıl Dönümü', '1948-04-01 21:00:00+00', '1948-04-02 20:59:59+00', 'death'),
    ('Cahit Sıtkı Tarancı', 'Cahit Sıtkı Tarancı: Doğum Yıl Dönümü', '1910-10-26 21:00:00+00', '1910-10-27 20:59:59+00', 'birth'),
    ('Cahit Sıtkı Tarancı', 'Cahit Sıtkı Tarancı: Vefat Yıl Dönümü', '1956-10-17 21:00:00+00', '1956-10-18 20:59:59+00', 'death'),
    ('Orhan Veli Kanık', 'Orhan Veli Kanık: Doğum Yıl Dönümü', '1914-04-12 21:00:00+00', '1914-04-13 20:59:59+00', 'birth'),
    ('Orhan Veli Kanık', 'Orhan Veli Kanık: Vefat Yıl Dönümü', '1950-11-13 21:00:00+00', '1950-11-14 20:59:59+00', 'death'),
    ('Haldun Taner', 'Haldun Taner: Doğum Yıl Dönümü', '1915-05-15 21:00:00+00', '1915-05-16 20:59:59+00', 'birth'),
    ('Haldun Taner', 'Haldun Taner: Vefat Yıl Dönümü', '1986-05-06 21:00:00+00', '1986-05-07 20:59:59+00', 'death'),
    ('Aziz Nesin', 'Aziz Nesin: Doğum Yıl Dönümü', '1915-12-19 21:00:00+00', '1915-12-20 20:59:59+00', 'birth'),
    ('Aziz Nesin', 'Aziz Nesin: Vefat Yıl Dönümü', '1995-07-05 21:00:00+00', '1995-07-06 20:59:59+00', 'death'),
    ('Behçet Necatigil', 'Behçet Necatigil: Doğum Yıl Dönümü', '1916-04-05 21:00:00+00', '1916-04-06 20:59:59+00', 'birth'),
    ('Behçet Necatigil', 'Behçet Necatigil: Vefat Yıl Dönümü', '1979-12-12 21:00:00+00', '1979-12-13 20:59:59+00', 'death'),
    ('Yaşar Kemal', 'Yaşar Kemal: Doğum Yıl Dönümü', '1923-10-05 21:00:00+00', '1923-10-06 20:59:59+00', 'birth'),
    ('Yaşar Kemal', 'Yaşar Kemal: Vefat Yıl Dönümü', '2015-02-27 21:00:00+00', '2015-02-28 20:59:59+00', 'death'),
    ('Attila İlhan', 'Attila İlhan: Doğum Yıl Dönümü', '1925-06-14 21:00:00+00', '1925-06-15 20:59:59+00', 'birth'),
    ('Attila İlhan', 'Attila İlhan: Vefat Yıl Dönümü', '2005-10-09 21:00:00+00', '2005-10-10 20:59:59+00', 'death'),
    ('Cemal Süreya', 'Cemal Süreya: Doğum Yıl Dönümü', '1931-02-12 21:00:00+00', '1931-02-13 20:59:59+00', 'birth'),
    ('Cemal Süreya', 'Cemal Süreya: Vefat Yıl Dönümü', '1990-08-15 21:00:00+00', '1990-08-16 20:59:59+00', 'death'),
    ('Gülten Akın', 'Gülten Akın: Doğum Yıl Dönümü', '1933-01-18 21:00:00+00', '1933-01-19 20:59:59+00', 'birth'),
    ('Gülten Akın', 'Gülten Akın: Vefat Yıl Dönümü', '2015-11-02 21:00:00+00', '2015-11-03 20:59:59+00', 'death'),
    ('Sezai Karakoç', 'Sezai Karakoç: Doğum Yıl Dönümü', '1933-01-21 21:00:00+00', '1933-01-22 20:59:59+00', 'birth'),
    ('Sezai Karakoç', 'Sezai Karakoç: Vefat Yıl Dönümü', '2021-11-15 21:00:00+00', '2021-11-16 20:59:59+00', 'death'),
    ('Oğuz Atay', 'Oğuz Atay: Doğum Yıl Dönümü', '1934-10-11 21:00:00+00', '1934-10-12 20:59:59+00', 'birth'),
    ('Oğuz Atay', 'Oğuz Atay: Vefat Yıl Dönümü', '1977-12-12 21:00:00+00', '1977-12-13 20:59:59+00', 'death'),
    ('Cahit Zarifoğlu', 'Cahit Zarifoğlu: Doğum Yıl Dönümü', '1940-12-23 21:00:00+00', '1940-12-24 20:59:59+00', 'birth'),
    ('Cahit Zarifoğlu', 'Cahit Zarifoğlu: Vefat Yıl Dönümü', '1987-05-28 21:00:00+00', '1987-05-29 20:59:59+00', 'death')
) AS e(subject_name, title, start_date, end_date, kind)
  ON inserted.name = e.subject_name;