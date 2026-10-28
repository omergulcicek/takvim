# Weekly fixture sync — 2026-08-30

## Run 23:24 TR

- Invoked: 2026-08-30 23:24 (`Europe/Istanbul`)
- Window: 2026-08-30 → 2026-09-13 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid

## Sources

- https://www.espn.com/soccer/match/_/gameId/401879317/brighton-hove-albion-chelsea — Chelsea 4-3 Brighton **FT**; Lavia 4', Neto 14', João Pedro 32', Palmer 74' / Yalcouyé 35', João Pedro 63' OG, Gross 90+6'
- https://www.espn.com/soccer/match/_/gameId/401882899 — Real Madrid 4-0 Malaga **FT**; Bellingham 19', Mbappé 30', Güler 90+1' / Herrero 26' OG
- https://www.espn.com/soccer/match/_/gameId/401879293/ipswich-town-manchester-united — Man United 5-2 Ipswich **FT**; Fernandes 40', 61' (Pen), 68', Mbeumo 82' / Davis 29', Greaves 56' OG, Akpom 90+1'
- https://www.sporx.com/samsunspor-fenerbahce-maci-goller-kartlar-5904730 — Samsunspor 0-2 Fenerbahçe **MS**; Muriqi 3', Oğuz Aydın 49' (teyit: star.com.tr, haberturk.com)
- https://www.premierleague.com/en/news/4675097/all-380-fixtures-for-202627-premier-league-season — 31 Ağu–13 Eyl fikstür
- https://www.tff.org/Default.aspx?pageId=198 — SL 4. hafta kickoff'ları (önceki run'da güncellendi)

## Events checked (today, 30 Ağu)

| Event                       | Kickoff (DB)     | Status       | Action        |
| --------------------------- | ---------------- | ------------ | ------------- |
| Chelsea - Brighton          | 2026-08-30 16:00 | finished 4-3 | update result |
| Real Madrid - Malaga        | 2026-08-30 18:00 | finished 4-0 | update result |
| Manchester United - Ipswich | 2026-08-30 18:30 | finished 5-2 | update result |
| Samsunspor - Fenerbahçe     | 2026-08-30 21:30 | finished 0-2 | update result |

## Fixture discovery (2-week window)

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
| PL/La Liga (30 Ağu–13 Eyl)  | lig         | çeşitli          | yes               | none                           |

## Migrations

- `supabase/migrations/20260830232400_update_chelsea_brighton_result.sql`
- `supabase/migrations/20260830232401_update_real_madrid_malaga_result.sql` (+ `_v2` remote apply)
- `supabase/migrations/20260830232402_update_manchester_united_ipswich_result.sql` (+ `_v2` remote apply)
- `supabase/migrations/20260830232403_update_samsunspor_fenerbahce_result.sql`

## Skipped

- SL 13 Eyl maçları (Konyaspor–Trabzonspor, Gaziantep–Fenerbahçe, GS–Kocaelispor, BJK–Erzurumspor) — TFF 12:00 placeholder, saat henüz yok

## Notes

- **4** FT skor güncellendi (bugünün tüm takip maçları).
- Yeni fikstür / kickoff değişikliği yok; 2 haftalık pencere zaten dolu.
- Yarın (31 Ağu): Beşiktaş, Trabzonspor, Arsenal, Barcelona maçları planlı.
