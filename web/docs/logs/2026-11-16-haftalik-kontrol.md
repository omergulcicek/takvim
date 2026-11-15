# Haftalık Kontrol — 2026-11-16

Koşu 02:03 TR. Dal: `claude/dazzling-babbage-mcp5ht` (platform atadı).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **2**

| Maç                 | Başlangıç (TR)   | Sonuç                   |
| ------------------- | ---------------- | ----------------------- |
| Fransa - Türkiye    | 2026-11-15 22:45 | Fransa 2 - 1 Türkiye    |
| İspanya - İngiltere | 2026-11-15 22:45 | İspanya 2 - 3 İngiltere |

- Skor ve bitiş (FT): ESPN ve FotMob'da aynı. Gol ve kart dakikaları ESPN ile FotMob arasında aynı.
- Fransa - Türkiye: Emirhan Topçu 49' kendi kalesine (Fransa bloğunda), Junior Kroupi 80', Abdülkerim Bardakçı 90'.
- İspanya - İngiltere: kırmızı kart Elliot Anderson 63' iki kaynakta aynı; yazıldı. Penaltılar: Kane 45', Oyarzabal 65'.
- Atlanan: yok. Kart doğrulanamadı: yok.
- Uygulama sonrası aynı sorgu: 0 satır.

## Adım 2 — Fikstür

Pencere: 2026-11-16 → 2026-11-30. Kontrol: ESPN'de 10 lig/turnuva kodu × 15 gün taranıp kapsam içi takımlar DB ile karşılaştırıldı (DB'de pencerede 34 maç vardı). Millî takımlar sekizi de kontrol edildi: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya.

- **Eklenen:** CSKA Sofya - Trabzonspor (Konferans Ligi 4. hafta, 26 Kas 23:00 TR). ESPN (20:00Z) ve FotMob (utcTime 20:00Z, tournamentStage 4) aynı.
- Eklenmeyen (kapsam dışı): Brezilya - Singapur, Arjantin - Kosta Rika, İspanya - Şili (hazırlık, Türkiye değil); Juventus - Omonia, Milan - Olympiacos (Avrupa Ligi, kulüp kategorisi yok); Serie A maçları (iki taraf da büyük beşten değil); diğer Uluslar Ligi maçları (kapsamdaki takım yok).
- Diğer tüm kapsam içi maçlar DB'de mevcut, saatler uyumlu.

## Adım 3 — Saatler

Sorgu (12:00 TR, `now()` → +14 gün): placeholder sayısı **0**. Netleşen: yok. Uyarı: yok. (Pencere dışı 6 Aralık ve sonrası 12:00 kayıtları normaldir.)

## Kaynaklar

| Kaynak            | Durum                                                |
| ----------------- | ---------------------------------------------------- |
| site.api.espn.com | Erişildi: skor, gol, kart, fikstür                   |
| fotmob.com        | Erişildi: skor, gol, kart, fikstür, hafta bilgisi    |
| Web araması       | Erişildi: sonuç dönmedi (kullanılmadı)               |

## Migration

- `20261116020000_update_milli_takimlar_15_kasim_sonuclari.sql` — Fransa-Türkiye ve İspanya-İngiltere sonuçları ve goller. `apply_migration` ile uygulandı.
- `20261116020100_add_fikstur_penceresi_20261116.sql` — CSKA Sofya - Trabzonspor eklendi (`trabzonspor`). `apply_migration` ile uygulandı.
- Saat migration'ı: oluşturulmadı (Adım 3 iş çıkarmadı).

## Kalan iş

- Skorsuz maç: yok.
- Pencere içinde placeholder saat: yok.
