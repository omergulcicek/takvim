# Weekly fixture sync — 2026-09-12

- Invoked: 2026-09-12 17:15 (`Europe/Istanbul`)
- Window: 2026-09-12 → 2026-09-26 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.aa.com.tr/tr/spor/besiktas-evinde-erzurumspor-fkyi-3-0-yendi/4054700 — Beşiktaş 3-0 Erzurumspor **FT**; Topçu 21', Trossard 27', Fakılı 82'
- https://www.aksam.com.tr/spor/mac-sonucu-besiktas-3-0-erzurumspor-fk/haber-1697621 — teyit skor + goller
- https://www.bbc.co.uk/sport/football/live/c67830ezxn4xt — Manchester United 4-0 Sabah **FT**; Cunha 27', Fernandes 42', Sesko 45', Martínez 68'
- https://www.theguardian.com/football/2026/sep/10/manchester-united-sabah-champions-league-match-report — teyit United 4-0
- https://www.espn.com/soccer/scoreboard/_/date/20260910/league/uefa.champions — United skorboard teyit
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL 12–20 Eyl dolu; 21–26 Eyl tracked maç yok
- https://www.espn.com/soccer/team/fixtures/_/id/83/barcelona — La Liga pencere dolu
- https://www.espn.com/soccer/team/fixtures/_/id/86/real-madrid — La Liga pencere dolu

## Fixture discovery (league + UCL, 2-week window)

| Event                         | Competition | Kickoff (source) | In DB? | Action                         |
| ----------------------------- | ----------- | ---------------- | ------ | ------------------------------ |
| Beşiktaş - Erzurumspor FK     | Süper Lig   | 2026-09-11 20:00 | yes    | update result (backfill FT)    |
| Manchester United - Sabah     | UCL         | 2026-09-10 22:00 | yes    | update result (backfill FT)    |
| Liverpool - Fulham            | Premier Lig | 2026-09-12 17:00 | yes    | none (live / not FT)           |
| Chelsea - Hull City           | Premier Lig | 2026-09-12 17:00 | yes    | none (live / not FT)           |
| Tottenham - Everton           | Premier Lig | 2026-09-12 19:30 | yes    | none (scheduled)               |
| Konyaspor - Trabzonspor       | Süper Lig   | 2026-09-12 20:00 | yes    | none (scheduled)               |
| Sunderland - Arsenal          | Premier Lig | 2026-09-12 22:00 | yes    | none (scheduled)               |
| Real Madrid - Rayo Vallecano  | La Liga     | 2026-09-12 22:00 | yes    | none (scheduled)               |
| PL / SL / La Liga (13–20 Eyl) | lig         | çeşitli          | yes    | none                           |
| 21–26 Eyl tracked             | —           | —                | —      | skipped: no fixtures in window |

## Events checked

| Event                        | Kickoff (DB)     | Status        | Action        |
| ---------------------------- | ---------------- | ------------- | ------------- |
| Manchester United - Sabah    | 2026-09-10 22:00 | finished 4-0  | update result |
| Beşiktaş - Erzurumspor FK    | 2026-09-11 20:00 | finished 3-0  | update result |
| Liverpool - Fulham           | 2026-09-12 17:00 | live / not FT | skipped       |
| Chelsea - Hull City          | 2026-09-12 17:00 | live / not FT | skipped       |
| Tottenham - Everton          | 2026-09-12 19:30 | scheduled     | none          |
| Konyaspor - Trabzonspor      | 2026-09-12 20:00 | scheduled     | none          |
| Sunderland - Arsenal         | 2026-09-12 22:00 | scheduled     | none          |
| Real Madrid - Rayo Vallecano | 2026-09-12 22:00 | scheduled     | none          |

## Migrations

- `supabase/migrations/20260912171500_update_besiktas_erzurumspor_result.sql`
- `supabase/migrations/20260912171501_update_manchester_united_sabah_result.sql`

## Skipped

- Liverpool–Fulham, Chelsea–Hull — kickoff 17:00, invocation ~15 dk sonra; **not finished**
- Bugün akşam maçları (Spurs, TS, Arsenal, Real) — henüz başlamadı
- 21–26 Eyl — tracked kulüpler için lig/UCL maçı yok (sonraki PL/UCL Ekim)

## Notes

- **2** FT skor (backfill: United–Sabah, BJK–Erzurum)
- **0** yeni fikstür
- Bugünkü 15:00 BST maçları sonraki run’da
