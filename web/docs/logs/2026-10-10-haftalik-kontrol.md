# Weekly fixture sync — 2026-10-10

- Invoked: 2026-10-10 23:35 (`Europe/Istanbul`)
- Window: 2026-10-10 → 2026-10-24 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://takvim.omergulcicek.com/feeds/{galatasaray,fenerbahce,besiktas,trabzonspor,premier-lig,la-liga,sampiyonlar-ligi,milli-takimlar}.ics — published events
- https://site.api.espn.com/apis/site/v2/sports/soccer/{tur.1,eng.1,esp.1,uefa.champions,uefa.europa,uefa.europa.conf}/scoreboard — kickoff + status, 10–24 Eki
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401878775 — Chelsea 5-1 Bournemouth **FT**
- https://www.skysports.com/football/chelsea-vs-bournemouth/report/559496 — Chelsea **FT** 5-1; Henderson 2', 70'; Rogers 3'; João Pedro 46', 67'; Evanilson 51'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401878773 — Manchester United 1-1 Tottenham **FT**
- https://www.bbc.com/sport/football/live/cmpwgrrx0nqpt — United **Full time** 1-1; Mbeumo 73'; Bentancur red 78'; Solanke 90+2
- https://www.skysports.com/football/manchester-united-vs-tottenham-hotspur/report/559502 — same FT score and incidents
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/esp.1/summary?event=401882853 — Barcelona 3-0 Getafe **FT**
- https://www.bbc.com/sport/football/live/cm87zxxd55r3t — Barcelona **Full time** 3-0; Gordon 2', Gabriel Jesus 30', Koundé 73'
- https://www.fcbarcelona.com/en/football/first-team/news/4590143/fc-barcelona-3-0-getafe-unstoppable — same scorers; Koundé 73'
- https://www.fenerbahce.org/haberler/futbol/2026/10/caykur-rizespor-0-3-fenerbahce — maç sonu 0-3; Asensio 12', İrfan Can Kahveci 84', Oğuz Aydın 87'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/tur.1/summary?event=401888282 — Rizespor 0-3 Fenerbahçe **STATUS_FULL_TIME**
- https://site.api.espn.com/apis/site/v2/sports/soccer/esp.1/scoreboard?dates=20261010 — Real Madrid–Villarreal `STATUS_SECOND_HALF` / `83'` / `completed: false`
- https://www.bbc.co.uk/sport/football/live/c620rnn3zg17t — Arsenal 2-1 Leeds **FT**; Calafiori 62', Bruno Guimarães 70', Justin 55' (DB ile aynı)
- https://beinsports.com.tr/haber/samsunspor-trabzonspor-3 — Samsunspor 0-3 Trabzonspor; Muçi 27', Nwaiwu 38', Dju 40', Kabasakal kırmızı (DB’de skor zaten yazılı)
- https://mobile.aa.com.tr/tr/spor/trendyol-super-ligde-7-16-haftalarin-programi-aciklandi/4057906 — 10. hafta saatleri
- https://www.hurriyet.com.tr/sporarena/super-ligde-7-16-haftalarin-programi-aciklandi-43307638 — 10. hafta teyit
- https://www.uefa.com/uefanationsleague/news/02a2-1fea18abbcbc-456e846509e7-1000--2026-27-uefa-nations-league-all-the-league-phase-fixtures-a/ — sonraki millî pencere 12–17 Kasım

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event | Competition | Kickoff (source) | In DB? | Action |
| --- | --- | --- | --- | --- |
| Samsunspor - Trabzonspor | Süper Lig | 2026-10-10 16:00 | yes, scored | none |
| Arsenal - Leeds United | Premier Lig | 2026-10-10 14:30 | yes, scored | none |
| Chelsea - Bournemouth | Premier Lig | 2026-10-10 17:00 | yes | update result |
| Ç. Rizespor - Fenerbahçe | Süper Lig | 2026-10-10 19:00 | yes | update result |
| Barcelona - Getafe | La Liga | 2026-10-10 19:30 | yes | update result |
| Manchester United - Tottenham | Premier Lig | 2026-10-10 19:30 | yes | update result |
| Real Madrid - Villarreal | La Liga | 2026-10-10 22:00 | yes | skipped: not finished |
| Beşiktaş - Kocaelispor | Süper Lig | 2026-10-11 19:00 | yes | none |
| Liverpool - Manchester City | Premier Lig | 2026-10-11 18:30 | yes | none |
| Galatasaray - Barcelona | UCL | 2026-10-13 22:00 | yes | none |
| Arsenal - Lille | UCL | 2026-10-13 22:00 | yes | none |
| Atlético Madrid - Manchester United | UCL | 2026-10-13 22:00 | yes | none |
| LASK Linz - Liverpool | UCL | 2026-10-14 19:45 | yes | none |
| Roma - Real Madrid | UCL | 2026-10-14 22:00 | yes | none |
| Aston Villa - Fenerbahçe | UCL | 2026-10-14 22:00 | yes | none |
| Manchester City - Paris Saint-Germain | UCL | 2026-10-14 22:00 | yes | none |
| KuPS Kuopio - Trabzonspor | Konferans Ligi | 2026-10-15 19:45 | yes | none |
| Hoffenheim - Beşiktaş | Avrupa Ligi | 2026-10-15 22:00 | yes | none |
| Gençlerbirliği - Galatasaray | Süper Lig | 2026-10-17 16:00 | yes | none |
| Everton - Chelsea | Premier Lig | 2026-10-17 14:30 | yes | none |
| Brentford - Liverpool | Premier Lig | 2026-10-17 17:00 | yes | none |
| Manchester City - Ipswich | Premier Lig | 2026-10-17 17:00 | yes | none |
| Fenerbahçe - Alanyaspor | Süper Lig | 2026-10-17 19:00 | yes | none |
| Real Betis - Barcelona | La Liga | 2026-10-17 19:30 | yes | none |
| Leeds United - Manchester United | Premier Lig | 2026-10-18 16:00 | yes | none |
| Nottingham Forest - Arsenal | Premier Lig | 2026-10-18 18:30 | yes | none |
| Real Madrid - Sevilla | La Liga | 2026-10-18 22:00 | yes | none |
| Trabzonspor - Beşiktaş | Süper Lig | 2026-10-19 20:00 | yes | none |
| Tottenham - Coventry | Premier Lig | 2026-10-19 22:00 | yes | none |
| Fenerbahçe - Slavia Prague | UCL | 2026-10-20 19:45 | yes | none |
| Liverpool - Villarreal | UCL | 2026-10-20 22:00 | yes | none |
| Manchester City - AEK Athens | UCL | 2026-10-20 22:00 | yes | none |
| Paris Saint-Germain - Barcelona | UCL | 2026-10-20 22:00 | yes | none |
| Como - Manchester United | UCL | 2026-10-21 19:45 | yes | none |
| Lille - Galatasaray | UCL | 2026-10-21 19:45 | yes | none |
| Bayern Münih - Arsenal | UCL | 2026-10-21 22:00 | yes | none |
| Real Madrid - RB Leipzig | UCL | 2026-10-21 22:00 | yes | none |
| Trabzonspor - Heart of Midlothian | Konferans Ligi | 2026-10-22 19:45 | yes | none |
| Beşiktaş - Crystal Palace | Avrupa Ligi | 2026-10-22 22:00 | yes | none |
| Aston Villa - Manchester City | Premier Lig | 2026-10-24 14:30 | yes | none |
| Arsenal - Everton | Premier Lig | 2026-10-24 17:00 | yes | none |
| Chelsea - Tottenham | Premier Lig | 2026-10-24 19:30 | yes | none |
| Konyaspor - Galatasaray | Süper Lig | 2026-10-30 20:00 | yes (1 Kas 12:00) | update kickoff |
| Fenerbahçe - Göztepe | Süper Lig | 2026-10-31 19:00 | yes (1 Kas 12:00) | update kickoff |
| Trabzonspor - Gaziantep FK | Süper Lig | 2026-11-01 16:00 | yes (1 Kas 12:00) | update kickoff |
| Kasımpaşa - Beşiktaş | Süper Lig | 2026-11-01 19:00 | yes (1 Kas 12:00) | update kickoff |
| Tracked national teams | Uluslar Ligi | 12–17 Kas | no | skipped: outside window |

