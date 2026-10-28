# Weekly fixture sync — 2026-08-27

- Invoked: 2026-08-27 22:15 (`Europe/Istanbul`)
- Window: 2026-08-27 → 2026-09-03
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi, premier-lig, la-liga

## Sources

- https://www.espn.co.uk/football/report/_/gameId/401882919 — Real Madrid 4-1 Real Sociedad **FT**; Mbappé 40', 60', 80'; Vinícius 68'; Sučić 44'
- https://www.theguardian.com/football/2026/aug/26/real-madrid-real-sociedad-la-liga-match-report-jose-mourinho-kylian-mbappe — aynı skor, maç raporu
- https://www.espn.com/soccer/match/_/gameId/401909828/besiktas-kauno-zalgiris — Kauno Žalgiris 1-0 Beşiktaş **FT**; Oliveira 64'
- https://www.espn.com/soccer/match/_/gameId/401909831/trabzonspor-ferencvaros — Ferencváros–Trabzonspor **45'+1'** canlı (1-0, agg 2-0); FT değil
- https://www.espn.com/soccer/match/_/gameId/401882921/athletic-club-barcelona — Barcelona–Athletic **5'** canlı; FT değil
- https://www.skorjet.net/ligler/super-lig/fikstur?round=3 — Süper Lig 3. hafta TFF kickoff saatleri
- https://www.takvim.com.tr/spor/2026/08/07/super-ligde-2-ve-3-haftanin-programi-aciklandi — TFF programı teyit
- https://www.espn.com.au/football/story/_/id/49730298/crystal-palace-vs-manchester-city-2026-27-premier-league-tv-channel-how-watch-kickoff-live-stream-referee-injury-predicted-lineups — Crystal Palace–Man City 28.08 20:00 BST = 22:00 TR
- https://matchesnow.co.uk/leagues/premier-league/2026/liverpool-nottingham-forest — Liverpool–Forest 29.08 12:30 GMT = 14:30 TR

## Events checked

| Event                            | Kickoff (DB)     | Kickoff (source) | Status                 | Action                |
| -------------------------------- | ---------------- | ---------------- | ---------------------- | --------------------- |
| Real Madrid - Real Sociedad      | 2026-08-26 22:00 | 2026-08-26 22:00 | finished 4-1           | update result         |
| Kauno Žalgiris - Beşiktaş        | 2026-08-27 20:00 | 2026-08-27 20:00 | finished 1-0 (agg 1-3) | update result         |
| Ferencváros - Trabzonspor        | 2026-08-27 21:30 | 2026-08-27 21:30 | live 1-0 (45'+1')      | skipped: not finished |
| Barcelona - Athletic Bilbao      | 2026-08-27 22:00 | 2026-08-27 22:00 | live (~5')             | skipped: not finished |
| Galatasaray - Göztepe            | 2026-08-30 12:00 | 2026-08-29 21:30 | scheduled              | update kickoff        |
| Samsunspor - Fenerbahçe          | 2026-08-30 12:00 | 2026-08-30 21:30 | scheduled              | update kickoff        |
| Beşiktaş - Çorum FK              | 2026-08-30 12:00 | 2026-08-31 21:30 | scheduled              | update kickoff        |
| Amed SK - Trabzonspor            | 2026-08-30 12:00 | 2026-08-31 21:30 | scheduled              | update kickoff        |
| Crystal Palace - Manchester City | 2026-08-28 22:00 | 2026-08-28 22:00 | scheduled              | none                  |
| Liverpool - Nottingham Forest    | 2026-08-29 14:30 | 2026-08-29 14:30 | scheduled              | none                  |
| Tottenham - Newcastle United     | 2026-08-29 19:30 | 2026-08-29 19:30 | scheduled              | none                  |
| Chelsea - Brighton               | 2026-08-30 16:00 | 2026-08-30 16:00 | scheduled              | none                  |
| Real Madrid - Malaga             | 2026-08-30 18:00 | 2026-08-30 18:00 | scheduled              | none                  |
| Manchester United - Ipswich      | 2026-08-30 18:30 | 2026-08-30 18:30 | scheduled              | none                  |
| Aston Villa - Arsenal            | 2026-08-31 22:00 | 2026-08-31 22:00 | scheduled              | none                  |
| Barcelona - Rayo Vallecano       | 2026-08-31 22:30 | 2026-08-31 22:30 | scheduled              | none                  |

## Migrations

- `supabase/migrations/20260827221500_update_real_madrid_real_sociedad_result.sql` — Real Madrid 4-1; Mbappé hat-trick, Vinícius 68', Sučić 44'
- `supabase/migrations/20260827221501_update_kauno_zalgiris_besiktas_result.sql` — Kauno Žalgiris 1-0; Oliveira 64'
- `supabase/migrations/20260827221600_update_super_lig_week3_kickoffs.sql` — 4 Süper Lig maçı TFF 3. hafta saatleri

## Skipped

- Ferencváros - Trabzonspor — kaynak FT değil (ESPN 45'+1', 1-0 canlı)
- Barcelona - Athletic Bilbao — kaynak FT değil (ESPN ~5' canlı)

## Notes

- Dün atlanan Real Madrid–Real Sociedad (26.08) FT teyidi sonrası güncellendi.
- Süper Lig 12:00 placeholder'ları TFF 3. hafta programına göre düzeltildi; GS–Göztepe ayrıca **29.08**'a taşındı.
- PL/La Liga penceredeki diğer maçların kickoff'ları kaynakla uyumlu; değişiklik yok.
- 3 changed (2 result + 4 kickoff), 2 skipped (live), 11 unchanged.
