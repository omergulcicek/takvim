# Haftalık kontrol — 2026-11-03

Dal: `claude/dazzling-babbage-x7uwwk` (platform atadı). Pencere: 2026-11-03 → 2026-11-17.

## Adım 1 — Sonuçlar

Sorgu çalıştırıldı (alt sınırsız, `start_date + 3 saat < now()`): **0 satır**. Skorsuz geçmiş maç yok. Güncelleme yapılmadı.

## Adım 2 — Fikstür

Sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) ve kapsamdaki kulüpler kontrol edildi. ESPN'de pencere için Süper Lig, Premier Lig, La Liga, Serie A, Bundesliga, Ligue 1, Şampiyonlar Ligi, Avrupa Ligi, Uluslar Ligi ve hazırlık maçları günlük taranıp Takvim ile karşılaştırıldı (~35 kapsam içi maç eşleştirildi).

Eklenen (1):

- Galler - Portekiz — 2026-11-17 22:45 TR, Uluslar Ligi 6. hafta, `milli-takimlar`. Kaynaklar: ESPN, FotMob, BBC (üçünde de 19:45 UTC).

Eklenmeyen: Arjantin ve Brezilya hazırlık maçları (hazırlık yalnızca Türkiye için eklenir); kapsam dışı takım maçları. Diğer tüm kapsam içi maçlar Takvim'de zaten vardı, tarih/saatleri kaynaklarla uyumlu.

## Adım 3 — Saatler

Sorgu çalıştırıldı (pencere, gelecek, 12:00 TR): **0 satır**. Placeholder saat yok; 72 saat uyarısı yok.

## Kaynaklar

| Kaynak            | Durum                                        |
| ----------------- | -------------------------------------------- |
| site.api.espn.com | Erişildi (tarih aralığı parametresi 400, günlük sorgu çalıştı) |
| fotmob.com        | Erişildi (`/api/data/matches`)               |
| bbc.co.uk         | Erişildi                                     |
| flashscore.com    | Erişildi (ana sayfa; takım sayfası 404)      |
| livescore.com     | 301                                          |

## Migration

- `20261103020000_add_fikstur_penceresi_20261103.sql` — Galler - Portekiz maçı eklendi. `apply_migration` ile uygulandı.

## Kalan iş

Skorsuz maç: yok. Pencere içinde placeholder saat: yok.
