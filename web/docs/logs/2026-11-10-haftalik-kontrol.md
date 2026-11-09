# Haftalık Kontrol — 2026-11-10

BUGUN = 2026-11-10 (Europe/Istanbul). Pencere: 2026-11-10 → 2026-11-24. Koşu saati ≈ 02:05 TR. Dal: `claude/dazzling-babbage-n0iusp` (platform atadı).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **0**. Güncellenecek maç yok; migration oluşturulmadı.

## Adım 2 — Fikstür

Pencere kapsamı: Süper Lig, La Liga, Premier Lig, Serie A, Şampiyonlar Ligi, Avrupa Ligi, Uluslar Ligi, millî hazırlık ve eleme (ESPN lig bazında 11 lig, 15 gün tarandı). Sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kontrol edildi.

- Uluslar Ligi 5. ve 6. hafta (12–17 Kasım): kapsamdaki 10 maçın hepsi Takvim'de var, saatler ESPN ile aynı.
- Süper Lig (4 kulüp), La Liga (Real Madrid, Barcelona), Premier Lig (Man City, Chelsea, Tottenham, Arsenal, Liverpool, Man United) 21–22 Kasım maçları Takvim'de var.
- Serie A: iki tarafı da takip edilen kulüp olan maç yok.
- Arjantin (Uruguay, 14 Kas 02:00 TR; Kosta Rika) ve Brezilya (Japonya, Singapur) hazırlık maçları: hazırlık yalnızca Türkiye için eklenir, eklenmedi.
- **Eksik 4 maç eklendi** (Şampiyonlar Ligi 5. hafta, 24 Kasım): Galatasaray - Aston Villa 20:45, Arsenal - Borussia Dortmund 23:00, Manchester City - Napoli 23:00, Real Madrid - PSV Eindhoven 23:00 (TR). Saatler ESPN ve Flashscore'da aynı.
- 25 Kasım UCL maçları (Barcelona, Villarreal, Liverpool, Inter, Bayern, PSG, Man United, Fenerbahçe vb.) pencere dışında; sonraki koşuda eklenecek.

## Adım 3 — Saatler

Sorgu çalıştırıldı (12:00 placeholder, `now()` → `+14 gün`). Placeholder sayısı: **0**. Netleşen yok, uyarı yok.

## Kaynaklar

| Kaynak                    | Durum                                           |
| ------------------------- | ----------------------------------------------- |
| site.api.espn.com         | Erişildi (tarih aralığı 400, günlük sorgu çalıştı) |
| flashscore.com            | Erişildi (UCL fikstür sayfası)                  |
| fotmob.com                | 308/404, kullanılamadı                          |
| uefa.com                  | Bağlantı kurulamadı                             |

## Migration

- `20261110020500_add_ucl_matchday5_nov24.sql` — Şampiyonlar Ligi 5. hafta, 24 Kasım'daki dört maç. `apply_migration` ile uygulandı, SELECT ile doğrulandı (başlık, saat, kategori).

## Kalan iş

- Skorsuz geçmiş maç: yok.
- Pencere içinde placeholder saat: yok.
- 25 Kasım UCL maçları sonraki koşuda pencereye girecek.
