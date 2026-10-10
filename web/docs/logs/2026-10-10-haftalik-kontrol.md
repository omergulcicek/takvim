# Weekly fixture sync — 2026-10-10

- Invoked: 2026-10-10 21:13 (`Europe/Istanbul`)
- Window: 2026-10-10 → 2026-10-24 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20261010 — Premier Lig 10 Eki: Arsenal–Leeds ve Chelsea–Bournemouth **FT**; Manchester United–Tottenham **Second Half** (`completed: false`)
- https://www.skysports.com/football/chelsea-vs-bournemouth/report/559496 — Chelsea 5-1 Bournemouth **FT**; Henderson 2', 70'; Rogers 3'; João Pedro 46', 67'; Evanilson 51'
- https://www.skysports.com/football/arsenal-vs-leeds-united/report/559494 — Arsenal 2-1 Leeds **FT**; Calafiori 62', Guimarães 70' / Justin 55' (DB ile aynı)
- https://www.bbc.co.uk/sport/football/live/c620rnn3zg17t — Arsenal 2-1 Leeds **Full time**
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/tur.1/scoreboard?dates=20261010 — Samsunspor–Trabzonspor ve Ç. Rizespor–Fenerbahçe **FT** (`completed: true`)
- https://www.aksam.com.tr/spor/mac-sonucu-caykur-rizespor-0-3-fenerbahce/haber-1705111 — maç sonucu 0-3; Asensio 12', İrfan Can Kahveci 83', Oğuz Aydın 87'
- https://www.aspor.com.tr/spor-toto-super-lig/2026/10/10/fenerbahceden-rizede-3-gollu-zafer-asensio-siftah-yapti — aynı 0-3 ve goller (güncelleme 21:11 TR)
- https://www.haberturk.com/spor/super-lig-de-karadeniz-derbisi-samsunspor-trabzonspor-muhtemel-11-ler-3918633 — Samsunspor 0-3 Trabzonspor maç sonucu; Muçi, Nwaiwu, Franculino; Kabasakal kırmızı
- https://www.sabah.com.tr/spor/futbol/2026/10/10/son-dakika-trabzonspor-farkli-kazandi-samsunspor-evinde-maglup — aynı skor; dakika dökümü Muçi 27'
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — 10–24 Eki kickoff (yazılmayan saat = 15:00 UK)
- https://www.fcbarcelona.com/en/matches/138367/real-betis-fc-barcelona-la-liga-2026-2027 — Real Betis–Barcelona 17 Eki 18:30 CEST
- https://www.realmadrid.com/en-US/news/football/first-team/latest-news/el-calendario-del-real-madrid-en-octubre-24-09-2026 — Villarreal 10 Eki, Roma 14 Eki, Sevilla 18 Eki, Leipzig 21 Eki; hepsi 21:00 CEST
- https://www.uefa.com/uefachampionsleague/news/02a8-2174c9e9019d-f909a77bd77a-1000--2026-27-champions-league-all-the-league-phase-fixtures-a/ — UCL 2. ve 3. hafta; 21:00 CET, belirtilenler 18:45
- https://www.fotmob.com/matches/hoffenheim-vs-besiktas/2sy5kr — Hoffenheim–Beşiktaş 15 Eki 19:00 UTC
- https://www.fotmob.com/matches/trabzonspor-vs-heart-midlothian/36iel6 — Trabzonspor–Hearts 22 Eki 16:45 UTC
- https://www.cpfc.co.uk/match/2685562/men/uefa-europa-league/2026-27/be-ikta--vs-crystal-palace-2026-10-22/ — Beşiktaş–Crystal Palace 22 Eki 19:00 UTC
- https://www.konhaber.com/spor/trendyol_super_lig_de_7_16_haftalarin_programi_aciklandi-2009171h — TFF 7–16. hafta (AA)
- https://www.uefa.com/uefanationsleague/news/02a2-1fea18abbcbc-456e846509e7-1000--2026-27-uefa-nations-league-all-the-league-phase-fixtures-a/ — sonraki millî pencere 12 Kasım

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event | Competition | Kickoff (source, TR) | In DB? | Action |
| --- | --- | --- | --- | --- |
| Arsenal - Leeds United | PL | 10 Eki 14:30 | yes, scored 2-1 | none (matches source) |
| Chelsea - Bournemouth | PL | 10 Eki 17:00 | yes, unscored | update result |
| Samsunspor - Trabzonspor | SL | 10 Eki 16:00 | yes, scored 0-3 | none (matches source) |
| Ç. Rizespor - Fenerbahçe | SL | 10 Eki 19:00 | yes, unscored | update result |
| Manchester United - Tottenham | PL | 10 Eki 19:30 | yes | skipped: not finished |
| Barcelona - Getafe | La Liga | 10 Eki 19:30 | yes | skipped: not finished |
| Real Madrid - Villarreal | La Liga | 10 Eki 22:00 | yes | none (scheduled) |
| Liverpool - Manchester City | PL | 11 Eki 18:30 | yes | none |
| Beşiktaş - Kocaelispor | SL | 11 Eki 19:00 | yes | none |
| Arsenal - Lille | UCL | 13 Eki 22:00 | yes | none |
| Atlético Madrid - Manchester United | UCL | 13 Eki 22:00 | yes | none |
| Galatasaray - Barcelona | UCL | 13 Eki 22:00 | yes | none |
| LASK Linz - Liverpool | UCL | 14 Eki 19:45 | yes | none |
| Roma - Real Madrid | UCL | 14 Eki 22:00 | yes | none |
| Aston Villa - Fenerbahçe | UCL | 14 Eki 22:00 | yes | none |
| Manchester City - Paris Saint-Germain | UCL | 14 Eki 22:00 | yes | none |
| KuPS Kuopio - Trabzonspor | UECL | 15 Eki 19:45 | yes | none |
| Hoffenheim - Beşiktaş | UEL | 15 Eki 22:00 | yes | none |
| Everton - Chelsea | PL | 17 Eki 14:30 | yes | none |
| Brentford - Liverpool | PL | 17 Eki 17:00 | yes | none |
| Manchester City - Ipswich | PL | 17 Eki 17:00 | yes | none |
| Gençlerbirliği - Galatasaray | SL | 17 Eki 16:00 | yes | none |
| Fenerbahçe - Alanyaspor | SL | 17 Eki 19:00 | yes | none |
| Real Betis - Barcelona | La Liga | 17 Eki 19:30 | yes | none |
| Leeds United - Manchester United | PL | 18 Eki 16:00 | yes | none |
| Nottingham Forest - Arsenal | PL | 18 Eki 18:30 | yes | none |
| Real Madrid - Sevilla | La Liga | 18 Eki 22:00 | yes | none |
| Trabzonspor - Beşiktaş | SL | 19 Eki 20:00 | yes | none |
| Tottenham - Coventry | PL | 19 Eki 22:00 | yes | none |
| Fenerbahçe - Slavia Prague | UCL | 20 Eki 19:45 | yes | none |
| Liverpool - Villarreal | UCL | 20 Eki 22:00 | yes | none |
| Manchester City - AEK Athens | UCL | 20 Eki 22:00 | yes | none |
| Paris Saint-Germain - Barcelona | UCL | 20 Eki 22:00 | yes | none |
| Como - Manchester United | UCL | 21 Eki 19:45 | yes | none |
| Lille - Galatasaray | UCL | 21 Eki 19:45 | yes | none |
| Bayern Münih - Arsenal | UCL | 21 Eki 22:00 | yes | none |
| Real Madrid - RB Leipzig | UCL | 21 Eki 22:00 | yes | none |
| Trabzonspor - Heart of Midlothian | UECL | 22 Eki 19:45 | yes | none |
| Beşiktaş - Crystal Palace | UEL | 22 Eki 22:00 | yes | none |
| Aston Villa - Manchester City | PL | 24 Eki 14:30 | yes | none |
| Arsenal - Everton | PL | 24 Eki 17:00 | yes | none |
| Chelsea - Tottenham | PL | 24 Eki 19:30 | yes | none |
| Liverpool - Brighton | PL | 24 Eki veya 25 Eki | no | skipped: ambiguous source |
| Manchester United - Bournemouth | PL | 25 Eki 17:00 | — | outside window |
| Barcelona - Real Madrid | La Liga | 25 Eki 22:00 | — | outside window |
| Konyaspor - Galatasaray | SL | 30 Eki 20:00 | yes (1 Kas 12:00) | update kickoff |
| Fenerbahçe - Göztepe | SL | 31 Eki 19:00 | yes (1 Kas 12:00) | update kickoff |
| Trabzonspor - Gaziantep FK | SL | 1 Kas 16:00 | yes (1 Kas 12:00) | update kickoff |
| Kasımpaşa - Beşiktaş | SL | 1 Kas 19:00 | yes (1 Kas 12:00) | update kickoff |
| Uluslar Ligi / hazırlık (8 NT) | NT | — | — | none in window (next 12 Kas) |

