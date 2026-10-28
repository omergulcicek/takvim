# Weekly fixture sync — 2026-09-22

- Invoked: 2026-09-22 12:02 (`Europe/Istanbul`)
- Window: 2026-09-22 → 2026-10-06 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261006 — UL 4. hafta; Hırvatistan–İspanya, İngiltere–Çekya **18:45Z = 21:45 TR**
- ESPN eng.1 / esp.1 / tur.1 / uefa.* (22 Eyl–6 Eki) — tracked kulüp / UEFA maçı yok

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                          | Competition | Kickoff (source) | In DB? | Action         |
| ------------------------------ | ----------- | ---------------- | ------ | -------------- |
| Hırvatistan - İspanya          | UL 4        | 6 Eki 21:45      | no     | add            |
| İngiltere - Çekya              | UL 4        | 6 Eki 21:45      | no     | add            |
| Mevcut UL (24 Eyl–5 Eki)       | UL          | 21:45 / 19:00    | yes    | none           |
| Tracked lig / UCL / UEL / UECL | —           | —                | —      | none in window |

## Events checked

| Event              | Status    | Action     |
| ------------------ | --------- | ---------- |
| Bugün (22 Eyl)     | —         | maç yok    |
| UL pencere maçları | scheduled | kickoff OK |

## Migrations

- `supabase/migrations/20260922120200_add_nations_league_matchday4_oct6.sql` (MCP: `add_ul_md4_ispanya_ingiltere_oct6`)

## Skipped

- Kulüp fikstürü — milli ara
- Hazırlık (non-TR) — kapsam dışı

## Notes

- **2** yeni Uluslar Ligi maçı; skor / kickoff güncellemesi yok
