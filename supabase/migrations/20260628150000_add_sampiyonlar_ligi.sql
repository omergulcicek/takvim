-- Şampiyonlar Ligi kategorisi ve 2025-26 eleme maçları (Türkiye saati, ~2 saat süre).

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'Şampiyonlar Ligi',
  'sampiyonlar-ligi',
  'UEFA Şampiyonlar Ligi maçları; skor, gol dakikaları ve turnuva bilgisi.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'sampiyonlar-ligi'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    '2025-26 UEFA Şampiyonlar Ligi',
    '2025-26 UEFA Şampiyonlar Ligi eleme turları ve final.',
    'https://tr.wikipedia.org/wiki/UEFA_%C5%9Eampiyonlar_Ligi'
  FROM cat
  RETURNING id
)
INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT
  cat.id,
  v.title,
  NULLIF(v.description, ''),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul'),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false,
  'published',
  'none',
  inserted.id
FROM cat
CROSS JOIN inserted
CROSS JOIN (
  VALUES
    (
      'Real Madrid 1 - 2 Bayern Münih',
      E'Kylian Mbappé 73''

Luis Díaz 40''
Harry Kane 45''',
      '2026-04-07 22:00:00'
    ),
    (
      'Sporting CP 0 - 1 Arsenal',
      E'Kai Havertz 90''',
      '2026-04-07 22:00:00'
    ),
    (
      'Barcelona 0 - 2 Atletico Madrid',
      E'Pau Cubarsí 43'' (kk)

Julián Álvarez 44''',
      '2026-04-08 22:00:00'
    ),
    (
      'Paris Saint-Germain 2 - 0 Liverpool',
      E'Désiré Doué 10''
Khvicha Kvaratskhelia 64''',
      '2026-04-08 22:00:00'
    ),
    (
      'Atletico Madrid 1 - 2 Barcelona',
      E'Ademola Lookman 30''

Lamine Yamal 3''
Ferran Torres 23''',
      '2026-04-14 22:00:00'
    ),
    (
      'Liverpool 0 - 2 Paris Saint-Germain',
      E'Ousmane Dembélé 71'', 90''',
      '2026-04-14 22:00:00'
    ),
    (
      'Bayern Münih 4 - 3 Real Madrid',
      E'Aleksandar Pavlović 5''
Harry Kane 37''
Luis Díaz 88''
Michael Olise 93''

Arda Güler 1'', 28'', 94''',
      '2026-04-15 22:00:00'
    ),
    (
      'Arsenal 0 - 0 Sporting CP',
      E'',
      '2026-04-15 22:00:00'
    ),
    (
      'Paris Saint-Germain 5 - 4 Bayern Münih',
      E'Khvicha Kvaratskhelia 24'', 56''
João Neves 33''
Ousmane Dembélé 45'', 58''

Harry Kane 17''
Michael Olise 41''
Dayot Upamecano 65''
Luis Díaz 68''',
      '2026-04-28 22:00:00'
    ),
    (
      'Atletico Madrid 1 - 1 Arsenal',
      E'Julián Álvarez 56''

Viktor Gyökeres 44''',
      '2026-04-29 22:00:00'
    ),
    (
      'Arsenal 1 - 0 Atletico Madrid',
      E'Bukayo Saka 44''',
      '2026-05-05 22:00:00'
    ),
    (
      'Bayern Münih 1 - 1 Paris Saint-Germain',
      E'Harry Kane 94''

Ousmane Dembélé 3''',
      '2026-05-06 22:00:00'
    ),
    (
      'Paris Saint-Germain 1 - 1 Arsenal',
      E'Ousmane Dembélé 60''

Kai Havertz 5''',
      '2026-05-30 19:00:00'
    )
) AS v(title, description, local_start);
