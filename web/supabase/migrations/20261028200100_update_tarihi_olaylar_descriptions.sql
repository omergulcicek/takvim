-- Tarihî Olaylar: değerlendirme cümlesiyle biten 13 açıklamaya somut sonuç eklendi.
-- Önce "önemli bir muharebedir / dönüm noktasıdır / temel taşlarından biridir" gibi
-- ölçülemez ifadelerle kapanıyorlardı; artık olayın ne ile sonuçlandığını söylüyorlar.
-- Diğer kayıtlarda sonuç zaten vardı, onlara dokunulmadı.
-- Varna'da ayrıca "Murad II" -> "II. Murad" olarak hizalandı (kategorinin geri kalanıyla tutarlı).
-- Sonuçlar tr.wikipedia üzerinden doğrulandı.

UPDATE public.subjects s
SET description = v.description
FROM (
  VALUES
    (
      $n$Harran Savaşı$n$,
      $d$1104'te Haçlılar ile Artuklu-Müslüman birlikleri arasında Harran yakınlarında yapılan savaş; Urfa Kontu II. Baudouin ile Joscelin esir alınmış, Haçlıların Fırat'ın doğusundaki ilerleyişi durmuştur.$d$
    ),
    (
      $n$Koyunhisar (Bafeus) Savaşı$n$,
      $d$1302'de Osmanlı Beyi Osman Gazi ile Bizans ordusu arasında Bafeus (Koyunhisar) yakınlarında yapılan savaş; Bizans'ın İznik çevresindeki direnci kırılmış, Bursa ve İzmit yönüne açılan yol Osmanlı denetimine girmiştir.$d$
    ),
    (
      $n$Sırpsındığı Savaşı$n$,
      $d$1364'te Osmanlı ordusu ile Sırp-Bulgar-Macar ittifakı arasında Edirne yakınlarında Sırpsındığı'nda yapılan savaş; müttefik ordu dağılmış, Edirne ve çevresindeki Osmanlı hâkimiyeti pekişmiştir.$d$
    ),
    (
      $n$I. Kosova Savaşı$n$,
      $d$1389'da Osmanlı ordusu ile Sırp ve müttefikleri arasında Kosova Ovası'nda yapılan savaş; muharebede hem Sultan I. Murad hem Sırp Prensi Lazar hayatını kaybetmiş, Sırp Despotluğu Osmanlı'ya bağlı hâle gelmiştir.$d$
    ),
    (
      $n$Niğbolu Savaşı$n$,
      $d$1396'da Yıldırım Bayezid komutasındaki Osmanlı ordusu ile Haçlı ordusu arasında Niğbolu'da yapılan savaş; Haçlı ordusu bozguna uğramış, Bulgaristan'daki Osmanlı hâkimiyeti kesinleşmiştir.$d$
    ),
    (
      $n$Varna Savaşı$n$,
      $d$1444'te II. Murad komutasındaki Osmanlı ordusu ile Macar-Polonya-Haçlı ittifakı arasında Varna'da yapılan savaş; Macar kralı III. Ulászló muharebede ölmüş, Haçlı ordusu dağılmıştır.$d$
    ),
    (
      $n$II. Kosova Savaşı$n$,
      $d$1448'de II. Murad ile Macar komutan Janos Hunyadi arasında Kosova Ovası'nda yapılan savaş; Hunyadi'nin ordusu yenilgiye uğramış, Macarların Balkanlar'daki taarruz gücü kırılmıştır.$d$
    ),
    (
      $n$Otlukbeli Savaşı$n$,
      $d$1473'te Fatih Sultan Mehmed ile Akkoyunlu hükümdarı Uzun Hasan arasında Otlukbeli'nde yapılan savaş; Akkoyunlu ordusu ağır yenilgiye uğramış, Uzun Hasan'ın Anadolu'ya yönelik genişleme girişimi sona ermiştir.$d$
    ),
    (
      $n$Çaldıran Savaşı$n$,
      $d$1514'te Yavuz Sultan Selim ile Safevi hükümdarı Şah İsmail arasında Çaldıran Ovası'nda yapılan savaş; Safevi ordusu dağılmış, Tebriz'e girilmiş ve Doğu Anadolu Osmanlı denetimine geçmiştir.$d$
    ),
    (
      $n$Kırım Savaşı$n$,
      $d$1853–1856 yılları arasında Osmanlı Devleti ile Rusya arasında Kırım Yarımadası merkezli süren savaş; İngiltere ve Fransa'nın Osmanlı yanında katıldığı savaş Paris Antlaşması ile sona ermiş, Rusya'nın Karadeniz'de donanma bulundurması yasaklanmıştır.$d$
    ),
    (
      $n$Sakarya Meydan Muharebesi$n$,
      $d$1921'de Türk Kurtuluş Ordusu ile Yunan ordusu arasında Sakarya Nehri boyunca süren meydan muharebesi; Yunan ordusunun ileri harekâtı durmuş ve ordu savunmaya çekilmiştir.$d$
    ),
    (
      $n$Büyük Taarruz$n$,
      $d$1922'de Türk ordusunun Yunan işgaline son vermek için başlattığı genel taarruz harekâtı; Başkomutanlık Meydan Muharebesi'ni de kapsayan harekâtta Yunan cephesi yarılmış, iki hafta içinde İzmir'e ulaşılmıştır.$d$
    ),
    (
      $n$İzmir'in Kurtuluşu$n$,
      $d$1922'de Türk ordusunun İzmir'e girerek şehri Yunan işgalinden kurtarması; Batı Anadolu'daki işgal sona ermiş, Kurtuluş Savaşı'nın muharebe dönemi kapanmıştır.$d$
    )
) AS v(name, description)
WHERE s.name = v.name
  AND s.category_id = (SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar');
