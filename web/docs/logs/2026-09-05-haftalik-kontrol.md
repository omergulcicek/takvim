# Weekly fixture sync — 2026-09-05

- Invoked: 2026-09-05 09:26 (`Europe/Istanbul`)
- Window: 2026-09-05 → 2026-09-19 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.aa.com.tr/tr/spor/galatasaray-basaksehir-deplasmaninda-saranin-frikigiyle-kazandi/4047711 — Başakşehir 2-3 Galatasaray **MS**; Osimhen 16', Torreira 71', Sara 90' / Shomurodov 66' (P), Sanchez 76' (kk); Umut Bozok 79' kırmızı
- https://www.liverpoolfc.com/news/alexander-isak-scores-twice-secure-liverpool-win-ipswich — Ipswich 0-2 Liverpool **FT**; Isak 6', 9'
- https://www.beinsports.com/en-us/soccer/la-liga/articles/real-betis-1-0-real-madrid-mbappe-misses-stoppage-time-penalty-in-dramatic-defeat-2026-09-04 — Real Betis 1-0 Real Madrid **FT**; Parrott 81'
- https://www.aydinlik.com.tr/haber/super-ligde-5-ve-6-hafta-programi-belli-oldu-588519 — TFF 5–6. hafta programı (saatler)
- https://beinsports.com.tr/haber/trendyol-super-ligde-5-ve-6-hafta-programi-aciklandi-iste-derbi-tarihi — teyit: SL 5–6. hafta
- https://www.realmadrid.com/en-US/news/football/first-team/latest-news/el-real-madrid-rayo-vallecano-se-jugara-el-sabado-12-de-septiembre-a-las-21-00-h-12-09-2026 — Real Madrid–Rayo 12 Eyl 21:00; Elche–Real Madrid 15 Eyl 21:30
- https://www.fcbarcelona.com/en/futbol/primer-equipo/calendario — Levante–Barcelona 13 Eyl 16:15; Barcelona–Racing 16 Eyl 21:30
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL fikstür

## Fixture discovery (league + UCL, 2-week window)

| Event                         | Competition | Kickoff (source) | In DB?             | Action                  |
| ----------------------------- | ----------- | ---------------- | ------------------ | ----------------------- |
| Manchester City - Coventry    | Premier Lig | 2026-09-05 17:00 | yes                | none                    |
| Nottingham Forest - Tottenham | Premier Lig | 2026-09-05 17:00 | yes                | none                    |
| Fenerbahçe - Beşiktaş         | Süper Lig   | 2026-09-05 20:00 | yes                | none                    |
| Beşiktaş - Erzurumspor FK     | Süper Lig   | 2026-09-11 20:00 | yes (13 Eyl 12:00) | update kickoff          |
| Konyaspor - Trabzonspor       | Süper Lig   | 2026-09-12 20:00 | yes (13 Eyl 12:00) | update kickoff          |
| Real Madrid - Rayo Vallecano  | La Liga     | 2026-09-12 22:00 | no                 | add fixture             |
| Galatasaray - Kocaelispor     | Süper Lig   | 2026-09-13 20:00 | yes (13 Eyl 12:00) | update kickoff          |
| Levante - Barcelona           | La Liga     | 2026-09-13 17:15 | no                 | add fixture             |
| Gaziantep FK - Fenerbahçe     | Süper Lig   | 2026-09-14 20:00 | yes (13 Eyl 12:00) | update kickoff          |
| Elche - Real Madrid           | La Liga     | 2026-09-15 22:30 | no                 | add fixture             |
| Barcelona - Racing Santander  | La Liga     | 2026-09-16 22:30 | no                 | add fixture             |
| Trabzonspor - Galatasaray     | Süper Lig   | 2026-09-19 20:00 | yes (20 Eyl 12:00) | update kickoff          |
| UCL MD1 (7 maç)               | UCL         | 8–10 Eyl         | yes                | none                    |
| PL (6–19 Eyl takip)           | Premier Lig | çeşitli          | yes                | none                    |
| Fenerbahçe - Eyüpspor         | Süper Lig   | 2026-09-20 17:00 | yes (12:00)        | skipped: outside window |
| Amed SK - Beşiktaş            | Süper Lig   | 2026-09-20 20:00 | yes (12:00)        | skipped: outside window |

## Events checked

