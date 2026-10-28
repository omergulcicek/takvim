# Weekly fixture sync — 2026-08-22

- Invoked: 2026-08-22 16:29 (`Europe/Istanbul`)
- Window: 2026-08-22 → 2026-08-29
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi, premier-lig, la-liga

## Sources

- https://www.sofascore.com/football/match/hull-city-manchester-united/KsWb — FT 2-0; Ajayi 17', Mendy 38'; kickoff 11:30 UTC (= 14:30 TR)
- https://www.espn.com/soccer/match/_/gameId/401879322/manchester-united-hull-city — aynı skor ve goller
- https://www.bbc.co.uk/sport/football/live/cv629k5zr2jxt — FT 2-0; Ajayi 17', Mendy 38'
- https://www.fanatik.com.tr/hull-city/canli-hull-city-manchester-united-maci-premier-lig-1-hafta-maci-2635151 — İY 2-0; Ajayi 17', Mendy 38'
- https://www.birgun.net/haber/fenerbahce-konyaspor-maci-hangi-gun-saat-kacta-ve-hangi-kanalda-730473 — FB–Konyaspor 22.08 21:30
- https://www.gzt.com/spor/super-lig-2-hafta-hangi-maclar-var-3-hafta-mac-programi-galatasaray-fenerbahce-besiktas-ve-trabzonspor-maclari-4249056 — TS–Başakşehir 23.08 19:00; Alanyaspor–BJK 23.08 21:30

## Events checked

