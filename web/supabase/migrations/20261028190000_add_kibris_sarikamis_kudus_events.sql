-- Tarihî Olaylar: Kıbrıs Barış Harekâtı, Sarıkamış Harekâtı ve Kudüs'ün Kaybı yıl dönümleri.
-- Kıbrıs 20 Temmuz - 18 Ağustos 1974 aralığıdır; çip harekâtın başladığı güne sabitlendi.
-- Sarıkamış yalnızca harekâtın başladığı güne (22 Aralık 1914) işlendi; bitiş tarihi kaynaklarda tartışmalı.

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
        $n$Kıbrıs Barış Harekâtı$n$,
        $d$1974'te Kıbrıs'ta gerçekleşen darbenin ardından Türkiye'nin garantörlük hakkına dayanarak başlattığı askerî harekât; iki aşamada yürütülmüş ve adanın kuzeyinin Türk kontrolüne geçmesiyle sonuçlanmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/K%C4%B1br%C4%B1s_Bar%C4%B1%C5%9F_Harek%C3%A2t%C4%B1$u$
      ),
      (
        $n$Sarıkamış Harekâtı$n$,
        $d$1914'te Osmanlı 3. Ordusu'nun Rus kuvvetlerini Sarıkamış çevresinde kuşatmak amacıyla başlattığı kış harekâtı; ağır iklim koşulları ve ikmal yetersizliği nedeniyle on binlerce askerin hayatını kaybetmesiyle sonuçlanmıştır.$d$,
        $u$https://tr.wikipedia.org/wiki/Sar%C4%B1kam%C4%B1%C5%9F_Harek%C3%A2t%C4%B1$u$
      ),
      (
        $n$Kudüs'ün Kaybı$n$,
        $d$1917'de Gazze muharebelerinin ardından Osmanlı kuvvetlerinin çekilmesiyle Kudüs'ün İngiliz ordusuna teslim edilmesi; şehirdeki dört yüzyıllık Osmanlı idaresinin sona ermesidir.$d$,
        $u$https://tr.wikipedia.org/wiki/Kud%C3%BCs_Muharebesi_(1917)$u$
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
  WHERE s.name IN ($n$Kıbrıs Barış Harekâtı$n$, $n$Sarıkamış Harekâtı$n$, $n$Kudüs'ün Kaybı$n$)
    AND NOT EXISTS (SELECT 1 FROM new_subjects ns WHERE ns.name = s.name)
),
new_events AS (
  INSERT INTO public.events (
    title,
    description,
    start_date,
    end_date,
    occurrence_date,
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
    e.occurrence_date::timestamptz,
    true,
    'published',
    'yearly',
    subject_rows.id,
    'commemoration',
    'gregorian'
  FROM (
    VALUES
      (
        $n$Kıbrıs Barış Harekâtı$n$,
        $n$Kıbrıs Barış Harekâtı$n$,
        '1974-07-19 21:00:00+00',
        '1974-08-18 20:59:59+00',
        '1974-07-19 21:00:00+00'
      ),
      (
        $n$Sarıkamış Harekâtı$n$,
        $n$Sarıkamış Harekâtı$n$,
        '1914-12-21 21:00:00+00',
        '1914-12-22 20:59:59+00',
        NULL
      ),
      (
        $n$Kudüs'ün Kaybı$n$,
        $n$Kudüs'ün Kaybı$n$,
        '1917-12-08 21:00:00+00',
        '1917-12-09 20:59:59+00',
        NULL
      )
  ) AS e(subject_name, title, start_date, end_date, occurrence_date)
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
