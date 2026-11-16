# Haftalık Kontrol — 2026-11-17

Koşu 02:03 TR. Dal: `claude/dazzling-babbage-6v6kel` (platform atadı).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **1**

| Maç                | Başlangıç (TR)   |
| ------------------ | ---------------- |
| Almanya - Hollanda | 2026-11-16 22:45 |

- Güncellendi: **Almanya 5 - 0 Hollanda**. Skor ve FT, ESPN ve FotMob'da aynı. Gol dakikaları ESPN ile FotMob arasında en fazla 1 dakika farklı (Gruda 77/78); ESPN dakikası yazıldı. Kart: yalnızca Hollanda'dan sarı kart, kırmızı yok.
- Atlanan: yok. Uygulama sonrası aynı sorgu 0 satır döndü.

## Adım 2 — Fikstür

Pencere: 2026-11-17 → 2026-12-01. ESPN'de Premier Lig, La Liga, Süper Lig, Serie A, Şampiyonlar Ligi, Avrupa Ligi, Uluslar Ligi ve millî hazırlık günlük tarandı (15 gün); sonuçlar Takvim ile karşılaştırıldı. Millî takımlar için sekiz takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kontrol edildi: resmî maç yalnızca Galler - Portekiz (zaten kayıtlı); İspanya - Şili, Arjantin - Kosta Rika ve Singapur - Brezilya hazırlık olduğu için, Türkiye dışı, eklenmedi. Türkiye ve Fransa'nın pencerede maçı yok.

Kontrol edilen kapsam içi maç: 36 (Takvim'de zaten var). **Pencerede eksik maç yok.** Kapsam dışı kalanlar: kategorilerde tanımlı olmayan takımların maçları (ör. Atlético Madrid, Newcastle, Aston Villa'nın lig maçları; Serie A'da iki tarafı da beşli listede olmayan maçlar).

## Adım 3 — Saatler

Placeholder sorgusu (12:00 TR, `now()` → +14 gün) çalıştırıldı: **0 satır**. Netleşecek saat ve 72 saat uyarısı yok.

## Kaynaklar

| Kaynak                         | Durum                                         |
| ------------------------------ | --------------------------------------------- |
| site.api.espn.com              | Erişildi (WebFetch 403, curl 200)             |
| fotmob.com                     | Erişildi (api/data/matches, matchDetails)     |
| Diğer siteler                  | Denenmedi, iki kaynak yeterliydi              |

## Migration

- `20261117020500_update_almanya_hollanda_sonuc.sql` — Almanya - Hollanda sonucu ve goller. `apply_migration` ile uygulandı.
- Adım 2 ve Adım 3 için iş çıkmadığından fikstür ve saat dosyası oluşturulmadı.

## Kalan iş

Skorsuz maç yok. Pencerede placeholder saat yok.
