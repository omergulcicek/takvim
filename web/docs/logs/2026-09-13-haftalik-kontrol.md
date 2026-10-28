# Weekly fixture sync — 2026-09-13

- Invoked: 2026-09-13 10:34 (`Europe/Istanbul`)
- Window: 2026-09-13 → 2026-09-27 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.skysports.com/football/news/11681/13583567/liverpool-0-0-fulham-andoni-iraola-waiting-for-first-premier-league-win-at-anfield-as-alvaro-arbeloa-makes-point — Liverpool 0-0 Fulham **FT**
- https://www.espn.com/soccer/report/_/gameId/401879283 — Chelsea 2-2 Hull **FT**; Rogers 7', João Pedro 66' / Belloumi 28', 34'
- https://www.espn.com/soccer/scoreboard/_/date/20260912/league/eng.1 — Tottenham 0-0 Everton **FT**; PL skorboard
- https://www.aa.com.tr/tr/spor/trabzonspor-deplasmanda-konyaspora-1-0-yenildi/4055410 — Konyaspor 1-0 Trabzonspor **FT**; Toth 2'
- https://www.espn.com/soccer/report/_/gameId/401878779 — Sunderland 0-2 Arsenal **FT**; Guimarães 58', Saka 90+7' (pen); Mandava 90+6' red
- https://www.espn.com/soccer/scoreboard/_/date/20260912/league/esp.1 — Real Madrid 4-1 Rayo **FT**; Mbappé 14' (pen)/90+1', Carreras 17', Bellingham 35' / Camello 51'
- https://www.aksam.com.tr/spor/arda-guler-asistini-yapti-real-madrid-farkli-kazandi/haber-1697900 — Real Madrid 4-1 teyit
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL pencere dolu

## Fixture discovery (league + UCL, 2-week window)

| Event                               | Competition | Kickoff      | In DB?    | Action           |
| ----------------------------------- | ----------- | ------------ | --------- | ---------------- |
| Liverpool - Fulham                  | PL          | 12 Eyl 17:00 | yes       | update result    |
| Chelsea - Hull City                 | PL          | 12 Eyl 17:00 | yes       | update result    |
| Tottenham - Everton                 | PL          | 12 Eyl 19:30 | yes       | update result    |
| Konyaspor - Trabzonspor             | SL          | 12 Eyl 20:00 | yes       | update result    |
| Sunderland - Arsenal                | PL          | 12 Eyl 22:00 | yes       | update result    |
| Real Madrid - Rayo Vallecano        | La Liga     | 12 Eyl 22:00 | yes       | update result    |
| Levante - Barcelona                 | La Liga     | 13 Eyl 17:15 | yes       | none (scheduled) |
| Manchester United - Manchester City | PL          | 13 Eyl 18:30 | yes       | none (scheduled) |
| Galatasaray - Kocaelispor           | SL          | 13 Eyl 20:00 | yes       | none (scheduled) |
| 14–20 / 21–27 Eyl tracked           | lig         | çeşitli      | yes / yok | none             |

## Events checked

| Event                               | Status       | Action        |
| ----------------------------------- | ------------ | ------------- |
| Liverpool - Fulham                  | finished 0-0 | update result |
| Chelsea - Hull City                 | finished 2-2 | update result |
| Tottenham - Everton                 | finished 0-0 | update result |
| Konyaspor - Trabzonspor             | finished 1-0 | update result |
| Sunderland - Arsenal                | finished 0-2 | update result |
| Real Madrid - Rayo Vallecano        | finished 4-1 | update result |
| Levante - Barcelona                 | scheduled    | none          |
| Manchester United - Manchester City | scheduled    | none          |
| Galatasaray - Kocaelispor           | scheduled    | none          |

## Migrations

- `supabase/migrations/20260913103400_update_liverpool_fulham_result.sql`
- `supabase/migrations/20260913103401_update_chelsea_hull_result.sql`
- `supabase/migrations/20260913103402_update_tottenham_everton_result.sql`
- `supabase/migrations/20260913103403_update_konyaspor_trabzonspor_result.sql`
- `supabase/migrations/20260913103404_update_sunderland_arsenal_result.sql`
- `supabase/migrations/20260913103405_update_real_madrid_rayo_result.sql`

## Skipped

- Bugünün maçları (Levante–Barça, United–City, GS–Kocaeli) — henüz başlamadı
- Yeni fikstür yok — pencere dolu

## Notes

- **6** FT skor (12 Eyl)
- 0-0 maçlarda description `NULL`
- Saka penaltı + Mandava kırmızı kart kaydedildi
- Mbappé 14' penaltı

---

## Run 23:18 TR

- Invoked: 2026-09-13 23:18 (`Europe/Istanbul`)
- Window: 2026-09-13 → 2026-09-27 (+14d)

### Sources

- https://www.espn.com/soccer/scoreboard/_/date/20260913/league/esp.1 — Levante 2-4 Barcelona **FT**; Romero 79', Brugué 88' / Espart 5', Yamal 19'/48' (pen), Adeyemi 90+3'
- https://www.gzt.com/spor/levante-barcelona-maci-kac-kac-bitti-levante-barcelona-mac-sonucu-4260630 — Barça 4-2 teyit
- https://www.espn.com/soccer/report/_/gameId/401879278 — Manchester United 0-1 City **FT**; Haaland 60'; Foden 23' red
- https://www.milliyet.com.tr/skorer/premier-ligde-dev-macta-manchester-city-manchester-unitedi-tek-golle-gecti-7659669 — derbi teyit
- https://www.yenisafak.com/spor/galatasaray-1-0-kocaelispor-ozet-4855526 — Galatasaray 1-0 Kocaelispor **FT**; Bardakcı 71'
- https://www.cumhuriyet.com.tr/spor/galatasaray-uc-puani-tek-golle-aldi-galatasaray-1-0-kocaelispor-2537182 — GS teyit

### Events checked

| Event                               | Status             | Action        |
| ----------------------------------- | ------------------ | ------------- |
| Levante - Barcelona                 | finished 2-4       | update result |
| Manchester United - Manchester City | finished 0-1       | update result |
| Galatasaray - Kocaelispor           | finished 1-0       | update result |
| Gaziantep FK - Fenerbahçe           | scheduled (14 Eyl) | none          |

### Migrations

- `supabase/migrations/20260913231800_update_levante_barcelona_result.sql`
- `supabase/migrations/20260913231801_update_manchester_united_city_result.sql` (MCP: `update_man_utd_man_city_derby_result` — ilk apply version çakışması)
- `supabase/migrations/20260913231802_update_galatasaray_kocaelispor_result.sql`

### Skipped

- Yeni fikstür yok
- Yarın Gaziantep–FB — henüz başlamadı

### Notes

- **3** FT skor (13 Eyl akşam)
- Foden kırmızı kart (City); Yamal 48' penaltı
