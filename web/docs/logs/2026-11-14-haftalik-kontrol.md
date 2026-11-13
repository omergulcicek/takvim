# Haftalık kontrol — 2026-11-14

Koşu 02:04 TR. Dal: `claude/dazzling-babbage-8bhbqb` (platform atadı). Pencere: 2026-11-14 → 2026-11-28.

## Adım 1 — Sonuçlar

Sorgu 2 satır döndü:

| Maç                     | Başlangıç (TR)   |
| ----------------------- | ---------------- |
| Çekya - İspanya         | 2026-11-12 22:45 |
| Sırbistan - Almanya     | 2026-11-13 22:45 |

Güncellenen: yok. Atlanan:

- **Çekya 0 - 2 İspanya** — skor ESPN ve FotMob'da aynı (Baena 39' pen., Pubill 90+6'). Çekya'dan Ladislav Krejčí kırmızı kart: oyuncu iki kaynakta aynı ama dakika ESPN 72', FotMob 69' (3 dk fark). Dakika tahmin edilmedi, maç atlandı.
- **Sırbistan 1 - 3 Almanya** — skor ESPN ve FotMob'da aynı (Babić k.k. 3', Wirtz 14', Gruda 50'; Babić 56'). Vanja Dragojević kırmızı kartı ESPN 76', FotMob 74' (2 dk fark). Aynı nedenle atlandı.

Not: Goller iki kaynakta aynı; yalnızca kırmızı kart dakikaları çelişiyor. Bir sonraki koşuda kaynaklar uzlaşırsa yazılır.

## Adım 2 — Fikstür

Kontrol: Süper Lig, Premier Lig, La Liga, Serie A, Şampiyonlar Ligi, Avrupa Ligi ve Uluslar Ligi (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya dahil sekiz millî takım; ESPN günlük fikstür). DB'de pencerede 31 maç vardı.

Eklenen (ESPN + FotMob'da aynı saat):

- Manchester United - Brentford — 2026-11-28 18:00 (`premier-lig`)
- Real Madrid - Alavés — 2026-11-28 23:00 (`la-liga`)

Eklenmeyen: Brezilya, Arjantin ve İspanya'nın pencere içi maçları hazırlık (yalnızca Türkiye hazırlığı eklenir). Kapsam dışı takımların maçları eklenmedi. Serie A'da iki taraf da kapsam takımı olan maç yok.

## Adım 3 — Saatler

Sorgu çalıştırıldı: penceredeki 12:00 placeholder sayısı 0. Netleşecek saat yok, uyarı yok.

## Kaynaklar

| Kaynak            | Durum    |
| ----------------- | -------- |
| site.api.espn.com | Erişildi |
| fotmob.com        | Erişildi |

## Migration

- `20261114020500_add_fikstur_penceresi_20261114.sql` — Manchester United - Brentford ve Real Madrid - Alavés eklendi; `apply_migration` ile uygulandı ve SELECT ile doğrulandı.

## Kalan iş

- Skorsuz: Çekya - İspanya, Sırbistan - Almanya (kart dakikası çelişkisi).
- Pencere içinde placeholder saat: yok.