| Event                         | Kickoff (DB)      | Kickoff (source) | Status       | Action         |
| ----------------------------- | ----------------- | ---------------- | ------------ | -------------- |
| Başakşehir - Galatasaray      | 2026-09-04 20:00  | 2026-09-04 20:00 | finished 2-3 | update result  |
| Ipswich - Liverpool           | 2026-09-04 22:00  | 2026-09-04 22:00 | finished 0-2 | update result  |
| Real Betis - Real Madrid      | 2026-09-04 22:00  | 2026-09-04 22:00 | finished 1-0 | update result  |
| Manchester City - Coventry    | 2026-09-05 17:00  | 2026-09-05 17:00 | scheduled    | none           |
| Nottingham Forest - Tottenham | 2026-09-05 17:00  | 2026-09-05 17:00 | scheduled    | none           |
| Fenerbahçe - Beşiktaş         | 2026-09-05 20:00  | 2026-09-05 20:00 | scheduled    | none           |
| SL 5. hafta (4 maç)           | 12:00 placeholder | TFF confirmed    | scheduled    | update kickoff |
| Trabzonspor - Galatasaray     | 2026-09-20 12:00  | 2026-09-19 20:00 | scheduled    | update kickoff |

## Migrations

- `supabase/migrations/20260905092600_update_basaksehir_galatasaray_result.sql`
- `supabase/migrations/20260905092601_update_ipswich_liverpool_result.sql`
- `supabase/migrations/20260905092602_update_real_betis_real_madrid_result.sql`
- `supabase/migrations/20260905092603_update_super_lig_week5_week6_kickoffs.sql`
- `supabase/migrations/20260905092604_add_la_liga_september_fixtures.sql` (remote: `add_la_liga_september_md5_md6_fixtures`)

## Skipped

- Bugünün maçları (City–Coventry, Forest–Tottenham, Fenerbahçe–Beşiktaş) — henüz başlamadı
- Fenerbahçe - Eyüpspor / Amed SK - Beşiktaş (20 Eyl) — pencere dışı; TFF saatleri belli, sonraki run'da kickoff güncellenebilir

## Notes

- **3** FT skor (4 Eyl maçları)
- **5** kickoff güncellemesi (SL 5–6. hafta)
- **4** yeni La Liga fikstürü
- Bugün (5 Eyl) 3 takip maçı planlı; sonuçlar maç sonu run'da yazılacak

---

## Run 21:57 TR

- Invoked: 2026-09-05 21:57 (`Europe/Istanbul`)
- Window: 2026-09-05 → 2026-09-19 (+14d)
- Focus: bugünün FT sonuçları (kullanıcı: Fenerbahçe–Beşiktaş 1-2)

## Sources

- https://www.sporx.com/fenerbahce-besiktas-maci-goller-kartlar-5904737 — Fenerbahçe 1-2 Beşiktaş **MS** (İY 1-1); Skriniar 26' / Rıdvan 38', Vlahovic 53'
- https://www.transfermarkt.com/spielbericht/index/spielbericht/4933668 — teyit: Skriniar, Rıdvan Yılmaz, Dušan Vlahović
- https://www.espn.com/soccer/match/_/gameId/401879287/coventry-city-manchester-city — Manchester City 1-0 Coventry **FT**; Haaland 26'
- https://www.espn.com/soccer/match/_/gameId/401878780/tottenham-hotspur-nottingham-forest — Nottingham Forest 0-0 Tottenham **FT**

## Events checked (today)

| Event                         | Kickoff (DB)     | Status       | Action        |
| ----------------------------- | ---------------- | ------------ | ------------- |
| Manchester City - Coventry    | 2026-09-05 17:00 | finished 1-0 | update result |
| Nottingham Forest - Tottenham | 2026-09-05 17:00 | finished 0-0 | update result |
| Fenerbahçe - Beşiktaş         | 2026-09-05 20:00 | finished 1-2 | update result |

## Migrations

- `supabase/migrations/20260905215700_update_fenerbahce_besiktas_result.sql` (remote: `update_fenerbahce_besiktas_derby_result`)
- `supabase/migrations/20260905215701_update_manchester_city_coventry_result.sql`
- `supabase/migrations/20260905215702_update_nottingham_forest_tottenham_result.sql` (remote: `update_nottingham_forest_tottenham_draw`)

## Notes

- Bugünün **3** takip maçının hepsi FT güncellendi.
- Yeni fikstür / kickoff değişikliği yok (sabah run'ında tamamlandı).
