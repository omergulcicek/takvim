# Weekly fixture sync — 2026-10-15

- Invoked: 2026-10-15 02:02 (`Europe/Istanbul`)
- Window: 2026-10-15 → 2026-10-29 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-14
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations,fifa.friendly,eng.fa,eng.league_cup,esp.copa_del_rey}/scoreboard?dates=YYYYMMDD — 15–29 Eki fikstür; 14 Eki sonuç
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915415 — LASK Linz 3-6 Liverpool, `detail: FT`, `description: Full Time`, `completed: true`, `state: post`; özet saati boş
- https://www.bbc.co.uk/sport/football/live/cmqjnvyn28k4t — **Full time**; Ljubičić 63', Flecker 74'/77', Araujo 22', Barcola 24'/37'/66', Frimpong 51', Koumas 72'
- https://www.theguardian.com/football/match/2026/oct/14/lask-v-liverpool — aynı skor ve dakikalar
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915409 — Aston Villa 6-0 Fenerbahçe, `FT` / `Full Time`, `completed: true`
- https://www.bbc.co.uk/sport/football/live/cmp3gj7gz9kwt — **Full time**; Manzambi 12', Jackson 31'/39', Barkley 68' pen / 72', Abraham 90'
- https://www.dha.com.tr/spor/aston-villa-fenerbahce-6-0-2962952 — maç 6-0 bitti; Barkley penaltı 68', Barkley 72', Abraham 90'
- https://next.gc.avfcservices.co.uk/news/2026/october/14/postmatch-vote-for-your-player-of-the-match-against-fenerbahce-/ — kulüp sayfası **FT** 6-0
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915407 — Manchester City 2-4 Paris Saint-Germain, `FT` / `Full Time`, `completed: true`
- https://www.bbc.com/sport/football/live/c6z9z9459900t — **Full time**; Haaland 53'/75', Doué 13', Dembélé 15', Vitinha 32', Akliouche 62'
- https://www.psg.fr/en/content/breathless-match-report-manchester-city-paris-saint-germain-uefa-champions-league-2026-2027 — 4-2; Doué, Dembélé 15', Vitinha 32', Akliouche 62', Haaland 53'/75'
- https://datencenter.dfb.de/datencenter/champions-league/2026-2027/spieltag/manchester-city-paris-saint-germain-2429544 — 2:4; aynı dakikalar, Akliouche 62'
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915414 — Roma 3-4 Real Madrid, `FT` / `Full Time`, `completed: true`
- https://www.skysports.com/football/roma-vs-real-madrid/stats/577630 — **FT Full Time**; de Roon 20', Malen 51'/57', Mbappé 25', Espí 83', Endrick 85', Rüdiger 90'
- https://www.realmadrid.com/en-US/news/football/first-team/reports/cronica-roma-real-madrid-14-10-2026 — **Finished** 3-4; Espí, Endrick, Rüdiger
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261015 — 15–29 Eki Uluslar Ligi ve hazırlık skor tabloları boş

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                  | Competition             | Kickoff (source, TR) | In DB? | Action                                 |
| -------------------------------------- | ----------------------- | -------------------- | ------ | -------------------------------------- |
| 15–26 Eki takip lig / UCL / UEL / UECL | —                       | kaynakla aynı        | yes    | kickoff değişmedi                      |
| 27–29 Eki                              | lig / UCL / UEL / UECL  | —                    | —      | maç yok                                |
| Fleetwood Town - Arsenal               | Lig Kupası              | 2026-10-27 23:00     | no     | skipped: domestic cup                  |
| Manchester City - Brighton             | Lig Kupası              | 2026-10-28 22:30     | no     | skipped: domestic cup                  |
| Liverpool - Chelsea                    | Lig Kupası              | 2026-10-28 23:00     | no     | skipped: domestic cup                  |
| Millî takım                            | Uluslar Ligi / hazırlık | —                    | —      | pencerede maç yok; sonraki 12–17 Kasım |

