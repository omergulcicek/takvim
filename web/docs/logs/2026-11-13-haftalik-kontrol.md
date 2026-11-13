# Haftalık Kontrol — 2026-11-13

Koşu 02:04 TR. Dal: `claude/dazzling-babbage-a0t3rt` (platformun atadığı dal).

## Adım 1 — Sonuçlar

Sorgu çalıştı. Skorsuz maç sayısı: **4**

| Maç                | Başlangıç (TR)   | Sonuç                                                                                                      |
| ------------------ | ---------------- | ---------------------------------------------------------------------------------------------------------- |
| Türkiye - Belçika  | 2026-11-12 20:00 | Güncellendi: 1 - 2 (ESPN + FotMob)                                                                         |
| Çekya - İspanya    | 2026-11-12 22:45 | **Atlandı**: skor 0 - 2 iki kaynakta aynı, ancak kırmızı kart dakikası çelişiyor (ESPN 72', FotMob 69')     |
| İngiltere - Hırvatistan | 2026-11-12 22:45 | Güncellendi: 2 - 1 (ESPN + FotMob)                                                                    |
| İtalya - Fransa    | 2026-11-12 22:45 | Güncellendi: 3 - 1 (ESPN + FotMob)                                                                         |

- Çekya - İspanya: Ladislav Krejcí kırmızı kartı iki kaynakta da var (oyuncu adı aynı) ancak dakika 3 dk farklı; uydurma yapılmadı, maç atlandı. Skor/goller (Baena 39' pen., Pubill 90+6') ESPN ve FotMob'da uyumlu; kart dakikası netleşince yazılabilir.
- Kart doğrulanamadı satırı: Çekya - İspanya, Krejcí, dakika uyuşmazlığı.
- Gol dakikaları ESPN/FotMob arasında tüm yazılan maçlarda ≤1 dk.

## Adım 2 — Fikstür

Pencere 2026-11-13 → 2026-11-27. Kontrol edilen kapsam: sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) + Süper Lig dörtlüsü, Premier Lig, La Liga, Şampiyonlar Ligi, Avrupa Ligi, Serie A. Pencere içindeki 30 maç DB'de, ESPN fikstürü (uefa.nations, fifa.friendly, uefa.champions, uefa.europa, eng.1, esp.1, tur.1, ita.1) ile karşılaştırıldı.

- **Eklenen:** Nottingham Forest - Chelsea, 2026-11-27 23:00 TR (ESPN ve FotMob 20:00Z), `premier-lig`.
- Eklenmeyen: Uruguay - Arjantin, Kosta Rika - Arjantin, Brezilya - Japonya, Brezilya - Singapur (hazırlık, yalnızca Türkiye için eklenir); Getafe - Atlético Madrid, Atlético Madrid - Viking (kapsam dışı takım, UCL'de Atlético yalnız rakip kategorisi üzerinden eklenir); diğer lig maçları kapsam dışı kulüpler.
- Millî takım maçları (Sırbistan-Almanya, Portekiz-Danimarka, Fransa-Türkiye, İspanya-İngiltere, Almanya-Hollanda, Galler-Portekiz) DB'de mevcut.

## Adım 3 — Saatler

Sorgu çalıştı. 12:00 placeholder sayısı: **0**. Netleşen / netleşmeyen / uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                      |
| ----------------- | ------------------------------------------ |
| site.api.espn.com | Erişildi (skor, olay, fikstür)             |
| fotmob.com        | Erişildi (api/data/matches, matchDetails)  |
| bbc.co.uk         | Erişildi (yalnızca sayfa açıldı)           |
| livescore.com     | Erişildi (kullanılmadı)                    |
| flashscore.com    | Erişildi (JS gerekli, kullanılmadı)        |
| skysports.com     | 404                                        |

## Migration

- `20261112230700_update_milli_takimlar_12_kasim_sonuclari.sql` — Türkiye-Belçika, İngiltere-Hırvatistan, İtalya-Fransa sonuçları. Uygulandı.
- `20261112230701_add_premier_lig_forest_chelsea.sql` — Nottingham Forest - Chelsea eklendi. Uygulandı.
- Saat migration'ı: yok (Adım 3 iş çıkarmadı).

## Kalan iş

- Skorsuz maç: Çekya - İspanya (kart dakikası çelişkisi).
- Pencere içinde placeholder saat: yok.

## Sonuç

KISMİ — üç adım çalıştı; Çekya - İspanya skorsuz kaldı.

## Ek — Çekya - İspanya (kullanıcı talimatı)

Kaynak çelişkisinde FotMob önceliklidir kararı runbook'a eklendi. Krejcí kırmızı kartı FotMob'a göre 69' olarak yazıldı.
- Migration dosyası: `20261113080000_update_cekya_ispanya_sonuc.sql` — **henüz `apply_migration` ile uygulanmadı**: Supabase MCP bağlantısı koptu (CONNECT_TIMEOUT). Bir sonraki koşuda veya bağlantı gelince uygulanmalı; migration idempotent.
