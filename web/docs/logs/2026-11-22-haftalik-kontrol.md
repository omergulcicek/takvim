# Haftalık Kontrol — 2026-11-22

Koşu: 02:06 TR (BUGUN = 2026-11-22, pencere 2026-11-22 → 2026-12-06). Dal: `claude/dazzling-babbage-4htajn`.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **7**

| Maç                          | Başlangıç (TR)   |
| ---------------------------- | ---------------- |
| Manchester City - Fulham     | 2026-11-21 15:30 |
| Galatasaray - Samsunspor     | 2026-11-21 16:00 |
| Chelsea - Leeds United       | 2026-11-21 18:00 |
| Tottenham - Ipswich          | 2026-11-21 18:00 |
| Kocaelispor - Fenerbahçe     | 2026-11-21 19:00 |
| Newcastle United - Arsenal   | 2026-11-21 20:30 |
| Real Madrid - Celta Vigo     | 2026-11-21 23:00 |

- Güncellenen: **0**
- Atlanan: **7** — skor yalnızca ESPN'de (`site.api.espn.com`) bulundu (FT durumu); ikinci bir kaynakta skor doğrulanamadı. Flashscore, FotMob, ESPN web, LiveScore sayfaları skor içermeden döndü; BBC engelli, fanatik.com.tr alan adı çözümlenemedi, skysports 404. Doğrulama kuralı gereği (iki kaynak) skor yazılmadı, uydurulmadı.
- ESPN'in bildirdiği ham skorlar (yazılmadı, yalnızca kayıt): Man City 1-1 Fulham, Galatasaray 2-1 Samsunspor, Chelsea 1-4 Leeds, Tottenham 2-0 Ipswich, Kocaelispor 2-2 Fenerbahçe, Newcastle 2-2 Arsenal, Real Madrid 2-1 Celta Vigo.
- Kart doğrulanamadı: yok (ESPN'de kırmızı kart olayı görülmedi).

## Adım 2 — Fikstür

Kontrol edilen: ESPN'de 22 Kas – 6 Ara için Premier Lig, La Liga, Serie A, Süper Lig, Şampiyonlar Ligi, Avrupa Ligi, hazırlık ve Uluslar Ligi; Takvim'deki 49 maçla karşılaştırıldı. Millî takımlar sekiz takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) için kontrol edildi: pencerede kapsam içi millî maç yok (ESPN'deki Ukrayna - İngiltere hazırlığı yalnızca Türkiye kuralı gereği eklenmedi).

Eklenen (2):

- Tottenham - Arsenal — 2026-12-06 19:30 TR (Premier Lig). Saat: ESPN 16:30Z + web araması 16:30 UK.
- Athletic Club - Real Madrid — 2026-12-06 18:15 TR (La Liga). Saat: ESPN 15:15Z + realmadrid.com duyurusu 16:15 CET.

Eklenmeyen: Serie A maçları (iki taraf da Inter/Juventus/Milan/Napoli/Roma değil), kapsam dışı takımların maçları, Avrupa Ligi'nde kapsam dışı kulüpler. CSKA Sofya - Trabzonspor ESPN'de listelenmeyen bir turnuvada; Takvim'de zaten var.

## Adım 3 — Saatler

Sorgu (`start_date > now() AND start_date < now() + interval '14 days'` ve 12:00 TR): **0 satır**. Netleşen: yok. Uyarı (72 saat içinde): yok.

Not: Pencere sonundaki (6 Ara) iki maç `now() + 14 gün` sınırının hemen dışında kalıyor ve hâlâ 12:00 placeholder: Beşiktaş - Samsunspor, Trabzonspor - Çorum FK. ESPN tek kaynak olarak 16:00 / 19:00 TR gösteriyor; ikinci kaynak yok, güncellenmedi.

## Kaynaklar

| Kaynak                 | Durum                                              |
| ---------------------- | -------------------------------------------------- |
| site.api.espn.com      | Erişildi (WebFetch 403, curl ile 200)              |
| fotmob.com             | Sayfa erişildi, skor yok                           |
| flashscore.com / .tr   | Erişildi, skor çıkarılamadı                        |
| livescore.com, espn.com| Erişildi, skor yok                                 |
| bbc.co.uk              | Engelli                                            |
| skysports.com          | 404                                                |
| fanatik.com.tr         | Alan adı çözümlenemedi (ağ izni gerekli)           |
| realmadrid.com         | Arama sonucunda erişildi (saat teyidi)             |

## Migration

- `20261122022000_add_fikstur_penceresi_20261122.sql` — 6 Aralık için iki maç eklendi (`apply_migration` ile uygulandı, doğrulandı).
- Sonuç ve saat migration'ı oluşturulmadı (iş çıkmadı).

## Kalan iş

- Skorsuz 7 maç (yukarıdaki liste): ikinci kaynak bulunduğunda güncellenecek.
- Pencere sınırında placeholder saatli 2 maç (6 Ara).
