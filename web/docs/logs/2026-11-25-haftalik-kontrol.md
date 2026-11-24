# Haftalık Kontrol — 2026-11-25

Koşu 02:04 TR. Dal: `claude/dazzling-babbage-10j8ur` (platform atadı). BUGUN = 2026-11-25, pencere 2026-11-25 → 2026-12-09.

## Adım 1 — Sonuçlar

Sorgu çalıştırıldı: 4 skorsuz maç (hepsi 24 Kasım, UCL 5. hafta). Dördü de ESPN + FotMob'da FT ve aynı skor; goller iki kaynakta aynı. Dördü güncellendi, atlanan yok.

- Galatasaray 1 - 0 Aston Villa
- Arsenal 1 - 1 Borussia Dortmund
- Manchester City 2 - 2 Napoli
- Real Madrid 5 - 1 PSV Eindhoven (Perišić penaltı)

Kırmızı kart: dört maçta da yok (iki kaynakta da). "Kart doğrulanamadı" satırı yok.

## Adım 2 — Fikstür

Sorgu çalıştırıldı. ESPN'den (UCL, Avrupa Ligi, Konferans Ligi, Premier Lig, La Liga, Serie A, Süper Lig, hazırlık, Uluslar Ligi, Dünya Kupası) 15 gün × lig taraması, 156 maç kontrol edildi; DB ile karşılaştırıldı.

Eklenen 4 maç (9 Aralık, UCL 6. hafta; ESPN + FotMob aynı saat, 23:00 TR):
- Arsenal - Real Madrid
- Borussia Dortmund - Inter
- LASK - Fenerbahçe
- Liverpool - FC Porto

Eklenmeyenler: kapsam dışı takım maçları (ör. Atlético - Viking, Slavia - Villarreal, Real Betis - Como, PSV - Atlético); Avrupa Ligi'nde kulüp kategorisi olmayan takımlar (Juventus, Milan vb.); Serie A'da iki taraf da kapsam içi olan maç yok; İngiltere - Ukrayna hazırlık (yalnızca Türkiye hazırlıkları eklenir).

Millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya — sekizi için pencerede resmî turnuva/eleme maçı bulunmadı (ESPN fifa.friendly, uefa.nations, fifa.world taramaları: resmî maç yok).

## Adım 3 — Saatler

Sorgu çalıştırıldı: pencerede 12:00 placeholder sayısı 0. Netleşen/netleşmeyen/uyarı yok.

## Kaynaklar

- site.api.espn.com: erişildi (tüm lig ve özet uçları)
- fotmob.com: erişildi (matches, matchDetails)
- Diğerleri denenmedi (iki kaynak yeterli oldu)

## Migration

- `20261125020600_update_sampiyonlar_ligi_5_hafta_sonuclari.sql` — UCL 5. hafta dört maçın skoru ve golleri. Uygulandı.
- `20261125020700_add_sampiyonlar_ligi_6_hafta_9_aralik.sql` — 9 Aralık UCL dört maç eklendi. Uygulandı.
- Adım 3 için migration yok (iş çıkmadı).

## Kalan iş

- Skorsuz geçmiş maç: 0
- Pencere içi placeholder saat: 0
