# Haftalık Kontrol — 2026-11-05

Koşu 02:05 TR. `BUGUN` = 2026-11-05, pencere 2026-11-05 → 2026-11-19. Dal: `claude/dazzling-babbage-q6s4p2` (platform atamış).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **5**

| Maç                         | Başlangıç (TR)   | Sonuç |
| --------------------------- | ---------------- | ----- |
| AEK Athens - Real Madrid    | 2026-11-04 20:45 | 2 - 3 |
| Fenerbahçe - Liverpool      | 2026-11-04 20:45 | 3 - 2 |
| Porto - Napoli              | 2026-11-04 23:00 | 4 - 1 |
| RB Leipzig - Manchester City | 2026-11-04 23:00 | 2 - 3 |
| Slavia Prague - Arsenal     | 2026-11-04 23:00 | 1 - 2 |

- Güncellenen: 5 maçın hepsi. Skor ve bitiş ESPN ile FotMob'da (ayrıca AEK maçı BBC'de) aynı. Gol dakikaları ESPN ile FotMob arasında 1 dakikayı geçen fark göstermedi (Marín kırmızı kartı ESPN 88', FotMob 89'; ESPN yazıldı).
- Kırmızı kartlar iki kaynakta oyuncu adıyla doğrulandı: Koïta (AEK, 90+5'), Rafa Marín (Napoli, 88'). Viking - Sabah'taki kart kapsam dışı.
- Leipzig - Man City: Lukeba kendi kalesine golü (37') Man City bloğunda yazıldı.
- Atlanan: yok. "Kart doğrulanamadı" satırı: yok.

## Adım 2 — Fikstür

Pencere ESPN'den lig bazında tarandı: Süper Lig, La Liga, Premier Lig, Serie A, Şampiyonlar Ligi, Avrupa Ligi, Uluslar Ligi, hazırlık maçları. Kapsam içi ~30 maç kontrol edildi (kulüp maçları + sekiz millî takımın resmî maçları: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya).

**Pencerede eksik maç yok.** Hepsi Takvim'de mevcut ve saatleri ESPN ile uyumlu. Eklenmeyenler (kapsam dışı): Serie A maçları (iki taraf da Inter/Juve/Milan/Napoli/Roma değil), Arjantin ve Brezilya hazırlıkları (hazırlık yalnızca Türkiye), diğer ülkelerin maçları. Türkiye için pencerede hazırlık maçı yok.

## Adım 3 — Saatler

Sorgu: `start_date > now() AND start_date < now() + interval '14 days' AND to_char(start_date AT TIME ZONE 'Europe/Istanbul', 'HH24:MI') = '12:00'`. Placeholder sayısı: **0**. Netleşen: yok. Uyarı: yok.

## Kaynaklar

| Kaynak            | Durum                                    |
| ----------------- | ---------------------------------------- |
| site.api.espn.com | Erişildi (skor, gol, kart, fikstür)      |
| fotmob.com        | Erişildi (skor, gol, kart)               |
| bbc.co.uk         | Erişildi (skor)                          |
| livescore.com     | Erişildi (kullanılmadı)                  |
| skysports.com     | 301 (kullanılmadı)                       |

## Migration

- `20261105020600_update_sampiyonlar_ligi_4_kasim_sonuclari.sql` — 4 Kasım Şampiyonlar Ligi sonuçları ve goller. `apply_migration` ile uygulandı, SELECT ile doğrulandı.
- Adım 2 ve Adım 3 için iş çıkmadığından dosya oluşturulmadı.

## Kalan iş

Skorsuz maç: yok. Pencere içinde placeholder saat: yok.
