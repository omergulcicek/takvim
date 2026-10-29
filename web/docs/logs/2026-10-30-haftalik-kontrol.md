# Haftalık Kontrol — 2026-10-30

Koşu: 02:04 TR. Dal: `claude/dazzling-babbage-ldff45` (platform atamalı dal). Pencere: 2026-10-30 → 2026-11-13.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **0**. Güncellenen yok, atlanan yok.

## Adım 2 — Fikstür

Penceredeki kapsam içi maçlar ESPN (eng.1, esp.1, ita.1, tur.1, uefa.champions, uefa.europa, uefa.nations, fifa.friendly) ve FotMob ile Takvim'e karşılaştırıldı. Süper Lig (4 kulüp), Premier Lig (6 kulüp), La Liga (Barcelona, Real Madrid), Serie A (5 kulüp arası), Şampiyonlar Ligi, Avrupa Ligi ve sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kontrol edildi; Takvim'de 37 kulüp maçı zaten vardı.

Eklenen (5, Uluslar Ligi 5. hafta, saatler ESPN ve FotMob'da aynı):

- Türkiye - Belçika — 12 Kas 20:00
- Çekya - İspanya — 12 Kas 22:45
- İngiltere - Hırvatistan — 12 Kas 22:45
- İtalya - Fransa — 12 Kas 22:45
- Sırbistan - Almanya — 13 Kas 22:45

Eklenmeyen:

- Danimarka - Portekiz (14 Kas): pencere dışı.
- Uruguay - Arjantin (13 Kas), Brezilya - Japonya (14 Kas): hazırlık maçı, yalnızca Türkiye için eklenir.
- Kapsam dışı kulüp maçları (ör. Fulham - Aston Villa, Atlético Madrid - Levante, Roma - Udinese): kategori kapsamında değil.

## Adım 3 — Saatler

Sorgu (gelecek, 14 gün içinde, 12:00 TR): placeholder sayısı **0**. Uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                        |
| ----------------- | -------------------------------------------- |
| site.api.espn.com | Erişildi (tarih aralığı 400, gün gün sorgulandı) |
| fotmob.com        | Erişildi (Uluslar Ligi saatleri)             |

## Migration

- `20261030021500_add_fikstur_penceresi_20261030.sql` — Uluslar Ligi 5. hafta, 5 millî takım maçı eklendi. `apply_migration` ile uygulandı, sonuç `SELECT` ile doğrulandı.

## Kalan iş

Skorsuz maç yok. Pencerede placeholder saat yok.
