# Weekly fixture sync — 2026-10-07

- Invoked: 2026-10-07 12:15 (`Europe/Istanbul`)
- Window: 2026-10-07 → 2026-10-21 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- ESPN `uefa.nations` / `tur.1` / `eng.1` / `esp.1` / `uefa.champions` / `uefa.europa` / `uefa.europa.conf` scoreboard, 6–8 ve 21 Eki
- https://www.bbc.com/sport/football/live/cm9w4w2vn711t — Hırvatistan 1-2 İspanya, FT; Perišić 17', Merino 61' ve 88', Perišić kırmızı 79'
- https://www.channelnewsasia.com/sport/spain-rally-beat-croatia-kane-shines-england-in-nations-league-6437641 — aynı skorlar; Coufal kk 27', Kane 40' ve 57'
- https://www.englandfootball.com/england/mens-senior-team/fixtures-results/2026-27/nations-league/england-czechia-uefa-nations-league-tuesday-6-october-2026-match-centre — İngiltere 3-0 Çekya, FT
- https://www.cbssports.com/soccer/news/uefa-champions-league-schedule-real-madrid-inter-liverpool-atletico-madrid-matchday-1/ — UCL 3. hafta, 21 Eki

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                           | Competition | Kickoff (source) | In DB? | Action  |
| ------------------------------- | ----------- | ---------------- | ------ | ------- |
| Como - Manchester United        | UCL 3       | 21 Eki 19:45     | no     | add     |
| Lille - Galatasaray             | UCL 3       | 21 Eki 19:45     | no     | add     |
| Bayern Münih - Arsenal          | UCL 3       | 21 Eki 22:00     | no     | add     |
| Real Madrid - RB Leipzig        | UCL 3       | 21 Eki 22:00     | no     | add     |
| 9–20 Eki lig / UCL / UEL / UECL | —           | mevcut saatler   | yes    | none    |
| 7–8 Eki                         | —           | —                | —      | maç yok |

## Events checked

| Event                 | Kickoff (DB)     | Kickoff (source)      | Status       | Action        |
| --------------------- | ---------------- | --------------------- | ------------ | ------------- |
| Hırvatistan - İspanya | 2026-10-06 21:45 | 2026-10-06 21:45      | finished 1-2 | update result |
| İngiltere - Çekya     | 2026-10-06 21:45 | 2026-10-06 21:45      | finished 3-0 | update result |
| 9–20 Eki              | DB ile aynı      | dünkü tarama ile aynı | scheduled    | none          |

## Migrations

- `supabase/migrations/20261007121500_update_croatia_spain_result.sql` — 1-2 (MCP: `weekly_sync_20261007`)
- `supabase/migrations/20261007121501_update_england_czechia_result.sql` — 3-0; Coufal 27' (kk), Kane 40', 57'
- `supabase/migrations/20261007121502_add_ucl_matchday3_oct21.sql` — 4 UCL maçı

## Skipped

- Hazırlık (non-TR) — kapsam dışı
- 7–8 Eki — takip edilen maç yok

## Notes

- **4** eklendi, **2** skor yazıldı, **0** kickoff değişti.
- 6 Eki maçları dün akşam scheduled idi; bugün FT.
- 22:00 maçların bitişi 23:55.
