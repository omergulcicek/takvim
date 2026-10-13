# Weekly fixture sync — 2026-10-14

- Invoked: 2026-10-14 02:04 (`Europe/Istanbul`)
- Window: 2026-10-14 → 2026-10-28 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-13
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations,fifa.friendly}/scoreboard?dates=YYYYMMDD — 13–28 Eki, gün gün fikstür ve durum
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915417 — Arsenal 3-0 Lille, `detail: FT`, `description: Full Time`, `completed: true`, `state: post`
- https://www.skysports.com/football/arsenal-vs-lille/report/577615 — **FT**; Timber 64', Eze 67', Saka 71'
- https://www.arsenal.com/news/report-arsenal-3-0-lille-aV2jb6t3eW45 — maç raporu; Timber 64, Eze üç dakika sonra, Saka 71
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915412 — Atlético Madrid 2-0 Manchester United, `FT` / `Full Time`, `completed: true`
- https://www.skysports.com/football/a-madrid-vs-man-utd/report/577616 — **FT**; Barrios 1', Lookman 79', Yoro kırmızı kart 74'
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/summary?event=401915435 — Galatasaray 1-4 Barcelona, `FT` / `Full Time`, `completed: true`
- https://www.fcbarcelona.com/en/news/4591863/galatasaray-1-4-fc-barcelona-heaven-in-hell — 4-1; López 50', Gordon üç dakika sonra, Adeyemi 65'
- https://www.tntsports.co.uk/football/champions-league/2026-2027/live-galatasaray-fc-barcelona_mtc21878433/live-commentary.shtml — **FULL-TIME: GALATASARAY 1-4 BARCELONA**; skor listesi Batrakov 28', Cancelo 43', López 50', Gordon 53', Adeyemi 65'
- https://www.turkiyegazetesi.com.tr/spor/galatasarayin-barcelona-maci-11i-belli-oldu-buruktan-osimhen-karari-1822511 — 4-1; Batrakov 28', Cancelo 43', Fermín 50', Gordon 53', Adeyemi 65'
- https://www.yenisafak.com/spor/galatasaray-barcelona-1-4-mac-ozeti-izle-video-galatasaray-barcelona-sampiyonlar-ligi-mac-ozeti-izle-4864036 — aynı dakika ve skor
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261112 — sonraki millî pencere 12–17 Kasım; bu pencerede maç yok

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                  | Competition             | Kickoff (source, TR) | In DB? | Action                                 |
| -------------------------------------- | ----------------------- | -------------------- | ------ | -------------------------------------- |
| 14–26 Eki takip lig / UCL / UEL / UECL | —                       | kaynakla aynı        | yes    | kickoff değişmedi                      |
| 27–28 Eki                              | lig / UCL / UEL / UECL  | —                    | —      | maç yok                                |
| Millî takım                            | Uluslar Ligi / hazırlık | —                    | —      | pencerede maç yok; sonraki 12–17 Kasım |

## Events checked

| Event                               | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ----------------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Arsenal - Lille                     | 2026-10-13 22:00 | 2026-10-13 22:00 | finished 3-0 | update result |
| Atlético Madrid - Manchester United | 2026-10-13 22:00 | 2026-10-13 22:00 | finished 2-0 | update result |
| Galatasaray - Barcelona             | 2026-10-13 22:00 | 2026-10-13 22:00 | finished 1-4 | update result |
| 14–26 Eki, 36 maç                   | DB saati         | kaynakla aynı    | scheduled    | none          |

## Migrations

- `supabase/migrations/20261014020400_update_arsenal_lille_result.sql` — Arsenal 3-0 Lille; Timber 64', Eze 67', Saka 71'
- `supabase/migrations/20261014020401_update_atletico_manchester_united_result.sql` — Atlético Madrid 2-0 Manchester United; Barrios 1', Lookman 79', Yoro kırmızı 74'
- `supabase/migrations/20261014020402_update_galatasaray_barcelona_result.sql` — Galatasaray 1-4 Barcelona; Batrakov 28', Cancelo 43', López 50', Gordon 53', Adeyemi 65'

## Skipped

- _(yok)_ — kapsam içi maçlarda belirsiz kaynak veya bitmemiş skor yok

## Notes

- Added **0**, changed **3** (üçü de dünkü FT skor), kickoff update **0**, unchanged **36**, skipped **0**
- 13 Eki yeni fikstür eklenmedi (yalnızca skor)
- Üç maç da 22:00 TR başladı; kontrol anında başlangıç + 2 saat geçmişti. ESPN özetinde `clock` boş, durum `FT` / `Full Time`, `completed: true`, `state: post`. Skorboard `displayClock` değeri `90'+` kalsa da özet ve ikinci kaynaklar FT
- Sky Arsenal sayfası ve arsenal.com dakikaları ESPN ile aynı: 64', 67', 71'. Sarı kartlar yazılmadı
- Sky Atlético kart listesi Yoro'yu 74' gösteriyor; aynı sayfanın dakika akışı 75 diyor. ESPN kırmızı kartı 74'. Dakika **74**
- TNT canlı anlatımı Adeyemi için 66' yazıyor; aynı sayfanın skor listesi, ESPN, fcbarcelona.com, Türkiye Gazetesi ve Yeni Şafak 65'. Dakika **65**. Barcelona.com Batrakov'u Alexey yazıyor; ESPN olay metni, TNT ve Türkiye Gazetesi Aleksey. Ad **Aleksey Batrakov**
- Barış Alper Yılmaz'ın (TNT: 34' civarı) ve Johnny Cardoso'nun golleri VAR ile iptal; açıklamaya yazılmadı
- 27–28 Eki Premier Lig, La Liga, Süper Lig, UCL, UEL, UECL, Uluslar Ligi ve hazırlık skor tabloları boş
- Uluslar Ligi 12–17 Kasım pencere dışı (Türkiye–Belçika 12 Kas, Fransa–Türkiye ve İspanya–İngiltere 15 Kas). Brezilya hazırlıkları (14 ve 17 Kas) hem pencere dışı hem Türkiye yok
- 1 Kasım Süper Lig 12:00 yer tutucuları pencere dışında; kickoff güncellenmedi
