# Weekly fixture sync — 2026-10-11

- Invoked: 2026-10-11 12:03 (`Europe/Istanbul`)
- Window: 2026-10-11 → 2026-10-25 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20261011 — Premier Lig penceresi (11–25 Ekim, gün gün); tümü `STATUS_SCHEDULED`
- https://site.api.espn.com/apis/site/v2/sports/soccer/esp.1/scoreboard?dates=20261011 — La Liga
- https://site.api.espn.com/apis/site/v2/sports/soccer/tur.1/scoreboard?dates=20261011 — Süper Lig
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.champions/scoreboard?dates=20261013 — Şampiyonlar Ligi 2. ve 3. hafta
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.europa/scoreboard?dates=20261015 — Avrupa Ligi (yalnızca Beşiktaş)
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.europa.conf/scoreboard?dates=20261015 — Konferans Ligi (yalnızca Trabzonspor)
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261011 — Uluslar Ligi: pencerede maç yok
- https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.friendly/scoreboard?dates=20261011 — hazırlık: pencerede maç yok
- https://www.liverpoolfc.com/news/liverpool-v-brighton-hove-albion-premier-league-fixture-rescheduled — Liverpool–Brighton **25 Ekim, 14:00 GMT** (17:00 TR)
- https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20261025 — Manchester United–Bournemouth **2026-10-25T14:00Z** (17:00 TR); Liverpool–Brighton aynı saat
- https://www.fcbarcelona.com/en/matches/138374/fc-barcelona-real-madrid-la-liga-2026-2027 — Barcelona–Real Madrid **25 Ekim, kickoff CET 21:00** (23:00 TR)
- https://site.api.espn.com/apis/site/v2/sports/soccer/esp.1/scoreboard?dates=20261025 — aynı maç **2026-10-25T20:00Z**
- https://www.aa.com.tr/tr/spor/trendyol-super-ligde-7-16-haftalarin-programi-aciklandi/4057906 — TFF 7–16. hafta programı (8. hafta teyit + 10. hafta placeholder düzeltmesi)
- https://takvim.omergulcicek.com/feeds/{galatasaray,fenerbahce,besiktas,trabzonspor,premier-lig,la-liga,sampiyonlar-ligi,milli-takimlar}.ics — yayındaki takvim

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                 | Competition | Kickoff (source) | In DB? | Action                   |
| ------------------------------------- | ----------- | ---------------- | ------ | ------------------------ |
| Liverpool - Manchester City           | PL          | 11 Eki 18:30     | yes    | none (scheduled)         |
| Beşiktaş - Kocaelispor                | SL          | 11 Eki 19:00     | yes    | none (scheduled)         |
| Arsenal - Lille                       | UCL         | 13 Eki 22:00     | yes    | none                     |
| Atlético Madrid - Manchester United   | UCL         | 13 Eki 22:00     | yes    | none                     |
| Galatasaray - Barcelona               | UCL         | 13 Eki 22:00     | yes    | none                     |
| LASK Linz - Liverpool                 | UCL         | 14 Eki 19:45     | yes    | none                     |
| Roma - Real Madrid                    | UCL         | 14 Eki 22:00     | yes    | none                     |
| Aston Villa - Fenerbahçe              | UCL         | 14 Eki 22:00     | yes    | none                     |
| Manchester City - Paris Saint-Germain | UCL         | 14 Eki 22:00     | yes    | none                     |
| KuPS Kuopio - Trabzonspor             | UECL        | 15 Eki 19:45     | yes    | none                     |
| Hoffenheim - Beşiktaş                 | UEL         | 15 Eki 22:00     | yes    | none                     |
| Everton - Chelsea                     | PL          | 17 Eki 14:30     | yes    | none                     |
| Gençlerbirliği - Galatasaray          | SL          | 17 Eki 16:00     | yes    | none                     |
| Brentford - Liverpool                 | PL          | 17 Eki 17:00     | yes    | none                     |
| Manchester City - Ipswich             | PL          | 17 Eki 17:00     | yes    | none                     |
| Fenerbahçe - Alanyaspor               | SL          | 17 Eki 19:00     | yes    | none                     |
| Real Betis - Barcelona                | La Liga     | 17 Eki 19:30     | yes    | none                     |
| Leeds United - Manchester United      | PL          | 18 Eki 16:00     | yes    | none                     |
| Nottingham Forest - Arsenal           | PL          | 18 Eki 18:30     | yes    | none                     |
| Real Madrid - Sevilla                 | La Liga     | 18 Eki 22:00     | yes    | none                     |
| Trabzonspor - Beşiktaş                | SL          | 19 Eki 20:00     | yes    | none                     |
| Tottenham - Coventry                  | PL          | 19 Eki 22:00     | yes    | none                     |
| Fenerbahçe - Slavia Prague            | UCL         | 20 Eki 19:45     | yes    | none                     |
| Liverpool - Villarreal                | UCL         | 20 Eki 22:00     | yes    | none                     |
| Manchester City - AEK Athens          | UCL         | 20 Eki 22:00     | yes    | none                     |
| Paris Saint-Germain - Barcelona       | UCL         | 20 Eki 22:00     | yes    | none                     |
| Como - Manchester United              | UCL         | 21 Eki 19:45     | yes    | none                     |
| Lille - Galatasaray                   | UCL         | 21 Eki 19:45     | yes    | none                     |
| Bayern Münih - Arsenal                | UCL         | 21 Eki 22:00     | yes    | none                     |
| Real Madrid - RB Leipzig              | UCL         | 21 Eki 22:00     | yes    | none                     |
| Trabzonspor - Heart of Midlothian     | UECL        | 22 Eki 19:45     | yes    | none                     |
| Beşiktaş - Crystal Palace             | UEL         | 22 Eki 22:00     | yes    | none                     |
| Aston Villa - Manchester City         | PL          | 24 Eki 14:30     | yes    | none                     |
| Arsenal - Everton                     | PL          | 24 Eki 17:00     | yes    | none                     |
| Chelsea - Tottenham                   | PL          | 24 Eki 19:30     | yes    | none                     |
| Liverpool - Brighton                  | PL          | 25 Eki 17:00     | no     | add fixture              |
| Manchester United - Bournemouth       | PL          | 25 Eki 17:00     | no     | add fixture              |
| Barcelona - Real Madrid               | La Liga     | 25 Eki 23:00     | no     | add fixture              |
| Uluslar Ligi / hazırlık               | NT          | —                | —      | none (pencerede maç yok) |

