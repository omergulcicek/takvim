# Haftalık kontrol — 2026-11-23 (Koşu 02:05 TR)

Dal: `claude/dazzling-babbage-bsjm1u` (platform atadı)

## Adım 1 — Sonuçlar

Sorgu çalıştı: 1 skorsuz maç.

- Liverpool - Manchester United (22.11.2026 19:30 TR) → **Liverpool 4 - 0 Manchester United**. FT ve skor iki kaynakta aynı (ESPN API, Sky Sports sonuç sayfası). Goller (ESPN): Szoboszlai 10', Wirtz 13', Ngumoha 66', Muñoz 82'.
- **Kart doğrulanamadı:** ESPN'e göre Leny Yoro 8' kırmızı kart; ikinci kaynakta doğrulanamadı, kart satırı yazılmadı.
- Atlanan: yok.

## Adım 2 — Fikstür

Pencere 2026-11-23 → 2026-12-07. ESPN günlük fikstürü ile (PL, La Liga, Süper Lig, Serie A, Şampiyonlar Ligi, Avrupa Ligi) Takvim'deki 39 maç karşılaştırıldı; saatler eşleşiyor. **Pencerede eksik maç yok.**

- Millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya kontrol edildi (ESPN fifa.friendly, uefa.nations, fifa.worldq.uefa); pencerede maç yok (milli ara yok).
- Kapsam dışı bırakılanlar: kategorideki takımların oynamadığı maçlar (ör. Elche - Atlético Madrid, Atlético Madrid - Real Betis, Brentford - Everton, Serie A'da iki tarafı da büyük olmayan maçlar).

## Adım 3 — Saatler

Sorgu çalıştı: pencerede 12:00 placeholder sayısı **0**. Uyarı yok.

## Kaynaklar

- site.api.espn.com: erişildi
- skysports.com: sonuç sayfası erişildi (rapor sayfası 404)
- fotmob.com: sayfa içeriği boş döndü (API ile denenmedi)
- bbc.co.uk: erişilemedi (araç engeli)
- espn.com maç sayfası: içerik alınamadı

## Migration

- `20261123020500_update_premier_lig_sonuclari_20261122.sql` — Liverpool 4 - 0 Manchester United sonucu ve golleri. `apply_migration` ile uygulandı.

## Kalan iş

- Skorsuz maç: yok (Yoro kırmızı kartı ikinci kaynakla doğrulanırsa eklenebilir).
- Pencere içinde placeholder saat: yok.
