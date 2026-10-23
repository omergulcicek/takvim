# Haftalık Kontrol — 2026-10-23

Çalışma zamanı (DB now()): 2026-10-23 08:30 UTC.

## Skorsuz geçmiş maçlar (ADIM 1)

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()` (alt sınır yok, status filtresi yok).

Sonuç: **0 satır** (`count(*) = 0`). Skorsuz geçmiş maç yok.

## Diğer

- ADIM 2 ve 3 atlandı (skorsuz maç yok).
- Kaynak erişimi: kaynak sorgulanmadı.
- Güncellenen: 0. Atlanan: 0. Doğrulanamayan: 0. Hâlâ skorsuz kalan: yok.
- Migration: yok.
