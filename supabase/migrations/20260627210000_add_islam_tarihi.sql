-- İslam Tarihi kategorisi ve Hicri yıllık anma günleri.

INSERT INTO public.categories (name, slug, "desc")
VALUES (
  'İslam Tarihi',
  'islam-tarihi',
  'İslam tarihinde Hicri takvime göre anılan savaşlar, antlaşmalar, fetihler ve dönüm noktaları.'
)
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

-- Bedir Savaşı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Bedir Savaşı', '624 yılında (2 H.) Ramazan ayının 17. gününde Müslümanlar ile Mekke müşrikleri arasında Bedir kuyuları yakınında yapılan savaş; İslam''ın Medine dönemindeki ilk büyük askeri zaferidir.', 'https://tr.wikipedia.org/wiki/Bedir_Sava%C5%9F%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 9, 17, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Bedir Savaşı');

-- Uhud Savaşı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Uhud Savaşı', '625 yılında (3 H.) Şevval ayının 7. gününde Uhud Dağı eteklerinde yapılan savaş; Bedir''den sonra Mekke ordusuyla Müslümanlar arasındaki ikinci büyük karşılaşmadır.', 'https://tr.wikipedia.org/wiki/Uhud_Sava%C5%9F%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 10, 7, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Uhud Savaşı');

-- Mekke'nin Fethi
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Mekke''nin Fethi', '630 yılında (8 H.) Ramazan ayının 20. gününde Hz. Muhammed (s.a.v.) komutasındaki Müslüman ordusunun Mekke''yi kan dökülmeden fethetmesi; İslam''ın Arap Yarımadası''ndaki egemenliğinin dönüm noktasıdır.', 'https://tr.wikipedia.org/wiki/Mekke%27nin_Fethi', true, 'published', 'hijri_yearly', 'hijri', 9, 20, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Mekke''nin Fethi');

-- Veda Haccı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Veda Haccı', '632 yılında (10 H.) Zilhicce ayının 9. günü (Arefe) Hz. Muhammed''in (s.a.v.) hayatındaki tek haccı ve Arafat''ta irad edilen Veda Hutbesi; İslam dininin tamamlandığının bildirildiği tarihtir.', 'https://tr.wikipedia.org/wiki/Veda_Hacc%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 12, 9, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Veda Haccı');

-- Hz. Muhammed'in Vefatı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Hz. Muhammed''in Vefatı', '632 yılında (11 H.) Rebiülevvel ayının 12. günü Hz. Muhammed''in (s.a.v.) vefatı; peygamberlik döneminin sona erdiği ve İslam ümmetinin yeni bir döneme girdiği tarihtir.', 'https://tr.wikipedia.org/wiki/Hazreti_Muhammed', true, 'published', 'hijri_yearly', 'hijri', 3, 12, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Hz. Muhammed''in Vefatı');

-- Kerbela
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Kerbela', '680 yılında (61 H.) Muharrem ayının 10. günü (Aşure) Hz. Hüseyin ve beraberindekilerin Kerbela''da şehit edilmesi; İslam tarihinin en acı dönüm noktalarından biridir.', 'https://tr.wikipedia.org/wiki/Kerbela_olay%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 1, 10, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Kerbela');

-- Hendek Savaşı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Hendek Savaşı', '627 yılında (5 H.) Zilkade ayının son günlerinde Medine etrafına kazılan hendekle savunulan savaş; Ahzâb veya Hendek Savaşı olarak bilinen kuşatmanın kırılmasıdır.', 'https://tr.wikipedia.org/wiki/Hendek_Sava%C5%9F%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 11, 5, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Hendek Savaşı');

-- Hudeybiye Antlaşması
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Hudeybiye Antlaşması', '628 yılında (6 H.) Zilkade ayının 6. gününde Müslümanlar ile Mekke müşrikleri arasında Hudeybiye''de imzalanan antlaşma; görünüşte ağır şartlar taşısa da Mekke''nin fethinin yolunu açmıştır.', 'https://tr.wikipedia.org/wiki/Hudeybiye_Antla%C5%9Fmas%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 11, 6, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Hudeybiye Antlaşması');

