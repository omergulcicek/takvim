-- 2026 FIFA Dünya Kupası son 16 turu maçları (Türkiye saati, ~2 saat süre).

INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT
  cat.id,
  v.title,
  NULL,
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul'),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false,
  'published',
  'none',
  NULL
FROM public.categories cat
CROSS JOIN (
  VALUES
    ('🇿🇦 Güney Afrika - Kanada 🇨🇦', '2026-06-28 22:00:00'),
    ('🇧🇷 Brezilya - Japonya 🇯🇵', '2026-06-29 20:00:00'),
    ('🇩🇪 Almanya - Paraguay 🇵🇾', '2026-06-29 23:30:00'),
    ('🇳🇱 Hollanda - Fas 🇲🇦', '2026-06-30 04:00:00'),
    ('🇨🇮 Fildişi Sahili - Norveç 🇳🇴', '2026-06-30 20:00:00'),
    ('🇫🇷 Fransa - İsveç 🇸🇪', '2026-07-01 00:00:00'),
    ('🇲🇽 Meksika - Ekvador 🇪🇨', '2026-07-01 04:00:00'),
    ('🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere - Kongo DC 🇨🇩', '2026-07-01 19:00:00'),
    ('🇧🇪 Belçika - Senegal 🇸🇳', '2026-07-01 23:00:00'),
    ('🇺🇸 ABD - Bosna-Hersek 🇧🇦', '2026-07-02 03:00:00'),
    ('🇪🇸 İspanya - Avusturya 🇦🇹', '2026-07-02 22:00:00'),
    ('🇵🇹 Portekiz - Hırvatistan 🇭🇷', '2026-07-03 02:00:00'),
    ('🇨🇭 İsviçre - Cezayir 🇩🇿', '2026-07-03 06:00:00'),
    ('🇦🇺 Avustralya - Mısır 🇪🇬', '2026-07-03 21:00:00'),
    ('🇦🇷 Arjantin - Yeşil Burun Adaları 🇨🇻', '2026-07-04 01:00:00'),
    ('🇨🇴 Kolombiya - Gana 🇬🇭', '2026-07-04 04:30:00')
) AS v(title, local_start)
WHERE cat.slug = 'dunya-kupasi'
  AND NOT EXISTS (
    SELECT 1
    FROM public.events e
    WHERE e.category_id = cat.id
      AND e.title = v.title
  );