No confirmed in-window fixture was missing from the DB. UEL/UECL outside GS/FB/BJK/TS and UCL pairings without a tracked club were not imported.

## Events checked

| Event | Kickoff (DB) | Kickoff (source) | Status | Action |
| --- | --- | --- | --- | --- |
| Samsunspor 0 - 3 Trabzonspor | 2026-10-10 16:00 | 2026-10-10 16:00 | finished 0-3 | none (already scored) |
| Arsenal 2 - 1 Leeds United | 2026-10-10 14:30 | 2026-10-10 14:30 | finished 2-1 | none (already scored) |
| Chelsea - Bournemouth | 2026-10-10 17:00 | 2026-10-10 17:00 | finished 5-1 | update result |
| Ç. Rizespor - Fenerbahçe | 2026-10-10 19:00 | 2026-10-10 19:00 | finished 0-3 | update result |
| Barcelona - Getafe | 2026-10-10 19:30 | 2026-10-10 19:30 | finished 3-0 | update result |
| Manchester United - Tottenham | 2026-10-10 19:30 | 2026-10-10 19:30 | finished 1-1 | update result |
| Real Madrid - Villarreal | 2026-10-10 22:00 | 2026-10-10 22:00 | live, Second Half 83' | skipped: not finished |
| Remaining in-window fixtures above | matches source | matches source | scheduled | none |
| Week-10 placeholders | 2026-11-01 12:00 | 30 Eki–1 Kas confirmed | scheduled | update kickoff |

