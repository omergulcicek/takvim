# Weekly fixture sync — 2026-08-26

- Invoked: 2026-08-26 23:55 (`Europe/Istanbul`)
- Window: 2026-08-26 → 2026-09-02
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi, premier-lig, la-liga

## Sources

- https://www.cnnturk.com/spor/futbol/live-lyon-fenerbahce-maci-canli-anlatim-temsilcimiz-sampiyonlar-ligi-yolunda-3459047 — **MAÇ SONUCU** Lyon 1-2 Fenerbahçe; Muriqi 24', Brown 28'; Fofana 61'
- https://www.foxsports.com/soccer/champions-league-lyon-vs-fenerbahce-aug-26-2026-game-boxscore-962548 — T 1-2; aynı goller
- https://www.espn.com/soccer/match/_/gameId/401909203/fenerbahce-lyon — skor 1-2 (sayfa bir süre 90'+6 canlı kaldı; FT için CNN + FOX kullanıldı)
- https://www.laliga.com/en-GB/match/temporada-2026-2027-laliga-ea-sports-real-madrid-real-sociedad-1 — Real Madrid–Real Sociedad hâlâ **Second Half** / canlı
- https://www.espn.com/soccer/match/_/gameId/401882919 — Real Madrid 4-1 ama **90'+3'** (FT değil)

## Events checked

| Event                            | Kickoff (DB)     | Kickoff (source) | Status                  | Action                |
| -------------------------------- | ---------------- | ---------------- | ----------------------- | --------------------- |
| Lyon - Fenerbahçe                | 2026-08-26 22:00 | 2026-08-26 22:00 | finished 1-2 (agg 3-2)  | update result         |
| Real Madrid - Real Sociedad      | 2026-08-26 22:00 | 2026-08-26 22:00 | live (~90+ / 2. yarı)   | skipped: not finished |
| Kauno Žalgiris - Beşiktaş        | 2026-08-27 20:00 | 2026-08-27 20:00 | scheduled               | none                  |
| Ferencváros - Trabzonspor        | 2026-08-27 21:30 | 2026-08-27 21:30 | scheduled               | none                  |
| Barcelona - Athletic Bilbao      | 2026-08-27 22:00 | 2026-08-27 22:00 | scheduled               | none                  |
| Crystal Palace - Manchester City | 2026-08-28 22:00 | 2026-08-28 22:00 | scheduled               | none                  |
| Liverpool - Nottingham Forest    | 2026-08-29 14:30 | 2026-08-29 14:30 | scheduled               | none                  |
| Tottenham - Newcastle United     | 2026-08-29 19:30 | 2026-08-29 19:30 | scheduled               | none                  |
| Samsunspor - Fenerbahçe          | 2026-08-30 12:00 | —                | scheduled (placeholder) | none                  |
| Galatasaray - Göztepe            | 2026-08-30 12:00 | —                | scheduled (placeholder) | none                  |
| Beşiktaş - Çorum FK              | 2026-08-30 12:00 | —                | scheduled (placeholder) | none                  |
| Amed SK - Trabzonspor            | 2026-08-30 12:00 | —                | scheduled (placeholder) | none                  |
| Chelsea - Brighton               | 2026-08-30 16:00 | 2026-08-30 16:00 | scheduled               | none                  |
| Real Madrid - Malaga             | 2026-08-30 18:00 | 2026-08-30 18:00 | scheduled               | none                  |
| Manchester United - Ipswich      | 2026-08-30 18:30 | 2026-08-30 18:30 | scheduled               | none                  |
| Aston Villa - Arsenal            | 2026-08-31 22:00 | 2026-08-31 22:00 | scheduled               | none                  |
| Barcelona - Rayo Vallecano       | 2026-08-31 22:30 | 2026-08-31 22:30 | scheduled               | none                  |

## Migrations

- `supabase/migrations/20260826235500_update_lyon_fenerbahce_result.sql` — Lyon 1-2; Fofana 61'; Muriqi 24', Brown 28' (apply_migration OK)

## Skipped

- Real Madrid - Real Sociedad — kaynaklar FT değil (La Liga: Second Half; ESPN: 90'+3'); skor yazılmadı

## Notes

- Pencere: **17** timed event.
- Lyon–FB: CNN Türk **MAÇ SONUCU** + FOX T 1-2; play-off turu description → gol listesi.
- Real Madrid–Real Sociedad için Mbappé 40'/60'/80', Vini 68', Sucic 44' görünüyor ama FT teyidi yok → atlandı (önceki Espanyol hatası tekrarlanmasın).
- 30 Ağustos Süper Lig 12:00 placeholder’lar; net kickoff bu koşuda doğrulanmadı.
- Fulham–Chelsea (24.08) pencere dışı; DB’de zaten skorlu.
- 1 changed, 15 unchanged, 1 skipped (not finished).