## Events checked

| Event | Kickoff (DB) | Kickoff (source) | Status | Action |
| --- | --- | --- | --- | --- |
| Arsenal 2 - 1 Leeds United | 10 Eki 14:30 | 10 Eki 14:30 | finished 2-1 | none (already scored; Sky + BBC agree) |
| Chelsea - Bournemouth | 10 Eki 17:00 | 10 Eki 17:00 | finished 5-1 | update result |
| Samsunspor 0 - 3 Trabzonspor | 10 Eki 16:00 | 10 Eki 16:00 | finished 0-3 | none (already scored; ESPN + Habertürk/Sabah agree) |
| Ç. Rizespor - Fenerbahçe | 10 Eki 19:00 | 10 Eki 19:00 | finished 0-3 | update result |
| Manchester United - Tottenham | 10 Eki 19:30 | 10 Eki 19:30 | live 90'+2' | skipped: not finished |
| Barcelona - Getafe | 10 Eki 19:30 | 10 Eki 19:30 | live 82' | skipped: not finished |
| Real Madrid - Villarreal | 10 Eki 22:00 | 10 Eki 22:00 | scheduled | none |
| Remaining in-window fixtures (34) | matches source | matches source | scheduled | none |

Checked at 21:19 TR. Manchester United was still `STATUS_SECOND_HALF` / `completed: false`. Barcelona was still `STATUS_SECOND_HALF` at 82'.