-- Hayber'in Fethi
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Hayber''in Fethi', '629 yılında (7 H.) Muharrem ayının 7. gününde Hayber kalelerinin fethedilmesi; Medine''nin kuzeyindeki Yahudi yerleşimlerinin İslam otoritesine girmesini sağlamıştır.', 'https://tr.wikipedia.org/wiki/Hayber%27in_Fethi', true, 'published', 'hijri_yearly', 'hijri', 1, 7, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Hayber''in Fethi');

-- Hz. Ömer'in Şehadeti
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Hz. Ömer''in Şehadeti', '644 yılında (23 H.) Zilhicce ayının 26. günü halife Hz. Ömer''in Ebu Lü''lü tarafından şehit edilmesi; Dört Halife döneminin sona yaklaşan kritik bir dönüm noktasıdır.', 'https://tr.wikipedia.org/wiki/%C3%96mer', true, 'published', 'hijri_yearly', 'hijri', 12, 26, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Hz. Ömer''in Şehadeti');

-- Kudüs'ün Geri Alınması (1187)
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'islam-tarihi')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Kudüs''ün Geri Alınması (1187)', '1187 yılında (583 H.) Receb ayının 27. gününde Selahaddin Eyyubi''nin Haçlılardan Kudüs''ü geri alması; İslam dünyasında büyük sevinçle karşılanmış ve Kudüs''ün sembolik önemini pekiştirmiştir.', 'https://tr.wikipedia.org/wiki/Kud%C3%BCs%27%C3%BCn_geri_al%C4%B1nmas%C4%B1', true, 'published', 'hijri_yearly', 'hijri', 7, 27, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Kudüs''ün Geri Alınması (1187)');
-- Miladi tarih override'ları (2026–2035, Diyanet anchor + Hicri dönüşüm).
-- scripts/generate-islam-tarihi-dates.ts ile üretilmiştir.

