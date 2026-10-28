# Weekly fixture sync — 2026-09-10

- Invoked: 2026-09-10 00:00 (`Europe/Istanbul`)
- Window: 2026-09-10 → 2026-09-24 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.espn.com/soccer/report/_/gameId/401915424 — Barcelona 5-1 Feyenoord **FT**; Raphinha 3'/57', Adeyemi 22', Yamal 77', Jesus 85' / Steijn 82'
- https://www.espn.com/soccer/report/_/gameId/401915446 — Liverpool 2-1 Atlético **FT**; Szoboszlai 40', Mac Allister 50' / Llorente 17'
- https://www.espn.com/soccer/report/_/gameId/401915423 — Napoli 0-1 Arsenal **FT**; Ødegaard 75'
- https://www.espn.com/soccer/report/_/gameId/401915447 — Sporting CP 3-1 Galatasaray **FT**; Catamo 27', Suárez 57' (pen), Zalazar 63' / Inácio 5' OG
- https://www.hurriyet.com.tr/sporarena/canli-anlatim-sporting-cp-galatasaray-uefa-sampiyonlar-ligi-43300772 — Sporting 3-1 GS teyit (MS)
- https://www.sporx.com/sporting-cp-galatasaray-maci-goller-kartlar-6106280 — Sporting 3-1 GS teyit
- https://www.foxsports.com/soccer/champions-league-sporting-cp-vs-galatasaray-sep-09-2026-game-boxscore-1003331 — play-by-play / skor teyit
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL pencere dolu
- https://www.fcbarcelona.com/en/football/first-team/schedule — Sevilla–Barcelona zaten DB’de

## Fixture discovery (league + UCL, 2-week window)

| Event                       | Competition | Kickoff (source) | In DB? | Action           |
| --------------------------- | ----------- | ---------------- | ------ | ---------------- |
| Barcelona - Feyenoord       | UCL         | 2026-09-09 19:45 | yes    | update result    |
| Liverpool - Atlético Madrid | UCL         | 2026-09-09 22:00 | yes    | update result    |
| Napoli - Arsenal            | UCL         | 2026-09-09 22:00 | yes    | update result    |
| Sporting CP - Galatasaray   | UCL         | 2026-09-09 22:00 | yes    | update result    |
| Fenerbahçe - Roma           | UCL         | 2026-09-10 19:45 | yes    | none (scheduled) |
| PL MW4–5 (12–20 Eyl)        | Premier Lig | çeşitli          | yes    | none             |
| SL hafta 5–6                | Süper Lig   | çeşitli          | yes    | none             |
| La Liga (12–20 Eyl)         | La Liga     | çeşitli          | yes    | none             |

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Barcelona - Feyenoord       | 2026-09-09 19:45 | 2026-09-09 19:45 | finished 5-1 | update result |
| Liverpool - Atlético Madrid | 2026-09-09 22:00 | 2026-09-09 22:00 | finished 2-1 | update result |
| Napoli - Arsenal            | 2026-09-09 22:00 | 2026-09-09 22:00 | finished 0-1 | update result |
| Sporting CP - Galatasaray   | 2026-09-09 22:00 | 2026-09-09 22:00 | finished 3-1 | update result |
| Fenerbahçe - Roma           | 2026-09-10 19:45 | 2026-09-10 19:45 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260910000000_update_barcelona_feyenoord_result.sql`
- `supabase/migrations/20260910000001_update_liverpool_atletico_result.sql`
- `supabase/migrations/20260910000002_update_napoli_arsenal_result.sql`
- `supabase/migrations/20260910000003_update_sporting_galatasaray_result.sql`

## Skipped

- Fenerbahçe–Roma (10 Eyl 19:45) — henüz başlamadı
- Yeni fikstür yok — pencere zaten dolu (önceki run’lar)

## Notes

- **4** FT skor (9 Eyl UCL MD1 akşam)
- GS golü: ESPN/FOX **Inácio OG (kk)**; Hürriyet Torreira diye yazmış — resmi skorboard OG ile alındı
- Suárez penaltı: `(Penaltı)`

---

## Run 21:38 TR

- Invoked: 2026-09-10 21:38 (`Europe/Istanbul`)
- Window: 2026-09-10 → 2026-09-24 (+14d)

### Sources

- https://www.espn.com/soccer/report/_/gameId/401915444 — Fenerbahçe 1-1 Roma **FT**; Brown 48' / Cristante 39'
- https://www.espn.com/soccer/match/_/gameId/401915444/as-roma-fenerbahce — FT + skorboard teyit
- https://www.beinsports.com/en-us/soccer/uefa-champions-league/articles/live-blog-fenerbahce-vs-roma-in-the-uefa-champions-league-2026-09-10 — Cristante 0-1, Brown 1-1
- https://www.espn.com/soccer/scoreboard/_/date/20260910/league/uefa.champions — United–Sabah henüz başlamadı; FB–Roma 1-1
- https://www.sportingnews.com/uk/football/news/champions-league-fixtures-schedule-results-2026-27/1b867157f66e7587cd071d16 — United–Sabah 10 Eyl 21:00 CET (=22:00 TR)
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL pencere dolu

### Fixture discovery

| Event                         | Competition | Kickoff (source) | In DB? | Action        |
| ----------------------------- | ----------- | ---------------- | ------ | ------------- |
| Fenerbahçe - Roma             | UCL         | 2026-09-10 19:45 | yes    | update result |
| Manchester United - Sabah     | UCL         | 2026-09-10 22:00 | no     | add fixture   |
| Beşiktaş - Erzurumspor FK     | Süper Lig   | 2026-09-11 20:00 | yes    | none          |
| PL / SL / La Liga (12–20 Eyl) | lig         | çeşitli          | yes    | none          |

### Events checked

| Event                     | Kickoff (DB)     | Status               | Action        |
| ------------------------- | ---------------- | -------------------- | ------------- |
| Fenerbahçe - Roma         | 2026-09-10 19:45 | finished 1-1         | update result |
| Manchester United - Sabah | —                | scheduled (pre-kick) | add fixture   |
| Beşiktaş - Erzurumspor FK | 2026-09-11 20:00 | scheduled            | none          |

### Migrations

- `supabase/migrations/20260910213800_update_fenerbahce_roma_result.sql`
- `supabase/migrations/20260910213801_add_manchester_united_sabah.sql`

### Skipped

- Manchester United–Sabah sonuç — henüz başlamadı (22:00 TR)
- Diğer pencere maçları — gelecek günler / zaten DB’de

### Notes

- **1** FT skor (Fenerbahçe 1-1 Roma)
- **1** yeni UCL fikstürü (Manchester United–Sabah; MD1’de eksikti)
- end_date United–Sabah: 23:55 (00:00 kaçınıldı)
