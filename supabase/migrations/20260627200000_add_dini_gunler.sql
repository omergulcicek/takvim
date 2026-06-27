-- Dini günler kategorisi, Hicri event tanımları ve Diyanet Miladi tarih override'ları (2026–2035).

INSERT INTO public.categories (name, slug, "desc")
VALUES ('Dini Günler', 'dini-gunler', 'Diyanet İşleri Başkanlığı''nın ilan ettiği dini günler, kandiller, bayramlar ve mübarek geceler.')
ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, "desc" = EXCLUDED."desc";

-- Miraç Kandili
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Miraç Kandili', 'İslam inancına göre Hz. Muhammedin (s.a.v.) bir gecede Mescid-i Haramdan Mescid-i Aksaya, oradan da göklere yükseldiği mirac olayının anıldığı mübarek gecedir. Recep ayının 27. gecesi idrak edilir; Diyanet İşleri Başkanlığının ilan ettiği takvime göre Receb ayının 26. gecesi kandil olarak kutlanır.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 7, 26, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Miraç Kandili');

-- Berat Kandili
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Berat Kandili', 'Şaban ayının 15. gecesine denk gelen, günahların affedilmesi, kaderin yazılması ve kulların rahmete mazhar kılınması dualarıyla anılan mübarek gecedir. Diyanet takviminde Şaban ayının 14. gecesi kandil olarak idrak edilir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 8, 14, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Berat Kandili');

-- Ramazan Başlangıcı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Ramazan Başlangıcı', 'Ramazan ayının ilk günü; oruç ibadetinin başladığı, Kuran-ı Kerimin indirilmeye başlandığı mübarek ayın açılışıdır. Müslümanlar bu ay boyunca imsakten iftara kadar oruç tutar.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 9, 1, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Ramazan Başlangıcı');

-- Kadir Gecesi
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Kadir Gecesi', 'Kuran-ı Kerimin indirilmeye başlandığı, bin aydan hayırlı olduğu bildirilen mübarek gecedir. Ramazan ayının 27. gecesi idrak edilir; Diyanet takviminde Ramazan ayının 26. gecesi olarak ilan edilir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 9, 26, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Kadir Gecesi');

-- Ramazan Bayramı Arefesi
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Ramazan Bayramı Arefesi', 'Ramazan Bayramına (Şeker Bayramı) hazırlık günüdür. Ramazan ayının son günü olup bayram arefesi olarak idrak edilir; zekâtların verilmesi ve bayramlık hazırlıkları bu gün tamamlanır.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 9, 29, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Ramazan Bayramı Arefesi');

-- Ramazan Bayramı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Ramazan Bayramı', 'Ramazan ayını müteakip Şevval ayının ilk üç gününde kutlanan, oruç ibadetinin ardından sevinç ve paylaşım günü olarak idrak edilen dini bayramdır. Şeker Bayramı olarak da bilinir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 10, 1, 10, 3, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Ramazan Bayramı');

-- Kurban Bayramı Arefesi
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Kurban Bayramı Arefesi', 'Kurban Bayramına hazırlık günüdür. Zilhicce ayının 9. günü olup arefe günü olarak idrak edilir; kurban ibadetine ve bayram hazırlıklarına ara verilir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 12, 9, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Kurban Bayramı Arefesi');

-- Kurban Bayramı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Kurban Bayramı', 'Zilhicce ayının 10–13. günlerinde kutlanan, Hz. İbrahimin oğlu Hz. İsmaili kurban etme emrini yerine getirme sadakatine atıfla kurban ibadetinin ifa edildiği dini bayramdır.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 12, 10, 12, 13, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Kurban Bayramı');

-- Hicri Yılbaşı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Hicri Yılbaşı', 'Hicri takvimin 1 Muharrem günü; Hicret olayının anıldığı ve yeni Hicri yılın başladığı gündür. İslam dünyasında yeni yılın ilk günü olarak idrak edilir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 1, 1, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Hicri Yılbaşı');

-- Aşure Günü
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Aşure Günü', 'Muharrem ayının 10. günü; Hz. Nuhun gemisinden inmesi, Hz. Musanın denizden geçmesi ve Kerbelada Hz. Hüseyinin şehadeti gibi birçok önemli olayın anıldığı gündür. Oruç tutmak ve sadaka vermek sünnettir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 1, 10, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Aşure Günü');

