# Weekly fixture sync — 2026-10-06

- Invoked: 2026-10-06 13:39 (`Europe/Istanbul`)
- Window: 2026-10-06 → 2026-10-20 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- ESPN `uefa.nations` / `tur.1` / `eng.1` / `esp.1` / `uefa.champions` / `uefa.europa` / `uefa.europa.conf` scoreboard, 5–6 ve 16–20 Eki
- https://www.foxsports.com/soccer/nations-league-france-vs-belgium-oct-05-2026-game-boxscore-689023 — Fransa 4-1 Belçika, FT; Doué 77', Cherki 81', Olise 88' ve 90', Lukébakio 35'
- https://www.uefa.com/uefanationsleague/news/02aa-21bfd72342bb-2092e5a5aba6-1000--uefa-nations-league-matchday-4-highlights-france-and-italy-r/ — Fransa 4-1, İtalya 3-1
- https://sportstar.thehindu.com/football/international-football/france-vs-belgium-italy-v-turkiye-nations-league-scores-goals-match-details/article71549798.ece — dakikalar
- https://www.cbssports.com/soccer/news/uefa-champions-league-schedule-real-madrid-inter-liverpool-atletico-madrid-matchday-1/ — UCL 3. hafta, 20 Eki
- https://www.transfermarkt.com/spielbericht/index/spielbericht/5035954 — Fenerbahçe–Slavia Prague, 20 Eki 18:45 CEST

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                                       | Competition | Kickoff (source) | In DB? | Action       |
| ----------------------------------------------------------- | ----------- | ---------------- | ------ | ------------ |
| Fenerbahçe - Slavia Prague                                  | UCL 3       | 20 Eki 19:45     | no     | add          |
| Liverpool - Villarreal                                      | UCL 3       | 20 Eki 22:00     | no     | add          |
| Manchester City - AEK Athens                                | UCL 3       | 20 Eki 22:00     | no     | add          |
| Paris Saint-Germain - Barcelona                             | UCL 3       | 20 Eki 22:00     | no     | add          |
| Hırvatistan - İspanya                                       | UL 4        | 6 Eki 21:45      | yes    | none         |
| İngiltere - Çekya                                           | UL 4        | 6 Eki 21:45      | yes    | none         |
| 9–19 Eki lig / UCL 2 / UEL / UECL                           | —           | mevcut saatler   | yes    | none         |
| UCL 21 Eki (Lille–GS, Bayern–Arsenal, Real Madrid, Man Utd) | UCL 3       | —                | —      | pencere dışı |

## Events checked

| Event                 | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Fransa - Belçika      | 2026-10-05 21:45 | 2026-10-05 21:45 | finished 4-1 | update result |
| İtalya - Türkiye      | 2026-10-05 21:45 | 2026-10-05 21:45 | finished 3-1 | update result |
| Hırvatistan - İspanya | 2026-10-06 21:45 | 2026-10-06 21:45 | scheduled    | none          |
| İngiltere - Çekya     | 2026-10-06 21:45 | 2026-10-06 21:45 | scheduled    | none          |
| 9–19 Eki              | DB ile aynı      | ESPN ile aynı    | scheduled    | none          |

## Migrations

- `supabase/migrations/20261006133900_update_france_belgium_result.sql` — 4-1 (MCP: `weekly_sync_20261006`)
- `supabase/migrations/20261006133901_update_italy_turkey_result.sql` — 3-1; Şimşir 61'
- `supabase/migrations/20261006133902_add_ucl_matchday3_oct20.sql` — 4 UCL maçı

## Skipped

- Hırvatistan - İspanya, İngiltere - Çekya — bu akşam 21:45, henüz başlamadı
- UCL 21 Eki — pencere dışı
- Hazırlık (non-TR) — kapsam dışı

## Notes

- **4** eklendi, **2** skor yazıldı, **0** kickoff değişti.
- 5 Eki maçları dün HT idi; bugün FT.
- 22:00 maçların bitişi 23:55.
