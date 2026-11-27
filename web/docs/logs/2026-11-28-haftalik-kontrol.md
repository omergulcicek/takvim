# Haftalık Kontrol — 2026-11-28

Koşu 02:04 TR. Dal: `claude/dazzling-babbage-dmfkb7` (platformun atadığı dal). Pencere: 2026-11-28 → 2026-12-12.

## Adım 1 — Sonuçlar

Sorgu sonucu: **1** skorsuz maç.

| Maç                          | Başlangıç (TR)   |
| ---------------------------- | ---------------- |
| Nottingham Forest - Chelsea  | 2026-11-27 23:00 |

- Güncellendi: **Nottingham Forest 3 - 2 Chelsea**. Skor/FT ESPN ve FotMob'da aynı; gol dakikaları iki kaynakta aynı. Kırmızı kart yok. Emegha adı ESPN'de "Emmanuel", FotMob'da "Emanuel"; DB'deki mevcut yazım (Emanuel Emegha) kullanıldı.
- Atlanan: yok. Uygulama sonrası aynı sorgu 0 satır.

## Adım 2 — Fikstür

Kontrol: ESPN'de eng.1, esp.1, tur.1, ita.1, uefa.champions, uefa.europa, uefa.nations, fifa.friendly, fifa.worldq.uefa için 28 Kas–12 Ara günlük taraması (yaklaşık 170 maç) ve DB penceresiyle karşılaştırma. Millî takımlar sekizi için kontrol edildi (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya): resmî maç yok; Ukrayna - İngiltere (5 Ara) hazırlık olduğu için kapsam dışı, eklenmedi.

Eklenen (4, ESPN + FotMob saatleri aynı):
- Liverpool - Leeds United — 12 Ara 18:00 (premier-lig)
- Eyüpspor - Galatasaray — 12 Ara 19:00 (galatasaray)
- Manchester City - Chelsea — 12 Ara 20:30 (premier-lig)
- Málaga - Barcelona — 12 Ara 20:30 (la-liga)

Eklenmeyenler: kapsam dışı takımlar (Atlético - PSV, Juventus - Hapoel vb.).

**UYARI — mükerrer kayıt:** `Eyüpspor - Galatasaray` için DB'de zaten 2026-12-13 12:00 placeholder kaydı varmış (ilk sorgu penceresi 12-13 02:00'a kadar olduğundan görülmedi). İki kaynağa göre doğru tarih 12 Ara 19:00; yeni eklenen kayıt doğru, eski 12-13 12:00 kaydı mükerrer. Silme yasak olduğu için dokunulmadı; elle silinmesi gerekir.

## Adım 3 — Saatler

Sorgu çalıştı: pencerede 12:00 placeholder **0**. Netleşen/netleşmeyen/uyarı yok. (Pencere dışındaki 13 Ara placeholder yukarıda.)

## Kaynaklar

| Kaynak            | Durum                         |
| ----------------- | ----------------------------- |
| site.api.espn.com | Erişildi (--compressed gerekli) |
| fotmob.com        | Erişildi                      |
| livescore.com     | 404                           |
| bbc.co.uk         | 404                           |

## Migration

- `20261128020500_update_nottingham_forest_chelsea_sonuc.sql` — Nottingham Forest 3 - 2 Chelsea sonucu ve goller.
- `20261128020600_add_fikstur_12_aralik.sql` — 12 Aralık'ın dört maçı eklendi.
- Adım 3 için dosya yok. İkisi de `apply_migration` ile uygulandı.

## Kalan iş

- Skorsuz maç: yok. Pencere içinde placeholder saat: yok.
- Mükerrer `Eyüpspor - Galatasaray` (2026-12-13 12:00) elle silinmeli.
