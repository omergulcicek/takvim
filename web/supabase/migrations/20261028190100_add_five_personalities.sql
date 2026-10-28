-- Önemli Şahsiyetler: Selahaddin Eyyubi, Ömer Hayyam, Mimar Sinan, İbn Haldun, Nurettin Topçu.
-- Yalnızca gün/ay'ı kesin olan yıl dönümleri eklendi:
--   Selahaddin Eyyubi -> doğumu y. 1137, günü bilinmiyor; yalnızca vefat.
--   Mimar Sinan       -> doğum tarihi bilinmiyor; yalnızca vefat.
--   İbn Haldun        -> vefatı kaynaklarda 17/19 Mart 1406 olarak çelişiyor; yalnızca doğum.
--   Nurettin Topçu    -> doğumu yalnızca 1909 olarak biliniyor; yalnızca vefat.

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
new_subjects AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        $n$Selahaddin Eyyubi$n$,
        $d$Eyyubi Devleti'nin kurucusu ve ilk sultanı. Hattin'de Haçlı ordusunu bozguna uğratarak Kudüs'ü yeniden İslam hâkimiyetine kazandırmış; Mısır, Suriye ve Hicaz'ı tek yönetim altında birleştirmiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/Selahaddin_Eyyubi$u$
      ),
      (
        $n$Ömer Hayyam$n$,
        $d$İranlı şair, matematikçi, astronom ve filozof. Üçüncü derece denklemlerin geometrik çözümü ve Celâlî takviminin hazırlanmasındaki rolüyle tanınır; Rubâiyât'ıyla dünya edebiyatında yer edinmiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/%C3%96mer_Hayyam$u$
      ),
      (
        $n$Mimar Sinan$n$,
        $d$Üç padişah döneminde hassa başmimarı olarak görev yapan Osmanlı mimarı. Şehzade, Süleymaniye ve Selimiye camileriyle klasik Osmanlı mimarisinin zirvesini kurmuş; cami, köprü ve külliye olmak üzere yüzlerce esere imza atmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/Mimar_Sinan$u$
      ),
      (
        $n$İbn Haldun$n$,
        $d$Mukaddime'nin yazarı; tarih felsefesi ve sosyolojinin öncüsü sayılan düşünür. Devletlerin doğuş ve çöküş döngüsünü asabiyet kavramıyla açıklamış, Mağrib ve Mısır'da kadılık ve müderrislik yapmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/%C4%B0bn-i_Haldun$u$
      ),
      (
        $n$Nurettin Topçu$n$,
        $d$Türk ahlak filozofu, yazar ve eğitimci. Hareket dergisini çıkarmış; isyan ahlakı ve Anadolu milliyetçiliği kavramları çevresinde ahlak, maarif ve kültür meselelerini işleyen bir düşünce çizgisi kurmuştur.$d$,
        $u$https://tr.wikipedia.org/wiki/Nurettin_Top%C3%A7u$u$
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
      $n$Selahaddin Eyyubi$n$,
      $n$Ömer Hayyam$n$,
      $n$Mimar Sinan$n$,
      $n$İbn Haldun$n$,
      $n$Nurettin Topçu$n$
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
      -- 4 Mart 1193
      ($n$Selahaddin Eyyubi$n$, $n$Selahaddin Eyyubi: Vefat Yıl Dönümü$n$, '1193-03-03 21:00:00+00', '1193-03-04 20:59:59+00', 'death'),
      -- 18 Mayıs 1048 / 4 Aralık 1131
      ($n$Ömer Hayyam$n$, $n$Ömer Hayyam: Doğum Yıl Dönümü$n$, '1048-05-17 21:00:00+00', '1048-05-18 20:59:59+00', 'birth'),
      ($n$Ömer Hayyam$n$, $n$Ömer Hayyam: Vefat Yıl Dönümü$n$, '1131-12-03 21:00:00+00', '1131-12-04 20:59:59+00', 'death'),
      -- 17 Temmuz 1588
      ($n$Mimar Sinan$n$, $n$Mimar Sinan: Vefat Yıl Dönümü$n$, '1588-07-16 21:00:00+00', '1588-07-17 20:59:59+00', 'death'),
      -- 27 Mayıs 1332
      ($n$İbn Haldun$n$, $n$İbn Haldun: Doğum Yıl Dönümü$n$, '1332-05-26 21:00:00+00', '1332-05-27 20:59:59+00', 'birth'),
      -- 10 Temmuz 1975
      ($n$Nurettin Topçu$n$, $n$Nurettin Topçu: Vefat Yıl Dönümü$n$, '1975-07-09 21:00:00+00', '1975-07-10 20:59:59+00', 'death')
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
