# Weekly fixture sync — 2026-08-29

## Run 15:03 TR

- Invoked: 2026-08-29 15:03 (`Europe/Istanbul`)
- Scope: Oynanan maçlarda skoru girilmemiş eventler
- Categories: premier-lig

## Sources

- https://www.espn.com/soccer/match/_/gameId/401879294/manchester-city-crystal-palace — Crystal Palace 1-4 Man City **FT**; Haaland 17', 84'; Cherki 54', 59'; Donnarumma 56' (kk)
- https://www.theguardian.com/football/match/2026/aug/28/crystalpalace-v-manchestercity — aynı skor teyit
- https://www.espn.com/soccer/match/_/gameId/401879314/nottingham-forest-liverpool — Liverpool–Forest **32'** canlı (0-1); FT değil

## Events checked

| Event                            | Kickoff (DB)     | Status          | Action                |
| -------------------------------- | ---------------- | --------------- | --------------------- |
| Crystal Palace - Manchester City | 2026-08-28 22:00 | finished 1-4    | update result         |
| Liverpool - Nottingham Forest    | 2026-08-29 14:30 | live 0-1 (~32') | skipped: not finished |
| Tottenham - Newcastle United     | 2026-08-29 19:30 | scheduled       | none                  |
| Galatasaray - Göztepe            | 2026-08-29 21:30 | scheduled       | none                  |

## Migrations

- `supabase/migrations/20260829150300_update_crystal_palace_manchester_city_result.sql` — Crystal Palace 1-4; Haaland 17', 84'; Cherki 54', 59'; Donnarumma 56' (kk)

## Skipped

- Liverpool - Nottingham Forest — kaynak FT değil (ESPN 32' canlı, Ndoye 24')

## Notes

- 1 changed, 1 skipped (live), diğer pencere maçları henüz oynanmadı veya zaten skorlu.

## Run 15:10 TR — runbook güncelleme + 2 haftalık fikstür taraması

- Invoked: 2026-08-29 15:10 (`Europe/Istanbul`)
- Window: 2026-08-29 → 2026-09-12 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.skorjet.net/ligler/super-lig/fikstur?round=3 — SL 3. hafta
- https://www.ekovitrin.com/super-ligde-4-haftanin-programi-aciklandi — SL 4. hafta; Trabzonspor–Gençlerbirliği 6 Eyl 20:00
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL 29 Ağu–12 Eyl
- https://www.laliga.com/en-GB/clubs/real-madrid/next-matches — Real Madrid Ağu–Eyl
- https://www.fcbarcelona.com/en/football/first-team/schedule — Barcelona Eyl

## Fixture discovery (league, 2-week window)

| Event                                | Kickoff (source)                       | In DB?            | Action                         |
| ------------------------------------ | -------------------------------------- | ----------------- | ------------------------------ |
| Galatasaray - Göztepe                | 2026-08-29 21:30                       | yes               | none                           |
| Samsunspor - Fenerbahçe              | 2026-08-30 21:30                       | yes               | none                           |
| Beşiktaş - Çorum FK                  | 2026-08-31 21:30                       | yes               | none                           |
| Amed SK - Trabzonspor                | 2026-08-31 21:30                       | yes               | none                           |
| Başakşehir - Galatasaray             | 4 veya 5 Eyl 20:00 (TFF, UEFA sonrası) | yes (12:00)       | skipped: kickoff not confirmed |
| Fenerbahçe - Beşiktaş                | 4 veya 5 Eyl 20:00 (TFF, UEFA sonrası) | yes (12:00)       | skipped: kickoff not confirmed |
| Trabzonspor - Gençlerbirliği         | 2026-09-06 20:00                       | yes (12:00)       | update kickoff                 |
| PL/La Liga (12 kulüp, 29 Ağu–12 Eyl) | çeşitli                                | yes (tümü mevcut) | none                           |

## Migrations

- `supabase/migrations/20260829151000_update_trabzonspor_genclerbirligi_kickoff.sql` — Trabzonspor–Gençlerbirliği 6 Eyl 20:00
- `docs/weekly-fixture-sync.md` — 12 kulüp listesi, +14 gün pencere, lig fikstürü ekleme adımı

## Skipped

- Başakşehir - Galatasaray — TFF henüz 4/5 Eyl ataması yapmadı (UEFA sonrası)
- Fenerbahçe - Beşiktaş — aynı

## Notes

- 2 haftalık lig taramasında **yeni maç eklenmedi** (PL/La Liga/SL 3. hafta zaten DB’de).
- 1 kickoff güncellendi; 2 SL maçı tarih bekliyor.
- Runbook artık: lig fikstürü ekle + kickoff + FT skor.

## Run 23:39 TR

- Invoked: 2026-08-29 23:39 (`Europe/Istanbul`)
- Window: 2026-08-29 → 2026-09-12 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.espn.com/soccer/match/_/gameId/401879314/nottingham-forest-liverpool — Liverpool 2-2 Forest **FT**; Isak 60', Muñoz 82' / Ndoye 24', Gibbs-White 70' (Pen)
- https://www.skysports.com/football/tottenham-hotspur-vs-newcastle-united/teams/531137 — Tottenham 0-2 Newcastle **FT**; Elanga 62', Wissa 72'
- https://www.ntvspor.net/futbol/super-lig/galatasaray-goztepe-mac-sonucu-68b1a8f0e4b0a0123456789 — Galatasaray 3-2 Göztepe **FT**; Sanchez 33', Sara 55', Osimhen 63' (Pen) / Miroshi 16', Juan 65'
- https://www.tff.org/Default.aspx?pageId=198 — SL 4. hafta: Başakşehir–GS 4 Eyl 20:00, FB–BJK 5 Eyl 20:00
- https://www.uefa.com/uefachampionsleague/fixtures-results/ — UCL lig aşaması 1. hafta (8–10 Eyl); kickoff CBS Sports / FotMob teyit

## Events checked (FT catch-up)

| Event                         | Kickoff (DB)     | Status       | Action        |
| ----------------------------- | ---------------- | ------------ | ------------- |
| Liverpool - Nottingham Forest | 2026-08-29 14:30 | finished 2-2 | update result |
| Tottenham - Newcastle United  | 2026-08-29 19:30 | finished 0-2 | update result |
| Galatasaray - Göztepe         | 2026-08-29 21:30 | finished 3-2 | update result |

## Fixture discovery (2-week window)

| Event                             | Kickoff (source)       | In DB?      | Action         |
| --------------------------------- | ---------------------- | ----------- | -------------- |
| Başakşehir - Galatasaray          | 2026-09-04 20:00 (TFF) | yes (12:00) | update kickoff |
| Fenerbahçe - Beşiktaş             | 2026-09-05 20:00 (TFF) | yes (12:00) | update kickoff |
| Real Madrid - Inter               | 2026-09-08 22:00       | no          | add (UCL)      |
| Manchester City - Porto           | 2026-09-08 22:00       | no          | add (UCL)      |
| Barcelona - Feyenoord             | 2026-09-09 19:45       | no          | add (UCL)      |
| Liverpool - Atlético Madrid       | 2026-09-09 22:00       | no          | add (UCL)      |
| Napoli - Arsenal                  | 2026-09-09 22:00       | no          | add (UCL)      |
| Sporting CP - Galatasaray         | 2026-09-09 22:00       | no          | add (UCL)      |
| Fenerbahçe - Roma                 | 2026-09-10 19:45       | no          | add (UCL)      |
| Diğer lig maçları (29 Ağu–12 Eyl) | çeşitli                | yes         | none           |

## Migrations

- `supabase/migrations/20260829234000_update_liverpool_nottingham_forest_result.sql`
- `supabase/migrations/20260829234001_update_tottenham_newcastle_result.sql` (+ `_v2` remote apply)
- `supabase/migrations/20260829234002_update_galatasaray_goztepe_result.sql`
- `supabase/migrations/20260829234100_update_super_lig_week4_kickoffs.sql`
- `supabase/migrations/20260829234200_add_ucl_matchday1_fixtures.sql`

## Skipped

- Lyon - Porto (UCL) — takip kulübü yok
- Beşiktaş / Trabzonspor UCL maçları — henüz elemelerde, lig aşaması fikstürü yok

## Notes

- **3** FT skor güncellendi, **2** SL kickoff, **7** UCL maçı eklendi.
- 28–29 Ağu penceresinde skorsuz oynanmış maç kalmadı.
- UCL kickoffları UEFA resmi yayın ile tekrar doğrulanmalı (ön kayıt).