## Events checked

| Event                           | Kickoff (DB)     | Kickoff (source) | Status    | Action      |
| ------------------------------- | ---------------- | ---------------- | --------- | ----------- |
| Liverpool - Manchester City     | 2026-10-11 18:30 | 2026-10-11 18:30 | scheduled | none        |
| Beşiktaş - Kocaelispor          | 2026-10-11 19:00 | 2026-10-11 19:00 | scheduled | none        |
| 13–24 Eki tracked (32 maç)      | matches source   | matches source   | scheduled | none        |
| Liverpool - Brighton            | —                | 2026-10-25 17:00 | scheduled | add fixture |
| Manchester United - Bournemouth | —                | 2026-10-25 17:00 | scheduled | add fixture |
| Barcelona - Real Madrid         | —                | 2026-10-25 23:00 | scheduled | add fixture |

## Placeholder kickoffs just outside the window

| Event                                                                     | Kickoff (DB)          | Kickoff (TFF / ESPN) | Action             |
| ------------------------------------------------------------------------- | --------------------- | -------------------- | ------------------ |
| Konyaspor - Galatasaray                                                   | 2026-11-01 12:00      | 2026-10-30 20:00     | update kickoff     |
| Fenerbahçe - Göztepe                                                      | 2026-11-01 12:00      | 2026-10-31 19:00     | update kickoff     |
| Trabzonspor - Gaziantep FK                                                | 2026-11-01 12:00      | 2026-11-01 16:00     | update kickoff     |
| Kasımpaşa - Beşiktaş                                                      | 2026-11-01 12:00      | 2026-11-01 19:00     | update kickoff     |
| 26 Eki: Rizespor–Trabzonspor, Beşiktaş–Başakşehir, Galatasaray–Fenerbahçe | 19:00 / 19:00 / 21:30 | same                 | none (already set) |

## Migrations

- `supabase/migrations/20261011120900_add_premier_lig_oct25.sql` — Liverpool–Brighton ve Manchester United–Bournemouth, 25 Eki 17:00, `premier-lig`, description `NULL`
- `supabase/migrations/20261011120901_add_barcelona_real_madrid.sql` — Barcelona–Real Madrid, 25 Eki 23:00 (bitiş 01:00), `la-liga`, description `NULL`
- `supabase/migrations/20261011120902_update_super_lig_week10_kickoffs.sql` — 10. hafta placeholder 12:00 → TFF saatleri

## Skipped

- Sonuç yok — penceredeki maçların tamamı `STATUS_SCHEDULED`; 11 Ekim 12:09 TR’de Liverpool–Manchester City (18:30) ve Beşiktaş–Kocaelispor (19:00) henüz başlamadı
- Takip edilmeyen UCL / UEL / UECL eşleşmeleri — eklenmedi
- Millî takım — Uluslar Ligi, eleme ve hazırlık pencerede boş
- Süper Lig 11–16. hafta `12:00` placeholder’ları — TFF saati var; pencerenin hemen dışındaki 10. haftadan daha ileride, bu turda güncellenmedi
- 10 Ekim maçları — pencere 11 Ekim’de başlıyor

## Notes

- **3** yeni fikstür, **4** kickoff düzeltmesi, **0** skor
- Liverpool–Brighton artık tek saat: kulüp sitesi 25 Ekim 14:00 GMT; ESPN `14:00Z`. 25 Ekim öğleden sonra İngiltere GMT
- El Clásico: Barcelona sayfası CET 21:00; ESPN `20:00Z`. 25 Ekim akşamı İspanya CET (yaz saati 25 Ekim sabahı biter) → 23:00 TR. Bitiş 01:00, `23:55` kuralı yok
- Premier Lig isimleri mevcut kayıtlardaki gibi: `Brighton`, `Bournemouth`
- Supabase MCP bağlı olmadığı için `apply_migration` çalışmadı. SQL repo’da; uzak veritabanı bu PR merge / ayrıca apply edilene kadar değişmez
