# Weekly fixture sync — 2026-10-18

- Pencere: 2026-10-18 → 2026-11-01 (+14d)
- Sonuç kontrolü: 2026-10-15 → 2026-10-17

## Kaynaklar

- ESPN scoreboard API (skor, gol dakikaları, fikstür saatleri)
- FotMob (skor, fikstür saatleri)
- BBC Sport (skor, yalnızca 17 Eki sonuçları)

Erişilemeyen kaynak: yok. Web araması 17 Eki 2026 maçları için sonuç döndürmedi, kullanılmadı.

## Migrations

- `20261018020000_update_everton_chelsea_result.sql` — Everton 0 - 2 Chelsea sonucu
- `20261018020001_update_genclerbirligi_galatasaray_result.sql` — Gençlerbirliği 0 - 1 Galatasaray sonucu
- `20261018020002_update_brentford_liverpool_result.sql` — Brentford 1 - 2 Liverpool sonucu
- `20261018020003_update_manchester_city_ipswich_result.sql` — Manchester City 3 - 2 Ipswich sonucu
- `20261018020004_update_fenerbahce_alanyaspor_result.sql` — Fenerbahçe 3 - 0 Alanyaspor sonucu
- `20261018020005_update_real_betis_barcelona_result.sql` — Real Betis 2 - 5 Barcelona sonucu
- `20261018020006_update_nov1_kickoffs.sql` — Kasımpaşa - Beşiktaş 19:00 ve Trabzonspor - Gaziantep FK 16:00 saatleri
- `20261018020007_add_nov1_league_fixtures.sql` — Liverpool - Arsenal, Racing Santander - Real Madrid, Juventus - Napoli eklendi

## Skipped

- 15-16 Eki sonuçları zaten Takvim'de skorlu; değişiklik yok
- Gol dakikaları tek kaynaktan (ESPN) alındı; skorlar üç kaynakta (ESPN, FotMob, BBC) aynı

## Notes

- Eklenen **3**, güncellenen **8** (6 sonuç + 2 saat), atlanan **0**
- Kaynak erişimi önceki çalıştırmada başarısızdı; bu çalıştırmada sorunsuz

## Akşam kontrolü (2. çalıştırma)

- Pencere: 2026-10-18 → 2026-11-01; sonuç kontrolü: 2026-10-15 → 2026-10-17 + bugünkü maçlar
- Kaynaklar: ESPN scoreboard API — erişilemedi (HTTP 403); web araması (Leeds United - Manchester United 18 Eki 2026) — sonuç bulunamadı
- Migrations: Yok.
- Atlanan: Leeds United - Manchester United, Nottingham Forest - Arsenal, Real Madrid - Sevilla (18 Eki) — skor en az iki kaynakta doğrulanamadı, kaynak erişilemedi
- 17 Eki sonuçları ve 1 Kasım fikstürü Takvim'de zaten güncel; değişiklik yok
