# Weekly fixture sync — 2026-10-12

- Invoked: 2026-10-12 02:02 (`Europe/Istanbul`)
- Window: 2026-10-12 → 2026-10-26 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-11
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations,fifa.friendly}/scoreboard — 11–26 Eki fikstür ve FT durumu
- https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401879264 — Liverpool 0-3 Manchester City, `STATUS_FULL_TIME`, `completed: true`, normal süre 90+4
- https://www.skysports.com/football/liverpool-vs-manchester-city/report/559501 — **FT**; Gravenberch kırmızı 62'; Haaland 65'; Doku 68'; Cherki 78'
- https://www.liverpoolfc.com/news/match-report-liverpool-man-city-premier-league-anfield — maç sonu 0-3; Gravenberch ikinci sarı, Haaland, Doku, Cherki
- https://www.mancity.com/news/mens/liverpool-v-city-premier-league-match-report-october-2026-63927325 — skor listesi Haaland 65', Doku 68', Cherki 78'
- https://www.bbc.com/sport/football/live/cr3el8xwnnxkt — aynı dakikalar; sayfa FT etiketi yerine 81' canlı görüntüsü taşıyor, skor kaynağı olarak kullanılmadı
- https://site.api.espn.com/apis/site/v2/sports/soccer/tur.1/summary?event=401888279 — Beşiktaş 2-1 Kocaelispor, `STATUS_FULL_TIME`, `completed: true`
- https://www.haberturk.com/spor/besiktas-kocaelispor-mac-sonucu-iste-besiktas-kocaelispor-maci-ozeti-ve-golleri-trendyol-super-lig-3918838 — maç sonucu 2-1; Orkun 18', Show 27', Vlahovic penaltı 31'
- https://www.hurriyet.com.tr/sporarena/besiktas-2-1-kocaelispor-super-lig-43337566 — aynı skor ve dakikalar
- https://www.takvim.com.tr/spor/besiktas/2026/10/10/besiktas-2-1-kocaelispor-super-lig-mac-sonucu — maç sonucu; Orkun 18', Show 27', Vlahovic 31' penaltı
- https://www.fanatik.com.tr/galatasaray/galatasaray-fenerbahce-derbisinin-tarihi-belli-oldu-2637858 — TFF: 19 Eki Trabzonspor–Beşiktaş 20:00; 26 Eki Galatasaray–Fenerbahçe 21:30
- https://www.tv100.com/fenerbahce-galatasaray-derbisine-etkinlik-ayari-resmi-aciklama-geldi-iste-dev-macin-tarih-ve-saati-haber-871796 — 26 Eki Ç. Rizespor–Trabzonspor 19:00, Beşiktaş–Başakşehir 19:00, Galatasaray–Fenerbahçe 21:30
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261112 — sonraki millî pencere 12–14 Kasım; bu pencerede maç yok

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                  | Competition             | Kickoff (source, TR) | In DB? | Action                                 |
| -------------------------------------- | ----------------------- | -------------------- | ------ | -------------------------------------- |
| 12–25 Eki takip lig / UCL / UEL / UECL | —                       | kaynakla aynı        | yes    | kickoff değişmedi                      |
| Ç. Rizespor - Trabzonspor              | Süper Lig               | 2026-10-26 19:00     | yes    | none                                   |
| Beşiktaş - Başakşehir                  | Süper Lig               | 2026-10-26 19:00     | yes    | none                                   |
| Galatasaray - Fenerbahçe               | Süper Lig               | 2026-10-26 21:30     | yes    | none                                   |
| Millî takım                            | Uluslar Ligi / hazırlık | —                    | —      | pencerede maç yok; sonraki 12–14 Kasım |

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Liverpool - Manchester City | 2026-10-11 18:30 | 2026-10-11 18:30 | finished 0-3 | update result |
| Beşiktaş - Kocaelispor      | 2026-10-11 19:00 | 2026-10-11 19:00 | finished 2-1 | update result |
| 12–26 Eki, 39 maç           | DB saati         | kaynakla aynı    | scheduled    | none          |

## Migrations

- `supabase/migrations/20261012020600_update_liverpool_manchester_city_result.sql` — Liverpool 0-3 Manchester City; Gravenberch kırmızı 62', Haaland 65', Doku 68', Cherki 78'
- `supabase/migrations/20261012020601_update_besiktas_kocaelispor_result.sql` — Beşiktaş 2-1 Kocaelispor; Orkun Kökçü 18', Vlahovic penaltı 31', Show 27'

## Skipped

- 11 Eki yeni fikstür eklenmedi (yalnızca skor)
- BBC Liverpool–Manchester City canlı sayfası FT yerine 81' gösteriyor; skor Sky, kulüp siteleri ve ESPN FT kaydından yazıldı
- Habertürk giriş cümlesi Show için 21' diyor; aynı metnin anlatımı, Hürriyet, Takvim ve ESPN 27'. Dakika **27**
- Ajansspor gol listesi Orkun için 17' diyor; aynı haberin başlığı, Hürriyet, Takvim ve ESPN 18'. Dakika **18**
- Kocaeli TV 19' ve 25' yazıyor; diğer kaynaklarla uyuşmuyor, kullanılmadı
- Chelsea ve Tottenham bu pencerede Şampiyonlar Ligi'nde yok; Avrupa Ligi İngiliz kulüpleri ekleme kapsamı dışında
- Uluslar Ligi 12–14 Kasım — pencere dışı

## Notes

- Added **0**, changed **2** (ikisi de dünkü FT skor), kickoff update **0**, unchanged **39**, skipped **0**
- 26 Eki Süper Lig saatleri TFF duyurusu ve ESPN ile DB'deki 19:00 / 19:00 / 21:30 kayıtlarıyla aynı
- 1 Kasım 12:00 yer tutucuları pencere dışında; kickoff güncellenmedi
