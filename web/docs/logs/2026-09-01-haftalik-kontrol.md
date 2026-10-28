# Weekly fixture sync — 2026-09-01

- Invoked: 2026-09-01 12:50 (`Europe/Istanbul`)
- Window: 2026-09-01 → 2026-09-15 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.fcbarcelona.com/en/football/first-team/news/4569755/fc-barcelona-5-2-rayo-vallecano-three-from-three — Barcelona 5-2 Rayo **FT**; Raphinha ×2, Lamine Yamal ×2, Lejeune (kk) / Camello ×2
- https://www.marca.com/en/soccer/laliga-ea-sports/barcelona-rayo/2026/08/31/01_0101_20260831_178_184-live.html — teyit: Match ends 5-2; Camello 11', 58'; Raphinha 18', 70'; Yamal 20', 89'; Lejeune OG 50'
- https://www.tff.org/default.aspx?ftxtID=50982&pageID=201 — Eylül dönemi genel saatler (17:00 / 20:00); 5. hafta maç bazında henüz yok
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — PL fikstür (4–13 Eyl)

## Fixture discovery (league + UCL, 2-week window)

| Event                        | Competition | Kickoff (source) | In DB?            | Action                         |
| ---------------------------- | ----------- | ---------------- | ----------------- | ------------------------------ |
| Başakşehir - Galatasaray     | Süper Lig   | 2026-09-04 20:00 | yes               | none                           |
| Fenerbahçe - Beşiktaş        | Süper Lig   | 2026-09-05 20:00 | yes               | none                           |
| Trabzonspor - Gençlerbirliği | Süper Lig   | 2026-09-06 20:00 | yes               | none                           |
| UCL MD1 (7 maç, 8–10 Eyl)    | UCL         | çeşitli          | yes               | none                           |
| PL/La Liga (4–13 Eyl)        | lig         | çeşitli          | yes               | none                           |
| SL 5. hafta (13 Eyl, 12:00)  | Süper Lig   | saat sonra       | yes (placeholder) | skipped: kickoff not confirmed |

## Events checked

| Event                      | Kickoff (DB)     | Kickoff (source) | Status       | Action                               |
| -------------------------- | ---------------- | ---------------- | ------------ | ------------------------------------ |
| Barcelona - Rayo Vallecano | 2026-08-31 22:30 | 2026-08-31 22:30 | finished 5-2 | update result (önceki run'dan kalan) |
| Başakşehir - Galatasaray   | 2026-09-04 20:00 | 2026-09-04 20:00 | scheduled    | none                                 |
| Fenerbahçe - Beşiktaş      | 2026-09-05 20:00 | 2026-09-05 20:00 | scheduled    | none                                 |
| UCL MD1 fixtures (7)       | 8–10 Eyl         | eşleşiyor        | scheduled    | none                                 |
| SL 5. hafta (4 maç)        | 2026-09-13 12:00 | placeholder      | scheduled    | none                                 |
| PL/La Liga (12 maç)        | 4–13 Eyl         | eşleşiyor        | scheduled    | none                                 |

## Migrations

- `supabase/migrations/20260901125000_update_barcelona_rayo_result.sql` — Barcelona 5-2 Rayo Vallecano

## Skipped

- SL 13 Eyl maçları (Konyaspor–Trabzonspor, Gaziantep–Fenerbahçe, GS–Kocaelispor, BJK–Erzurumspor) — TFF 12:00 placeholder, maç bazında saat henüz yok

## Notes

- **1** FT skor güncellendi (31 Ağu Barcelona maçı, önceki run'da canlıydı).
- Bugün (1 Eyl) takip kulüplerinde maç yok.
- Yeni fikstür / kickoff değişikliği yok; 2 haftalık pencere dolu.
