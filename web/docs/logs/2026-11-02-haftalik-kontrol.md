# Haftalık kontrol — 2026-11-02

Dal: `claude/dazzling-babbage-kytiwp` (platform atadı). BUGUN = 2026-11-02, pencere 2026-11-02 → 2026-11-16.

## Adım 1 — Sonuçlar

Sorgu çalıştı: 5 skorsuz maç. Beşi de ESPN ve FotMob'da aynı skorla (FT) doğrulandı, güncellendi.

- Trabzonspor 2 - 0 Gaziantep FK
- Racing Santander 0 - 3 Real Madrid
- Kasımpaşa 2 - 2 Beşiktaş (Trossard dakikası ESPN 28', FotMob 27'; 1 dk fark, 27' yazıldı)
- Liverpool 0 - 1 Arsenal
- Juventus 2 - 0 Napoli (Marianucci 75', ikinci sarıdan kırmızı; iki kaynakta aynı)

Atlanan: yok.

## Adım 2 — Fikstür

Sorgu çalıştı. Veritabanında pencerede 32 maç vardı. FotMob (Süper Lig, La Liga, Premier League, Serie A, Şampiyonlar Ligi, millî maçlar) ve ESPN (Uluslar Ligi) ile karşılaştırıldı. Millî takımlar için sekiz takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kontrol edildi.

- Eklenen: Almanya - Hollanda, 16 Kasım 22:45 (Uluslar Ligi 6. hafta). FotMob ve ESPN'de aynı saat.
- Eklenmeyen: kapsam dışı takımların lig/UCL maçları; Brezilya'nın hazırlık maçı (yalnızca Türkiye hazırlıkları eklenir); pencerede Arjantin maçı bulunmadı.

## Adım 3 — Saatler

Sorgu çalıştı: penceredeki 12:00 placeholder sayısı 0. Netleşen, netleşmeyen ve 72 saat uyarısı yok.

## Kaynaklar

- site.api.espn.com: erişildi
- fotmob.com: erişildi (`/api/data/matches`, `/api/data/matchDetails`)
- bbc.co.uk: erişildi
- skysports.com: 301 yönlendirme, kullanılmadı

## Migration

- `20261102020000_update_1_kasim_sonuclari.sql` — 1 Kasım'daki beş maçın skoru ve gol listesi.
- `20261102020100_add_almanya_hollanda.sql` — Almanya - Hollanda maçı eklendi.

İkisi de `apply_migration` ile uygulandı, SELECT ile doğrulandı.

## Kalan iş

- Skorsuz geçmiş maç: yok.
- Pencere içinde placeholder saat: yok.
