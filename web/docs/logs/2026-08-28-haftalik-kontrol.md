# Weekly fixture sync — 2026-08-28

## Run 01:08 TR

- Invoked: 2026-08-28 01:08 (`Europe/Istanbul`)
- Scope: Dün (27.08) atlanan canlı maçlar — FT teyidi
- Categories: trabzonspor, la-liga

## Sources

- https://www.espn.com/soccer/match/_/gameId/401909831/trabzonspor-ferencvaros — Ferencváros 4-0 Trabzonspor **FT**; O'Dowda 19', Corbu 54', Yusuf 59' (Pen), Lisztes 86'
- https://www.espn.com/soccer/match/_/gameId/401882921/athletic-club-barcelona — Barcelona 2-0 Athletic **FT**; Raphinha 37', Fermín López 82'

## Events checked

| Event                       | Kickoff (DB)     | Status                 | Action        |
| --------------------------- | ---------------- | ---------------------- | ------------- |
| Ferencváros - Trabzonspor   | 2026-08-27 21:30 | finished 4-0 (agg 5-0) | update result |
| Barcelona - Athletic Bilbao | 2026-08-27 22:00 | finished 2-0           | update result |

## Migrations

- `supabase/migrations/20260828010800_update_ferencvaros_trabzonspor_result.sql` — Ferencváros 4-0; O'Dowda 19', Corbu 54', Yusuf 59' (Pen), Lisztes 86'
- `supabase/migrations/20260828010801_update_barcelona_athletic_bilbao_result.sql` — Barcelona 2-0; Raphinha 37', Fermín López 82'

## Skipped

- _(none)_

## Notes

- 27.08 akşamı canlı atlanan iki maç FT sonrası güncellendi.
- 2 changed, 0 skipped.