-- Mevlid Kandili
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Mevlid Kandili', 'Hz. Muhammedin (s.a.v.) dünyaya teşrif ettiği Rebiülevvel ayının 12. gecesine denk gelen mübarek gecedir. Diyanet takvimine göre Rebiülevvel ayının 11. gecesi kandil olarak idrak edilir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 3, 11, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Mevlid Kandili');

-- Üç Ayların Başlangıcı
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Üç Ayların Başlangıcı', 'Receb, Şaban ve Ramazan aylarından oluşan üç ayların başlangıcıdır. Receb ayının ilk günü olup manevi hazırlık, ibadet ve tövbe ile karşılanan mübarek dönemin açılışını ifade eder.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 7, 1, NULL, NULL, NULL, ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Üç Ayların Başlangıcı');

-- Regaib Kandili
WITH cat AS (SELECT id FROM public.categories WHERE slug = 'dini-gunler')
INSERT INTO public.events (
  category_id, title, description, source_url, is_all_day, status, recurrence,
  calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, tags
)
SELECT cat.id, 'Regaib Kandili', 'Üç ayların müjdecisi olan Receb ayının ilk Cuma gecesinde idrak edilen mübarek kandildir. Rahmet ve bereket dualarıyla anılır; Diyanet takviminde Receb ayının ilk Cuma gecesine denk gelir.', 'https://vakithesaplama.diyanet.gov.tr/dinigunler.php', true, 'published', 'hijri_yearly', 'hijri', 7, NULL, NULL, NULL, 'first_friday_of_month', ARRAY[]::text[]
FROM cat
WHERE NOT EXISTS (SELECT 1 FROM public.events e JOIN cat ON e.category_id = cat.id WHERE e.title = 'Regaib Kandili');

