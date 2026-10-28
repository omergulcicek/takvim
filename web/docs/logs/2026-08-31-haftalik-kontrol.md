# Weekly fixture sync — 2026-08-31

- Invoked: 2026-08-31 23:47 (`Europe/Istanbul`)
- Window: 2026-08-31 → 2026-09-14 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.star.com.tr/spor/mac-sonucu-besiktas-6-2-corum-fk-haber-2037270/ — Beşiktaş 6-2 Çorum FK **MS**; Cerny 9', Vlahovic 43' (P), 59', 66', İlhan Fakılı 73', Murillo 83' / Diomande 52', Mahmić 77'
- https://www.cumhuriyet.com.tr/spor/trabzonspor-diyarbakir-da-son-dakikada-yikildi-amedspor-2-1-trabzonspor-2533839 — Amed SK 2-1 Trabzonspor **MS**; Sor 45+5', Orban 90' / Salah 11'
- https://www.skysports.com/football/aston-villa-vs-arsenal/live/559454 — Aston Villa 0-1 Arsenal **Full Time**; Saka 59'
- https://www.espn.com/soccer/match/_/gameId/401879295/arsenal-aston-villa — teyit: 0-1 FT, Saka 59'
- https://www.espn.com/soccer/match/_/gameId/401882903 — Barcelona - Rayo Vallecano canlı (~77')
- https://www.tff.org/Default.aspx?pageId=198 — SL fikstür (5. hafta saatleri henüz yok)
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL fikstür

## Fixture discovery (league + UCL, 2-week window)

| Event                       | Competition | Kickoff (source) | In DB?            | Action                         |
| --------------------------- | ----------- | ---------------- | ----------------- | ------------------------------ |
| Beşiktaş - Çorum FK         | Süper Lig   | 2026-08-31 21:30 | yes               | none                           |
| Amed SK - Trabzonspor       | Süper Lig   | 2026-08-31 21:30 | yes               | none                           |
| Aston Villa - Arsenal       | Premier Lig | 2026-08-31 22:00 | yes               | none                           |
| Barcelona - Rayo Vallecano  | La Liga     | 2026-08-31 22:30 | yes               | none                           |
| Başakşehir - Galatasaray    | Süper Lig   | 2026-09-04 20:00 | yes               | none                           |
| Fenerbahçe - Beşiktaş       | Süper Lig   | 2026-09-05 20:00 | yes               | none                           |
| UCL MD1 (7 maç, 8–10 Eyl)   | UCL         | çeşitli          | yes               | none                           |
| SL 5. hafta (13 Eyl, 12:00) | Süper Lig   | saat sonra       | yes (placeholder) | skipped: kickoff not confirmed |
| PL/La Liga (31 Ağu–14 Eyl)  | lig         | çeşitli          | yes               | none                           |

## Events checked

| Event                      | Kickoff (DB)     | Kickoff (source) | Status       | Action                |
| -------------------------- | ---------------- | ---------------- | ------------ | --------------------- |
| Beşiktaş - Çorum FK        | 2026-08-31 21:30 | 2026-08-31 21:30 | finished 6-2 | update result         |
| Amed SK - Trabzonspor      | 2026-08-31 21:30 | 2026-08-31 21:30 | finished 2-1 | update result         |
| Aston Villa - Arsenal      | 2026-08-31 22:00 | 2026-08-31 22:00 | finished 0-1 | update result         |
| Barcelona - Rayo Vallecano | 2026-08-31 22:30 | 2026-08-31 22:30 | live (~77')  | skipped: not finished |
| Başakşehir - Galatasaray   | 2026-09-04 20:00 | 2026-09-04 20:00 | scheduled    | none                  |
| Fenerbahçe - Beşiktaş      | 2026-09-05 20:00 | 2026-09-05 20:00 | scheduled    | none                  |
| UCL MD1 fixtures (7)       | 8–10 Eyl         | eşleşiyor        | scheduled    | none                  |
| SL 5. hafta (4 maç)        | 2026-09-13 12:00 | placeholder      | scheduled    | none                  |

## Migrations

- `supabase/migrations/20260831235000_update_besiktas_corum_result.sql` — Beşiktaş 6-2 Çorum FK
- `supabase/migrations/20260831235001_update_amed_trabzonspor_result.sql` — Amed SK 2-1 Trabzonspor
- `supabase/migrations/20260831235002_update_aston_villa_arsenal_result.sql` — Aston Villa 0-1 Arsenal

## Skipped

- Barcelona - Rayo Vallecano — skipped: not finished (canlı, ~77. dk)
- SL 13 Eyl maçları (Konyaspor–Trabzonspor, Gaziantep–Fenerbahçe, GS–Kocaelispor, BJK–Erzurumspor) — TFF 12:00 placeholder, saat henüz yok

## Notes

- **3** FT skor güncellendi (bugünün biten maçları).
- Barcelona - Rayo Vallecano maçı hâlâ devam ediyor; sonuç bir sonraki run'da yazılacak.
- Yeni fikstür / kickoff değişikliği yok; 2 haftalık pencere zaten dolu.
