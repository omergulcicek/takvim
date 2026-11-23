# Haftalık Kontrol — 2026-11-24

Koşu: 02:05 TR. Dal: `claude/dazzling-babbage-2kzfoo` (platform atadı). Pencere: 2026-11-24 → 2026-12-08.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **0**. Güncellenen yok, atlanan yok.

## Adım 2 — Fikstür

ESPN (`site.api.espn.com`) ile pencerenin 15 günü için 11 lig/turnuva tarandı: Premier Lig, La Liga, Süper Lig, Serie A, Şampiyonlar Ligi, Avrupa Ligi, Konferans Ligi, Uluslar Ligi, hazırlık, UEFA ve CONMEBOL Dünya Kupası eleme. Pencerede yaklaşık 150 maç listelendi, kapsam içi olanlar Takvim ile karşılaştırıldı.

Millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya sekizi için kontrol edildi. Pencerede resmî turnuva/eleme maçı yok. Tek millî maç Ukrayna - İngiltere (5 Aralık) hazırlık maçı; hazırlık yalnızca Türkiye için eklendiğinden eklenmedi. Türkiye hazırlık maçı yok.

Eklenen (7 maç, Şampiyonlar Ligi 6. hafta, 8 Aralık 23:00 TR; ESPN ve FotMob'da saat aynı):

- AEK Athens - Galatasaray
- Aston Villa - Paris Saint-Germain
- Barcelona - Manchester City
- Bayern Münih - Slavia Prague
- Manchester United - RB Leipzig
- Roma - Sporting CP
- Napoli - Club Brugge

Eklenmeyen (kapsam dışı takımlar): Sabah - Villarreal, Viking - Feyenoord (8 Aralık); Viking - Atlético Madrid, Villarreal - Slavia Prague (25 Kasım) ve diğer kapsam dışı ligi maçları. Diğer tüm kapsam içi maçlar (Süper Lig, Premier Lig, La Liga, UCL 5. hafta, Avrupa/Konferans Ligi) Takvim'de zaten var.

## Adım 3 — Saatler

Sorgu: `start_date > now() AND start_date < now() + interval '14 days' AND to_char(start_date AT TIME ZONE 'Europe/Istanbul','HH24:MI') = '12:00'`. Placeholder sayısı: **0**. Netleşen yok, uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                   |
| ----------------- | --------------------------------------- |
| site.api.espn.com | Erişildi (günlük scoreboard)            |
| fotmob.com        | Erişildi (`/api/data/leagues?id=42`)    |
| Diğerleri         | Denenmedi (ilk iki kaynak yeterliydi)   |

## Migration

- `20261124020500_add_fikstur_penceresi_20261124.sql` — 8 Aralık UCL 6. hafta kapsam içi 7 maç. `apply_migration` ile uygulandı, SELECT ile doğrulandı.

Adım 1 ve Adım 3 iş çıkarmadığı için sonuç ve saat migration'ı oluşturulmadı.

## Kalan iş

Skorsuz maç: yok. Pencere içinde placeholder saat: yok. 9 Aralık UCL maçları pencere dışı, sonraki koşuda eklenecek.
