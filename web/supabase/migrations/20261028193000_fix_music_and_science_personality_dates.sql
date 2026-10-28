-- 20260716150000_add_music_and_science_personalities.sql tarihleri bir gün ileri yazılmıştı.
-- O migration gerçek tarihi start_date literal'ine koymuş; kural ise start = (tarih - 1 gün) 21:00.
-- Sonuç olarak 17 kaydın tamamı takvimde bir gün sonra görünüyordu. Hepsi doğru güne çekildi.
-- Tarihler tr.wikipedia üzerinden tek tek doğrulandı.

UPDATE public.events e
SET
  start_date = v.start_date::timestamptz,
  end_date = v.end_date::timestamptz
FROM (
  VALUES
    -- Âşık Veysel: 25 Ekim 1894 - 21 Mart 1973
    ($t$Âşık Veysel: Doğum Yıl Dönümü$t$, '1894-10-24 21:00:00+00', '1894-10-25 20:59:59+00'),
    ($t$Âşık Veysel: Vefat Yıl Dönümü$t$, '1973-03-20 21:00:00+00', '1973-03-21 20:59:59+00'),
    -- Barış Manço: 2 Ocak 1943 - 1 Şubat 1999
    ($t$Barış Manço: Doğum Yıl Dönümü$t$, '1943-01-01 21:00:00+00', '1943-01-02 20:59:59+00'),
    ($t$Barış Manço: Vefat Yıl Dönümü$t$, '1999-01-31 21:00:00+00', '1999-02-01 20:59:59+00'),
    -- Cem Karaca: 5 Nisan 1945 - 8 Şubat 2004
    ($t$Cem Karaca: Doğum Yıl Dönümü$t$, '1945-04-04 21:00:00+00', '1945-04-05 20:59:59+00'),
    ($t$Cem Karaca: Vefat Yıl Dönümü$t$, '2004-02-07 21:00:00+00', '2004-02-08 20:59:59+00'),
    -- Cahit Arf: 11 Ekim 1910 - 26 Aralık 1997
    ($t$Cahit Arf: Doğum Yıl Dönümü$t$, '1910-10-10 21:00:00+00', '1910-10-11 20:59:59+00'),
    ($t$Cahit Arf: Vefat Yıl Dönümü$t$, '1997-12-25 21:00:00+00', '1997-12-26 20:59:59+00'),
    -- Neşet Ertaş: 25 Eylül 2012 (doğum günü bilinmiyor)
    ($t$Neşet Ertaş: Vefat Yıl Dönümü$t$, '2012-09-24 21:00:00+00', '2012-09-25 20:59:59+00'),
    -- Aziz Sancar: 8 Eylül 1946
    ($t$Aziz Sancar: Doğum Yıl Dönümü$t$, '1946-09-07 21:00:00+00', '1946-09-08 20:59:59+00'),
    -- Oktay Sinanoğlu: 25 Şubat 1935 - 19 Nisan 2015
    ($t$Oktay Sinanoğlu: Doğum Yıl Dönümü$t$, '1935-02-24 21:00:00+00', '1935-02-25 20:59:59+00'),
    ($t$Oktay Sinanoğlu: Vefat Yıl Dönümü$t$, '2015-04-18 21:00:00+00', '2015-04-19 20:59:59+00'),
    -- Ali Kuşçu: 16 Aralık 1474 (doğum tarihi bilinmiyor)
    ($t$Ali Kuşçu: Vefat Yıl Dönümü$t$, '1474-12-15 21:00:00+00', '1474-12-16 20:59:59+00'),
    -- Hammamizade İsmail Dede Efendi: 9 Ocak 1778 - 29 Kasım 1846
    ($t$Hammamizade İsmail Dede Efendi: Doğum Yıl Dönümü$t$, '1778-01-08 21:00:00+00', '1778-01-09 20:59:59+00'),
    ($t$Hammamizade İsmail Dede Efendi: Vefat Yıl Dönümü$t$, '1846-11-28 21:00:00+00', '1846-11-29 20:59:59+00'),
    -- Bîrûnî: 4 Eylül 973 - 13 Aralık 1048
    ($t$Bîrûnî: Doğum Yıl Dönümü$t$, '0973-09-03 21:00:00+00', '0973-09-04 20:59:59+00'),
    ($t$Bîrûnî: Vefat Yıl Dönümü$t$, '1048-12-12 21:00:00+00', '1048-12-13 20:59:59+00')
) AS v(title, start_date, end_date)
WHERE e.title = v.title;