## Migrations

- `supabase/migrations/20261010234200_update_chelsea_bournemouth_result.sql` — Chelsea 5-1 Bournemouth
- `supabase/migrations/20261010234201_update_rizespor_fenerbahce_result.sql` — Ç. Rizespor 0-3 Fenerbahçe
- `supabase/migrations/20261010234202_update_manchester_united_tottenham_result.sql` — Manchester United 1-1 Tottenham
- `supabase/migrations/20261010234203_update_barcelona_getafe_result.sql` — Barcelona 3-0 Getafe
- `supabase/migrations/20261010234204_update_super_lig_week10_kickoffs.sql` — 10. hafta placeholder kickoff

`apply_migration` did not run: the Supabase MCP server is not connected in this run. SQL is in the repo only.

## Skipped

- Real Madrid - Villarreal — `skipped: not finished` (ESPN `Second Half`, `83'`, `completed: false`, score 1-0). Kickoff + 2 hours had not passed.
- Uluslar Ligi MD5/MD6 (Türkiye, İspanya, Fransa, İngiltere, Portekiz, Almanya) — 12–17 Kasım, pencere dışı. Arjantin / Brezilya için bu pencerede teyitli maç yok.
- Süper Lig 11. hafta ve sonrası (`2026-11-08` 12:00 placeholder’lar) — sezonun geri kalanı; yalnızca bir sonraki placeholder bloğu (10. hafta) güncellendi.
- Yeni fikstür — penceredeki takip maçları zaten DB’de.

## Notes

- **4** FT results, **4** kickoff corrections, **0** new fixtures.
- İrfan Can Kahveci minute: Fenerbahçe resmi özeti **84'**. ESPN key events list **83'**. Title uses the club goal list (12', 84', 87').
- Gabriel Jesus: BBC / ESPN / La Liga **30'**. beIN goal clip text said 29'; description uses 30'.
- Arsenal 2-1 Leeds and Samsunspor 0-3 Trabzonspor were already scored and match the FT sources; not overwritten.
- Henderson 70' is a direct free kick, not a penalty, so it has no `(Penaltı)` mark.
- Bentancur 78' is a red card, not a goal.
