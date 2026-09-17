# Weekly fixture sync — 2026-09-17

- Invoked: 2026-09-17 00:03 (`Europe/Istanbul`)
- Window: 2026-09-17 → 2026-10-01 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.espn.com/soccer/scoreboard/_/date/20260914/league/tur.1 — Gaziantep FK 0-0 Fenerbahçe **FT**
- https://www.espn.com/soccer/scoreboard/_/date/20260915/league/esp.1 — Elche 2-3 Real Madrid **FT**; Osorio 71', Niño 83' / Dituro 25' (OG), Mbappé 33', Espí 90+1'
- https://www.espn.com/soccer/match/_/gameId/401882872 — Elche–Real Madrid goller teyit
- https://www.espn.com/soccer/scoreboard/_/date/20260916/league/esp.1 — Barcelona 4-2 Racing Santander **FT**
- https://www.espn.com/soccer/match/_/gameId/401882871 — Cancelo 8', Raphinha 25' (pen)/42', Villalibre 36' (OG) / Gueye 30', Zabiri 65'

## Fixture discovery (league + UCL + UEL/UECL big four, 2-week window)

| Event                         | Competition | Kickoff      | In DB? | Action                            |
| ----------------------------- | ----------- | ------------ | ------ | --------------------------------- |
| Gaziantep FK - Fenerbahçe     | SL          | 14 Eyl 20:00 | yes    | update result                     |
| Elche - Real Madrid           | La Liga     | 15 Eyl 22:30 | yes    | update result                     |
| Barcelona - Racing Santander  | La Liga     | 16 Eyl 22:30 | yes    | update result                     |
| Beşiktaş - Marsilya           | UEL         | 17 Eyl 22:00 | yes    | none (scheduled)                  |
| Brentford - Chelsea           | PL          | 18 Eyl 22:00 | yes    | none                              |
| Tottenham - Aston Villa       | PL          | 19 Eyl 14:30 | yes    | none                              |
| Brighton - Arsenal            | PL          | 19 Eyl 17:00 | yes    | none                              |
| Manchester City - Sunderland  | PL          | 19 Eyl 17:00 | yes    | none                              |
| Trabzonspor - Galatasaray     | SL          | 19 Eyl 20:00 | yes    | none                              |
| Sevilla - Barcelona           | La Liga     | 19 Eyl 22:00 | yes    | none                              |
| Bournemouth - Liverpool       | PL          | 20 Eyl 16:00 | yes    | none                              |
| Fenerbahçe - Eyüpspor         | SL          | 20 Eyl 17:00 | yes    | none                              |
| Atlético Madrid - Real Madrid | La Liga     | 20 Eyl 17:15 | yes    | none                              |
| Fulham - Manchester United    | PL          | 20 Eyl 18:30 | yes    | none                              |
| Amed SK - Beşiktaş            | SL          | 20 Eyl 20:00 | yes    | none                              |
| 21 Eyl – 1 Eki tracked        | lig/UEFA    | —            | —      | none (kaynakta yok / hafta 7 Eki) |

## Events checked

| Event                        | Status             | Action        |
| ---------------------------- | ------------------ | ------------- |
| Gaziantep FK - Fenerbahçe    | finished 0-0       | update result |
| Elche - Real Madrid          | finished 2-3       | update result |
| Barcelona - Racing Santander | finished 4-2       | update result |
| Beşiktaş - Marsilya          | scheduled (17 Eyl) | none          |

## Migrations

- `supabase/migrations/20260917000300_update_gaziantep_fenerbahce_result.sql`
- `supabase/migrations/20260917000301_update_elche_real_madrid_result.sql`
- `supabase/migrations/20260917000302_update_barcelona_racing_result.sql` (MCP: `update_barcelona_racing_santander_result` — ilk apply version çakışması)

## Skipped

- Beşiktaş–Marsilya — henüz oynamadı
- Yeni fikstür yok — 17–20 Eyl penceresi dolu; 21 Eyl–1 Eki için kaynakta takip maçı yok

## Notes

- **3** FT skor (14–16 Eyl catch-up)
- 0-0 maçta description `NULL`
- Dituro / Villalibre own goal → `(kk)`
- Raphinha 25' penaltı
- UEL: Beşiktaş–Marsilya zaten DB’de (önceki run)

---

## Run 00:18 TR — Barcelona FT düzeltme

- Invoked: 2026-09-17 00:18 (`Europe/Istanbul`)
- Sebep: 00:03 run’da Barcelona–Racing **live** iken 4-2 yazılmıştı (FT kuralı ihlali)

