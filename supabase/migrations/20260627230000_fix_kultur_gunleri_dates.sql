-- Kültürel Günler tarihlerini Türkiye duvar saati kodlamasına göre düzelt.
-- Takvim günü D için: start = (D-1) 21:00 UTC, tek gün bitiş = D 20:59:59 UTC,
-- çok günlü bitiş = son_gün 17:59:59 UTC.

UPDATE public.events e
SET
  start_date = v.start_date::timestamptz,
  end_date = v.end_date::timestamptz,
  occurrence_date = v.occurrence_date::timestamptz
FROM public.categories c,
LATERAL (
  VALUES
    (
      'Nevruz Bayramı',
      '2000-03-20 21:00:00+00',
      '2000-03-21 20:59:59+00',
      NULL::text
    ),
    (
      'Orman Haftası',
      '2000-03-20 21:00:00+00',
      '2000-03-26 17:59:59+00',
      NULL::text
    ),
    (
      'Yerli Malı Haftası',
      '2000-12-11 21:00:00+00',
      '2000-12-18 17:59:59+00',
      NULL::text
    ),
    (
      'İstiklâl Marşı''nın Kabulü',
      '2000-03-11 21:00:00+00',
      '2000-03-12 20:59:59+00',
      NULL::text
    ),
    (
      'Şehitler Günü',
      '2000-03-17 21:00:00+00',
      '2000-03-18 20:59:59+00',
      NULL::text
    ),
    (
      'Mevlana Haftası',
      '2000-12-06 21:00:00+00',
      '2000-12-17 17:59:59+00',
      NULL::text
    )
) AS v(title, start_date, end_date, occurrence_date)
WHERE e.category_id = c.id
  AND c.slug = 'kultur-gunleri'
  AND e.title = v.title;
