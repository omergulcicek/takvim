# Weekly fixture sync — 2026-10-17

- Invoked: 2026-10-17 02:06 (`Europe/Istanbul`)
- Window: 2026-10-17 → 2026-10-31 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-16
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations,fifa.friendly,fifa.worldq.uefa,uefa.euroq,eng.fa,eng.league_cup,esp.copa_del_rey}/scoreboard?dates=YYYYMMDD — 16–31 Eki fikstür ve 16 Eki sonuç kontrolü; 1 Kasım yalnızca pencere dışı not
- https://www.premierleague.com/en/news/4688862/fixture-amendments-for-premier-league-matches-in-october-and-november — 17–24 Eki BST, 25 Eki sonrası GMT; 31 Eki 12:30 Chelsea–Man Utd, 15:00 Man City–Brighton, 17:30 Spurs–Crystal Palace
- https://www.bbc.co.uk/sport/football/premier-league/scores-fixtures/2026-10 — 31 Eki aynı üç saat
- https://www.skysports.com/football-scores-fixtures/2026-10-31 — 12:30 / 15:00 / 17:30 UK
- https://www.fcbarcelona.com/en/matches/138382/fc-barcelona-alaves-la-liga-2026-2027 — Barcelona–Alavés, 31 Eki, Kickoff CET 21:00
- https://www.fcbarcelona.com/en/matches/138367/real-betis-fc-barcelona-la-liga-2026-2027 — Real Betis–Barcelona, 17 Eki, Kickoff CEST 18:30
- https://www.realmadrid.com/en-US/news/football/first-team/latest-news/el-real-madrid-sevilla-se-jugara-el-domingo-18-de-octubre-a-las-21-00-h-16-09-2026 — Real Madrid–Sevilla, 18 Eki 21:00 CEST
- https://www.milliyet.com.tr/skorer/super-ligde-7-16-hafta-programlari-belli-oldu-7660940 — 31 Eki 19:00 Fenerbahçe–Göztepe
- http://www.goztepe.org.tr/Futbol/erkek-a-takim/fikstur — 31 Ekim 2026 19:00
- https://www.uefa.com/uefanationsleague/news/0298-1d6ef1acfaef-b54fcf1da859-1000--2026-27-uefa-nations-league-all-you-need-to-know/ — sonraki Uluslar Ligi 12–17 Kasım

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                        | Competition            | Kickoff (source, TR) | In DB?            | Action                          |
| ---------------------------- | ---------------------- | -------------------- | ----------------- | ------------------------------- |
| 17–30 Eki takip lig / UCL / UEL / UECL | —            | kaynakla aynı        | yes               | kickoff değişmedi               |
| Chelsea - Manchester United  | Premier Lig            | 2026-10-31 15:30     | no                | add fixture                     |
| Manchester City - Brighton   | Premier Lig            | 2026-10-31 18:00     | no                | add fixture                     |
| Tottenham - Crystal Palace   | Premier Lig            | 2026-10-31 20:30     | no                | add fixture                     |
| Barcelona - Alavés           | La Liga                | 2026-10-31 23:00     | no                | add fixture                     |
| Fenerbahçe - Göztepe         | Süper Lig              | 2026-10-31 19:00     | yes (01.11 12:00) | update kickoff                  |
| Fleetwood Town - Arsenal     | Lig Kupası             | 2026-10-27 23:00     | no                | skipped: domestic cup           |
| Manchester City - Brighton   | Lig Kupası             | 2026-10-28 22:30     | no                | skipped: domestic cup           |
| Liverpool - Chelsea          | Lig Kupası             | 2026-10-28 23:00     | no                | skipped: domestic cup           |
| Liverpool - Arsenal          | Premier Lig            | 2026-11-01 19:30     | no                | skipped: outside window         |
| Racing Santander - Real Madrid | La Liga              | 2026-11-01 18:15     | no                | skipped: outside window         |
| Trabzonspor - Gaziantep FK   | Süper Lig              | 2026-11-01 16:00     | yes (01.11 12:00) | skipped: kickoff outside window |
| Kasımpaşa - Beşiktaş         | Süper Lig              | 2026-11-01 19:00     | yes (01.11 12:00) | skipped: kickoff outside window |
| Millî takım                  | Uluslar Ligi / hazırlık | —                   | —                 | pencerede maç yok; sonraki 12–17 Kasım |

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status    | Action         |
| --------------------------- | ---------------- | ---------------- | --------- | -------------- |
| 16 Eki, kapsam içi kayıt yok | —               | skor tablosu boş | —         | none           |
| Real Betis - Barcelona      | 2026-10-17 19:30 | 2026-10-17 19:30 | scheduled | none           |
| Fenerbahçe - Göztepe        | 2026-11-01 12:00 | 2026-10-31 19:00 | scheduled | update kickoff |
| 17–30 Eki, 30 maç           | DB saati         | kaynakla aynı    | scheduled | none           |