## Events checked

| Event                                 | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ------------------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| LASK Linz - Liverpool                 | 2026-10-14 19:45 | 2026-10-14 19:45 | finished 3-6 | update result |
| Aston Villa - Fenerbahçe              | 2026-10-14 22:00 | 2026-10-14 22:00 | finished 6-0 | update result |
| Manchester City - Paris Saint-Germain | 2026-10-14 22:00 | 2026-10-14 22:00 | finished 2-4 | update result |
| Roma - Real Madrid                    | 2026-10-14 22:00 | 2026-10-14 22:00 | finished 3-4 | update result |
| 15–26 Eki, 32 maç                     | DB saati         | kaynakla aynı    | scheduled    | none          |

## Migrations

- `supabase/migrations/20261015020200_update_lask_liverpool_result.sql` — LASK Linz 3-6 Liverpool; Ljubičić 63', Flecker 74'/77', Araujo 22', Barcola 24'/37'/66', Frimpong 51', Koumas 72'
- `supabase/migrations/20261015020201_update_aston_villa_fenerbahce_result.sql` — Aston Villa 6-0 Fenerbahçe; Manzambi 12', Jackson 31'/39', Barkley 68' penaltı / 72', Abraham 90'
- `supabase/migrations/20261015020202_update_manchester_city_psg_result.sql` — Manchester City 2-4 Paris Saint-Germain; Haaland 53'/75', Doué 13', Dembélé 15', Vitinha 32', Akliouche 62'
- `supabase/migrations/20261015020203_update_roma_real_madrid_result.sql` — Roma 3-4 Real Madrid; de Roon 20', Malen 51'/57', Mbappé 25', Espí 83', Endrick 85', Rüdiger 90'

## Skipped

- Fleetwood Town - Arsenal — Lig Kupası, 27 Eki 23:00 TR; yeni kupa fikstürü eklenmez
- Manchester City - Brighton — Lig Kupası, 28 Eki 22:30 TR; yeni kupa fikstürü eklenmez
- Liverpool - Chelsea — Lig Kupası, 28 Eki 23:00 TR; yeni kupa fikstürü eklenmez

## Notes

- Added **0**, changed **4** (dördü de dünkü FT skor), kickoff update **0**, unchanged **32**, skipped **3**
- 14 Eki yeni fikstür eklenmedi (yalnızca skor)
- Dört maç da kontrol anında başlangıç + 2 saati geçmişti. ESPN özetinde `clock` boş, durum `FT` / `Full Time`, `completed: true`, `state: post`. Skorboard `displayClock` değeri `90'+` kalsa da özet ve ikinci kaynaklar FT
- Sarı kartlar yazılmadı. İptal edilen goller (Real Madrid'in ofsayt Mbappé golü, PSG'nin kurtarılan penaltısı) açıklamaya yazılmadı
- BBC skor listesi Ljubičić diyakritikli; Guardian ve ESPN olay metni Ljubicic. Ad **Robert Ljubičić**. BBC ve Guardian Ronald Araujo; ESPN oyuncu sayfası Araújo. Ad **Ronald Araujo**
- FotMob Akliouche'u 63' yazıyor. ESPN, BBC, PSG.fr ve DFB 62'. Dakika **62**
- realmadrid.com anlatımı Rüdiger'i 89. dakika diyor. Sky skor listesi, ESPN ve maç kaydı 90'. Dakika **90**
- 27–29 Eki Premier Lig, La Liga, Süper Lig, UCL, UEL, UECL, Uluslar Ligi ve hazırlık skor tabloları boş. 29 Eki Lig Kupası maçı Everton–Newcastle; takip edilen kulüp yok
- Uluslar Ligi 12–17 Kasım pencere dışı. 1 Kasım Süper Lig 12:00 yer tutucuları pencere dışında; kickoff güncellenmedi
