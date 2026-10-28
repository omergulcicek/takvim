# Weekly fixture sync — 2026-09-21

- Invoked: 2026-09-21 22:41 (`Europe/Istanbul`)
- Window: 2026-09-21 → 2026-10-05 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.web.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261005 — UL 4. hafta; Fransa–Belçika, İtalya–Türkiye **18:45Z = 21:45 TR**
- https://site.web.api.espn.com/apis/site/v2/sports/soccer/eng.1|esp.1|tur.1 + uefa.* scoreboards (21 Eyl–5 Eki) — tracked kulüp / UEFA maçı yok

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                          | Competition | Kickoff (source) | In DB? | Action            |
| ------------------------------ | ----------- | ---------------- | ------ | ----------------- |
| Fransa - Belçika               | UL 4        | 5 Eki 21:45      | no     | add               |
| İtalya - Türkiye               | UL 4        | 5 Eki 21:45      | no     | add               |
| Mevcut UL MD1–4 (24 Eyl–4 Eki) | UL          | 21:45 / 19:00    | yes    | none (kickoff OK) |
| Tracked lig / UCL / UEL / UECL | —           | —                | —      | none in window    |

## Events checked

| Event                     | Status    | Action                   |
| ------------------------- | --------- | ------------------------ |
| Bugün (21 Eyl) kulüp maçı | —         | yok                      |
| UL pencere maçları        | scheduled | none (kickoff eşleşiyor) |

## Migrations

- `supabase/migrations/20260921224100_add_nations_league_matchday4_oct5.sql` (MCP: `add_ul_md4_fransa_italya_oct5`)

## Skipped

- Hazırlık (non-TR) — kapsam dışı
- Kulüp fikstürü — milli ara, pencere içinde yok

## Notes

- **2** yeni Uluslar Ligi maçı; skor / kickoff güncellemesi yok
