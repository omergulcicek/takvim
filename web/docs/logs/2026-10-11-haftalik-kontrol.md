# Weekly fixture sync — 2026-10-11

- Invoked: 2026-10-11 13:03 (`Europe/Istanbul`)
- Window: 2026-10-11 → 2026-10-25 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-10
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations}/scoreboard — 10–25 Eki fikstür ve FT durumu
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — 25 Eki 14:00 GMT Liverpool–Brighton, Manchester United–Bournemouth
- https://www.liverpoolfc.com/tickets/match/liverpool-v-brighton-and-hove-albion-english-premier-league-20261025 — Liverpool–Brighton 14:00, 25 Eki
- https://www.realmadrid.com/en-US/news/football/first-team/latest-news/el-barcelona-real-madrid-se-jugara-el-domingo-25-de-octubre-a-las-21-00-h-01-09-2026 — Clásico 25 Eki 21:00
- https://www.fcbarcelona.com/en/matches/138374/fc-barcelona-real-madrid-la-liga-2026-2027 — kickoff CET 21:00 (saatler geri alındıktan sonra yerel saat = 20:00 UTC = 23:00 TR)
- https://www.skysports.com/football/chelsea-vs-bournemouth/report/559496 — Chelsea 5-1 Bournemouth **FT**; Henderson 2', 70'; Rogers 3'; João Pedro 46', 67' / Evanilson 51'
- https://fbref.com/en/matches/306c7739/Chelsea-Bournemouth-October-10-2026-Premier-League — aynı skor ve dakikalar
- https://www.bbc.com/sport/football/live/cmpwgrrx0nqpt — Manchester United 1-1 Tottenham **Full time**; Mbeumo 73'; Bentancur kırmızı 78'; Solanke 90+2
- https://www.tottenhamhotspur.com/news/1176346/solanke-secures-dramatic-late-point-for-our-10-men-at-united — Mbeumo 73, Solanke 90+2, Bentancur kırmızı
- https://www.bbc.com/sport/football/live/cm87zxxd55r3t — Barcelona 3-0 Getafe **Full time**; Gordon 2', Gabriel Jesus 30', Koundé 73'
- https://www.fcbarcelona.com/en/football/first-team/news/4590143/fc-barcelona-3-0-getafe-unstoppable — aynı goller
- https://www.bbc.com/sport/football/live/cx30eppd991et — Real Madrid 1-0 Villarreal **Full time**; Diomande 62', Vinícius Júnior kırmızı 72'
- https://h.aa.com.tr/tr/spor/fenerbahce-deplasmanda-3-puani-3-golle-aldi/4084671 — Çaykur Rizespor 0-3 Fenerbahçe, maç bitti; Asensio 12', İrfan Can Kahveci 83', Oğuz Aydın 87'
- https://www.dha.com.tr/spor/caykur-rizespor-fenerbahce-0-3-2960410 — aynı skor; İrfan 83', Oğuz 87'
- https://www.uefa.com/uefanationsleague/news/02a2-1fea7079900a-801b2c5f6c9e-1000--2026-27-uefa-nations-league-league-phase-fixtures-by-team/ — sonraki millî pencere 12–15 Kasım

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event | Competition | Kickoff (source, TR) | In DB? | Action |
| --- | --- | --- | --- | --- |
| Liverpool - Brighton | Premier Lig | 2026-10-25 17:00 | no | add fixture |
| Manchester United - Bournemouth | Premier Lig | 2026-10-25 17:00 | no | add fixture |
| Barcelona - Real Madrid | La Liga | 2026-10-25 23:00 | no | add fixture |
| 11–24 Eki takip lig / UCL / UEL / UECL | — | kaynakla aynı | yes | kickoff değişmedi |
| Millî takım | Uluslar Ligi | — | — | pencerede maç yok; sonraki 12–15 Kasım |

## Events checked

| Event | Kickoff (DB) | Kickoff (source) | Status | Action |
| --- | --- | --- | --- | --- |
| Arsenal 2 - 1 Leeds United | 2026-10-10 14:30 | 2026-10-10 14:30 | finished 2-1 | none (zaten skorlu) |
| Samsunspor 0 - 3 Trabzonspor | 2026-10-10 16:00 | 2026-10-10 16:00 | finished 0-3 | none (zaten skorlu) |
| Chelsea - Bournemouth | 2026-10-10 17:00 | 2026-10-10 17:00 | finished 5-1 | update result |
| Ç. Rizespor - Fenerbahçe | 2026-10-10 19:00 | 2026-10-10 19:00 | finished 0-3 | update result |
| Barcelona - Getafe | 2026-10-10 19:30 | 2026-10-10 19:30 | finished 3-0 | update result |
| Manchester United - Tottenham | 2026-10-10 19:30 | 2026-10-10 19:30 | finished 1-1 | update result |
| Real Madrid - Villarreal | 2026-10-10 22:00 | 2026-10-10 22:00 | finished 1-0 | update result |
| Liverpool - Manchester City | 2026-10-11 18:30 | 2026-10-11 18:30 | scheduled | none |
| Beşiktaş - Kocaelispor | 2026-10-11 19:00 | 2026-10-11 19:00 | scheduled | none |
| 13–24 Eki, 33 maç | DB saati | kaynakla aynı | scheduled | none |

## Migrations

- `supabase/migrations/20261011130300_add_oct25_league_fixtures.sql` — Liverpool–Brighton, Manchester United–Bournemouth (`premier-lig`); Barcelona–Real Madrid (`la-liga`, 23:00, bitiş +2 saat)
- `supabase/migrations/20261011130301_update_chelsea_bournemouth_result.sql`
- `supabase/migrations/20261011130302_update_rizespor_fenerbahce_result.sql`
- `supabase/migrations/20261011130303_update_barcelona_getafe_result.sql`
- `supabase/migrations/20261011130304_update_manchester_united_tottenham_result.sql`
- `supabase/migrations/20261011130305_update_real_madrid_villarreal_result.sql`

## Skipped

- Liverpool–Manchester City, Beşiktaş–Kocaelispor — 11 Eki maçları henüz başlamadı (`scheduled`); skor yazılmadı
- 26 Eki Süper Lig (Ç. Rizespor–Trabzonspor, Beşiktaş–Başakşehir, Galatasaray–Fenerbahçe) — kickoff penceresi 11–25 Eki; dokunulmadı
- Uluslar Ligi 12–15 Kasım — pencere dışı, yeni fikstür yok
- Dünün fikstürü eklenmedi (yalnızca skor)

## Notes

- Added **3**, changed **5** (hepsi dünkü FT skor), kickoff update **0**, unchanged **37**, skipped **2** (bugün başlamamış maç)
- İrfan Can Kahveci dakikası: AA ve DHA **83**, ESPN **83**; Habertürk gol listesinde 84 geçiyor, başlık ve diğer kaynaklar 83. Dakika **83** yazıldı
- Vinícius kırmızısı BBC ve ESPN **72'**; MARCA bir cümlede 73 diyor. **72** yazıldı
- Real Madrid 23:00 bitişi 01:00 (ertesi gün); 00:00 clamp uygulanmadı
- Supabase `apply_migration` bu koşuda bağlı değil; migration dosyaları repoda, uzak veritabanına uygulanmadı
