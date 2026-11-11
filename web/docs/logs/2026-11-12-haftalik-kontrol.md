# Haftalık Kontrol — 2026-11-12

Koşu 02:04 TR. `BUGUN` = 2026-11-12 (Europe/Istanbul; UTC'de hâlâ 11 Kasım). Pencere: 2026-11-12 → 2026-11-26. Dal: `claude/dazzling-babbage-edsddj`.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **0**. Güncellenen yok, atlanan yok.

## Adım 2 — Fikstür

Kontrol edilen: ESPN'de pencereye düşen Şampiyonlar Ligi (18), Avrupa Ligi (18), Uluslar Ligi (52), hazırlık (43), Premier Lig, La Liga, Süper Lig, Serie A maçları. Millî takım kapsamı sekiz takımın tamamı için kontrol edildi (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya). Uluslar Ligi maçlarının hepsi Takvim'de zaten vardı.

Eklenen (8):

| Maç | Başlangıç (TR) | Kategori |
| --- | --- | --- |
| Sabah - Barcelona | 2026-11-25 20:45 | sampiyonlar-ligi, la-liga |
| Paris Saint-Germain - Roma | 2026-11-25 23:00 | sampiyonlar-ligi |
| Lille - Bayern Münih | 2026-11-25 23:00 | sampiyonlar-ligi |
| Shakhtar Donetsk - Fenerbahçe | 2026-11-25 23:00 | sampiyonlar-ligi, fenerbahce |
| Club Brugge - Liverpool | 2026-11-25 23:00 | sampiyonlar-ligi, premier-lig |
| Sporting CP - Manchester United | 2026-11-25 23:00 | sampiyonlar-ligi, premier-lig |
| Inter - VfB Stuttgart | 2026-11-25 23:00 | sampiyonlar-ligi |
| Beşiktaş - Hapoel Be'er Sheva | 2026-11-26 20:45 | besiktas |

Eklenmeyen (neden):
- Uruguay - Arjantin (13 Kas), Kosta Rika - Arjantin (17 Kas), Brezilya - Japonya, Brezilya - Singapur: hazırlık maçı, yalnızca Türkiye için eklenir.
- Diğer UCL maçları (Porto-Feyenoord, AEK-Como, Viking-Atlético vb.): kapsam dışı takımlar.
- Milan - Olympiacos ve diğer Avrupa Ligi maçları: Avrupa Ligi'nde yalnızca kulüp kategorisi var, kapsam içi kulüp yok (Beşiktaş hariç).
- Premier Lig / La Liga / Süper Lig / Serie A hafta sonu maçları: kapsam içi olanlar zaten Takvim'de.

**Uyarı:** Bu sekiz maçın saati yalnızca ESPN'den alındı; ikinci kaynak doğrulaması yapılamadı (aşağıya bakın).

## Adım 3 — Saatler

Sorgu: pencere içinde gelecek maçlardan `12:00` (Europe/Istanbul) olanlar. Placeholder sayısı: **0**. Netleşen yok, netleşmeyen yok, 72 saat uyarısı yok.

## Kaynaklar

| Kaynak | Durum |
| --- | --- |
| site.api.espn.com | Erişildi (günlük scoreboard sorguları) |
| fotmob.com | API 404; sayfa içeriği boş döndü. Gömülü veri çekme denemesi izin sistemi tarafından reddedildi, tekrar denenmedi |
| livescore.com | 404 |
| Diğer kaynaklar | Denenmedi |

## Migration

- `20261112020500_add_fikstur_penceresi_20261112.sql` — 8 maç eklendi (UCL 5. hafta, Beşiktaş Avrupa Ligi). `apply_migration` ile uygulandı, SELECT ile doğrulandı. Adım 1 ve 3 için dosya yok (iş çıkmadı).

## Kalan iş

- Skorsuz maç: yok.
- Pencere içi placeholder saat: yok.
- Yukarıdaki sekiz maçın saati için ikinci kaynak teyidi.