-- Miladi tarih override'ları
-- Miraç Kandili
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-01-14 21:00:00+00'::timestamptz, '2026-01-15 17:59:59+00'::timestamptz, '2026-01-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Miraç Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-12-23 21:00:00+00'::timestamptz, '2027-12-24 17:59:59+00'::timestamptz, '2027-12-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Miraç Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Berat Kandili
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-02-01 21:00:00+00'::timestamptz, '2026-02-02 17:59:59+00'::timestamptz, '2026-02-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Berat Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-01-21 21:00:00+00'::timestamptz, '2027-01-22 17:59:59+00'::timestamptz, '2027-01-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Berat Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Ramazan Başlangıcı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-02-18 21:00:00+00'::timestamptz, '2026-02-19 17:59:59+00'::timestamptz, '2026-02-18 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-02-07 21:00:00+00'::timestamptz, '2027-02-08 17:59:59+00'::timestamptz, '2027-02-07 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-01-27 21:00:00+00'::timestamptz, '2028-01-28 17:59:59+00'::timestamptz, '2028-01-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-01-15 21:00:00+00'::timestamptz, '2029-01-16 17:59:59+00'::timestamptz, '2029-01-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-12-25 21:00:00+00'::timestamptz, '2030-12-26 17:59:59+00'::timestamptz, '2030-12-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-12-14 21:00:00+00'::timestamptz, '2031-12-15 17:59:59+00'::timestamptz, '2031-12-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-12-03 21:00:00+00'::timestamptz, '2032-12-04 17:59:59+00'::timestamptz, '2032-12-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-11-22 21:00:00+00'::timestamptz, '2033-11-23 17:59:59+00'::timestamptz, '2033-11-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-11-11 21:00:00+00'::timestamptz, '2034-11-12 17:59:59+00'::timestamptz, '2034-11-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-10-31 21:00:00+00'::timestamptz, '2035-11-01 17:59:59+00'::timestamptz, '2035-10-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Kadir Gecesi
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-15 21:00:00+00'::timestamptz, '2026-03-16 17:59:59+00'::timestamptz, '2026-03-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kadir Gecesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-04 21:00:00+00'::timestamptz, '2027-03-05 17:59:59+00'::timestamptz, '2027-03-04 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kadir Gecesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Ramazan Bayramı Arefesi
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-18 21:00:00+00'::timestamptz, '2026-03-19 17:59:59+00'::timestamptz, '2026-03-18 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-07 21:00:00+00'::timestamptz, '2027-03-08 17:59:59+00'::timestamptz, '2027-03-07 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-02-24 21:00:00+00'::timestamptz, '2028-02-25 17:59:59+00'::timestamptz, '2028-02-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-02-12 21:00:00+00'::timestamptz, '2029-02-13 17:59:59+00'::timestamptz, '2029-02-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-02-02 21:00:00+00'::timestamptz, '2030-02-03 17:59:59+00'::timestamptz, '2030-02-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-22 21:00:00+00'::timestamptz, '2031-01-23 17:59:59+00'::timestamptz, '2031-01-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-01-12 21:00:00+00'::timestamptz, '2032-01-13 17:59:59+00'::timestamptz, '2032-01-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-21 21:00:00+00'::timestamptz, '2033-12-22 17:59:59+00'::timestamptz, '2033-12-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-12-10 21:00:00+00'::timestamptz, '2034-12-11 17:59:59+00'::timestamptz, '2034-12-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-11-29 21:00:00+00'::timestamptz, '2035-11-30 17:59:59+00'::timestamptz, '2035-11-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Ramazan Bayramı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-19 21:00:00+00'::timestamptz, '2026-03-22 17:59:59+00'::timestamptz, '2026-03-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-08 21:00:00+00'::timestamptz, '2027-03-11 17:59:59+00'::timestamptz, '2027-03-08 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-02-25 21:00:00+00'::timestamptz, '2028-02-28 17:59:59+00'::timestamptz, '2028-02-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-02-13 21:00:00+00'::timestamptz, '2029-02-16 17:59:59+00'::timestamptz, '2029-02-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-02-03 21:00:00+00'::timestamptz, '2030-02-06 17:59:59+00'::timestamptz, '2030-02-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-23 21:00:00+00'::timestamptz, '2031-01-26 17:59:59+00'::timestamptz, '2031-01-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-01-13 21:00:00+00'::timestamptz, '2032-01-16 17:59:59+00'::timestamptz, '2032-01-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-22 21:00:00+00'::timestamptz, '2033-12-25 17:59:59+00'::timestamptz, '2033-12-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-12-11 21:00:00+00'::timestamptz, '2034-12-14 17:59:59+00'::timestamptz, '2034-12-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-11-30 21:00:00+00'::timestamptz, '2035-12-03 17:59:59+00'::timestamptz, '2035-11-30 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Kurban Bayramı Arefesi
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-05-25 21:00:00+00'::timestamptz, '2026-05-26 17:59:59+00'::timestamptz, '2026-05-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-05-14 21:00:00+00'::timestamptz, '2027-05-15 17:59:59+00'::timestamptz, '2027-05-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-03 21:00:00+00'::timestamptz, '2028-05-04 17:59:59+00'::timestamptz, '2028-05-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-04-22 21:00:00+00'::timestamptz, '2029-04-23 17:59:59+00'::timestamptz, '2029-04-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-04-11 21:00:00+00'::timestamptz, '2030-04-12 17:59:59+00'::timestamptz, '2030-04-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-03-31 21:00:00+00'::timestamptz, '2031-04-01 17:59:59+00'::timestamptz, '2031-03-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-03-20 21:00:00+00'::timestamptz, '2032-03-21 17:59:59+00'::timestamptz, '2032-03-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-09 21:00:00+00'::timestamptz, '2033-03-10 17:59:59+00'::timestamptz, '2033-03-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-02-27 21:00:00+00'::timestamptz, '2034-02-28 17:59:59+00'::timestamptz, '2034-02-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-02-16 21:00:00+00'::timestamptz, '2035-02-17 17:59:59+00'::timestamptz, '2035-02-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Kurban Bayramı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-05-26 21:00:00+00'::timestamptz, '2026-05-30 17:59:59+00'::timestamptz, '2026-05-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-05-15 21:00:00+00'::timestamptz, '2027-05-19 17:59:59+00'::timestamptz, '2027-05-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-04 21:00:00+00'::timestamptz, '2028-05-08 17:59:59+00'::timestamptz, '2028-05-04 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-04-23 21:00:00+00'::timestamptz, '2029-04-27 17:59:59+00'::timestamptz, '2029-04-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-04-12 21:00:00+00'::timestamptz, '2030-04-16 17:59:59+00'::timestamptz, '2030-04-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-04-01 21:00:00+00'::timestamptz, '2031-04-05 17:59:59+00'::timestamptz, '2031-04-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-03-21 21:00:00+00'::timestamptz, '2032-03-25 17:59:59+00'::timestamptz, '2032-03-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-10 21:00:00+00'::timestamptz, '2033-03-14 17:59:59+00'::timestamptz, '2033-03-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-02-28 21:00:00+00'::timestamptz, '2034-03-04 17:59:59+00'::timestamptz, '2034-02-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-02-17 21:00:00+00'::timestamptz, '2035-02-21 17:59:59+00'::timestamptz, '2035-02-17 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Hicri Yılbaşı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-15 21:00:00+00'::timestamptz, '2026-06-16 17:59:59+00'::timestamptz, '2026-06-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-06-05 21:00:00+00'::timestamptz, '2027-06-06 17:59:59+00'::timestamptz, '2027-06-05 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-24 21:00:00+00'::timestamptz, '2028-05-25 17:59:59+00'::timestamptz, '2028-05-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-13 21:00:00+00'::timestamptz, '2029-05-14 17:59:59+00'::timestamptz, '2029-05-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-05-02 21:00:00+00'::timestamptz, '2030-05-03 17:59:59+00'::timestamptz, '2030-05-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-04-22 21:00:00+00'::timestamptz, '2031-04-23 17:59:59+00'::timestamptz, '2031-04-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-10 21:00:00+00'::timestamptz, '2032-04-11 17:59:59+00'::timestamptz, '2032-04-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-31 21:00:00+00'::timestamptz, '2033-04-01 17:59:59+00'::timestamptz, '2033-03-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-20 21:00:00+00'::timestamptz, '2034-03-21 17:59:59+00'::timestamptz, '2034-03-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-10 21:00:00+00'::timestamptz, '2035-03-11 17:59:59+00'::timestamptz, '2035-03-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Aşure Günü
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-24 21:00:00+00'::timestamptz, '2026-06-25 17:59:59+00'::timestamptz, '2026-06-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-06-14 21:00:00+00'::timestamptz, '2027-06-15 17:59:59+00'::timestamptz, '2027-06-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-06-02 21:00:00+00'::timestamptz, '2028-06-03 17:59:59+00'::timestamptz, '2028-06-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-22 21:00:00+00'::timestamptz, '2029-05-23 17:59:59+00'::timestamptz, '2029-05-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-05-11 21:00:00+00'::timestamptz, '2030-05-12 17:59:59+00'::timestamptz, '2030-05-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-05-01 21:00:00+00'::timestamptz, '2031-05-02 17:59:59+00'::timestamptz, '2031-05-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-19 21:00:00+00'::timestamptz, '2032-04-20 17:59:59+00'::timestamptz, '2032-04-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-04-09 21:00:00+00'::timestamptz, '2033-04-10 17:59:59+00'::timestamptz, '2033-04-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-29 21:00:00+00'::timestamptz, '2034-03-30 17:59:59+00'::timestamptz, '2034-03-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-19 21:00:00+00'::timestamptz, '2035-03-20 17:59:59+00'::timestamptz, '2035-03-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Mevlid Kandili
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-08-23 21:00:00+00'::timestamptz, '2026-08-24 17:59:59+00'::timestamptz, '2026-08-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Mevlid Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-08-12 21:00:00+00'::timestamptz, '2027-08-13 17:59:59+00'::timestamptz, '2027-08-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Mevlid Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Üç Ayların Başlangıcı
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-12-09 21:00:00+00'::timestamptz, '2026-12-10 17:59:59+00'::timestamptz, '2026-12-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-11-28 21:00:00+00'::timestamptz, '2027-11-29 17:59:59+00'::timestamptz, '2027-11-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-11-17 21:00:00+00'::timestamptz, '2028-11-18 17:59:59+00'::timestamptz, '2028-11-17 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-11-06 21:00:00+00'::timestamptz, '2029-11-07 17:59:59+00'::timestamptz, '2029-11-06 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-10-27 21:00:00+00'::timestamptz, '2030-10-28 17:59:59+00'::timestamptz, '2030-10-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-10-16 21:00:00+00'::timestamptz, '2031-10-17 17:59:59+00'::timestamptz, '2031-10-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-10-05 21:00:00+00'::timestamptz, '2032-10-06 17:59:59+00'::timestamptz, '2032-10-05 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-09-24 21:00:00+00'::timestamptz, '2033-09-25 17:59:59+00'::timestamptz, '2033-09-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-09-13 21:00:00+00'::timestamptz, '2034-09-14 17:59:59+00'::timestamptz, '2034-09-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-09-02 21:00:00+00'::timestamptz, '2035-09-03 17:59:59+00'::timestamptz, '2035-09-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

-- Regaib Kandili
INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-12-09 21:00:00+00'::timestamptz, '2026-12-10 17:59:59+00'::timestamptz, '2026-12-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Regaib Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;

INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-12-01 21:00:00+00'::timestamptz, '2027-12-02 17:59:59+00'::timestamptz, '2027-12-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Regaib Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;
