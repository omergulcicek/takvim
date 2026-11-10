# 2026-11-11 Haftalık Kontrol

Koşu 02:04 TR · BUGUN = 2026-11-11 · Pencere: 2026-11-11 → 2026-11-25 · Dal: `claude/dazzling-babbage-tonczu` (platform atadı)

## Adım 1 — Sonuçlar

Sorgu çalıştırıldı: skorsuz geçmiş maç sayısı **0**. Güncellenen yok, atlanan yok.

## Adım 2 — Fikstür

Pencerede Takvim'de **26** maç kontrol edildi (Millî Takımlar 10, Premier Lig 6, La Liga 2, Süper Lig 3, UEFA ŞL 4 ve benzeri). Sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kapsamda tutuldu.

Eklenen maç: **yok.** Eksik maç **doğrulanamadı**: kaynaklar erişilemedi veya yeterli değildi (aşağıya bakın). Tahmin yapılmadı, uydurma maç eklenmedi. Arjantin ve Brezilya için pencerede kayıt yok; kaynaktan teyit edilemedi.

## Adım 3 — Saatler

Sorgu çalıştırıldı: penceredeki 12:00 placeholder sayısı **0**. 72 saat uyarısı yok.

## Kaynaklar

| Kaynak | Durum |
| --- | --- |
| site.api.espn.com | HTTP 400 (curl), 403 (WebFetch) |
| fotmob.com (API) | 404 |
| flashscore.com | ana sayfa 200, fikstür verisi alınamadı |
| Web araması (haber) | Süper Lig 11. hafta bilgisi var, pencerenin tamamını doğrulayacak veri yok |

## Migration

Yok. Üç adımın hiçbiri değişiklik çıkarmadı.

## Kalan iş

- Skorsuz geçmiş maç: 0
- Pencere içinde placeholder saat: 0
- Pencere fikstürünün tam doğrulaması kaynak erişimi nedeniyle yapılamadı.
