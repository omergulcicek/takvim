-- Savaşlar kategorisi ve 33 savaş/sefer/kuşatma kaydı.
-- Tarihler tr.wikipedia infobox ve madde metnine göre (Miladi).
-- occurrence_date: takvimde chip günü; start_date/end_date: UI'da gösterilen aralık.

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'Savaşlar',
  'savaslar',
  'Türk ve dünya tarihinde iz bırakmış dönüm noktası niteliğindeki askeri çatışmalar, meydan muharebeleri, kuşatmalar ve seferler.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'savaslar'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        'Dandanakan Savaşı',
        '1040 yılında Selçuklu Sultan Mesud ile Gazneli Sultan Mesud arasında Dandanakan (Merv) yakınlarında yapılan meydan muharebesi; Gaznelilerin yıkılışının dönüm noktasıdır.',
        'https://tr.wikipedia.org/wiki/Dandanakan_Sava%C5%9F%C4%B1'
      ),
      (
        'Pasinler Savaşı',
        '1312''de İlhanlı hükümdarı Olcaytu ile Osmanlı Beyi Orhan Gazi arasında Erzurum yakınlarında Pasinler''de yapılan savaş; Osmanlı Beyliği''nin Doğu Anadolu''daki konumunu güçlendirmiştir.',
        'https://tr.wikipedia.org/wiki/Pasinler_Sava%C5%9F%C4%B1'
      ),
      (
        'Malazgirt Meydan Muharebesi',
        '1071''de Büyük Selçuklu Sultanı Alp Arslan ile Bizans İmparatoru IV. Romen Diyogenes arasında Malazgirt''te yapılan savaş; Anadolu''nun Türkleşmesinin başlangıcı kabul edilir.',
        'https://tr.wikipedia.org/wiki/Malazgirt_Meydan_Muharebesi'
      ),
      (
        'Harran Savaşı',
        '1104''te Haçlılar ile Artuklu-Müslüman birlikleri arasında Harran yakınlarında yapılan savaş; Haçlı Seferleri döneminde önemli bir meydan muharebesidir.',
        'https://tr.wikipedia.org/wiki/Harran_Sava%C5%9F%C4%B1'
      ),
      (
        'Koyunhisar (Bafeus) Savaşı',
        '1302''de Osmanlı Beyi Osman Gazi ile Bizans ordusu arasında Bafeus (Koyunhisar) yakınlarında yapılan savaş; Osmanlı Beyliği''nin bağımsızlığının simgesi sayılır.',
        'https://tr.wikipedia.org/wiki/Koyunhisar_Sava%C5%9F%C4%B1'
      ),
      (
        'Sırpsındığı Savaşı',
        '1364''te Osmanlı ordusu ile Sırp-Bulgar-Macar ittifakı arasında Edirne yakınlarında Sırpsındığı''nda yapılan savaş; Rumeli''deki Osmanlı ilerleyişinin önemli aşamalarından biridir.',
        'https://tr.wikipedia.org/wiki/S%C4%B1rps%C4%B1nd%C4%9F%C4%B1_Sava%C5%9F%C4%B1'
      ),
      (
        'Çirmen Savaşı',
        '1371''de Murad I komutasındaki Osmanlı ordusu ile Sırp kralı Vukaşin arasındaki savaş; Sırp ve Bizans karşı direncinin zayıflamasına yol açmıştır.',
        'https://tr.wikipedia.org/wiki/%C3%87irmen_Sava%C5%9F%C4%B1'
      ),
      (
        'I. Kosova Savaşı',
        '1389''da Osmanlı ordusu ile Sırp ve müttefikleri arasında Kosova Ovası''nda yapılan savaş; Balkanlar''daki Osmanlı egemenliğinin temel taşlarından biridir.',
        'https://tr.wikipedia.org/wiki/I._Kosova_Sava%C5%9F%C4%B1'
      ),
      (
        'Niğbolu Savaşı',
        '1396''da Yıldırım Bayezid komutasındaki Osmanlı ordusu ile Haçlı ordusu arasında Niğbolu''da yapılan savaş; Haçlı Seferleri''nin son büyük meydan muharebelerinden biridir.',
        'https://tr.wikipedia.org/wiki/Ni%C4%9Fbolu_Sava%C5%9F%C4%B1'
      ),
      (
        'İstanbul''un Fethi',
        '1453''te Fatih Sultan Mehmed komutasındaki Osmanlı ordusunun Bizans İmparatorluğu''nun başkenti Konstantinopolis''i (İstanbul) kuşatıp fethetmesi; Orta Çağ''ın sonu, Yeni Çağ''ın başlangıcı sayılır.',
        'https://tr.wikipedia.org/wiki/%C4%B0stanbul%27un_Fethi'
      ),
      (
        'Eflak Seferi',
        '1462''de Fatih Sultan Mehmed''in Kazıklı Voyvoda III. Vlad''a karşı düzenlediği cezalandırma seferi; Eflak''ın yeniden Osmanlı hakimiyetine girmesini sağlamıştır.',
        'https://tr.wikipedia.org/wiki/Eflak_Seferi_(1462)'
      ),
      (
        'Otlukbeli Savaşı',
        '1473''te Fatih Sultan Mehmed ile Akkoyunlu hükümdarı Uzun Hasan arasında Otlukbeli''nde yapılan savaş; Doğu Anadolu''daki Osmanlı-Akkoyunlu rekabetinin dönüm noktasıdır.',
        'https://tr.wikipedia.org/wiki/Otlukbeli_Sava%C5%9F%C4%B1'
      ),
      (
        'Çaldıran Savaşı',
        '1514''te Yavuz Sultan Selim ile Safevi hükümdarı I. Tahmasp arasında Çaldıran Ovası''nda yapılan savaş; Osmanlı''nın Doğu sınırındaki Safevi tehdidine karşı kesin zaferidir.',
        'https://tr.wikipedia.org/wiki/%C3%87ald%C4%B1ran_Sava%C5%9F%C4%B1'
      ),
      (
        'Mercidabık Savaşı',
        '1516''da Yavuz Sultan Selim ile Memlük sultanı Kansu Gavri arasında Mercidabık''ta yapılan savaş; Suriye''nin Osmanlı yönetimine girmesinin kapısını açmıştır.',
        'https://tr.wikipedia.org/wiki/Mercidab%C4%B1k_Sava%C5%9F%C4%B1'
      ),
      (
        'Ridaniye Savaşı',
        '1517''de Yavuz Sultan Selim ile Memlük sultanı Tumanbay arasında Kahire yakınlarında Ridaniye''de yapılan savaş; Mısır''ın Osmanlı topraklarına katılmasını sağlamıştır.',
        'https://tr.wikipedia.org/wiki/Ridaniye_Sava%C5%9F%C4%B1'
      ),
      (
        'Belgrad Seferi',
        '1521''de Kanuni Sultan Süleyman''ın Macaristan''ın en güçlü kalesi Belgrad''ı kuşatıp fethetmesi; Macaristan''ın savunma hattının çökertilmesinde belirleyici olmuştur.',
        'https://tr.wikipedia.org/wiki/Belgrad%27%C4%B1n_Fethi'
      ),
      (
        'Rodos''un Fethi',
        '1522''de Kanuni Sultan Süleyman''ın Hospitalier Şövalyelerinin son kalesi Rodos''u kuşatıp ele geçirmesi; Osmanlı''nın Doğu Akdeniz hakimiyetini pekiştirmiştir.',
        'https://tr.wikipedia.org/wiki/Rodos%27un_Fethi'
      ),
      (
        'Mohaç Meydan Muharebesi',
        '1526''da Kanuni Sultan Süleyman ile Macar kralı II. Lajos arasında Mohaç Ovası''nda yapılan savaş; Macaristan''ın Osmanlı egemenliğine girmesinin başlangıcıdır.',
        'https://tr.wikipedia.org/wiki/Moha%C3%A7_Meydan_Muharebesi'
      ),
      (
        'Preveze Deniz Savaşı',
        '1538''de Barbaros Hayreddin Paşa komutasındaki Osmanlı donanması ile Haçlı donanması arasında Preveze açıklarında yapılan deniz savaşı; Akdeniz''deki Osmanlı üstünlüğünü kesinleştirmiştir.',
        'https://tr.wikipedia.org/wiki/Preveze_Deniz_Sava%C5%9F%C4%B1'
      ),
      (
        'Zigetvar Kuşatması',
        '1566''da Kanuni Sultan Süleyman''ın Macaristan''daki son seferinde Zigetvar Kalesi''nin kuşatılması; kuşatma sırasında padişahın vefat ettiği tarihsel dönüm noktasıdır.',
        'https://tr.wikipedia.org/wiki/Zigetvar_Ku%C5%9Fatmas%C4%B1'
      ),
      (
        'II. Viyana Kuşatması',
        '1683''te Kara Mustafa Paşa komutasındaki Osmanlı ordusunun Viyana''yı kuşatması; Avrupa ittifakının müdahalesiyle sona ererek Osmanlı''nın Batı''daki ilerleyişinin durduğu nokta sayılır.',
        'https://tr.wikipedia.org/wiki/II._Viyana_Ku%C5%9Fatmas%C4%B1'
      ),
      (
        'Kırım Savaşı',
        '1853–1856 yılları arasında Osmanlı Devleti ile Rusya arasında Kırım Yarımadası merkezli süren savaş; Avrupa devletlerinin de dahil olduğu büyük bir çatışmadır.',
        'https://tr.wikipedia.org/wiki/K%C4%B1r%C4%B1m_Sava%C5%9F%C4%B1'
      ),
      (
        '93 Harbi',
        '1877–1878 Osmanlı-Rus Savaşı; Rusların Osmanlı topraklarına ilerlemesi üzerine başlamış, Berlin Antlaşması ile sona ermiştir.',
        'https://tr.wikipedia.org/wiki/93_Harbi'
      ),
      (
        'Çanakkale Savaşları',
        '1915–1916 yıllarında İtilaf Devletleri''nin Çanakkale Boğazı''nı geçerek İstanbul''u ele geçirme girişimine karşı Osmanlı ordusunun verdiği savunma savaşlarıdır.',
        'https://tr.wikipedia.org/wiki/%C3%87anakkale_Sava%C5%9F%C4%B1'
      ),
      (
        'Sakarya Meydan Muharebesi',
        '1921''de Türk Kurtuluş Ordusu ile Yunan ordusu arasında Sakarya Nehri boyunca süren meydan muharebesi; Milli Mücadele''nin dönüm noktası kabul edilir.',
        'https://tr.wikipedia.org/wiki/Sakarya_Meydan_Muharebesi'
      ),
      (
        'Büyük Taarruz',
        '1922''de Türk ordusunun Yunan işgaline son vermek için başlattığı genel taarruz harekâtı; Başkomutanlık Meydan Muharebesi''ni de kapsar.',
        'https://tr.wikipedia.org/wiki/B%C3%BCy%C3%BCk_Taarruz'
      ),
      (
        'İzmir''in Kurtuluşu',
        '1922''de Türk ordusunun İzmir''e girerek şehri Yunan işgalinden kurtarması; Milli Mücadele''nin simgesel zaferlerinden biridir.',
        'https://tr.wikipedia.org/wiki/%C4%B0zmir%27in_Kurtulu%C5%9Fu'
      ),
      (
        'Miryokefalon Savaşı',
        '1176''da Anadolu Selçuklu Sultanı II. Kılıç Arslan ile Bizans İmparatoru II. Manuel Komnenos arasında Miryokefalon''da yapılan savaş; Bizans''ın Anadolu''daki son büyük seferinin sonu olmuştur.',
        'https://tr.wikipedia.org/wiki/Miryokefalon_Sava%C5%9F%C4%B1'
      ),
      (
        'Ankara Savaşı',
        '1402''de Timur ile Yıldırım Bayezid arasında Ankara yakınlarında Çubuk Ovası''nda yapılan savaş; Osmanlı''da Fetret Devri''nin başlangıcı sayılır.',
        'https://tr.wikipedia.org/wiki/Ankara_Sava%C5%9F%C4%B1'
      ),
      (
        'Varna Savaşı',
        '1444''te Murad II komutasındaki Osmanlı ordusu ile Macar-Polonya-Haçlı ittifakı arasında Varna''da yapılan savaş; Haçlı Seferleri''nin son büyük meydan muharebelerinden biridir.',
        'https://tr.wikipedia.org/wiki/Varna_Sava%C5%9F%C4%B1'
      ),
      (
        'Turnadağ Savaşı',
        '1644''te IV. Murad döneminde Osmanlı ordusu ile isyancı birlikler arasında Turnadağ''da yapılan savaş; Doğu Anadolu''daki isyanın bastırılmasında belirleyici olmuştur.',
        'https://tr.wikipedia.org/wiki/Turnada%C4%9F_Sava%C5%9F%C4%B1'
      ),
      (
        'II. Kosova Savaşı',
        '1448''de Murad II ile Macar kralı III. Ulászló arasında Kosova Ovası''nda yapılan savaş; I. Kosova''dan sonra Balkanlar''daki Osmanlı-Macar rekabetinin devam ettiği önemli bir muharebedir.',
        'https://tr.wikipedia.org/wiki/II._Kosova_Sava%C5%9F%C4%B1'
      ),
      (
        'Dumlupınar Meydan Muharebesi',
        '1922''de Büyük Taarruz kapsamında Türk ordusu ile Yunan ordusu arasında Dumlupınar''da yapılan meydan muharebesi; Yunan ordusunun Anadolu''dan tamamen çıkarılmasını sağlamıştır.',
        'https://tr.wikipedia.org/wiki/Dumlup%C4%B1nar_Meydan_Muharebesi'
      )
  ) AS v(name, description, source_url)
  RETURNING id, name
)
INSERT INTO public.events (
  category_id,
  title,
  start_date,
  end_date,
  occurrence_date,
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
  e.occurrence_date::timestamptz,
  true,
  'published',
  'yearly',
  inserted.id,
  'commemoration'
FROM cat
JOIN inserted ON true
JOIN (
  VALUES
    -- subject_name, title, start_date, end_date, occurrence_date (null = tek gün)
    ('Dandanakan Savaşı', 'Dandanakan Savaşı', '1040-08-22 21:00:00+00', '1040-08-23 20:59:59+00', NULL),
    ('Pasinler Savaşı', 'Pasinler Savaşı', '1312-09-19 21:00:00+00', '1312-09-20 20:59:59+00', NULL),
    ('Malazgirt Meydan Muharebesi', 'Malazgirt Meydan Muharebesi', '1071-08-25 21:00:00+00', '1071-08-26 20:59:59+00', NULL),
    ('Harran Savaşı', 'Harran Savaşı', '1104-05-06 21:00:00+00', '1104-05-07 20:59:59+00', NULL),
    ('Koyunhisar (Bafeus) Savaşı', 'Koyunhisar (Bafeus) Savaşı', '1302-07-26 21:00:00+00', '1302-07-27 20:59:59+00', NULL),
    ('Sırpsındığı Savaşı', 'Sırpsındığı Savaşı', '1364-09-25 21:00:00+00', '1364-09-26 20:59:59+00', NULL),
    ('Çirmen Savaşı', 'Çirmen Savaşı', '1371-09-25 21:00:00+00', '1371-09-26 20:59:59+00', NULL),
    ('I. Kosova Savaşı', 'I. Kosova Savaşı', '1389-06-14 21:00:00+00', '1389-06-15 20:59:59+00', NULL),
    ('Niğbolu Savaşı', 'Niğbolu Savaşı', '1396-09-24 21:00:00+00', '1396-09-25 20:59:59+00', NULL),
    ('İstanbul''un Fethi', 'İstanbul''un Fethi', '1453-05-28 21:00:00+00', '1453-05-29 20:59:59+00', NULL),
    ('Eflak Seferi', 'Eflak Seferi', '1462-06-16 21:00:00+00', '1462-07-08 20:59:59+00', '1462-07-07 21:00:00+00'),
    ('Otlukbeli Savaşı', 'Otlukbeli Savaşı', '1473-08-10 21:00:00+00', '1473-08-11 20:59:59+00', NULL),
    ('Çaldıran Savaşı', 'Çaldıran Savaşı', '1514-08-22 21:00:00+00', '1514-08-23 20:59:59+00', NULL),
    ('Mercidabık Savaşı', 'Mercidabık Savaşı', '1516-08-23 21:00:00+00', '1516-08-24 20:59:59+00', NULL),
    ('Ridaniye Savaşı', 'Ridaniye Savaşı', '1517-01-21 21:00:00+00', '1517-01-22 20:59:59+00', NULL),
    ('Belgrad Seferi', 'Belgrad Seferi', '1521-06-24 21:00:00+00', '1521-08-29 20:59:59+00', '1521-08-28 21:00:00+00'),
    ('Rodos''un Fethi', 'Rodos''un Fethi', '1522-06-25 21:00:00+00', '1522-12-22 20:59:59+00', '1522-12-21 21:00:00+00'),
    ('Mohaç Meydan Muharebesi', 'Mohaç Meydan Muharebesi', '1526-08-28 21:00:00+00', '1526-08-29 20:59:59+00', NULL),
    ('Preveze Deniz Savaşı', 'Preveze Deniz Savaşı', '1538-09-27 21:00:00+00', '1538-09-28 20:59:59+00', NULL),
    ('Zigetvar Kuşatması', 'Zigetvar Kuşatması', '1566-08-05 21:00:00+00', '1566-09-08 20:59:59+00', '1566-09-07 21:00:00+00'),
    ('II. Viyana Kuşatması', 'II. Viyana Kuşatması', '1683-07-13 21:00:00+00', '1683-09-12 20:59:59+00', '1683-09-11 21:00:00+00'),
    ('Kırım Savaşı', 'Kırım Savaşı', '1853-10-15 21:00:00+00', '1856-03-30 20:59:59+00', '1853-10-15 21:00:00+00'),
    ('93 Harbi', '93 Harbi', '1877-04-23 21:00:00+00', '1878-03-03 20:59:59+00', '1877-04-23 21:00:00+00'),
    ('Çanakkale Savaşları', 'Çanakkale Savaşları', '1915-02-18 21:00:00+00', '1916-01-09 20:59:59+00', '1915-03-17 21:00:00+00'),
    ('Sakarya Meydan Muharebesi', 'Sakarya Meydan Muharebesi', '1921-08-22 21:00:00+00', '1921-09-13 20:59:59+00', '1921-09-12 21:00:00+00'),
    ('Büyük Taarruz', 'Büyük Taarruz', '1922-08-25 21:00:00+00', '1922-09-18 20:59:59+00', '1922-08-25 21:00:00+00'),
    ('İzmir''in Kurtuluşu', 'İzmir''in Kurtuluşu', '1922-09-08 21:00:00+00', '1922-09-09 20:59:59+00', NULL),
    ('Miryokefalon Savaşı', 'Miryokefalon Savaşı', '1176-09-16 21:00:00+00', '1176-09-17 20:59:59+00', NULL),
    ('Ankara Savaşı', 'Ankara Savaşı', '1402-07-27 21:00:00+00', '1402-07-28 20:59:59+00', NULL),
    ('Varna Savaşı', 'Varna Savaşı', '1444-11-09 21:00:00+00', '1444-11-10 20:59:59+00', NULL),
    ('Turnadağ Savaşı', 'Turnadağ Savaşı', '1644-07-20 21:00:00+00', '1644-07-21 20:59:59+00', NULL),
    ('II. Kosova Savaşı', 'II. Kosova Savaşı', '1448-10-16 21:00:00+00', '1448-10-20 20:59:59+00', '1448-10-16 21:00:00+00'),
    ('Dumlupınar Meydan Muharebesi', 'Dumlupınar Meydan Muharebesi', '1922-08-29 21:00:00+00', '1922-08-30 20:59:59+00', NULL)
) AS e(subject_name, title, start_date, end_date, occurrence_date)
  ON inserted.name = e.subject_name;
