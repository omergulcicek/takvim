-- Futbol kategorisi, 2026 FIFA Dünya Kupası turnuvası ve örnek maç kaydı.

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'Futbol',
  'futbol',
  'Seçilmiş lig ve turnuva maçları; skor, gol dakikaları ve turnuva bilgisi.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'futbol'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    '2026 FIFA Dünya Kupası',
    '2026 FIFA Dünya Kupası; ABD, Kanada ve Meksika''da düzenlenen 23. Dünya Kupası.',
    'https://tr.wikipedia.org/wiki/2026_FIFA_D%C3%BCnya_Kupas%C4%B1'
  FROM cat
  RETURNING id
)
INSERT INTO public.events (
  category_id,
  title,
  description,
  start_date,
  end_date,
  is_all_day,
  status,
  recurrence,
  subject_id
)
SELECT
  cat.id,
  '🇦🇺  Avustralya 2 - 0 Türkiye 🇹🇷',
  E'Nestory Irankunda 27''\nConnor Metcalfe 75''',
  '2026-06-13 21:00:00+00'::timestamptz,
  '2026-06-14 20:59:59+00'::timestamptz,
  true,
  'published',
  'none',
  inserted.id
FROM cat
CROSS JOIN inserted;
