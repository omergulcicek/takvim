# Weekly fixture sync — 2026-10-02

- Invoked: 2026-10-02 12:08 (`Europe/Istanbul`)
- Window: 2026-10-02 → 2026-10-16 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- ESPN `uefa.nations` / `tur.1` / `eng.1` / `esp.1` / `uefa.champions` / `uefa.europa` / `uefa.europa.conf` scoreboard, 1–16 Eki
- https://www.bbc.com/sport/football/live/cvrl6660y8w3t — Danimarka 2-4 Portekiz, FT
- https://www.bbc.com/sport/football/live/c914ddded4ket — Almanya 2-0 Sırbistan, FT
- https://www.beinsports.com/en-us/soccer/uefa-nations-league/articles/all-goals-denmark-vs-portugal-uefa-nations-league-2026-10-01 — gol dakikaları
- https://www.sportschau.de/live-und-ergebnisse/fussball/uefa-europa-league/ma12520572/tsg-hoffenheim_besiktas/liveticker — Hoffenheim–Beşiktaş, 2. hafta, 21:00 CET = 22:00 TR
- https://www.fotmob.com/en-GB/matches/kups-vs-trabzonspor/1303fz — KuPS–Trabzonspor, 15 Eki 16:45 UTC = 19:45 TR
- https://sportlu.com/football-uefa-competitions-champions-europe-and-conference-league/ — Konferans Ligi 1. hafta, 15 Eki

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                       | Competition | Kickoff (source) | In DB? | Action                             |
| ------------------------------------------- | ----------- | ---------------- | ------ | ---------------------------------- |
| LASK Linz - Liverpool                       | UCL 2       | 14 Eki 19:45     | no     | add                                |
| Roma - Real Madrid                          | UCL 2       | 14 Eki 22:00     | no     | add                                |
| Aston Villa - Fenerbahçe                    | UCL 2       | 14 Eki 22:00     | no     | add                                |
| Manchester City - Paris Saint-Germain       | UCL 2       | 14 Eki 22:00     | no     | add                                |
| Hoffenheim - Beşiktaş                       | UEL 2       | 15 Eki 22:00     | no     | add                                |
| KuPS Kuopio - Trabzonspor                   | UECL 1      | 15 Eki 19:45     | no     | add                                |
| UL 3–4 (2–6 Eki)                            | UL          | 21:45 / 19:00    | yes    | none                               |
| Süper Lig / PL / La Liga (9–11 Eki)         | lig         | mevcut saatler   | yes    | none                               |
| UCL 13 Eki (Arsenal, Atlético, Galatasaray) | UCL 2       | 22:00            | yes    | none                               |
| UEL / UECL diğer eşleşmeler                 | —           | —                | —      | skipped: takip kulübü yok          |
| Arjantin / Brezilya hazırlık                | —           | —                | —      | skipped: hazırlık yalnızca Türkiye |

## Events checked

| Event                   | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ----------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Danimarka - Portekiz    | 2026-10-01 21:45 | 2026-10-01 21:45 | finished 2-4 | update result |
| Almanya - Sırbistan     | 2026-10-01 21:45 | 2026-10-01 21:45 | finished 2-0 | update result |
| Belçika - Türkiye       | 2026-10-02 21:45 | 2026-10-02 21:45 | scheduled    | none          |
| Fransa - İtalya         | 2026-10-02 21:45 | 2026-10-02 21:45 | scheduled    | none          |
| Hırvatistan - İngiltere | 2026-10-03 19:00 | 2026-10-03 19:00 | scheduled    | none          |
| İspanya - Çekya         | 2026-10-03 21:45 | 2026-10-03 21:45 | scheduled    | none          |
| Portekiz - Norveç       | 2026-10-04 21:45 | 2026-10-04 21:45 | scheduled    | none          |
| Yunanistan - Almanya    | 2026-10-04 21:45 | 2026-10-04 21:45 | scheduled    | none          |
| Fransa - Belçika        | 2026-10-05 21:45 | 2026-10-05 21:45 | scheduled    | none          |
| İtalya - Türkiye        | 2026-10-05 21:45 | 2026-10-05 21:45 | scheduled    | none          |
| Hırvatistan - İspanya   | 2026-10-06 21:45 | 2026-10-06 21:45 | scheduled    | none          |
| İngiltere - Çekya       | 2026-10-06 21:45 | 2026-10-06 21:45 | scheduled    | none          |
| Galatasaray - Kasımpaşa | 2026-10-09 20:00 | 2026-10-09 20:00 | scheduled    | none          |
| Lig maçları 10–11 Eki   | DB ile aynı      | ESPN ile aynı    | scheduled    | none          |
| UCL 13 Eki              | 2026-10-13 22:00 | 2026-10-13 22:00 | scheduled    | none          |

## Migrations

- `supabase/migrations/20261002121500_update_denmark_portugal_result.sql` — 2-4; Damsgaard 23', Højlund 53'; Cancelo 13', Ramos 25', Vitinha 67', Félix 87' (MCP: `weekly_sync_20261002`)
- `supabase/migrations/20261002121501_update_germany_serbia_result.sql` — 2-0; Bischof 39', Wirtz 61'
- `supabase/migrations/20261002121502_add_oct14_oct15_uefa_fixtures.sql` — 6 yeni maç

## Skipped

- Belçika - Türkiye, Fransa - İtalya — bu akşam 21:45, henüz başlamadı
- 3–13 Eki mevcut maçlar — scheduled, kickoff kaynakla aynı
- Hazırlık (non-TR) — kapsam dışı

## Notes

- **6** eklendi, **2** skor yazıldı, **0** kickoff değişti.
- 1 Eki maçları pencere başlangıcından bir gün önce; FT ve skorsuz oldukları için sonuç yazıldı.
- 22:00 başlayan yeni maçların bitişi 23:55.
