-- Türk Edebiyatı: 20260627240000_add_turk_edebiyati.sql'de yanlış girilen tarihler düzeltildi.
-- Burada pencere kuralı doğru uygulanmış, veri hatalı girilmişti (ay/gün yanlışları).
-- Tarihler tr.wikipedia üzerinden tek tek doğrulandı.
-- Cahit Zarifoğlu bu listede yok; çift kaydı ayrı migration'da birleştiriliyor.

UPDATE public.events e
SET
  start_date = v.start_date::timestamptz,
  end_date = v.end_date::timestamptz
FROM (
  VALUES
    -- 1 Ekim 1958 -> 1 Kasım 1958
    ($t$Yahya Kemal Beyatlı: Vefat Yıl Dönümü$t$, '1958-10-31 21:00:00+00', '1958-11-01 20:59:59+00'),
    -- 11 Nisan 1954 -> 11 Mayıs 1954
    ($t$Sait Faik Abasıyanık: Vefat Yıl Dönümü$t$, '1954-05-10 21:00:00+00', '1954-05-11 20:59:59+00'),
    -- 16 Mayıs 1915 -> 16 Mart 1915
    ($t$Haldun Taner: Doğum Yıl Dönümü$t$, '1915-03-15 21:00:00+00', '1915-03-16 20:59:59+00'),
    -- 16 Ağustos 1990 -> 9 Ocak 1990
    ($t$Cemal Süreya: Vefat Yıl Dönümü$t$, '1990-01-08 21:00:00+00', '1990-01-09 20:59:59+00'),
    -- 27 Ekim 1910 -> 4 Ekim 1910 / 18 Ekim 1956 -> 12 Ekim 1956
    ($t$Cahit Sıtkı Tarancı: Doğum Yıl Dönümü$t$, '1910-10-03 21:00:00+00', '1910-10-04 20:59:59+00'),
    ($t$Cahit Sıtkı Tarancı: Vefat Yıl Dönümü$t$, '1956-10-11 21:00:00+00', '1956-10-12 20:59:59+00'),
    -- 1 Kasım 1889 -> 25 Kasım 1889
    ($t$Reşat Nuri Güntekin: Doğum Yıl Dönümü$t$, '1889-11-24 21:00:00+00', '1889-11-25 20:59:59+00'),
    -- 6 Nisan 1916 -> 16 Nisan 1916
    ($t$Behçet Necatigil: Doğum Yıl Dönümü$t$, '1916-04-15 21:00:00+00', '1916-04-16 20:59:59+00'),
    -- 19 Ocak 1933 -> 23 Ocak 1933 / 3 Kasım 2015 -> 4 Kasım 2015
    ($t$Gülten Akın: Doğum Yıl Dönümü$t$, '1933-01-22 21:00:00+00', '1933-01-23 20:59:59+00'),
    ($t$Gülten Akın: Vefat Yıl Dönümü$t$, '2015-11-03 21:00:00+00', '2015-11-04 20:59:59+00')
) AS v(title, start_date, end_date)
WHERE e.title = v.title;
