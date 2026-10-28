-- Tarihi kesin olmayan kayıtlar veritabanından kaldırıldı.
--   Cemal Süreya doğumu -> doğum günü bilinmiyor, şair kendisi farklı tarihler söylemiştir;
--                          kayıttaki 13 Şubat 1931 dayanaksızdı. Yalnızca doğum etkinliği silindi,
--                          vefat (9 Ocak 1990) kesin olduğu için subject ve vefat kaydı korundu.
--   Seydibeşir Olayı    -> kaynaklarda gün/ay yok, olay 1918 Hicaz-Yemen cephesiyle ilişkilendiriliyor;
--                          kayıttaki 27 Mayıs 1921 hem dayanaksız hem açıklamayla çelişiyordu.
--   Sırpsındığı Savaşı  -> yalnızca yıl (1364) biliniyor; savaşın Çirmen Muharebesi'yle aynı olup
--                          olmadığı bile tartışmalı. Kayıttaki 26 Eylül dayanaksızdı.
-- event_categories bağları ON DELETE CASCADE ile temizlenir.

-- 1) Cemal Süreya: yalnızca doğum yıl dönümü
DELETE FROM public.events
WHERE title = $t$Cemal Süreya: Doğum Yıl Dönümü$t$
  AND kind = 'birth';

-- 2) Seydibeşir Olayı ve Sırpsındığı Savaşı: etkinlikleri
DELETE FROM public.events e
WHERE e.subject_id IN (
  SELECT s.id
  FROM public.subjects s
  JOIN public.categories c ON c.id = s.category_id
  WHERE c.slug = 'tarihi-olaylar'
    AND s.name IN ($n$Seydibeşir Olayı$n$, $n$Sırpsındığı Savaşı$n$)
);

-- 3) ...ve artık etkinliği kalmayan subject'leri
DELETE FROM public.subjects s
USING public.categories c
WHERE c.id = s.category_id
  AND c.slug = 'tarihi-olaylar'
  AND s.name IN ($n$Seydibeşir Olayı$n$, $n$Sırpsındığı Savaşı$n$);
