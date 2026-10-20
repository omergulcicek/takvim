# Haftalık kontrol — 2026-10-20

- Sonuç penceresi: 2026-10-17 → 2026-10-19 (Europe/Istanbul, start_date'e göre)
- Sorgu: pencere + `NOT (title ~ '[0-9] - [0-9]')`, status = published. Lig Kupası ve Türkiye Kupası dönmedi.

## Skorsuz maçlar (2 satır)

1. Trabzonspor - Beşiktaş — 2026-10-19 20:00 (besiktas, trabzonspor)
2. Tottenham - Coventry — 2026-10-19 22:00 (premier-lig)

## Kaynak erişimi

- skysports.com — erişildi (Tottenham 3-1, goller ve dakikalar)
- flashscore.com — açıldı, sayfa kesildi, maç verisi okunamadı
- site.api.espn.com — HTTP 403
- sofascore.com API — HTTP 403 (haber sayfası da 403)
- fotmob.com API — HTTP 404; takım sayfası maç verisi içermedi
- flashscore.com.tr — HTTP 404
- Türk haber siteleri ve aa.com.tr, beinsports.com — alan adı çözümlenemedi (doğrudan açılamadı)
- Web araması: Trabzonspor-Beşiktaş için hurriyet, AA, beIN, TRT, milliyet, cumhuriyet; Tottenham-Coventry için sofascore, skysports, vavel, allfootballapp sonuçları aynı skor ve gol dakikalarını verdi

## Güncellenen

- Tottenham 3 - 1 Coventry (Maddison 14', Marmoush 58', Davies 90+6' / Rudoni 49')
- Trabzonspor 2 - 0 Beşiktaş (Tufan 21', Salah 71')

## Migrations

- `20261020020000_update_tottenham_coventry_result.sql` — Tottenham 3 - 1 Coventry sonucu ve goller
- `20261020020001_update_trabzonspor_besiktas_result.sql` — Trabzonspor 2 - 0 Beşiktaş sonucu ve goller

İkisi de `apply_migration` ile Takvim'e uygulandı; doğrulama SELECT'i skorlu başlıkları döndürdü.

## Atlanan / doğrulanamayan

- Yok. Hâlâ skorsuz kalan maç: **0**.

## Notlar

- Trabzonspor-Beşiktaş sayfaları doğrudan açılamadı; skor ve dakikalar birden fazla kaynağın arama özetinde tutarlıydı. Salah adı kaynaklarda "Muhammed/Mohamed" diye değişiyor; veritabanındaki mevcut kayıtlarla (Mohamed Salah) uyumlu yazıldı.
- Fikstür penceresi (bugün → +14) bu koşuda taranmadı; yeni maç eklenmedi.