### Sources

- https://www.espn.com/soccer/match/_/gameId/401882871 — **FT** 6-2; Cancelo 8', Raphinha 25' (pen)/42'/67' (pen), Villalibre 36' (OG), Jesus 79' / Gueye 30', Zabiri 65'
- https://www.espn.com/soccer/scoreboard/_/date/20260916/league/esp.1 — skorboard teyit

### Migrations

- `supabase/migrations/20260917001800_update_barcelona_racing_result.sql` (MCP: `fix_barcelona_racing_ft_6_2`)

### Notes

- Runbook FT check sıkılaştırıldı: dakika saati / Live / Second Half varken skor yazmak yasak; skor varlığı ≠ FT

---

## Run 00:41 TR — Barcelona FT 7-2

- Invoked: 2026-09-17 00:41 (`Europe/Istanbul`)

### Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/esp.1/summary?event=401882871 — **STATUS_FULL_TIME** / `completed: true` / **7-2**
- https://www.espn.com/soccer/match/_/gameId/401882871 — Cancelo 8', Raphinha 25' (pen)/42'/67' (pen), Villalibre 36' (OG), Jesus 79', Yamal 89' / Gueye 30', Zabiri 65'

### Migrations

- `supabase/migrations/20260917004100_update_barcelona_racing_result.sql` (MCP: `update_barcelona_racing_ft_7_2`)

---

## Run 01:06 TR — gelecek maç kickoff netleştirme

- Invoked: 2026-09-17 01:06 (`Europe/Istanbul`)
- Window: 2026-09-17 → 2026-10-01 (+14d)

### Sources

- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL: 20 Eyl sonrası sonraki lig haftası **10 Eki**
- https://www.footballwebpages.co.uk/spanish-la-liga/fixtures-results/september — La Liga: Barça/Real 20 Eyl sonrası Eylül’de yok
- https://en.as.com/soccer/champions-league-2026-27-full-league-phase-schedule-fixtures-dates-and-times-f202608-n/ — UCL MD2 **13–14 Eki** (pencere dışı)
- https://www.milliyet.com.tr/skorer/super-ligde-7-16-hafta-programlari-belli-oldu-7660940 — TFF 7–16. hafta programı
- https://www.tgrthaber.com/spor/besiktasin-avrupa-ligi-fiksturu-belli-oldu-iste-siyah-beyazlilarin-maclarinin-tarihle-3356376 — BJK UEL sonraki: 15 Eki Hoffenheim
- https://www.aksam.com.tr/spor/mac-takvimi-belli-oldu-iste-temsilcilerimizin-avrupa-fiksturu/haber-1694393 — TS UECL: 15 Eki KuPS

### Fixture discovery (+14d)

| Sonuç        | Not                                                                    |
| ------------ | ---------------------------------------------------------------------- |
| Yeni add yok | 21 Eyl–1 Eki: PL/La Liga/SL/UCL/UEL/UECL’de takip maçı yok (ara hafta) |
| 17–20 Eyl    | Zaten DB’de                                                            |

### Kickoff updates (TFF — mevcut placeholder’lar)

| Event                        | Eski         | Yeni             |
| ---------------------------- | ------------ | ---------------- |
| Galatasaray - Kasımpaşa      | 11 Eki 12:00 | **9 Eki 20:00**  |
| Samsunspor - Trabzonspor     | 11 Eki 12:00 | **10 Eki 16:00** |
| Ç. Rizespor - Fenerbahçe     | 11 Eki 12:00 | **10 Eki 19:00** |
| Beşiktaş - Kocaelispor       | 11 Eki 12:00 | **11 Eki 19:00** |
| Gençlerbirliği - Galatasaray | 18 Eki 12:00 | **17 Eki 16:00** |
| Fenerbahçe - Alanyaspor      | 18 Eki 12:00 | **17 Eki 19:00** |
| Trabzonspor - Beşiktaş       | 18 Eki 12:00 | **19 Eki 20:00** |
| Ç. Rizespor - Trabzonspor    | 25 Eki 12:00 | **26 Eki 19:00** |
| Beşiktaş - Başakşehir        | 25 Eki 12:00 | **26 Eki 19:00** |
| Galatasaray - Fenerbahçe     | 25 Eki 12:00 | **26 Eki 21:30** |

### Migrations

- `supabase/migrations/20260917010600_update_super_lig_week7_week9_kickoffs.sql`

### Skipped

- UCL MD2 (13–14 Eki) / UEL–UECL 15 Eki — +14d pencere dışı; henüz add yok
- PL 10 Eki / La Liga ~11 Eki — pencere dışı

