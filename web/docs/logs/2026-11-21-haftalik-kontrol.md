# Haftalık Kontrol — 2026-11-21

Koşu: 02:03 TR. Pencere: 2026-11-21 → 2026-12-05. Dal: `claude/dazzling-babbage-5rs8vy` (platform atadı).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **0**. Güncellenen yok, atlanan yok.

## Adım 2 — Fikstür

Pencerede DB'de 39 maç vardı; ESPN (eng.1, esp.1, tur.1, uefa.champions, uefa.europa, uefa.nations, fifa.friendly, fifa.worldq.uefa/conmebol) 15 gün tek tek tarandı, 5 Aralık FotMob ile doğrulandı. Millî takımlar (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) için resmî turnuva/eleme maçı çıkmadı.

Eklenen (ESPN + FotMob aynı saat, 5 Aralık, DB'de yoktu):

- Chelsea - Liverpool — 15:30 (`premier-lig`)
- Manchester United - Coventry City — 18:00 (`premier-lig`)
- Brentford - Manchester City — 23:00 (`premier-lig`)
- Barcelona - Celta Vigo — 23:00 (`la-liga`)

Eklenmeyen: Ukrayna - İngiltere (5 Aralık, hazırlık; yalnızca Türkiye hazırlıkları eklenir). Kapsam dışı takım maçları (ör. Sunderland - Aston Villa, Atlético - Getafe) eklenmedi.

## Adım 3 — Saatler

Placeholder sorgusu (gelecek, 14 gün, 12:00 TR): **0 satır**. Uyarı yok.

Ek bulgu: DB'deki `Başakşehir - Fenerbahçe` 2026-12-06 12:00 placeholder'ıydı; ESPN ve FotMob ikisi de 2026-12-05 19:00 TR gösteriyor, güncellendi.

## Kaynaklar

| Kaynak             | Durum                                         |
| ------------------ | --------------------------------------------- |
| site.api.espn.com  | Erişildi (`--compressed` gerekiyor)           |
| fotmob.com         | Erişildi (`/api/data/matches`)                |
| ESPN uefa.* / nations / worldq | Erişildi, pencerede ilgili maç yok |
| WebFetch ile ESPN  | 403                                           |

## Migration

- `20261121020500_add_fikstur_5_aralik_premier_la_liga.sql` — 4 maç eklendi.
- `20261121020600_update_saat_basaksehir_fenerbahce.sql` — Başakşehir - Fenerbahçe tarih/saat kesinleşti.

İkisi de `apply_migration` ile uygulandı, SELECT ile doğrulandı.

## Kalan iş

Skorsuz maç yok. Pencere içinde placeholder saat yok. Pencere dışı: Beşiktaş - Samsunspor ve Trabzonspor - Çorum FK 6 Aralık 12:00 placeholder (FotMob: 16:00 ve 19:00 TR; tek kaynak, pencere dışı, bir sonraki koşuda ikinci kaynakla doğrulanacak).
