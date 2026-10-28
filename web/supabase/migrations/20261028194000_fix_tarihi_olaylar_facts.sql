-- Tarihî Olaylar: altı kaydın açıklamasındaki olgu hataları düzeltildi.
-- Pasinler, Turnadağ ve Dandanakan'da tarih de yanlıştı; doğru güne çekildi.
--   Pasinler   -> 1312 / İlhanlı-Osmanlı yazılmıştı; doğrusu 1048, Selçuklu-Bizans.
--   Turnadağ   -> 1644 / IV. Murad yazılmıştı; doğrusu 1515, Osmanlı-Dulkadiroğulları.
--   Dandanakan -> 23 Ağustos ve "Selçuklu Sultan Mesud" yazılmıştı; doğrusu 23 Mayıs, Tuğrul ve Çağrı Bey.
--   Çaldıran   -> Safevi hükümdarı I. Tahmasp yazılmıştı; doğrusu Şah İsmail (Tahmasp 1524'te tahta çıktı).
--   II. Kosova -> Macar kralı III. Ulászló yazılmıştı; doğrusu komutan Janos Hunyadi (Ulászló 1444'te Varna'da öldü).
--   93 Harbi   -> Berlin Antlaşması ile bitti yazılmıştı; doğrusu Ayastefanos, Berlin sonradan revize etti.
-- Kaynak bağlantıları zaten doğru sayfalara işaret ediyordu, değiştirilmedi.
-- Tarihler tr.wikipedia üzerinden doğrulandı.

-- 1) Açıklamalar
UPDATE public.subjects s
SET description = v.description
FROM (
  VALUES
    (
      $n$Pasinler Savaşı$n$,
      $d$1048'de İbrahim Yınal ve Kutalmış komutasındaki Selçuklu kuvvetleri ile Bizans-Gürcü ordusu arasında Erzurum yakınlarındaki Pasinler'de yapılan savaş; Selçukluların Anadolu'ya yönelik akınlarının önünü açmıştır.$d$
    ),
    (
      $n$Turnadağ Savaşı$n$,
      $d$1515'te Yavuz Sultan Selim döneminde Osmanlı kuvvetleri ile Dulkadiroğulları Beyliği arasında Turnadağ'da yapılan savaş; beyliğin sona ererek topraklarının Osmanlı Devleti'ne katılmasıyla sonuçlanmıştır.$d$
    ),
    (
      $n$Dandanakan Savaşı$n$,
      $d$1040'ta Tuğrul ve Çağrı Bey komutasındaki Selçuklular ile Gazneli Sultan I. Mesud arasında Merv yakınlarındaki Dandanakan'da yapılan meydan muharebesi; Gaznelilerin yıkılışının ve Büyük Selçuklu Devleti'nin kuruluşunun dönüm noktasıdır.$d$
    ),
    (
      $n$Çaldıran Savaşı$n$,
      $d$1514'te Yavuz Sultan Selim ile Safevi hükümdarı Şah İsmail arasında Çaldıran Ovası'nda yapılan savaş; Osmanlı'nın Doğu sınırındaki Safevi tehdidine karşı kesin zaferidir.$d$
    ),
    (
      $n$II. Kosova Savaşı$n$,
      $d$1448'de II. Murad ile Macar komutan Janos Hunyadi arasında Kosova Ovası'nda yapılan savaş; I. Kosova'dan sonra Balkanlar'daki Osmanlı-Macar rekabetinin devam ettiği önemli bir muharebedir.$d$
    ),
    (
      $n$93 Harbi$n$,
      $d$1877–1878 Osmanlı-Rus Savaşı; Rusya'nın savaş ilan etmesiyle başlamış, Ayastefanos Antlaşması ile sona ermiş, şartları aynı yıl Berlin Antlaşması ile yeniden düzenlenmiştir.$d$
    )
) AS v(name, description)
WHERE s.name = v.name
  AND s.category_id = (SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar');

-- 2) Tarihi de yanlış olan üç kayıt
UPDATE public.events e
SET
  start_date = v.start_date::timestamptz,
  end_date = v.end_date::timestamptz
FROM (
  VALUES
    -- 20 Eylül 1312 -> 18 Eylül 1048 (kaynak 10 veya 18 Eylül veriyor; künye 18 Eylül)
    ($t$Pasinler Savaşı$t$, '1048-09-17 21:00:00+00', '1048-09-18 20:59:59+00'),
    -- 21 Temmuz 1644 -> 12 Haziran 1515
    ($t$Turnadağ Savaşı$t$, '1515-06-11 21:00:00+00', '1515-06-12 20:59:59+00'),
    -- 23 Ağustos 1040 -> 23 Mayıs 1040
    ($t$Dandanakan Savaşı$t$, '1040-05-22 21:00:00+00', '1040-05-23 20:59:59+00')
) AS v(title, start_date, end_date)
WHERE e.title = v.title;