| Event                            | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| -------------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Hull City - Manchester United    | 2026-08-22 14:30 | 2026-08-22 14:30 | finished 2-0 | update result |
| Brentford - Tottenham            | 2026-08-22 19:30 | 2026-08-22 19:30 | scheduled    | none          |
| Fenerbahçe - Konyaspor           | 2026-08-22 21:30 | 2026-08-22 21:30 | scheduled    | none          |
| Espanyol - Real Madrid           | 2026-08-22 22:30 | 2026-08-22 22:30 | scheduled    | none          |
| Manchester City - Bournemouth    | 2026-08-23 16:00 | 2026-08-23 16:00 | scheduled    | none          |
| Newcastle United - Liverpool     | 2026-08-23 18:30 | 2026-08-23 18:30 | scheduled    | none          |
| Trabzonspor - Başakşehir         | 2026-08-23 19:00 | 2026-08-23 19:00 | scheduled    | none          |
| Alanyaspor - Beşiktaş            | 2026-08-23 21:30 | 2026-08-23 21:30 | scheduled    | none          |
| Elche - Barcelona                | 2026-08-23 22:30 | 2026-08-23 22:30 | scheduled    | none          |
| Fulham - Chelsea                 | 2026-08-24 22:00 | 2026-08-24 22:00 | scheduled    | none          |
| Real Madrid - Real Sociedad      | 2026-08-26 22:00 | 2026-08-26 22:00 | scheduled    | none          |
| Lyon - Fenerbahçe                | 2026-08-26 22:00 | 2026-08-26 22:00 | scheduled    | none          |
| Kauno Žalgiris - Beşiktaş        | 2026-08-27 20:00 | 2026-08-27 20:00 | scheduled    | none          |
| Ferencváros - Trabzonspor        | 2026-08-27 21:30 | 2026-08-27 21:30 | scheduled    | none          |
| Barcelona - Athletic Bilbao      | 2026-08-27 22:00 | 2026-08-27 22:00 | scheduled    | none          |
| Crystal Palace - Manchester City | 2026-08-28 22:00 | 2026-08-28 22:00 | scheduled    | none          |
| Liverpool - Nottingham Forest    | 2026-08-29 14:30 | 2026-08-29 14:30 | scheduled    | none          |
| Tottenham - Newcastle United     | 2026-08-29 19:30 | 2026-08-29 19:30 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260822162900_update_hull_city_manchester_united_result.sql` — title `Hull City 2 - 0 Manchester United`; Ajayi 17', Mendy 38' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **18** timed events for in-scope football categories.
- Bugün biten: Hull City–Man United FT 2-0 (İY 2-0). Kickoff 14:30 TR, DB ile uyumlu.
- Akşam maçları (Brentford–Tottenham 19:30, FB–Konyaspor 21:30, Espanyol–Real Madrid 22:30) henüz oynanmadı; sonuç yazılmadı.
- Kalan kickoff’lar TFF / PL / La Liga kaynaklarıyla uyumlu.
- 1 changed (result), 17 unchanged (upcoming / not finished), 0 skipped.

## Run 23:45 TR

- Invoked: 2026-08-22 23:45 (`Europe/Istanbul`)
- Scope: bugünün maçları (22 Ağustos)

### Sources

- https://www.sofascore.com/football/match/brentford-tottenham-hotspur/Isab — FT 3-0; Lewis-Potter 12', Janelt 33', Kayode 49'
- https://www.espn.com/soccer/match/_/gameId/401879321/tottenham-hotspur-brentford — aynı skor ve goller
- https://www.skysports.com/football/brentford-vs-tottenham-hotspur/report/559445 — FT 3-0; İY 2-0
- https://www.hurriyet.com.tr/sporarena/fenerbahce-4-2-konyaspor-super-lig-maci-ozeti-43281262 — FT 4-2; Muriqi 7', Greenwood 20' 49', Asensio 33'; Colley 11', Deniz Türüç 90+4'
- https://arsiv.mackolik.com/Mac/4542665/Fenerbahce-Konyaspor — FT 4-2
- https://www.laliga.com/en-GB/match/temporada-2026-2027-laliga-ea-sports-rcd-espanyol-de-barcelona-real-madrid-2 — FT 1-1; Calatrava 30', Bellingham 9'
- https://www.foxsports.com/soccer/la-liga-espanyol-vs-real-madrid-aug-23-2026-game-boxscore-908965 — FT 1-1; Calatrava 30', Bellingham 9'

### Events checked (bugün)

| Event                             | Kickoff (DB)     | Kickoff (source) | Status       | Action            |
| --------------------------------- | ---------------- | ---------------- | ------------ | ----------------- |
| Hull City 2 - 0 Manchester United | 2026-08-22 14:30 | 2026-08-22 14:30 | finished 2-0 | none (önceki run) |
| Brentford - Tottenham             | 2026-08-22 19:30 | 2026-08-22 19:30 | finished 3-0 | update result     |
| Fenerbahçe - Konyaspor            | 2026-08-22 21:30 | 2026-08-22 21:30 | finished 4-2 | update result     |
| Espanyol - Real Madrid            | 2026-08-22 22:30 | 2026-08-22 22:30 | finished 1-1 | update result     |

### Migrations

- `supabase/migrations/20260822234500_update_brentford_tottenham_result.sql` — Brentford 3-0; Lewis-Potter 12', Janelt 33', Kayode 49' (apply_migration OK)
- `supabase/migrations/20260822234501_update_fenerbahce_konyaspor_result.sql` — Fenerbahçe 4-2; Muriqi 7', Greenwood 20' 49', Asensio 33'; Colley 11', Deniz Türüç 90+4' (apply_migration OK)
- `supabase/migrations/20260822234502_update_espanyol_real_madrid_result.sql` — Espanyol 1-1; Calatrava 30', Bellingham 9' (apply_migration OK)

### Skipped

- _(none)_

### Notes

- Bugünün 4 maçı tamamlandı; Hull City–Man United öğleden güncellenmişti.
- Brentford–Tottenham İY 2-0, FT 3-0.
- Fenerbahçe–Konyaspor İY 3-1, FT 4-2.
- Espanyol–Real Madrid İY 1-1, FT 1-1.
- 3 changed (result), 1 unchanged (already scored), 0 skipped.

### Düzeltme (23.08 00:42)

Espanyol–Real Madrid maçı **devam ederken** 1-1 yazılmıştı (canlı/İY kaynağı). FT **1-2** olarak düzeltildi → `20260823004200_fix_espanyol_real_madrid_result.sql`. Runbook’a “günün maçları = yalnızca FT” kuralı eklendi.
