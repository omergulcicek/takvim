# Haftalık Kontrol — 2026-10-28

## Geçmişteki skorsuz maçlar (sorgu başlangıcı)

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **1**

| Maç | Başlangıç (TR) |
| --- | --- |
| Ç. Rizespor - Trabzonspor | 2026-10-26 19:00 |

## Kaynak erişimi

| Kaynak | Durum |
| --- | --- |
| site.api.espn.com | Erişildi: 3 - 4, goller ve dakikalar |
| flashscore.com | Erişildi: sonuç listesi, 3 - 4 (gol dakikası yok) |
| fotmob.com | Erişildi: maç sayfası, 3 - 4, goller ve dakikalar |
| sofascore.com | 403 |
| skysports.com | Maç sayfası bulunamadı (404), takım sayfasında maç yok |

## Güncellenen

- Ç. Rizespor 3 - 4 Trabzonspor — skor ESPN, Flashscore ve FotMob'da aynı. Gol dakikaları ESPN ile FotMob arasında en fazla 1 dakika farklı (Şimşir 51/50, Laçi 68/69); ESPN dakikaları yazıldı. Rizespor'un 89' kırmızı kartında oyuncu adı kaynaklarda yok, yazılmadı.
- Migration: `20261028000000_update_rizespor_trabzonspor_sonuc.sql` — Rizespor - Trabzonspor sonucu ve goller. `apply_migration` ile uygulandı.

## Atlanan / doğrulanamayan

Yok.

## Hâlâ skorsuz kalan maç

Yok. Uygulama sonrası aynı sorgu 0 satır döndü.

## Fikstür penceresi

Bu koşuda kontrol kapsamı geçmiş sonuçlarla sınırlıydı; yeni maç eklenmedi.