### Notes

- Takvimde 21 Eyl–1 Eki boşluğu beklenen: milli ara; sonraki lig maçları Ekim

---

## Run 11:30 TR — millî takım listesi + Uluslar Ligi / hazırlık add

- Invoked: 2026-09-17 11:30 (`Europe/Istanbul`)
- Window: 2026-09-17 → 2026-10-01 (+14d)
- Tracked national teams (yeni): İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

### Sources

- https://www.uefa.com/uefanationsleague/news/02a2-1fea18abbcbc-456e846509e7-1000--2026-27-uefa-nations-league-all-the-league-phase-fixtures/ — Uluslar Ligi fikstür; **20:45 CET** (= **21:45 TR**)
- https://fixturedownload.azurewebsites.net/results/nations-league-2026 — UTC 18:45 satırları (CET 20:45 ile uyumlu)
- https://www.tff.org/default.aspx?ftxtID=49696&pageID=202 — Türkiye maçları **21:45 TSİ**
- https://www.milliyet.com.tr/galeri/milli-mac-ne-zaman-uefa-uluslar-ligi-2026-2027-sezonu-turkiye-fransa-maci-ne-zaman-saat-kacta-hangi-kanalda-7661332 — Türkiye–Fransa / İtalya teyit
- https://footballaustralia.com.au/news/commbank-socceroos-face-five-time-world-champions-brazil — Avustralya–Brezilya **20:00 local** (= **13:00 TR**)
- https://www.cbf.com.br/selecao-brasileira/noticias/selecao-masculina/a/convocacao-para-amistosos-da-selecao-com-australia-e-india-sera-no-dia-9-de-setembro — Brezilya saat teyit (07:00 Brasília)

### Fixture discovery (NT)

| Event                 | Comp     | Kickoff TR   | Action                                            |
| --------------------- | -------- | ------------ | ------------------------------------------------- |
| Portekiz - Galler     | UL 1     | 24 Eyl 21:45 | add                                               |
| Hollanda - Almanya    | UL 1     | 24 Eyl 21:45 | add                                               |
| Avustralya - Brezilya | Hazırlık | 25 Eyl 13:00 | add → **sonra kaldırıldı** (hazırlık yalnızca TR) |
| Türkiye - Fransa      | UL 1     | 25 Eyl 21:45 | add                                               |
| İngiltere - İspanya   | UL 1     | 26 Eyl 21:45 | add                                               |
| Almanya - Yunanistan  | UL 2     | 27 Eyl 21:45 | add                                               |
| Norveç - Portekiz     | UL 2     | 27 Eyl 21:45 | add                                               |
| Belçika - Fransa      | UL 2     | 28 Eyl 21:45 | add                                               |
| Türkiye - İtalya      | UL 2     | 28 Eyl 21:45 | add                                               |
| Avustralya - Brezilya | Hazırlık | 29 Eyl 13:00 | add → **sonra kaldırıldı** (hazırlık yalnızca TR) |
| İspanya - Hırvatistan | UL 2     | 29 Eyl 21:45 | add                                               |
| Çekya - İngiltere     | UL 2     | 29 Eyl 21:45 | add                                               |
| Almanya - Sırbistan   | UL 3     | 1 Eki 21:45  | add                                               |
| Danimarka - Portekiz  | UL 3     | 1 Eki 21:45  | add                                               |

### Migrations

- `supabase/migrations/20260917113000_add_nations_league_window.sql` (**12** Uluslar Ligi maçı; Brezilya hazırlık sonradan kaldırıldı)

### Skipped

- Arjantin - Bolivya (30 Eyl) — `kickoff not confirmed` (yalnızca gün)
- Belçika - Türkiye / Fransa - İtalya (2 Eki) — pencere dışı (+14d sonu 1 Eki)
- İtalya - Belçika vb. — takip edilen milli takım yok
- Kulüp: yeni add yok; Beşiktaş–Marsilya 17 Eyl 22:00 henüz oynamadı

### Notes

- Runbook’a 8 millî takım + `milli-takimlar` discovery kuralları eklendi
- CET→TR: +1 saat (Eylül CEST)

---

## Run 11:38 TR — hazırlık yalnızca Türkiye

- Hazırlık kuralı: **sadece Türkiye** dostluk maçları
- Kaldırıldı: Avustralya – Brezilya (25 ve 29 Eyl)
- Migration: `supabase/migrations/20260917113800_remove_brazil_australia_friendlies.sql`
