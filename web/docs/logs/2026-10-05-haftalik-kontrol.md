# Weekly fixture sync — 2026-10-05

- Invoked: 2026-10-05 22:43 (`Europe/Istanbul`)
- Window: 2026-10-05 → 2026-10-19 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- ESPN `uefa.nations` / `tur.1` / `eng.1` / `esp.1` / `uefa.champions` / `uefa.europa` / `uefa.europa.conf` scoreboard, 2–19 Eki
- https://www.uefa.com/uefanationsleague/news/02aa-21b9c92be12f-a190457ae8e6-1000--uefa-nations-league-matchday-3-harry-kane-inspires-englan/ — 2–3 Eki skorları
- https://www.nampa.org/text/23031422 — AFP: Yunanistan 0-0 Almanya; Portekiz 2-1 Norveç (Cancelo 38, Ramos 79, Ajer 36)
- https://www.englandfootball.com/england/mens-senior-team/fixtures-results/2026-27/nations-league/croatia-england-uefa-nations-league-saturday-3-october-2026-match-centre — Hırvatistan 0-7 İngiltere, FT
- https://www.bbc.com/sport/football/live/cm046w9zdkrwt — aynı 0-7, gol dakikaları
- https://www.nbcsports.com/soccer/news/uefa-nations-league-2026-27-nations-league-format-schedule-standings-scores — Belçika 3-0, Fransa 1-1, İspanya 3-1

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                            | Competition | Kickoff (source) | In DB? | Action       |
| -------------------------------- | ----------- | ---------------- | ------ | ------------ |
| Everton - Chelsea                | PL          | 17 Eki 14:30     | no     | add          |
| Brentford - Liverpool            | PL          | 17 Eki 17:00     | no     | add          |
| Manchester City - Ipswich        | PL          | 17 Eki 17:00     | no     | add          |
| Real Betis - Barcelona           | La Liga     | 17 Eki 19:30     | no     | add          |
| Gençlerbirliği - Galatasaray     | SL          | 17 Eki 16:00     | yes    | none         |
| Fenerbahçe - Alanyaspor          | SL          | 17 Eki 19:00     | yes    | none         |
| Leeds United - Manchester United | PL          | 18 Eki 16:00     | no     | add          |
| Nottingham Forest - Arsenal      | PL          | 18 Eki 18:30     | no     | add          |
| Real Madrid - Sevilla            | La Liga     | 18 Eki 22:00     | no     | add          |
| Trabzonspor - Beşiktaş           | SL          | 19 Eki 20:00     | yes    | none         |
| Tottenham - Coventry             | PL          | 19 Eki 22:00     | no     | add          |
| UCL 13–14 Eki / UEL–UECL 15 Eki  | UEFA        | mevcut           | yes    | none         |
| UCL 3. hafta (20–21 Eki)         | UCL         | —                | —      | pencere dışı |

## Events checked

| Event                   | Kickoff (DB)     | Kickoff (source) | Status       | Action                |
| ----------------------- | ---------------- | ---------------- | ------------ | --------------------- |
| Belçika - Türkiye       | 2026-10-02 21:45 | 2026-10-02 21:45 | finished 3-0 | update result         |
| Fransa - İtalya         | 2026-10-02 21:45 | 2026-10-02 21:45 | finished 1-1 | update result         |
| Hırvatistan - İngiltere | 2026-10-03 19:00 | 2026-10-03 19:00 | finished 0-7 | update result         |
| İspanya - Çekya         | 2026-10-03 21:45 | 2026-10-03 21:45 | finished 3-1 | update result         |
| Yunanistan - Almanya    | 2026-10-04 21:45 | 2026-10-04 21:45 | finished 0-0 | update result         |
| Portekiz - Norveç       | 2026-10-04 21:45 | 2026-10-04 21:45 | finished 2-1 | update result         |
| Fransa - Belçika        | 2026-10-05 21:45 | 2026-10-05 21:45 | HT           | skipped: not finished |
| İtalya - Türkiye        | 2026-10-05 21:45 | 2026-10-05 21:45 | HT           | skipped: not finished |
| 6–15 Eki mevcut maçlar  | DB ile aynı      | ESPN ile aynı    | scheduled    | none                  |

## Migrations

- `supabase/migrations/20261005224300_update_belgium_turkey_result.sql` — 3-0; De Bruyne 10', 59', Lukaku 76' (MCP: `weekly_sync_20261005`)
- `supabase/migrations/20261005224301_update_france_italy_result.sql` — 1-1; Olise 55', Upamecano 85' kırmızı, Bastoni 68'
- `supabase/migrations/20261005224302_update_croatia_england_result.sql` — 0-7
- `supabase/migrations/20261005224303_update_spain_czechia_result.sql` — 3-1; Krejcí 85' kırmızı
- `supabase/migrations/20261005224304_update_greece_germany_result.sql` — 0-0
- `supabase/migrations/20261005224305_update_portugal_norway_result.sql` — 2-1; Conceição 86' kırmızı
- `supabase/migrations/20261005224306_add_oct17_oct19_league_fixtures.sql` — 8 lig maçı

## Skipped

- Fransa - Belçika, İtalya - Türkiye — HT, maç bitmedi
- Hazırlık (non-TR) — kapsam dışı
- Şampiyonlar Ligi 20–21 Eki — pencere dışı

## Notes

- **8** eklendi, **6** skor yazıldı, **0** kickoff değişti.
- 2–4 Eki maçları pencere öncesi; FT ve skorsuz oldukları için sonuç yazıldı.
- 22:00 maçların bitişi 23:55.
