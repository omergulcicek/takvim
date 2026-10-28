# Haftalık Kontrol — 2026-10-28

## Geçmişteki skorsuz maçlar (sorgu başlangıcı)

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **1**

| Maç                       | Başlangıç (TR)   |
| ------------------------- | ---------------- |
| Ç. Rizespor - Trabzonspor | 2026-10-26 19:00 |

## Kaynak erişimi

| Kaynak            | Durum                                                  |
| ----------------- | ------------------------------------------------------ |
| site.api.espn.com | Erişildi: 3 - 4, goller ve dakikalar                   |
| flashscore.com    | Erişildi: sonuç listesi, 3 - 4 (gol dakikası yok)      |
| fotmob.com        | Erişildi: maç sayfası, 3 - 4, goller ve dakikalar      |
| sofascore.com     | 403                                                    |
| skysports.com     | Maç sayfası bulunamadı (404), takım sayfasında maç yok |

## Güncellenen

- Ç. Rizespor 3 - 4 Trabzonspor — skor ESPN, Flashscore ve FotMob'da aynı. Gol dakikaları ESPN ile FotMob arasında en fazla 1 dakika farklı (Şimşir 51/50, Laçi 68/69); ESPN dakikaları yazıldı. Rizespor'un 89' kırmızı kartında oyuncu adı kaynaklarda yok, yazılmadı.
- Migration: `20261028000000_update_rizespor_trabzonspor_sonuc.sql` — Rizespor - Trabzonspor sonucu ve goller. `apply_migration` ile uygulandı.

## Atlanan / doğrulanamayan

Yok.

## Hâlâ skorsuz kalan maç

Yok. Uygulama sonrası aynı sorgu 0 satır döndü.

## Fikstür penceresi

Bu koşuda kontrol kapsamı geçmiş sonuçlarla sınırlıydı; yeni maç eklenmedi.

## Koşu 02:05 TR

Dal: `claude/dazzling-babbage-jdgf6w`. Üç adımın üçü de kendi sorgusuyla çalıştırıldı.

### Adım 1 — Sonuçlar

- Sorgu: skorsuz ve `start_date + 3 saat < now()` maçlar → **0 satır**.
- Güncellenen: yok. Atlanan: yok.

### Adım 2 — Fikstür

- Pencere: 2026-10-28 → 2026-11-11. DB'de pencerede 37 maç var (30 Ekim - 8 Kasım).
- ESPN tarama kapsamı: Süper Lig, Premier Lig, La Liga, Serie A, Şampiyonlar Ligi, Avrupa Ligi, hazırlık maçları (günlük sorgu, 28 Ekim - 11 Kasım).
- Millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya sekizi de kontrol edildi. Pencerede bu takımlardan hiçbirinin maçı yok (tek hazırlık maçı Çin Taipei - Vietnam, kapsam dışı).
- Kapsam içi tüm maçlar Takvim'de mevcut, saatler ESPN ile uyumlu. 9 - 11 Kasım için hiçbir ligde maç yok.
- Eklenen: yok. Pencerede eksik maç yok.
- Not: eşleşme yalnızca ESPN'e dayanıyor. Eklenecek maç olmadığı için iki kaynak şartı devreye girmedi.

### Adım 3 — Saatler

- Sorgu: pencerede gelecekteki `12:00` placeholder maçlar → **0 satır**. Uyarı yok.

### Kaynaklar

| Kaynak            | Durum                                       |
| ----------------- | ------------------------------------------- |
| site.api.espn.com | Erişildi (tarih aralığı sorgusu 400, günlük sorgu çalıştı) |
| fotmob.com        | Yalnızca HTML döndü, veri alınamadı         |

### Migration

Yok. Bu koşuda üç adım da iş çıkarmadı.

### Kalan iş

Skorsuz maç yok. Pencere içinde placeholder saat yok.
