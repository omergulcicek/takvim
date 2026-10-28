-- Türk Edebiyatı: Garip, İkinci Yeni ve Yedi Güzel Adam kümelerini tamamlayan on yazar.
-- Erdem Bayazıt'ın doğumu yalnızca 1939 olarak biliniyor; bu nedenle yalnızca vefat yıl dönümü eklendi.

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'turk-edebiyati'
),
new_subjects AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        $n$Ömer Seyfettin$n$,
        $d$Modern Türk öykücülüğünün kurucularından; Genç Kalemler hareketinin öncü ismi. Yalın bir dil ve Millî Edebiyat anlayışını savunmuş; Kaşağı, Yüksek Ökçeler ve Falaka gibi hikâyeleriyle tanınır.$d$,
        $u$https://tr.wikipedia.org/wiki/%C3%96mer_Seyfettin$u$
      ),
      (
        $n$Ziya Gökalp$n$,
        $d$Türk sosyolojisinin kurucusu sayılan şair, yazar ve düşünür. Türkleşmek, İslamlaşmak, Muasırlaşmak ve Türkçülüğün Esasları ile Türk milliyetçiliğinin kuramsal çerçevesini kurmuştur.$d$,
        $u$https://tr.wikipedia.org/wiki/Ziya_G%C3%B6kalp$u$
      ),
      (
        $n$Peyami Safa$n$,
        $d$Türk romancı, gazeteci ve denemeci. Dokuzuncu Hariciye Koğuşu ve Fatih-Harbiye ile Doğu-Batı meselesini ve psikolojik derinliği romana taşımış; Server Bedi takma adıyla da yazmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/Peyami_Safa$u$
      ),
      (
        $n$Tarık Buğra$n$,
        $d$Türk romancı, oyun yazarı ve gazeteci. Küçük Ağa, Osmancık ve İbişin Rüyası ile Millî Mücadele'yi ve Osmanlı kuruluş dönemini bireyin iç dünyasından anlatmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/Tar%C4%B1k_Bu%C4%9Fra$u$
      ),
      (
        $n$Melih Cevdet Anday$n$,
        $d$Garip hareketini Orhan Veli ve Oktay Rifat'la birlikte kuran şair, yazar ve denemeci. Rahatı Kaçan Ağaç ve Kolları Bağlı Odysseus ile söyleyişte yalınlıktan düşünsel şiire geçmiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/Melih_Cevdet_Anday$u$
      ),
      (
        $n$Oktay Rifat$n$,
        $d$Garip hareketinin üç şairinden biri; şair, oyun yazarı ve romancı. Perçemli Sokak'la soyut imgeye yönelmiş, Türk şiirinde biçim ve dil arayışını sürdürmüştür.$d$,
        $u$https://tr.wikipedia.org/wiki/Oktay_Rifat_Horozcu$u$
      ),
      (
        $n$Turgut Uyar$n$,
        $d$İkinci Yeni şiirinin önde gelen şairi. Dünyanın En Güzel Arabistanı ve Divan ile kent insanının yabancılaşmasını, geleneksel biçimleri modern duyarlıkla birleştirerek işlemiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/Turgut_Uyar$u$
      ),
      (
        $n$Edip Cansever$n$,
        $d$İkinci Yeni şiirinin kurucu şairlerinden. Yerçekimli Karanfil ve Çağrılmayan Yakup ile Türk şiirine dramatik monolog ve kişi kurgusunu getirmiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/Edip_Cansever$u$
      ),
      (
        $n$Mehmet Akif İnan$n$,
        $d$Yedi Güzel Adam oluşumundan şair, yazar ve sendikacı. Hicret ve Tenha Sözler ile geleneğe yaslanan bir şiir dili kurmuş; Eğitim-Bir-Sen ile Memur-Sen'in kurucu genel başkanlığını yapmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/Mehmet_Akif_%C4%B0nan$u$
      ),
      (
        $n$Erdem Bayazıt$n$,
        $d$Yedi Güzel Adam oluşumundan şair ve yazar. Sebep Ey ve Risaleler ile toplumsal duyarlığı tasavvufi bir dille birleştirmiş; Edebiyat ve Mavera dergilerinin kurucuları arasında yer almıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/Erdem_Bayaz%C4%B1t$u$
      )
  ) AS v(name, description, source_url)
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    WHERE s.category_id = cat.id
      AND s.name = v.name
  )
  RETURNING id, name
),
subject_rows AS (
  SELECT id, name FROM new_subjects
  UNION ALL
  SELECT s.id, s.name
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name IN (
      $n$Ömer Seyfettin$n$,
      $n$Ziya Gökalp$n$,
      $n$Peyami Safa$n$,
      $n$Tarık Buğra$n$,
      $n$Melih Cevdet Anday$n$,
      $n$Oktay Rifat$n$,
      $n$Turgut Uyar$n$,
      $n$Edip Cansever$n$,
      $n$Mehmet Akif İnan$n$,
      $n$Erdem Bayazıt$n$
    )
    AND NOT EXISTS (SELECT 1 FROM new_subjects ns WHERE ns.name = s.name)
),
new_events AS (
  INSERT INTO public.events (
    title,
    description,
    start_date,
    end_date,
    is_all_day,
    status,
    recurrence,
    subject_id,
    kind,
    calendar_system
  )
  SELECT
    e.title,
    NULL,
    e.start_date::timestamptz,
    e.end_date::timestamptz,
    true,
    'published',
    'yearly',
    subject_rows.id,
    e.kind,
    'gregorian'
  FROM (
    VALUES
      -- 11 Mart 1884 / 6 Mart 1920
      ($n$Ömer Seyfettin$n$, $n$Ömer Seyfettin: Doğum Yıl Dönümü$n$, '1884-03-10 21:00:00+00', '1884-03-11 20:59:59+00', 'birth'),
      ($n$Ömer Seyfettin$n$, $n$Ömer Seyfettin: Vefat Yıl Dönümü$n$, '1920-03-05 21:00:00+00', '1920-03-06 20:59:59+00', 'death'),
      -- 23 Mart 1876 / 25 Ekim 1924
      ($n$Ziya Gökalp$n$, $n$Ziya Gökalp: Doğum Yıl Dönümü$n$, '1876-03-22 21:00:00+00', '1876-03-23 20:59:59+00', 'birth'),
      ($n$Ziya Gökalp$n$, $n$Ziya Gökalp: Vefat Yıl Dönümü$n$, '1924-10-24 21:00:00+00', '1924-10-25 20:59:59+00', 'death'),
      -- 2 Nisan 1899 / 15 Haziran 1961
      ($n$Peyami Safa$n$, $n$Peyami Safa: Doğum Yıl Dönümü$n$, '1899-04-01 21:00:00+00', '1899-04-02 20:59:59+00', 'birth'),
      ($n$Peyami Safa$n$, $n$Peyami Safa: Vefat Yıl Dönümü$n$, '1961-06-14 21:00:00+00', '1961-06-15 20:59:59+00', 'death'),
      -- 2 Eylül 1918 / 26 Şubat 1994
      ($n$Tarık Buğra$n$, $n$Tarık Buğra: Doğum Yıl Dönümü$n$, '1918-09-01 21:00:00+00', '1918-09-02 20:59:59+00', 'birth'),
      ($n$Tarık Buğra$n$, $n$Tarık Buğra: Vefat Yıl Dönümü$n$, '1994-02-25 21:00:00+00', '1994-02-26 20:59:59+00', 'death'),
      -- 13 Mart 1915 / 28 Kasım 2002
      ($n$Melih Cevdet Anday$n$, $n$Melih Cevdet Anday: Doğum Yıl Dönümü$n$, '1915-03-12 21:00:00+00', '1915-03-13 20:59:59+00', 'birth'),
      ($n$Melih Cevdet Anday$n$, $n$Melih Cevdet Anday: Vefat Yıl Dönümü$n$, '2002-11-27 21:00:00+00', '2002-11-28 20:59:59+00', 'death'),
      -- 10 Haziran 1914 / 18 Nisan 1988
      ($n$Oktay Rifat$n$, $n$Oktay Rifat: Doğum Yıl Dönümü$n$, '1914-06-09 21:00:00+00', '1914-06-10 20:59:59+00', 'birth'),
      ($n$Oktay Rifat$n$, $n$Oktay Rifat: Vefat Yıl Dönümü$n$, '1988-04-17 21:00:00+00', '1988-04-18 20:59:59+00', 'death'),
      -- 4 Ağustos 1927 / 22 Ağustos 1985
      ($n$Turgut Uyar$n$, $n$Turgut Uyar: Doğum Yıl Dönümü$n$, '1927-08-03 21:00:00+00', '1927-08-04 20:59:59+00', 'birth'),
      ($n$Turgut Uyar$n$, $n$Turgut Uyar: Vefat Yıl Dönümü$n$, '1985-08-21 21:00:00+00', '1985-08-22 20:59:59+00', 'death'),
      -- 8 Ağustos 1928 / 28 Mayıs 1986
      ($n$Edip Cansever$n$, $n$Edip Cansever: Doğum Yıl Dönümü$n$, '1928-08-07 21:00:00+00', '1928-08-08 20:59:59+00', 'birth'),
      ($n$Edip Cansever$n$, $n$Edip Cansever: Vefat Yıl Dönümü$n$, '1986-05-27 21:00:00+00', '1986-05-28 20:59:59+00', 'death'),
      -- 12 Temmuz 1940 / 6 Ocak 2000
      ($n$Mehmet Akif İnan$n$, $n$Mehmet Akif İnan: Doğum Yıl Dönümü$n$, '1940-07-11 21:00:00+00', '1940-07-12 20:59:59+00', 'birth'),
      ($n$Mehmet Akif İnan$n$, $n$Mehmet Akif İnan: Vefat Yıl Dönümü$n$, '2000-01-05 21:00:00+00', '2000-01-06 20:59:59+00', 'death'),
      -- 5 Temmuz 2008
      ($n$Erdem Bayazıt$n$, $n$Erdem Bayazıt: Vefat Yıl Dönümü$n$, '2008-07-04 21:00:00+00', '2008-07-05 20:59:59+00', 'death')
  ) AS e(subject_name, title, start_date, end_date, kind)
  JOIN subject_rows ON subject_rows.name = e.subject_name
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events ev WHERE ev.title = e.title
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT new_events.id, cat.id
FROM new_events
CROSS JOIN cat
ON CONFLICT DO NOTHING;
