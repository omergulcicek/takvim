# Haftalık Kontrol — 2026-11-06

Koşu 02:04 TR. Dal: `claude/dazzling-babbage-bq691n` (platform atadı). Pencere: 2026-11-06 → 2026-11-20.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **2**

| Maç                      | Başlangıç (TR)   | Sonuç                       |
| ------------------------ | ---------------- | --------------------------- |
| Trabzonspor - Freiburg   | 2026-11-05 20:45 | Trabzonspor 0 - 1 Freiburg  |
| Celtic - Beşiktaş        | 2026-11-05 23:00 | Celtic 3 - 2 Beşiktaş       |

- Skorlar ESPN ve FotMob'da aynı (FT). Gol dakikaları ESPN'den. Kırmızı kart yok.
- Atlanan: yok. Uygulama sonrası aynı sorgu 0 satır döndü.

## Adım 2 — Fikstür

Pencerede ESPN'de taranan ligler: Süper Lig, Premier Lig, La Liga, Şampiyonlar Ligi, Uluslar Ligi, hazırlık. Takvimde pencerede 26 maç var; kapsam içi tüm maçlar mevcut, **pencerede eksik maç yok**.

- Millî takımlar sekizi de kontrol edildi (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya). Uluslar Ligi maçlarının hepsi var. Arjantin (Uruguay, Kosta Rika) ve Brezilya (Japonya, Singapur) maçları hazırlık olduğu için eklenmedi (yalnızca Türkiye hazırlığı eklenir).
- Pencerede Avrupa kupası maçı yok (sonraki tur 26 Kasım). Kapsam dışı kulüp maçları (ör. Newcastle - Fulham) eklenmedi.

## Adım 3 — Saatler

Sorgu çalıştırıldı: penceredeki 12:00 placeholder sayısı **0**. Uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                  |
| ----------------- | -------------------------------------- |
| site.api.espn.com | Erişildi (gzip; `--compressed` gerekir) |
| fotmob.com        | Erişildi (günlük maç listesi)          |

## Migration

- `20261106020500_update_avrupa_kupalari_sonuclari.sql` — Celtic - Beşiktaş ve Trabzonspor - Freiburg sonuçları. `apply_migration` ile uygulandı.
- Adım 2 ve 3 için migration yok (iş çıkmadı).

## Kalan iş

Skorsuz maç: yok. Pencerede placeholder saat: yok.
