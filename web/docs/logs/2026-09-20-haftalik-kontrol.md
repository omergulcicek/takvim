# Weekly fixture sync — 2026-09-20

- Invoked: 2026-09-20 10:47 (`Europe/Istanbul`)
- Window: 2026-09-20 → 2026-10-04 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20260919 — Tottenham / Brighton FT
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401879269 — Tottenham 2-3 Villa; Gallagher 86', van Hecke 90+8' / Manzambi 45+4', Jackson 67', Buendía 79'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401879274 — Brighton 3-0 Arsenal; Groß/Gross 31', Kostoulas 45', Andrés 57'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20260920 — City–Sunderland **20 Eyl 13:00Z = 16:00 TR** (scheduled)
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/tur.1/summary?event=401888291 — Trabzonspor 4-0 Galatasaray; Salah 4'/44'/80', Saviolo 39'; Ugochukwu red (ESPN 87')
- https://www.aa.com.tr/tr/spor/trabzonspor-salahin-hat-trick-yaptigi-macta-galatasarayi-farkli-maglup-etti-/4062172 — TS–GS FT; Ugochukwu **85'** kırmızı
- https://www.haberturk.com/spor/trabzonspor-galatasaray-macinda-okan-buruk-ve-ugochukwu-kirmizi-kart-gordu-3913685 — Ugochukwu 85'; Okan Buruk 72' (teknik direktör — description’a yazılmadı)
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/esp.1/summary?event=401882859 — Sevilla 1-3 Barcelona; Fofana 19' / Raphinha 22'/52'/69'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261004 — UL 4. hafta; Portekiz–Norveç, Yunanistan–Almanya 18:45Z = 21:45 TR

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                       | Competition | Kickoff (source) | In DB?             | Action                 |
| ------------------------------------------- | ----------- | ---------------- | ------------------ | ---------------------- |
| Manchester City - Sunderland                | PL          | 20 Eyl 16:00     | yes (19 Eyl 17:00) | update kickoff         |
| Portekiz - Norveç                           | UL 4        | 4 Eki 21:45      | no                 | add                    |
| Yunanistan - Almanya                        | UL 4        | 4 Eki 21:45      | no                 | add                    |
| Wales - Denmark                             | UL 4        | 4 Eki 21:45      | —                  | skipped: no tracked NT |
| İtalya - Türkiye                            | UL          | 5 Eki 21:45      | —                  | skipped: window dışı   |
| Fransa - Belçika                            | UL          | 5 Eki 21:45      | —                  | skipped: window dışı   |
| Bournemouth / Fulham / FB / BJK / Atleti–RM | lig         | 20 Eyl           | yes                | none (henüz başlamadı) |
| UCL / UEL / UECL (tracked)                  | UEFA        | —                | —                  | none in window         |

## Events checked

| Event                         | Kickoff (DB) | Kickoff (source) | Status       | Action         |
| ----------------------------- | ------------ | ---------------- | ------------ | -------------- |
| Tottenham - Aston Villa       | 19 Eyl 14:30 | 19 Eyl 14:30     | finished 2-3 | update result  |
| Brighton - Arsenal            | 19 Eyl 17:00 | 19 Eyl 17:00     | finished 3-0 | update result  |
| Manchester City - Sunderland  | 19 Eyl 17:00 | 20 Eyl 16:00     | scheduled    | update kickoff |
| Trabzonspor - Galatasaray     | 19 Eyl 20:00 | 19 Eyl 20:00     | finished 4-0 | update result  |
| Sevilla - Barcelona           | 19 Eyl 22:00 | 19 Eyl 22:00     | finished 1-3 | update result  |
| Bournemouth - Liverpool       | 20 Eyl 16:00 | 20 Eyl 16:00     | scheduled    | none           |
| Fenerbahçe - Eyüpspor         | 20 Eyl 17:00 | 20 Eyl 17:00     | scheduled    | none           |
| Atlético Madrid - Real Madrid | 20 Eyl 17:15 | 20 Eyl 17:15     | scheduled    | none           |
| Fulham - Manchester United    | 20 Eyl 18:30 | 20 Eyl 18:30     | scheduled    | none           |
| Amed SK - Beşiktaş            | 20 Eyl 20:00 | 20 Eyl 20:00     | scheduled    | none           |

## Migrations

- `supabase/migrations/20260920104700_update_tottenham_aston_villa_result.sql`
- `supabase/migrations/20260920104701_update_brighton_arsenal_result.sql`
- `supabase/migrations/20260920104702_update_manchester_city_sunderland_kickoff.sql`
- `supabase/migrations/20260920104703_update_trabzonspor_galatasaray_result.sql`
- `supabase/migrations/20260920104704_update_sevilla_barcelona_result.sql`
- `supabase/migrations/20260920104705_add_nations_league_matchday4_oct4.sql` (MCP: `add_ul_md4_portekiz_yunanistan_oct4`)

## Skipped

- Bugünün kulüp maçları (20 Eyl) — henüz başlamadı / FT yok
- Galler – Danimarka (4 Eki) — tracked NT yok
- İtalya – Türkiye / Fransa – Belçika (5 Eki) — pencere dışı (+14d = 4 Eki)
- Okan Buruk kırmızı (TS–GS) — teknik direktör; oyuncu description formatına alınmadı
- Ugochukwu dakikası: AA/Habertürk **85'**, ESPN **87'** → TR kaynakları tercih edildi

## Notes

- **4** FT skor; **1** kickoff düzeltmesi; **2** yeni Uluslar Ligi maçı
- Milli ara: 21 Eyl–4 Eki aralığında yeni lig/UEFA kulüp fikstürü yok

---

## Run 22:26 TR

- Invoked: 2026-09-20 22:26 (`Europe/Istanbul`)
- Window: 2026-09-20 → 2026-10-04 (+14d)

### Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard?dates=20260920 — PL FT
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401879276 — Bournemouth 0-1 Liverpool; Isak 57'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401879272 — City 5-3 Sunderland; Fernández 9', Cherki 29', Semenyo 43'/57', Haaland 81' / Brobbey 12'/33'/59'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1/summary?event=401878777 — Fulham 1-1 Man Utd; Martínez 63' (kk) / Cunha 89'
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/esp.1/summary?event=401882865 — Atlético 2-1 Real; Grimaldo 53' (P), David 59' / Huijsen 52' kırmızı, Rüdiger 89'
- https://www.trthaber.com/haber/turkiye/fenerbahce-evinde-gol-oldu-yagdi-957453.html — Fenerbahçe 8-0 Eyüpspor; Greenwood 5' (P)/80', Muriqi 7'/21'/47'/55', Guendouzi 38', İrfan Can 45+1'
- https://www.yenisafak.com/spor/amedspor-3-2-besiktas-mac-ozeti-izle-video-4857433 — Amed 3-2 BJK; Orban 13', Saba 22', Soyalp 59', Cissé 84' kırmızı / Vlahovic 55', Kökçü 90+8' (P)

### Events checked

| Event                                     | Status       | Action           |
| ----------------------------------------- | ------------ | ---------------- |
| Bournemouth - Liverpool                   | finished 0-1 | update result    |
| Manchester City - Sunderland              | finished 5-3 | update result    |
| Fenerbahçe - Eyüpspor                     | finished 8-0 | update result    |
| Atlético Madrid - Real Madrid             | finished 2-1 | update result    |
| Fulham - Manchester United                | finished 1-1 | update result    |
| Amed SK - Beşiktaş                        | finished 3-2 | update result    |
| Yeni kulüp / UEFA fikstürü (21 Eyl–4 Eki) | —            | none (milli ara) |

### Migrations

- `supabase/migrations/20260920222600_update_bournemouth_liverpool_result.sql`
- `supabase/migrations/20260920222601_update_manchester_city_sunderland_result.sql`
- `supabase/migrations/20260920222602_update_fenerbahce_eyupspor_result.sql`
- `supabase/migrations/20260920222603_update_atletico_real_madrid_result.sql`
- `supabase/migrations/20260920222604_update_fulham_manchester_united_result.sql` (MCP: `update_fulham_man_utd_pl_ft_result`)
- `supabase/migrations/20260920222605_update_amed_besiktas_result.sql`

### Notes

- **6** FT skor; yeni fikstür yok