-- Bedir Savaşı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-06 21:00:00+00'::timestamptz, '2026-03-07 17:59:59+00'::timestamptz, '2026-03-06 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-02-23 21:00:00+00'::timestamptz, '2027-02-24 17:59:59+00'::timestamptz, '2027-02-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-02-12 21:00:00+00'::timestamptz, '2028-02-13 17:59:59+00'::timestamptz, '2028-02-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-01-31 21:00:00+00'::timestamptz, '2029-02-01 17:59:59+00'::timestamptz, '2029-01-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-10 21:00:00+00'::timestamptz, '2031-01-11 17:59:59+00'::timestamptz, '2031-01-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-12-19 21:00:00+00'::timestamptz, '2032-12-20 17:59:59+00'::timestamptz, '2032-12-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-08 21:00:00+00'::timestamptz, '2033-12-09 17:59:59+00'::timestamptz, '2033-12-08 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-11-27 21:00:00+00'::timestamptz, '2034-11-28 17:59:59+00'::timestamptz, '2034-11-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-11-16 21:00:00+00'::timestamptz, '2035-11-17 17:59:59+00'::timestamptz, '2035-11-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Bedir Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Uhud Savaşı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-25 21:00:00+00'::timestamptz, '2026-03-26 17:59:59+00'::timestamptz, '2026-03-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-14 21:00:00+00'::timestamptz, '2027-03-15 17:59:59+00'::timestamptz, '2027-03-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-03-02 21:00:00+00'::timestamptz, '2028-03-03 17:59:59+00'::timestamptz, '2028-03-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-02-19 21:00:00+00'::timestamptz, '2029-02-20 17:59:59+00'::timestamptz, '2029-02-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-02-09 21:00:00+00'::timestamptz, '2030-02-10 17:59:59+00'::timestamptz, '2030-02-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-29 21:00:00+00'::timestamptz, '2031-01-30 17:59:59+00'::timestamptz, '2031-01-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-01-19 21:00:00+00'::timestamptz, '2032-01-20 17:59:59+00'::timestamptz, '2032-01-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-28 21:00:00+00'::timestamptz, '2033-12-29 17:59:59+00'::timestamptz, '2033-12-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-12-17 21:00:00+00'::timestamptz, '2034-12-18 17:59:59+00'::timestamptz, '2034-12-17 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-12-06 21:00:00+00'::timestamptz, '2035-12-07 17:59:59+00'::timestamptz, '2035-12-06 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Uhud Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Mekke'nin Fethi
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-09 21:00:00+00'::timestamptz, '2026-03-10 17:59:59+00'::timestamptz, '2026-03-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-02-26 21:00:00+00'::timestamptz, '2027-02-27 17:59:59+00'::timestamptz, '2027-02-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-02-15 21:00:00+00'::timestamptz, '2028-02-16 17:59:59+00'::timestamptz, '2028-02-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-02-03 21:00:00+00'::timestamptz, '2029-02-04 17:59:59+00'::timestamptz, '2029-02-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-13 21:00:00+00'::timestamptz, '2031-01-14 17:59:59+00'::timestamptz, '2031-01-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-01-02 21:00:00+00'::timestamptz, '2032-01-03 17:59:59+00'::timestamptz, '2032-01-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-11 21:00:00+00'::timestamptz, '2033-12-12 17:59:59+00'::timestamptz, '2033-12-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-11-30 21:00:00+00'::timestamptz, '2034-12-01 17:59:59+00'::timestamptz, '2034-11-30 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-11-19 21:00:00+00'::timestamptz, '2035-11-20 17:59:59+00'::timestamptz, '2035-11-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Mekke''nin Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Veda Haccı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-05-25 21:00:00+00'::timestamptz, '2026-05-26 17:59:59+00'::timestamptz, '2026-05-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-05-14 21:00:00+00'::timestamptz, '2027-05-15 17:59:59+00'::timestamptz, '2027-05-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-03 21:00:00+00'::timestamptz, '2028-05-04 17:59:59+00'::timestamptz, '2028-05-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-04-22 21:00:00+00'::timestamptz, '2029-04-23 17:59:59+00'::timestamptz, '2029-04-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-04-11 21:00:00+00'::timestamptz, '2030-04-12 17:59:59+00'::timestamptz, '2030-04-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-03-31 21:00:00+00'::timestamptz, '2031-04-01 17:59:59+00'::timestamptz, '2031-03-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-03-20 21:00:00+00'::timestamptz, '2032-03-21 17:59:59+00'::timestamptz, '2032-03-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-09 21:00:00+00'::timestamptz, '2033-03-10 17:59:59+00'::timestamptz, '2033-03-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-02-27 21:00:00+00'::timestamptz, '2034-02-28 17:59:59+00'::timestamptz, '2034-02-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-02-16 21:00:00+00'::timestamptz, '2035-02-17 17:59:59+00'::timestamptz, '2035-02-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Veda Haccı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Hz. Muhammed'in Vefatı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-08-24 21:00:00+00'::timestamptz, '2026-08-25 17:59:59+00'::timestamptz, '2026-08-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-08-13 21:00:00+00'::timestamptz, '2027-08-14 17:59:59+00'::timestamptz, '2027-08-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-08-02 21:00:00+00'::timestamptz, '2028-08-03 17:59:59+00'::timestamptz, '2028-08-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-07-23 21:00:00+00'::timestamptz, '2029-07-24 17:59:59+00'::timestamptz, '2029-07-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-07-12 21:00:00+00'::timestamptz, '2030-07-13 17:59:59+00'::timestamptz, '2030-07-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-07-01 21:00:00+00'::timestamptz, '2031-07-02 17:59:59+00'::timestamptz, '2031-07-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-06-19 21:00:00+00'::timestamptz, '2032-06-20 17:59:59+00'::timestamptz, '2032-06-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-06-08 21:00:00+00'::timestamptz, '2033-06-09 17:59:59+00'::timestamptz, '2033-06-08 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-05-29 21:00:00+00'::timestamptz, '2034-05-30 17:59:59+00'::timestamptz, '2034-05-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-05-19 21:00:00+00'::timestamptz, '2035-05-20 17:59:59+00'::timestamptz, '2035-05-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Muhammed''in Vefatı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Kerbela
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-24 21:00:00+00'::timestamptz, '2026-06-25 17:59:59+00'::timestamptz, '2026-06-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-06-14 21:00:00+00'::timestamptz, '2027-06-15 17:59:59+00'::timestamptz, '2027-06-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-06-02 21:00:00+00'::timestamptz, '2028-06-03 17:59:59+00'::timestamptz, '2028-06-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-22 21:00:00+00'::timestamptz, '2029-05-23 17:59:59+00'::timestamptz, '2029-05-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-05-11 21:00:00+00'::timestamptz, '2030-05-12 17:59:59+00'::timestamptz, '2030-05-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-05-01 21:00:00+00'::timestamptz, '2031-05-02 17:59:59+00'::timestamptz, '2031-05-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-19 21:00:00+00'::timestamptz, '2032-04-20 17:59:59+00'::timestamptz, '2032-04-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-04-09 21:00:00+00'::timestamptz, '2033-04-10 17:59:59+00'::timestamptz, '2033-04-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-29 21:00:00+00'::timestamptz, '2034-03-30 17:59:59+00'::timestamptz, '2034-03-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-19 21:00:00+00'::timestamptz, '2035-03-20 17:59:59+00'::timestamptz, '2035-03-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kerbela'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Hendek Savaşı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-04-21 21:00:00+00'::timestamptz, '2026-04-22 17:59:59+00'::timestamptz, '2026-04-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-04-11 21:00:00+00'::timestamptz, '2027-04-12 17:59:59+00'::timestamptz, '2027-04-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-03-30 21:00:00+00'::timestamptz, '2028-03-31 17:59:59+00'::timestamptz, '2028-03-30 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-03-19 21:00:00+00'::timestamptz, '2029-03-20 17:59:59+00'::timestamptz, '2029-03-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-03-08 21:00:00+00'::timestamptz, '2030-03-09 17:59:59+00'::timestamptz, '2030-03-08 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-02-26 21:00:00+00'::timestamptz, '2031-02-27 17:59:59+00'::timestamptz, '2031-02-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-02-15 21:00:00+00'::timestamptz, '2032-02-16 17:59:59+00'::timestamptz, '2032-02-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-01-25 21:00:00+00'::timestamptz, '2034-01-26 17:59:59+00'::timestamptz, '2034-01-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-01-13 21:00:00+00'::timestamptz, '2035-01-14 17:59:59+00'::timestamptz, '2035-01-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hendek Savaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Hudeybiye Antlaşması
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-04-22 21:00:00+00'::timestamptz, '2026-04-23 17:59:59+00'::timestamptz, '2026-04-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-04-12 21:00:00+00'::timestamptz, '2027-04-13 17:59:59+00'::timestamptz, '2027-04-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-03-31 21:00:00+00'::timestamptz, '2028-04-01 17:59:59+00'::timestamptz, '2028-03-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-03-20 21:00:00+00'::timestamptz, '2029-03-21 17:59:59+00'::timestamptz, '2029-03-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-03-09 21:00:00+00'::timestamptz, '2030-03-10 17:59:59+00'::timestamptz, '2030-03-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-02-27 21:00:00+00'::timestamptz, '2031-02-28 17:59:59+00'::timestamptz, '2031-02-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-02-16 21:00:00+00'::timestamptz, '2032-02-17 17:59:59+00'::timestamptz, '2032-02-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-01-26 21:00:00+00'::timestamptz, '2034-01-27 17:59:59+00'::timestamptz, '2034-01-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-01-14 21:00:00+00'::timestamptz, '2035-01-15 17:59:59+00'::timestamptz, '2035-01-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hudeybiye Antlaşması'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Hayber'in Fethi
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-21 21:00:00+00'::timestamptz, '2026-06-22 17:59:59+00'::timestamptz, '2026-06-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-06-11 21:00:00+00'::timestamptz, '2027-06-12 17:59:59+00'::timestamptz, '2027-06-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-30 21:00:00+00'::timestamptz, '2028-05-31 17:59:59+00'::timestamptz, '2028-05-30 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-19 21:00:00+00'::timestamptz, '2029-05-20 17:59:59+00'::timestamptz, '2029-05-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-05-08 21:00:00+00'::timestamptz, '2030-05-09 17:59:59+00'::timestamptz, '2030-05-08 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-04-28 21:00:00+00'::timestamptz, '2031-04-29 17:59:59+00'::timestamptz, '2031-04-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-16 21:00:00+00'::timestamptz, '2032-04-17 17:59:59+00'::timestamptz, '2032-04-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-04-06 21:00:00+00'::timestamptz, '2033-04-07 17:59:59+00'::timestamptz, '2033-04-06 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-26 21:00:00+00'::timestamptz, '2034-03-27 17:59:59+00'::timestamptz, '2034-03-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-16 21:00:00+00'::timestamptz, '2035-03-17 17:59:59+00'::timestamptz, '2035-03-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hayber''in Fethi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Hz. Ömer'in Şehadeti
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-11 21:00:00+00'::timestamptz, '2026-06-12 17:59:59+00'::timestamptz, '2026-06-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-05-31 21:00:00+00'::timestamptz, '2027-06-01 17:59:59+00'::timestamptz, '2027-05-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-20 21:00:00+00'::timestamptz, '2028-05-21 17:59:59+00'::timestamptz, '2028-05-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-09 21:00:00+00'::timestamptz, '2029-05-10 17:59:59+00'::timestamptz, '2029-05-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-04-28 21:00:00+00'::timestamptz, '2030-04-29 17:59:59+00'::timestamptz, '2030-04-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-04-17 21:00:00+00'::timestamptz, '2031-04-18 17:59:59+00'::timestamptz, '2031-04-17 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-06 21:00:00+00'::timestamptz, '2032-04-07 17:59:59+00'::timestamptz, '2032-04-06 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-26 21:00:00+00'::timestamptz, '2033-03-27 17:59:59+00'::timestamptz, '2033-03-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-16 21:00:00+00'::timestamptz, '2034-03-17 17:59:59+00'::timestamptz, '2034-03-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-05 21:00:00+00'::timestamptz, '2035-03-06 17:59:59+00'::timestamptz, '2035-03-05 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Hz. Ömer''in Şehadeti'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Kudüs'ün Geri Alınması (1187)
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-01-16 21:00:00+00'::timestamptz, '2026-01-17 17:59:59+00'::timestamptz, '2026-01-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-01-04 21:00:00+00'::timestamptz, '2027-01-05 17:59:59+00'::timestamptz, '2027-01-04 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-12-13 21:00:00+00'::timestamptz, '2028-12-14 17:59:59+00'::timestamptz, '2028-12-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-12-02 21:00:00+00'::timestamptz, '2029-12-03 17:59:59+00'::timestamptz, '2029-12-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-11-22 21:00:00+00'::timestamptz, '2030-11-23 17:59:59+00'::timestamptz, '2030-11-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-11-11 21:00:00+00'::timestamptz, '2031-11-12 17:59:59+00'::timestamptz, '2031-11-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-10-31 21:00:00+00'::timestamptz, '2032-11-01 17:59:59+00'::timestamptz, '2032-10-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-10-20 21:00:00+00'::timestamptz, '2033-10-21 17:59:59+00'::timestamptz, '2033-10-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-10-09 21:00:00+00'::timestamptz, '2034-10-10 17:59:59+00'::timestamptz, '2034-10-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-09-28 21:00:00+00'::timestamptz, '2035-09-29 17:59:59+00'::timestamptz, '2035-09-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'islam-tarihi' AND e.title = 'Kudüs''ün Geri Alınması (1187)'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;
