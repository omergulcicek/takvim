# Weekly fixture sync — 2026-09-19

- Invoked: 2026-09-19 01:28 (`Europe/Istanbul`)
- Window: 2026-09-19 → 2026-10-03 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401879275 — Brentford 3-0 Chelsea **FT**; Anthony 61', Thiago 83', Carvalho 90+4'
- https://www.espn.com/soccer/match/_/gameId/401879275 — skor / goller teyit
- https://fixturedownload.azurewebsites.net/results/nations-league-2026 — UL 3. hafta UTC saatleri
- https://www.turkiyegazetesi.com.tr/haberler/turkiye-italya-maci-ne-zaman-202627-uefa-uluslar-a-ligi-1-grup-fiksturu-duyuruldu-1781908 — Belçika–Türkiye / Fransa–İtalya **21:45 TSİ**

## Fixture discovery

| Event                   | Competition | Kickoff TR   | In DB? | Action                 |
| ----------------------- | ----------- | ------------ | ------ | ---------------------- |
| Brentford - Chelsea     | PL          | 18 Eyl 22:00 | yes    | update result          |
| Fransa - İtalya         | UL 3        | 2 Eki 21:45  | no     | add                    |
| Belçika - Türkiye       | UL 3        | 2 Eki 21:45  | no     | add                    |
| Hırvatistan - İngiltere | UL 3        | 3 Eki 19:00  | no     | add                    |
| İspanya - Çekya         | UL 3        | 3 Eki 21:45  | no     | add                    |
| 19 Eyl kulüp maçları    | lig         | çeşitli      | yes    | none (henüz başlamadı) |

## Events checked

| Event                                              | Status       | Action        |
| -------------------------------------------------- | ------------ | ------------- |
| Brentford - Chelsea                                | finished 3-0 | update result |
| Tottenham / Arsenal / City / TS–GS / Sevilla–Barça | scheduled    | none          |

## Migrations

- `supabase/migrations/20260919012800_update_brentford_chelsea_result.sql` (MCP: `update_brentford_chelsea_pl_result`)
- `supabase/migrations/20260919012801_add_nations_league_matchday3_window.sql`

## Skipped

- Bugünün maçları (19 Eyl) — henüz kickoff yok
- İtalya – Türkiye (5 Eki) — pencere dışı
- Hazırlık (non-TR) — kapsam dışı

## Notes

- **1** FT skor; **4** yeni Uluslar Ligi maçı
- Hırvatistan–İngiltere 18:00 CET → 19:00 TR
