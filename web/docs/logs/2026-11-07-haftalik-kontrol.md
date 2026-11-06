# Haftalık Kontrol — 2026-11-07

Koşu 02:04 TR. Dal: `claude/dazzling-babbage-83d4in` (platform atadı). Pencere: 2026-11-07 → 2026-11-21.

## Adım 1 — Sonuçlar

Sorgu çalıştırıldı (skorsuz, başlığı `A - B` biçiminde, başlangıç + 3 saat < now, alt sınır yok). Sonuç: **0 satır**. Güncellenen yok, atlanan yok.

## Adım 2 — Fikstür

Sorgu çalıştırıldı: pencerede Takvim'de 21 maç var (12 kulüp maçı 7–8 Kasım, 12 millî maç 12–17 Kasım; toplam 21 kayıt kontrol edildi). Sekiz millî takım kontrol edildi (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya):

- İspanya: Çekya - İspanya (12), İspanya - İngiltere (15) — Takvim'de var
- Fransa: İtalya - Fransa (12), Fransa - Türkiye (15) — var
- İngiltere: İngiltere - Hırvatistan (12) — var
- Portekiz: Portekiz - Danimarka (14), Galler - Portekiz (17) — var
- Almanya: Sırbistan - Almanya (13), Almanya - Hollanda (16) — var
- Türkiye: Türkiye - Belçika (12, 20:00 TR, birden çok kaynakla doğrulandı), Fransa - Türkiye (15) — var
- Arjantin, Brezilya: pencerede yalnızca hazırlık maçı bulundu (Arjantin: Uruguay, Kosta Rika haberleri; Brezilya: tek kaynak) — kural gereği hazırlık yalnızca Türkiye için eklenir, eklenmedi
- 18–21 Kasım: Uluslar Ligi maçı yok (lig aşaması 17 Kasım'da bitiyor)

Eklenen maç: yok. **Pencerede eksik maç yok.**

Not: bazı kaynaklar bazı millî maçlar için 1 gün farklı tarih veriyor (örn. 12 vs 13 Kasım, Fransa - Türkiye 15 vs 16). İki kaynakta teyit edilemediği için mevcut kayıtlara dokunulmadı; takip edilecek.

## Adım 3 — Saatler

Sorgu çalıştırıldı (gelecek, 14 gün içi, 12:00 TR). Placeholder sayısı: **0**. Netleşen yok, uyarı yok.

## Kaynaklar

- site.api.espn.com: 403 (WebFetch), curl 400
- fotmob.com: 404 (API yolu)
- flashscore.com, uefa.com: 200 ama içerik JS ile yüklenir, fikstür okunamadı
- livescore.com: 301
- Web aramaları (UEFA/Sky Sports/haber siteleri): erişildi

## Migration

Yok. Üç adımın üçü de iş çıkarmadı.

## Kalan iş

- Skorsuz maç: yok
- Pencere içi placeholder saat: yok
- 12–17 Kasım millî maç tarihleri için kaynaklar arası 1 günlük çelişki; resmî UEFA listesinden teyit edilmeli
