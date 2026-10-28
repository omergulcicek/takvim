# Haftalık kontrol — 2026-10-26

## Skorsuz maç sorgusu

Takvim (`ieqzwanwsikryweutnvk`), alt sınır yok, `NOT (title ~ '[0-9] - [0-9]')`, `title LIKE '% - %'`, `start_date + 3 saat < now()`, Lig Kupası ve Türkiye Kupası hariç.

- Sonuç: **3 satır** (eskiden yeniye)
  1. Liverpool - Brighton (25 Eki 17:00, premier-lig)
  2. Manchester United - Bournemouth (25 Eki 17:00, premier-lig)
  3. Barcelona - Real Madrid (25 Eki 23:00, la-liga)

## Kaynak erişimi

| Kaynak | Durum |
| --- | --- |
| site.api.espn.com | Erişildi (skor + gol dakikaları) |
| bbc.co.uk | Erişildi (skor doğrulama) |
| sofascore.com | 403 |
| fotmob.com | API 404 (kullanılamadı) |
| skysports.com | Maç sayfası 404 (kullanılamadı) |
| flashscore.com / livescore.com | Erişildi, ancak skor ayrıştırılmadı (iki kaynak yeterli olduğu için kullanılmadı) |

## Güncellenen (skor ESPN + BBC'de aynı; gol dakikaları ESPN)

- Liverpool 2 - 0 Brighton — `20261026020000_update_liverpool_brighton_result.sql`
- Manchester United 0 - 3 Bournemouth — `20261026020001_update_manchester_united_bournemouth_result.sql`
- Barcelona 1 - 2 Real Madrid — `20261026020002_update_barcelona_real_madrid_result.sql`

Üç migration `apply_migration` ile uygulandı; sonrasında SELECT ile doğrulandı.

## Sonuç

- Atlanan: 0
- Doğrulanamayan: 0
- Hâlâ skorsuz kalan maç: **yok** (doğrulama sorgusu 0 satır)
- Fikstür penceresi (bugün → +14) bu koşuda kapsam dışı bırakıldı; yeni maç eklenmedi.
