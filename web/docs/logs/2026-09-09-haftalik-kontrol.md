# Weekly fixture sync — 2026-09-09

- Invoked: 2026-09-09 12:00 (`Europe/Istanbul`)
- Window: 2026-09-09 → 2026-09-23 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.bbc.com/sport/football/articles/cz9z3x0wv8yo — Porto 0-2 Manchester City **FT**; Haaland 47', 90+1'
- https://www.channelnewsasia.com/sport/real-punish-inter-errors-haaland-double-lifts-man-city-6370856 — teyit City 2-0 Porto; Real Madrid 2-1 Inter
- https://www.realmadrid.com/en-US/news/football/first-team/reports/cronica-real-madrid-inter-j1-ucl-08-09-2026 — Real Madrid 2-1 Inter **FT**; Mbappé, Valverde / Carlos Augusto 76'
- https://apnews.com/article/real-madrid-inter-milan-josep-martinez-5bfac87a6267dd828b988020c8302787 — Mbappé 14', Valverde 23'
- https://www.fcbarcelona.com/en/football/first-team/schedule — Sevilla–Barcelona 19 Eyl 21:00; bugün Barça–Feyenoord 18:45 CEST
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL pencere dolu

## Fixture discovery (league + UCL, 2-week window)

| Event                         | Competition | Kickoff (source) | In DB?                         | Action                   |
| ----------------------------- | ----------- | ---------------- | ------------------------------ | ------------------------ |
| Porto - Manchester City       | UCL         | 2026-09-08 22:00 | yes (yanlış title: City–Porto) | update result + fix home |
| Real Madrid - Inter           | UCL         | 2026-09-08 22:00 | yes                            | none (result)            |
| Barcelona - Feyenoord         | UCL         | 2026-09-09 19:45 | yes                            | none                     |
| Liverpool - Atlético Madrid   | UCL         | 2026-09-09 22:00 | yes                            | none                     |
| Napoli - Arsenal              | UCL         | 2026-09-09 22:00 | yes                            | none                     |
| Sporting CP - Galatasaray     | UCL         | 2026-09-09 22:00 | yes                            | none                     |
| Fenerbahçe - Roma             | UCL         | 2026-09-10 19:45 | yes                            | none                     |
| Sevilla - Barcelona           | La Liga     | 2026-09-19 22:00 | no                             | add fixture              |
| PL / SL / La Liga (11–20 Eyl) | lig         | çeşitli          | yes                            | none                     |

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status               | Action                           |
| --------------------------- | ---------------- | ---------------- | -------------------- | -------------------------------- |
| Manchester City - Porto     | 2026-09-08 22:00 | Porto home 22:00 | finished 0-2 (Porto) | update result; fix to Porto home |
| Real Madrid - Inter         | 2026-09-08 22:00 | 2026-09-08 22:00 | finished 2-1         | update result                    |
| Barcelona - Feyenoord       | 2026-09-09 19:45 | 2026-09-09 19:45 | scheduled            | none                             |
| Liverpool - Atlético Madrid | 2026-09-09 22:00 | 2026-09-09 22:00 | scheduled            | none                             |
| Napoli - Arsenal            | 2026-09-09 22:00 | 2026-09-09 22:00 | scheduled            | none                             |
| Sporting CP - Galatasaray   | 2026-09-09 22:00 | 2026-09-09 22:00 | scheduled            | none                             |
| Fenerbahçe - Roma           | 2026-09-10 19:45 | 2026-09-10 19:45 | scheduled            | none                             |
| Sevilla - Barcelona         | —                | 2026-09-19 22:00 | —                    | add fixture                      |

## Migrations

- `supabase/migrations/20260909120000_update_porto_manchester_city_result.sql`
- `supabase/migrations/20260909120001_update_real_madrid_inter_result.sql`
- `supabase/migrations/20260909120002_add_sevilla_barcelona.sql`

## Skipped

- Bugünün UCL maçları (Barça–Feyenoord, Liverpool–Atlético, Napoli–Arsenal, Sporting–GS) — henüz başlamadı (öğlen run)
- Fenerbahçe–Roma (10 Eyl) — yarın

## Notes

- **2** FT skor (8 Eyl UCL MD1)
- Porto–City: ev sahibi düzeltildi (`Manchester City - Porto` → `Porto 0 - 2 Manchester City`)
- **1** yeni La Liga fikstürü (Sevilla–Barcelona, 19 Eyl)
- Bugün akşam 4 UCL maçı; sonuçlar bir sonraki run'da
