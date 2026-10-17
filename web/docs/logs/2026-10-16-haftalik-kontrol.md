# Weekly fixture sync — 2026-10-16

- Invoked: 2026-10-16 02:06 (`Europe/Istanbul`)
- Window: 2026-10-16 → 2026-10-30 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-15
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations,fifa.friendly,fifa.worldq.uefa,uefa.euroq,eng.fa,eng.league_cup,esp.copa_del_rey}/scoreboard?dates=YYYYMMDD — 16–30 Eki fikstür; 15 Eki sonuç
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.europa.conf/summary?event=401915858 — KuPS Kuopio 2-4 Trabzonspor, `detail: FT`, `description: Full Time`, `completed: true`, `state: post`
- https://www.bbc.com/sport/football/live/c32l4j1ken29t — **Full time**; Pennanen 54', Engvall 90+6', Onuachu 3', Salah 44', Franculino Djú 47'/90+1'
- https://yle.fi/a/74-20251721/64-3-311525 — lopputulos 2–4; Engvall başlıkta 90+6, özet satırında 90+7
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.europa/summary?event=401915563 — Hoffenheim 2-3 Beşiktaş, `FT` / `Full Time`, `completed: true`, `state: post`
- https://www.sportinglife.com/football/live/243836/hoffenheim-vs-besiktas/commentary — **FT**; maç bitti 2-3; Asllani 68', Machida 87', Murillo 60', Oh Hyeon-Gyu 72'/79'
- https://www.hurriyet.com.tr/sporarena/hoffenheim-2-3-besiktas-uefa-avrupa-ligi-maci-ozeti-43342160 — 3-2 galibiyet; Oh 73 ve 79, Machida 88
- https://www.fotmob.com/matches/konyaspor-vs-galatasaray/2golhr — 30 Eki 17:00 UTC (20:00 TR)
- https://www.teleskor.com.tr/mac/konyaspor-galatasaray-34026 — 30 Ekim 2026 20:00
- https://www.sosyalvadi.com/spor/mac/317870/ — TFF aktarımı, 30.10.2026 20:00
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261016 — 16–30 Eki Uluslar Ligi, eleme ve hazırlık skor tabloları boş

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                  | Competition             | Kickoff (source, TR) | In DB?            | Action                                 |
| -------------------------------------- | ----------------------- | -------------------- | ----------------- | -------------------------------------- |
| 16–26 Eki takip lig / UCL / UEL / UECL | —                       | kaynakla aynı        | yes               | kickoff değişmedi                      |
| Konyaspor - Galatasaray                | Süper Lig               | 2026-10-30 20:00     | yes (01.11 12:00) | update kickoff                         |
| 27–29 Eki                              | lig / UCL / UEL / UECL  | —                    | —                 | maç yok                                |
| Fleetwood Town - Arsenal               | Lig Kupası              | 2026-10-27 23:00     | no                | skipped: domestic cup                  |
| Manchester City - Brighton             | Lig Kupası              | 2026-10-28 22:30     | no                | skipped: domestic cup                  |
| Liverpool - Chelsea                    | Lig Kupası              | 2026-10-28 23:00     | no                | skipped: domestic cup                  |
| Fenerbahçe - Göztepe                   | Süper Lig               | 2026-10-31 19:00     | yes (01.11 12:00) | skipped: kickoff outside window        |
| Trabzonspor - Gaziantep FK             | Süper Lig               | 2026-11-01 16:00     | yes (01.11 12:00) | skipped: kickoff outside window        |
| Kasımpaşa - Beşiktaş                   | Süper Lig               | 2026-11-01 19:00     | yes (01.11 12:00) | skipped: kickoff outside window        |
| Millî takım                            | Uluslar Ligi / hazırlık | —                    | —                 | pencerede maç yok; sonraki 12–17 Kasım |

## Events checked

| Event                     | Kickoff (DB)     | Kickoff (source) | Status       | Action         |
| ------------------------- | ---------------- | ---------------- | ------------ | -------------- |
| KuPS Kuopio - Trabzonspor | 2026-10-15 19:45 | 2026-10-15 19:45 | finished 2-4 | update result  |
| Hoffenheim - Beşiktaş     | 2026-10-15 22:00 | 2026-10-15 22:00 | finished 2-3 | update result  |
| Konyaspor - Galatasaray   | 2026-11-01 12:00 | 2026-10-30 20:00 | scheduled    | update kickoff |
| 16–26 Eki, 30 maç         | DB saati         | kaynakla aynı    | scheduled    | none           |

## Migrations

- `supabase/migrations/20261016020600_update_kups_trabzonspor_result.sql` — KuPS Kuopio 2-4 Trabzonspor; Pennanen 54', Engvall 90+6', Onuachu 3', Salah 44', Franculino Djú 47'/90+1'
- `supabase/migrations/20261016020601_update_hoffenheim_besiktas_result.sql` — Hoffenheim 2-3 Beşiktaş; Asllani 68', Machida 87', Murillo 60', Oh Hyeon-Gyu 72'/79'
- `supabase/migrations/20261016020602_update_konyaspor_galatasaray_kickoff.sql` — Konyaspor - Galatasaray 30 Eki 20:00; 1 Kasım 12:00 yer tutucusu

## Skipped

- Fleetwood Town - Arsenal — Lig Kupası, 27 Eki 23:00 TR; yeni kupa fikstürü eklenmez
- Manchester City - Brighton — Lig Kupası, 28 Eki 22:30 TR; yeni kupa fikstürü eklenmez
- Liverpool - Chelsea — Lig Kupası, 28 Eki 23:00 TR; yeni kupa fikstürü eklenmez
- Fenerbahçe - Göztepe — kaynak 31 Eki 19:00 TR; kickoff penceresi 30 Eki'de biter, 12:00 yer tutucusu duruyor
- Trabzonspor - Gaziantep FK — kaynak 1 Kasım 16:00 TR; pencere dışı
- Kasımpaşa - Beşiktaş — kaynak 1 Kasım 19:00 TR; pencere dışı

## Notes

- Added **0**, changed **3** (2 dünkü FT skor, 1 kickoff), kickoff update **1**, unchanged **30**, skipped **6**
- 15 Eki yeni fikstür eklenmedi (yalnızca skor)
- İki maç da kontrol anında başlangıç + 2 saati geçmişti. ESPN özetinde durum `FT` / `Full Time`, `completed: true`, `state: post`. BBC KuPS sayfası **Full time**. Sporting Life Hoffenheim sayfası **FT** ve "Match ends"
- Sarı kartlar yazılmadı. KuPS'un kurtarılan penaltısı (Parzyszek) gol değil
- Yle özet satırı Engvall'ı 90+7 yazıyor; aynı sayfanın 90+6 başlığı, BBC ve ESPN 90+6. Dakika **90+6**
- Hürriyet Oh'un ilk golünü 73, Machida'yı 88 yazıyor. ESPN olay saati ve Sporting Life gol satırı 72 ve 87. Dakikalar **72** ve **87**
- 16 Eki ve 23 Eki takip edilen lig, UCL, UEL, UECL, Uluslar Ligi ve hazırlık skor tabloları boş
- Uluslar Ligi 12–17 Kasım pencere dışı
