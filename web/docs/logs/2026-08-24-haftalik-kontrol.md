# Weekly fixture sync — 2026-08-24

- Invoked: 2026-08-24 16:04 (`Europe/Istanbul`)
- Scope: Elche–Barcelona (23 Ağustos maçı, FT)

## Sources

- https://www.espn.com/soccer/report/_/gameId/401882913 — Final 0-5; Raphinha 14' pen, 67'; Adeyemi 45+3'; Fermín López 71', 79'
- https://www.statmuse.com/fc/match/8-23-2026-elc-vs-fcb-113468 — FT 0-5; aynı goller (Adeyemi 45+3')
- https://www.beinsports.com/en-us/soccer/la-liga/articles/elche-0-5-barcelona-raphinha-and-fermin-double-up-in-five-star-showing-2026-08-23 — FT 0-5; Raphinha ve Fermín duble, Adeyemi İY uzatma

## Events checked

| Event             | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ----------------- | ---------------- | ---------------- | ------------ | ------------- |
| Elche - Barcelona | 2026-08-23 22:30 | 2026-08-23 22:30 | finished 0-5 | update result |

## Migrations

- `supabase/migrations/20260824160400_update_elche_barcelona_result.sql` — 0-5; Raphinha 14' (P) 67', Adeyemi 45+3', Fermín López 71' 79' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- FOX Adeyemi dakikasını 45+2 gösterir; ESPN + StatMuse 45+3 ile uyumlu — 45+3 yazıldı.
- Ev sahibi golü yok; description deplasman satırlarıyla başlar (leading blank yok).
- 1 changed, 0 skipped.
