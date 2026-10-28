-- Cahit Zarifoğlu ve Sezai Karakoç hem onemli-sahsiyetler hem turk-edebiyati altında
-- ayrı subject + ayrı event olarak iki kez duruyordu. İki kategoriye birlikte abone olan
-- kullanıcı aynı günü iki kez görüyordu; Zarifoğlu'nun iki kaydı ayrıca çelişkili tarih taşıyordu
-- (turk-edebiyati: 24 Aralık 1940 / 29 Mayıs 1987 — yanlış).
--
-- Çözüm, derbi maçlarındaki kalıbın aynısı: tek event, event_categories üzerinden iki kategori.
-- Doğru tarihli ve daha ayrıntılı açıklamaya sahip onemli-sahsiyetler kayıtları korunuyor
-- (Zarifoğlu 1 Temmuz 1940 / 7 Haziran 1987, Karakoç 22 Ocak 1933 / 16 Kasım 2021),
-- turk-edebiyati kopyaları siliniyor.

-- 1) Korunan event'leri turk-edebiyati kategorisine de bağla.
INSERT INTO public.event_categories (event_id, category_id)
SELECT e.id, edebiyat.id
FROM public.events e
JOIN public.subjects s ON s.id = e.subject_id
JOIN public.categories sahsiyet ON sahsiyet.id = s.category_id
CROSS JOIN public.categories edebiyat
WHERE sahsiyet.slug = 'onemli-sahsiyetler'
  AND edebiyat.slug = 'turk-edebiyati'
  AND s.name IN ($n$Cahit Zarifoğlu$n$, $n$Sezai Karakoç$n$)
ON CONFLICT DO NOTHING;

-- 2) turk-edebiyati kopyası event'leri sil (event_categories ON DELETE CASCADE ile temizlenir).
DELETE FROM public.events e
WHERE e.subject_id IN (
  SELECT s.id
  FROM public.subjects s
  JOIN public.categories c ON c.id = s.category_id
  WHERE c.slug = 'turk-edebiyati'
    AND s.name IN ($n$Cahit Zarifoğlu$n$, $n$Sezai Karakoç$n$)
);

-- 3) Artık event'i kalmayan kopya subject'leri sil.
DELETE FROM public.subjects s
USING public.categories c
WHERE c.id = s.category_id
  AND c.slug = 'turk-edebiyati'
  AND s.name IN ($n$Cahit Zarifoğlu$n$, $n$Sezai Karakoç$n$);
