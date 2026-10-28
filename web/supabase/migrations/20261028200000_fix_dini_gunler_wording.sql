-- Dini Günler'deki dil hataları:
--   1) "idrak edilir/edilen" 9 açıklamada tekrar ediyordu. "İdrak etmek" kavramak anlamına gelir;
--      bir gün için doğru fiiller ihya edilir / kutlanır / anılır / sayılır / denk gelir.
--      Aynı hata milli-ve-kulturel-gunler'deki Şehitler Günü'nde de vardı, o da düzeltildi.
--   2) Mevlid Kandili tek başına dualı birinci çoğul üslupla yazılmıştı
--      ("Sevgili Peygamberimiz", "dünyayı şereflendirdiği"); kategorinin geri kalanı nötr
--      ve betimleyici olduğu için aynı sese çekildi. "(s.a.v.)" kalıbı korundu.
--   3) Miraç Kandili'nde aynı cümlede "Recep" ve "Receb" birlikte kullanılmıştı; "Receb" yapıldı.
--   4) Kurban Bayramı Arefesi'ndeki "kurban ibadetine ve bayram hazırlıklarına ara verilir"
--      ifadesi anlamsızdı; günün gerçek içeriğiyle (Arafat vakfesi, arefe orucu) değiştirildi.

UPDATE public.events e
SET description = v.description
FROM (
  VALUES
    (
      $t$Hicri Yılbaşı$t$,
      $d$Hicri takvimin 1 Muharrem günü; Hicret olayının anıldığı ve yeni Hicri yılın başladığı gündür. İslam dünyasında yeni yılın ilk günü olarak karşılanır.$d$
    ),
    (
      $t$Mevlid Kandili$t$,
      $d$Hz. Muhammed'in (s.a.v.) doğduğu gece olarak anılan mübarek kandildir; Müslümanlar için rahmet ve sevginin sembolü sayılır. Diyanet takvimine göre Rebiülevvel ayının 11. gecesinde kutlanır. Bu gece pek çok yerde mevlid okunur, salavat getirilir ve Peygamberin hayatı, ahlakı ve öğretileri anılır.$d$
    ),
    (
      $t$Regaib Kandili$t$,
      $d$Üç ayların müjdecisi olan Receb ayının ilk Cuma gecesinde ihya edilen mübarek kandildir; rahmet ve bereket dualarıyla anılır. Diyanet takviminde de kandil bu geceye yerleştirilir.$d$
    ),
    (
      $t$Miraç Kandili$t$,
      $d$İslam inancına göre Hz. Muhammed'in (s.a.v.) bir gecede Mescid-i Haram'dan Mescid-i Aksa'ya, oradan da göklere yükseldiği mirac olayının anıldığı mübarek gecedir. Receb ayının 27. gecesine denk gelir; Diyanet İşleri Başkanlığı'nın ilan ettiği takvime göre Receb ayının 26. gecesi kandil olarak kutlanır.$d$
    ),
    (
      $t$Berat Kandili$t$,
      $d$Şaban ayının 15. gecesine denk gelen, günahların affedilmesi, kaderin yazılması ve kulların rahmete mazhar kılınması dualarıyla anılan mübarek gecedir. Diyanet takviminde Şaban ayının 14. gecesi kandil olarak ilan edilir.$d$
    ),
    (
      $t$Kadir Gecesi$t$,
      $d$Kur'an-ı Kerim'in indirilmeye başlandığı, bin aydan hayırlı olduğu bildirilen mübarek gecedir. Ramazan ayının 27. gecesine denk gelir; Diyanet takviminde Ramazan ayının 26. gecesi olarak ilan edilir.$d$
    ),
    (
      $t$Ramazan Bayramı Arefesi$t$,
      $d$Ramazan Bayramı'na (Şeker Bayramı) hazırlık günüdür. Ramazan ayının son günü olup bayram arefesi sayılır; zekâtların verilmesi ve bayramlık hazırlıkları bu gün tamamlanır.$d$
    ),
    (
      $t$Ramazan Bayramı$t$,
      $d$Ramazan ayını müteakip Şevval ayının ilk üç gününde kutlanan dini bayramdır; oruç ibadetinin ardından sevinç ve paylaşım günü sayılır. Şeker Bayramı olarak da bilinir.$d$
    ),
    (
      $t$Kurban Bayramı Arefesi$t$,
      $d$Kurban Bayramı'na hazırlık günüdür. Zilhicce ayının 9. günü olup hacıların Arafat'ta vakfe yaptığı gündür; oruç tutmak sünnettir ve bayram hazırlıkları bu gün tamamlanır.$d$
    ),
    (
      $t$Şehitler Günü$t$,
      $d$Çanakkale Cephesi'nde şehit düşen Mehmetçiklerin anıldığı, Türk milletinin vatan uğruna canını feda eden evlatlarını andığı gündür. 18 Mart 1915'te Deniz Zaferi'nin kutlandığı gün olarak her yıl anma törenleriyle anılır.$d$
    )
) AS v(title, description)
WHERE e.title = v.title;
