# Weekly fixture sync — 2026-09-06

- Invoked: 2026-09-06 21:54 (`Europe/Istanbul`)
- Window: 2026-09-06 → 2026-09-20 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.skysports.com/football/news/11095/13565582/everton-2-2-man-utd-ainsley-maitland-niles-scores-outrageous-stoppage-time-equaliser-to-earn-dramatic-draw — Everton 2-2 Man Utd **FT**; George 83', Maitland-Niles 90+5' / Mbeumo 46', Sesko 88'
- https://apnews.com/article/premier-league-scores-arsenal-chelsea-everton-man-united-48ede14af4b89d9a8e224f2bfb26e83b — Arsenal 2-1 Chelsea **FT**; Havertz 25', Odegaard 50' / Rogers 2'; teyit Everton 2-2
- https://www.espn.com.au/football/report/_/gameId/401882888 — Valencia 0-5 Barcelona **FT**; Yamal 6', 84'; Fermín 22'; Raphinha 50'; Pedri 79'
- https://www.cnnturk.com/spor/futbol/live-trabzonspor-genclerbirligi-maci-canli-anlatim-firtina-3-puan-istiyor-3463533 — Trabzonspor 5-0 Gençlerbirliği **MS**; Onuachu 5', 22'; Salah 14' (P); Muçi 59'; Franculino Djú 79'
- https://www.sporx.com/trabzonspor-genclerbirligi-maci-goller-kartlar-5904731 — teyit 5-0 MS
- https://www.milligazete.com.tr/super-lig-5-hafta-maclari-ne-zaman-galatasaray-kiminle-oynayacak-fenerbahce-maci-hangi-gun-besiktas-maci-saat-kacta — SL 6. hafta: FB–Eyüpspor 20 Eyl 17:00; Amed–BJK 20 Eyl 20:00
- https://www.realmadrid.com/en-US/news/football/first-team/latest-news/el-real-madrid-rayo-vallecano-se-jugara-el-sabado-12-de-septiembre-a-las-21-00-h-12-09-2026 — Atlético–Real Madrid 20 Eyl 16:15 İspanya

## Fixture discovery (league + UCL, 2-week window)

| Event                         | Competition | Kickoff (source) | In DB?      | Action         |
| ----------------------------- | ----------- | ---------------- | ----------- | -------------- |
| Everton - Manchester United   | Premier Lig | 2026-09-06 16:00 | yes         | none           |
| Valencia - Barcelona          | La Liga     | 2026-09-06 17:15 | yes         | none           |
| Arsenal - Chelsea             | Premier Lig | 2026-09-06 18:30 | yes         | none           |
| Trabzonspor - Gençlerbirliği  | Süper Lig   | 2026-09-06 20:00 | yes         | none           |
| UCL MD1 (7 maç)               | UCL         | 8–10 Eyl         | yes         | none           |
| SL / PL / La Liga (11–19 Eyl) | çeşitli     | çeşitli          | yes         | none           |
| Fenerbahçe - Eyüpspor         | Süper Lig   | 2026-09-20 17:00 | yes (12:00) | update kickoff |
| Amed SK - Beşiktaş            | Süper Lig   | 2026-09-20 20:00 | yes (12:00) | update kickoff |
| Atlético Madrid - Real Madrid | La Liga     | 2026-09-20 17:15 | no          | add fixture    |
| Bournemouth - Liverpool       | Premier Lig | 2026-09-20 16:00 | yes         | none           |
| Fulham - Manchester United    | Premier Lig | 2026-09-20 18:30 | yes         | none           |

## Events checked

| Event                        | Kickoff (DB)     | Kickoff (source) | Status       | Action         |
| ---------------------------- | ---------------- | ---------------- | ------------ | -------------- |
| Everton - Manchester United  | 2026-09-06 16:00 | 2026-09-06 16:00 | finished 2-2 | update result  |
| Valencia - Barcelona         | 2026-09-06 17:15 | 2026-09-06 17:15 | finished 0-5 | update result  |
| Arsenal - Chelsea            | 2026-09-06 18:30 | 2026-09-06 18:30 | finished 2-1 | update result  |
| Trabzonspor - Gençlerbirliği | 2026-09-06 20:00 | 2026-09-06 20:00 | finished 5-0 | update result  |
| Fenerbahçe - Eyüpspor        | 2026-09-20 12:00 | 2026-09-20 17:00 | scheduled    | update kickoff |
| Amed SK - Beşiktaş           | 2026-09-20 12:00 | 2026-09-20 20:00 | scheduled    | update kickoff |
| UCL / diğer pencere maçları  | çeşitli          | eşleşiyor        | scheduled    | none           |

## Migrations

- `supabase/migrations/20260906215400_update_everton_manchester_united_result.sql`
- `supabase/migrations/20260906215401_update_valencia_barcelona_result.sql`
- `supabase/migrations/20260906215402_update_arsenal_chelsea_result.sql`
- `supabase/migrations/20260906215403_update_trabzonspor_genclerbirligi_result.sql`
- `supabase/migrations/20260906215404_update_super_lig_week6_sep20_kickoffs.sql`
- `supabase/migrations/20260906215405_add_atletico_real_madrid.sql` (remote: `add_atletico_madrid_real_madrid_derby`)

## Skipped

- _(none for today)_

## Notes

- **4** FT skor (bugünün tüm takip maçları)
- **2** kickoff güncellemesi (SL 6. hafta, 20 Eyl)
- **1** yeni La Liga fikstürü (Madrid derbisi)
- Sonraki yoğun gün: UCL MD1 (8–10 Eyl)
