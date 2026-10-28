# Weekly fixture sync — 2026-08-23

- Invoked: 2026-08-23 00:42 (`Europe/Istanbul`)
- Scope: Espanyol–Real Madrid düzeltmesi (22 Ağustos maçı, FT sonrası)

## Sources

- https://www.espn.com/soccer/match/_/gameId/401882912/real-madrid-espanyol — FT 1-2; Calatrava 30', Bellingham 9', Carlos Espí 90'
- https://www.statmuse.com/fc/match/-113466 — FT 1-2; aynı goller
- https://www.managingmadrid.com/real-madrid-cf-la-liga/111682/immediate-reaction-espanyol-1-2-real-madrid — FT 1-2; Bellingham & Espí

## Events checked

| Event                  | Kickoff (DB)     | Status (source) | Action                          |
| ---------------------- | ---------------- | --------------- | ------------------------------- |
| Espanyol - Real Madrid | 2026-08-22 22:30 | finished 1-2    | fix result (was wrongly 1-1 FT) |

## Migrations

- `supabase/migrations/20260823004200_fix_espanyol_real_madrid_result.sql` — 1-2; Calatrava 30', Bellingham 9', Espí 90' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Önceki run (22.08 23:45) maç devam ederken 1-1 yazmıştı; kaynak canlı/İY verisiydi, FT değildi.
- Runbook güncellendi: “günün maçları” = yalnızca **FT** bitenler; canlı/İY skoru yazılmaz.
- 1 düzeltme, 0 skipped.

## Run 21:02 TR

- Invoked: 2026-08-23 21:02 (`Europe/Istanbul`)
- Window: 2026-08-23 → 2026-08-30
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi, premier-lig, la-liga
- Scope: **yalnızca FT biten** maçlar (canlı/henüz başlamamış → skor yazılmadı)

### Sources

- https://www.espn.com/soccer/match/_/gameId/401879320 — FT 2-1 Man City–Bournemouth; Tavernier 26', Guéhi 84', Gvardiol 90+1'
- https://www.sofascore.com/news/man-city-2-1-bournemouth-guehi-leads-late-rally-key-stats — FT 2-1; Finished
- https://www.espn.com/soccer/match/_/gameId/401879319/liverpool-newcastle-united — FT 2-2; Elanga 5', Willock 57'; Gakpo 55', Szoboszlai 90+9' pen
- https://www.skysports.com/football/newcastle-united-vs-liverpool/report/559452 — FT 2-2; aynı goller
- https://spor.haber7.com/canli-anlatim/1897-trabzonspor-istanbul-basaksehir-fk — Maç Bitti; FT 2-1; Salah 9' 48', Shomurodov 19' pen
- https://www.takvim.com.tr/spor/trabzonspor/2026/08/23/canli-trabzonspor-basaksehir-super-lig-2-hafta-maci — FT 2-1; Salah 8' 48', Shomurodov 19' pen

### Events checked (bugün — 23 Ağustos)

| Event                         | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ----------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Manchester City - Bournemouth | 2026-08-23 16:00 | 2026-08-23 16:00 | finished 2-1 | update result |
| Newcastle United - Liverpool  | 2026-08-23 18:30 | 2026-08-23 18:30 | finished 2-2 | update result |
| Trabzonspor - Başakşehir      | 2026-08-23 19:00 | 2026-08-23 19:00 | finished 2-1 | update result |
| Alanyaspor - Beşiktaş         | 2026-08-23 21:30 | 2026-08-23 21:30 | not started  | none          |
| Elche - Barcelona             | 2026-08-23 22:30 | 2026-08-23 22:30 | not started  | none          |

### Events checked (pencere — upcoming)

| Event                            | Kickoff (DB)     | Status    | Action |
| -------------------------------- | ---------------- | --------- | ------ |
| Fulham - Chelsea                 | 2026-08-24 22:00 | scheduled | none   |
| Lyon - Fenerbahçe                | 2026-08-26 22:00 | scheduled | none   |
| Real Madrid - Real Sociedad      | 2026-08-26 22:00 | scheduled | none   |
| Kauno Žalgiris - Beşiktaş        | 2026-08-27 20:00 | scheduled | none   |
| Ferencváros - Trabzonspor        | 2026-08-27 21:30 | scheduled | none   |
| Barcelona - Athletic Bilbao      | 2026-08-27 22:00 | scheduled | none   |
| Crystal Palace - Manchester City | 2026-08-28 22:00 | scheduled | none   |
| Liverpool - Nottingham Forest    | 2026-08-29 14:30 | scheduled | none   |
| Tottenham - Newcastle United     | 2026-08-29 19:30 | scheduled | none   |
| Amed SK - Trabzonspor            | 2026-08-30 12:00 | scheduled | none   |
| Galatasaray - Göztepe            | 2026-08-30 12:00 | scheduled | none   |
| Beşiktaş - Çorum FK              | 2026-08-30 12:00 | scheduled | none   |
| Samsunspor - Fenerbahçe          | 2026-08-30 12:00 | scheduled | none   |
| Chelsea - Brighton               | 2026-08-30 16:00 | scheduled | none   |
| Real Madrid - Malaga             | 2026-08-30 18:00 | scheduled | none   |
| Manchester United - Ipswich      | 2026-08-30 18:30 | scheduled | none   |

### Migrations

- `supabase/migrations/20260823210200_update_manchester_city_bournemouth_result.sql` — apply OK (remote: `update_manchester_city_bournemouth_result_v2`)
- `supabase/migrations/20260823210201_update_newcastle_liverpool_result.sql` — apply OK (remote: `update_newcastle_liverpool_result_v2`)
- `supabase/migrations/20260823210202_update_trabzonspor_basaksehir_result.sql` — apply OK

### Skipped (not FT)

- Alanyaspor - Beşiktaş — henüz başlamadı (21:02 TR)
- Elche - Barcelona — henüz başlamadı

### Notes

- Pencere: **21** timed event.
- Bugün FT: 3 maç güncellendi; akşam maçları (Alanyaspor–BJK 21:30, Elche–Barcelona 22:30) bilinçli olarak atlandı.
- 3 changed, 18 unchanged, 2 skipped (not finished).

## Run 23:24 TR

- Invoked: 2026-08-23 23:24 (`Europe/Istanbul`)
- Scope: Alanyaspor–Beşiktaş (FT)

### Sources

- https://www.cnnturk.com/spor/futbol/live-alanyaspor-besiktas-maci-canli-anlatim-kartal-3-puan-pesinde-3457784 — MAÇ SONUCU 1-0; Lima 73'
- https://www.espn.com/soccer/match/_/gameId/401888317/besiktas-alanyaspor — FT 1-0; Nuno Lima 73'

### Events checked

| Event                 | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Alanyaspor - Beşiktaş | 2026-08-23 21:30 | 2026-08-23 21:30 | finished 1-0 | update result |

### Migrations

- `supabase/migrations/20260823232400_update_alanyaspor_besiktas_result.sql` — 1-0; Nuno Lima 73' (apply_migration OK)

### Skipped

- _(none)_

### Notes

- İY 0-0, FT 1-0.
- 1 changed, 0 skipped.