## Migrations

- `supabase/migrations/20261017020600_add_oct31_league_fixtures.sql` — Chelsea–Manchester United 15:30, Manchester City–Brighton 18:00, Tottenham–Crystal Palace 20:30, Barcelona–Alavés 23:00
- `supabase/migrations/20261017020601_update_fenerbahce_goztepe_kickoff.sql` — Fenerbahçe–Göztepe 31 Eki 19:00; 1 Kasım 12:00 yer tutucusu

## Skipped

- Fleetwood Town - Arsenal — Lig Kupası, 27 Eki 23:00 TR; yeni kupa fikstürü eklenmez
- Manchester City - Brighton — Lig Kupası, 28 Eki 22:30 TR; lig maçı ayrı eklendi, kupa eklenmez
- Liverpool - Chelsea — Lig Kupası, 28 Eki 23:00 TR; yeni kupa fikstürü eklenmez
- Liverpool - Arsenal — Premier Lig, 1 Kasım 19:30 TR; pencere 31 Eki'de biter
- Racing Santander - Real Madrid — La Liga, 1 Kasım 18:15 TR; pencere dışı
- Trabzonspor - Gaziantep FK — kaynak 1 Kasım 16:00 TR; 12:00 yer tutucusu duruyor
- Kasımpaşa - Beşiktaş — kaynak 1 Kasım 19:00 TR; 12:00 yer tutucusu duruyor

## Notes

- Added **4**, changed **1** (kickoff), kickoff update **1**, unchanged **31**, skipped **7**, yesterday results **0**
- 16 Eki yeni fikstür eklenmedi. Takvim'de o gün kapsam içi yayınlanmış maç yok; ESPN skor tablolarında da takip edilen lig, UCL, UEL, UECL, Uluslar Ligi ve hazırlık maçı yok. Yazılacak FT skor yok
- 31 Eki İngiltere GMT (saatler 25 Eki Pazar'dan itibaren GMT). 12:30 / 15:00 / 17:30 UK = 15:30 / 18:00 / 20:30 TR. Premier League duyurusu, BBC ve ESPN `12:30Z` / `15:00Z` / `17:30Z` aynı
- İspanya 25 Eki'de kış saatine geçti. Barcelona–Alavés 21:00 CET = 20:00 UTC = 23:00 TR. Bitiş 01:00; 00:00 olmadığı için 23:55 kısaltması yok
- Real Betis–Barcelona: fcbarcelona.com **CEST 18:30** (17 Eki hâlâ yaz saati) = 19:30 TR. DB zaten 19:30. ESPN `2026-10-17T16:00Z` (19:00 TR) resmi saatle uyuşmuyor; kickoff güncellenmedi
- Real Madrid–Sevilla: realmadrid.com 18 Eki **21:00 CEST** = 22:00 TR. DB ile aynı
- Premier League duyurusu Liverpool–Brighton'ı 24 Eki satırında da basıyor. ESPN 24 Eki'de bu maçı göstermiyor; aynı duyuru ve ESPN maçı 25 Eki 14:00 GMT (17:00 TR) koyuyor. DB öyle. İkinci kayıt eklenmedi
- 16 Eki bitmiş kapsam içi maç yok. Penceredeki maçlar henüz oynanmadı
- Uluslar Ligi 12–17 Kasım pencere dışı. Hazırlık skor tablosu boş
