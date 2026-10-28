-- Kurtuluş günlerinde Adana yerine Şanlıurfa.
-- Adana'nın Kurtuluşu (5 Ocak 1922) kaldırıldı; yerine Şanlıurfa'nın Kurtuluşu eklendi.
-- Şanlıurfa -> 11 Nisan 1920, Fransız kuvvetlerinin sabah şehirden çekilmesi.
--              TBMM kayıtları ve her yıl yapılan kutlamalarla sabit bir tarihtir.
-- Böylece kategoride Maraş, Antep ve Urfa kalıyor.

-- 1) Adana'nın Kurtuluşu: etkinlik (event_categories ON DELETE CASCADE ile temizlenir)
DELETE FROM public.events e
WHERE e.subject_id IN (
  SELECT s.id
  FROM public.subjects s
  JOIN public.categories c ON c.id = s.category_id
  WHERE c.slug = 'tarihi-olaylar'
    AND s.name = $n$Adana'nın Kurtuluşu$n$
);

-- 2) ...ve artık etkinliği kalmayan subject
DELETE FROM public.subjects s
USING public.categories c
WHERE c.id = s.category_id
  AND c.slug = 'tarihi-olaylar'
  AND s.name = $n$Adana'nın Kurtuluşu$n$;

-- 3) Şanlıurfa'nın Kurtuluşu
WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar'
),
new_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    $n$Şanlıurfa'nın Kurtuluşu$n$,
    $d$1920'de Urfalı milislerin Fransız işgaline karşı verdiği direnişin ardından Fransız kuvvetlerinin şehirden çekilmesi; şehre bu mücadelesi nedeniyle 1984'te "Şanlı" unvanı verilerek adı Şanlıurfa olmuştur.$d$,
    $u$https://tr.wikipedia.org/wiki/%C5%9Eanl%C4%B1urfa$u$
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = $n$Şanlıurfa'nın Kurtuluşu$n$
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM new_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = $n$Şanlıurfa'nın Kurtuluşu$n$
    AND NOT EXISTS (SELECT 1 FROM new_subject)
),
new_event AS (
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
    $n$Şanlıurfa'nın Kurtuluşu$n$,
    NULL,
    '1920-04-10 21:00:00+00'::timestamptz,
    '1920-04-11 20:59:59+00'::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    'commemoration',
    'gregorian'
  FROM subject_row
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = $n$Şanlıurfa'nın Kurtuluşu$n$
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT new_event.id, cat.id
FROM new_event
CROSS JOIN cat
ON CONFLICT DO NOTHING;
