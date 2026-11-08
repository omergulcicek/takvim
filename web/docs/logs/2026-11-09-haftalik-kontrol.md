# Haftalık kontrol — 2026-11-09 (BUGUN)

Koşu: 02:00 TR. Dal: `claude/dazzling-babbage-cori4q` (platformun atadığı dal). Pencere: 2026-11-09 → 2026-11-23.

## Adım 1 — Sonuçlar

Sorgu çalıştı: **7 skorsuz maç** bulundu. Hepsi ESPN + FotMob'da FT ve skor aynı; goller/kartlar iki kaynakta tutarlı. 7'si güncellendi, atlanan yok.

| Maç | Skor |
| --- | --- |
| Çorum FK - Fenerbahçe | 0 - 5 |
| Sunderland - Chelsea | 1 - 0 |
| Crystal Palace - Liverpool | 1 - 3 |
| Alanyaspor - Trabzonspor | 0 - 2 |
| Manchester United - Aston Villa | 4 - 4 |
| Beşiktaş - Gençlerbirliği | 3 - 0 (Metehan Baltacı 22' kırmızı kart; kart ve oyuncu adı iki kaynakta aynı) |
| Atlético Madrid - Barcelona | 1 - 2 |

Kart doğrulanamadı satırı yok.

## Adım 2 — Fikstür

Kontrol: Süper Lig (4 kulüp), Premier Lig (6 kulüp), La Liga (Barcelona, Real Madrid), Serie A (5 kulüp arası), Şampiyonlar Ligi/Avrupa Ligi (pencerede maç yok) ve **sekiz millî takım** (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya). Pencerede kapsam içi 24 maç kontrol edildi (Uluslar Ligi 10, kulüp 14); Arjantin ve Brezilya'nın yalnızca hazırlık maçı var, kapsam dışı (hazırlık yalnızca Türkiye).

- Eklenen: **Tottenham - Ipswich** (21 Kas 18:00 TR, `premier-lig`; ESPN + FotMob saat aynı).
- Eklenmeyen: Serie A maçlarının hiçbirinde iki taraf birden kapsamda değil; Brentford - Everton vb. kapsam dışı.

## Adım 3 — Saatler

Sorgu çalıştı: pencerede 12:00 placeholder sayısı **0**. Netleşen/netleşmeyen yok, 72 saat uyarısı yok.

## Kaynaklar

- site.api.espn.com: erişildi
- fotmob.com: erişildi (`/api/data/matches` ve maç sayfaları; `/api/matches` 404)
- flashscore.com.tr, livescore.com, bbc.co.uk, tff.org, skysports.com: erişildi (kullanılmadı)

## Migration

- `20261109020000_update_hafta_sonu_sonuclari_20261108.sql` — 8 Kasım'daki 7 maçın skor ve gol güncellemesi (uygulandı).
- `20261109020100_add_fikstur_tottenham_ipswich.sql` — Tottenham - Ipswich maçı eklendi (uygulandı).
- Adım 3 için migration yok (iş çıkmadı).

## Kalan iş

- Skorsuz geçmiş maç: 0 (doğrulama sorgusuyla kontrol edildi).
- Pencere içinde placeholder saat: 0.
