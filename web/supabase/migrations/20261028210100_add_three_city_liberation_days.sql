-- Tarihî Olaylar: Maraş, Antep ve Adana'nın kurtuluş günleri.
-- Yalnızca bu üç il eklendi; tarihleri resmî kayıt ve kutlamalarla sabit:
--   Kahramanmaraş -> 12 Şubat 1920, Fransız kuvvetlerinin şehri terk etmesi.
--   Gaziantep     -> 25 Aralık 1921, Ankara Antlaşması uyarınca son Fransız askerinin çekilmesi.
--   Adana         -> 5 Ocak 1922, Ankara Antlaşması uyarınca Fransız çekilmesi.
-- Adlandırma mevcut "İzmir'in Kurtuluşu" kaydıyla aynı kalıpta.

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar'
),
new_subjects AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        $n$Kahramanmaraş'ın Kurtuluşu$n$,
        $d$1920'de Maraş halkının Fransız işgaline karşı verdiği direnişin ardından Fransız kuvvetlerinin şehri terk etmesi; şehir bu mücadelesi nedeniyle İstiklal Madalyası ile ödüllendirilmiş, 1973'te adı Kahramanmaraş olmuştur.$d$,
        $u$https://tr.wikipedia.org/wiki/Kahramanmara%C5%9F$u$
      ),
      (
        $n$Gaziantep'in Kurtuluşu$n$,
        $d$1921'de Ankara Antlaşması uyarınca son Fransız askerinin Antep'ten çekilmesi; kuşatma sürerken TBMM tarafından "Gazi" unvanı verilen şehrin işgal dönemi böylece sona ermiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/Antep_Savunmas%C4%B1$u$
      ),
      (
        $n$Adana'nın Kurtuluşu$n$,
        $d$1922'de 20 Ekim 1921 tarihli Ankara Antlaşması uyarınca Fransız kuvvetlerinin Adana ve çevresinden çekilmesi; şehirde üç yıldan uzun süren işgal dönemi sona ermiştir.$d$,
        $u$https://tr.wikipedia.org/wiki/Adana$u$
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
      $n$Kahramanmaraş'ın Kurtuluşu$n$,
      $n$Gaziantep'in Kurtuluşu$n$,
      $n$Adana'nın Kurtuluşu$n$
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
    'commemoration',
    'gregorian'
  FROM (
    VALUES
      -- 12 Şubat 1920
      ($n$Kahramanmaraş'ın Kurtuluşu$n$, $n$Kahramanmaraş'ın Kurtuluşu$n$, '1920-02-11 21:00:00+00', '1920-02-12 20:59:59+00'),
      -- 25 Aralık 1921
      ($n$Gaziantep'in Kurtuluşu$n$, $n$Gaziantep'in Kurtuluşu$n$, '1921-12-24 21:00:00+00', '1921-12-25 20:59:59+00'),
      -- 5 Ocak 1922
      ($n$Adana'nın Kurtuluşu$n$, $n$Adana'nın Kurtuluşu$n$, '1922-01-04 21:00:00+00', '1922-01-05 20:59:59+00')
  ) AS e(subject_name, title, start_date, end_date)
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