## Migrations

- `supabase/migrations/20261010212000_update_rizespor_fenerbahce_result.sql` — `Ç. Rizespor 0 - 3 Fenerbahçe`; Asensio 12', İrfan Can Kahveci 83', Oğuz Aydın 87'
- `supabase/migrations/20261010212100_update_chelsea_bournemouth_result.sql` — `Chelsea 5 - 1 Bournemouth`; Henderson 2', 70'; Rogers 3'; João Pedro 46', 67' / Evanilson 51'
- `supabase/migrations/20261010212200_update_super_lig_week10_kickoffs.sql` — 10. hafta placeholder 12:00 → TFF saati (pencerenin hemen dışı)

Remote `apply_migration` bu oturumda yok (Supabase MCP bağlı değil). Publishable anahtar satır döndürmeden UPDATE’i reddetti (RLS). Uzak Takvim veritabanı bu koşuda değişmedi.

## Skipped

- Manchester United - Tottenham — not finished (Second Half, 90'+2', `completed: false` at 21:19 TR)
- Barcelona - Getafe — not finished (Second Half, 82', `completed: false` at 21:19 TR)
- Liverpool - Brighton — ambiguous source (premierleague.com lists both Saturday 24 October, untimed, and Sunday 25 October 14:00 GMT)
- Manchester United - Bournemouth, Barcelona - Real Madrid, Süper Lig 26 Eki — outside the window
- Süper Lig 11–16. hafta `12:00` placeholders — rest of season, not the next week only
- Millî takım — no confirmed fixture inside the window; next Nations League dates are 12 November
- Galatasaray - Kasımpaşa (9 Eki) — kickoff before the window; result sync not in scope

## Notes

- Added: 0. Result migrations: 2. Kickoff migrations: 4 events in one file. Already-correct scored events left as-is: Arsenal 2-1 Leeds, Samsunspor 0-3 Trabzonspor.
- Samsunspor headline copies say Muçi 28'; the minute-by-minute (Sabah) and ESPN say 27'. DB already has 27' plus Nwaiwu 38', Djú 40', Kabasakal 43' red. Not overwritten.
- Henderson 70' is a free-kick, not a penalty, so no `(Penaltı)` tag.
- Week 10 kickoffs are existing `12:00` rows whose confirmed TFF time sits just past 24 October (30 Eki–1 Kas). Weeks 11–16 were left on the placeholder.
- UK times in October before 25 October are BST (TR = UK + 2). CEST kickoffs are TR = CEST + 1.
