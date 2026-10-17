# Weekly Fixture Sync (Runbook)

**Trigger:** This runbook runs **only when this file is explicitly invoked** (referenced / attached / “run weekly-fixture-sync”). It is not a cron job.

**Purpose:** One pass over the next **two weeks** of in-scope fixtures:

1. **Add** newly confirmed matches for tracked **clubs** and tracked **national teams** that are not yet in the DB (domestic league + UEFA club cups + national-team competitions per rules below).
2. **Correct** kickoff date/time when the source differs.
3. **Write** match results for **finished** games that still lack a score, including **yesterday** (`Europe/Istanbul`) when the title is still unscored.

**Must follow:** [`docs/event-data-rules.md`](./event-data-rules.md) for every SQL change.

---

## Scope

### Tracked clubs

When searching club sources, only look up fixtures for these clubs. Do not scan full competition calendars beyond what is needed for these teams.

| League          | Clubs                                                                              | What to add                                          |
| --------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------- |
| **Süper Lig**   | Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor                                     | League + UEFA                                        |
| **Premier Lig** | Arsenal, Liverpool, Manchester City, Manchester United, Tottenham Hotspur, Chelsea | League + UCL                                         |
| **La Liga**     | Barcelona, Real Madrid                                                             | League + UCL                                         |
| **UCL-only**    | Bayern Münih, Paris Saint-Germain, Inter, Juventus, Milan, Napoli, Roma            | **UCL only** — no domestic league, no UEL/UECL       |
| **Serie A**     | Inter, Juventus, Milan, Napoli, Roma                                               | League match **only if both sides** are in this five |

Title spelling: `Bayern Münih`, `Paris Saint-Germain`, `Inter`, `Juventus`, `Milan`, `Napoli`, `Roma`.

The Italian five are in **both** rows. Scan every Şampiyonlar Ligi match of those seven UCL-only clubs. Scan a Serie A match only when the opponent is also in the five. If one of them is in Avrupa Ligi or Konferans Ligi instead of Şampiyonlar Ligi, skip that competition.

### Tracked national teams

When searching national-team sources (Uluslar Ligi, Dünya Kupası, Copa América, Euro, hazırlık vb.), only look up fixtures for these **8** sides. Do **not** import full competition calendars.

| Region / confederation | National teams                                         |
| ---------------------- | ------------------------------------------------------ |
| **UEFA**               | İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye |
| **CONMEBOL**           | Arjantin, Brezilya                                     |

Add a national-team match **only if at least one side is on this list** (same rule as UCL for clubs).

| Example                          | Add?    | Why                             |
| -------------------------------- | ------- | ------------------------------- |
| Türkiye - Fransa                 | **Yes** | Both tracked                    |
| İngiltere - İspanya              | **Yes** | Both tracked                    |
| Avustralya - Brezilya (hazırlık) | **No**  | Hazırlık yalnızca Türkiye       |
| Türkiye - Galler (hazırlık)      | **Yes** | Türkiye + hazırlık              |
| Hollanda - Almanya (Uluslar)     | **Yes** | Almanya tracked (resmi turnuva) |
| İtalya - Belçika                 | **No**  | Neither side tracked            |

Turkish title names: `Türkiye`, `Fransa`, `İspanya`, `İngiltere`, `Portekiz`, `Almanya`, `Arjantin`, `Brezilya` (and opponents in Turkish: `Galler`, `Hollanda`, `Yunanistan`, …).

### Categories (DB slugs)

| Slug               | Used for                                                                                           |
| ------------------ | -------------------------------------------------------------------------------------------------- |
| `galatasaray`      | Galatasaray — Süper Lig; UEFA when Galatasaray plays                                               |
| `fenerbahce`       | Fenerbahçe — Süper Lig; UEFA when Fenerbahçe plays                                                 |
| `besiktas`         | Beşiktaş — Süper Lig; UEFA when Beşiktaş plays                                                     |
| `trabzonspor`      | Trabzonspor — Süper Lig; UEFA when Trabzonspor plays                                               |
| `premier-lig`      | Premier Lig matches of the six English clubs above                                                 |
| `la-liga`          | La Liga matches of Barcelona and Real Madrid                                                       |
| `serie-a`          | Serie A matches where **both** sides are Inter, Juventus, Milan, Napoli, or Roma                   |
| `sampiyonlar-ligi` | Şampiyonlar Ligi matches where **at least one side is a tracked club** (domestic 12 or UCL-only 7) |
| `milli-takimlar`   | Millî takım maçları where **≥1 tracked national team** plays (Uluslar Ligi, DK, …)                 |

### Şampiyonlar Ligi — hangi maçlar eklenir?

During the 2-week fixture discovery, add UCL matches **only if at least one club is tracked** (the domestic 12 or the UCL-only 7). Domestic clubs link **club or league slug + `sampiyonlar-ligi`**. UCL-only clubs link **`sampiyonlar-ligi` only** — do not add their domestic league matches.

| Example                | Add?    | Why                                  |
| ---------------------- | ------- | ------------------------------------ |
| Barcelona - Lyon       | **Yes** | Barcelona is tracked                 |
| Lyon - Porto           | **No**  | Neither side is tracked              |
| Galatasaray - PSG      | **Yes** | Galatasaray is tracked               |
| Viking - Bayern Münih  | **Yes** | Bayern Münih is UCL-only             |
| Liverpool - Fenerbahçe | **Yes** | Liverpool and Fenerbahçe are tracked |
| Sporting - Stuttgart   | **No**  | Neither side is tracked              |

Do **not** import the full UCL matchday or scan every fixture on UEFA.com — only fixtures that involve a tracked club in the window.

### Serie A — hangi maçlar eklenir?

Add a Serie A match **only when both sides** are Inter, Juventus, Milan, Napoli, or Roma. Link **`serie-a` only**. Description `NULL`.

| Example              | Add?                | Why                               |
| -------------------- | ------------------- | --------------------------------- |
| Napoli - Roma        | **Yes**             | Both sides are in the five        |
| Milan - Inter        | **Yes**             | Both sides are in the five        |
| Juventus - Lecce     | **No**              | Lecce is outside the five         |
| Inter - Napoli (UCL) | **No** as `serie-a` | UCL stays `sampiyonlar-ligi` only |

Do **not** import the rest of Serie A.

### Avrupa Ligi / Konferans Ligi — hangi maçlar eklenir?

During the 2-week fixture discovery, also scan **UEFA Avrupa Ligi** and **UEFA Konferans Ligi** for the **four Turkish clubs only** (Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor) — including league phase and qualifying/play-off when kickoff is confirmed.

| Example                           | Add?    | Why                                                                      |
| --------------------------------- | ------- | ------------------------------------------------------------------------ |
| Beşiktaş - Marsilya (UEL)         | **Yes** | Beşiktaş is one of the four                                              |
| Trabzonspor - Hearts (UECL)       | **Yes** | Trabzonspor is one of the four                                           |
| Crystal Palace - Hoffenheim (UEL) | **No**  | No Turkish big-four club                                                 |
| Arsenal - Athletic (UEL)          | **No**  | English tracked clubs: UEL/UECL **not** in add scope (UCL only for them) |
| Juventus - Rennes (UEL)           | **No**  | UCL-only clubs: UEL/UECL **not** in add scope                            |

Link **club slug only** (no `avrupa-ligi` / konferans category yet) per event-data-rules §2.3. Pre-match description: `'Avrupa Ligi …'` / `'Konferans Ligi …'` round text (same style as existing eleme / lig aşaması events).

Do **not** import full UEL/UECL matchdays — only fixtures of GS / FB / BJK / TS in the window. Do **not** add Avrupa Ligi or Konferans Ligi fixtures for the UCL-only seven (Bayern Münih, Paris Saint-Germain, Inter, Juventus, Milan, Napoli, Roma).

There is **no** separate Süper Lig category. Süper Lig fixtures link the relevant club slug(s); derbies link **both** clubs.

### Millî takım maçları — hangi maçlar eklenir?

During the 2-week fixture discovery, scan **UEFA Uluslar Ligi**, Dünya Kupası / eleme, Avrupa Şampiyonası, Copa América for the **8 tracked national teams**, and confirmed **hazırlık** matches **only when Türkiye plays**.

| Match type                        | Add?                                   |
| --------------------------------- | -------------------------------------- |
| Uluslar Ligi / DK / Euro / Copa … | ≥1 tracked national team               |
| Hazırlık maçı                     | **Only if Türkiye is home or away**    |
| Other tracked NT friendlies       | **No** (e.g. Brezilya–Avustralya skip) |

Link **`milli-takimlar` only** (one category for all national-team events). Pre-match description: `'Uluslar Ligi lig aşaması — N. hafta'` / `'Hazırlık maçı'` (Türkiye only) / other round text per event-data-rules — never invent competition labels.

Do **not** import full Nations League matchdays — only fixtures with ≥1 tracked national team and a **confirmed** kickoff (date + time). Date-only friendlies → `skipped: kickoff not confirmed`.

### What to add vs what to sync only

| Competition       | Add new fixtures? | Notes                                                                        |
| ----------------- | ----------------- | ---------------------------------------------------------------------------- |
| Süper Lig         | **Yes**           | Only matches of the four Turkish clubs                                       |
| Premier Lig       | **Yes**           | Only matches of the six English clubs                                        |
| La Liga           | **Yes**           | Only matches of Barcelona and Real Madrid                                    |
| Serie A           | **Yes**           | Only when **both** sides are Inter, Juventus, Milan, Napoli, or Roma         |
| Şampiyonlar Ligi  | **Yes**           | Domestic 12 **or** UCL-only 7; UCL-only clubs have no domestic league import |
| Avrupa Ligi       | **Yes**           | **Only** GS / FB / BJK / TS (not PL / La Liga clubs)                         |
| Konferans Ligi    | **Yes**           | **Only** GS / FB / BJK / TS                                                  |
| Uluslar Ligi / NT | **Yes**           | ≥1 tracked national team; **hazırlık yalnızca Türkiye**                      |
| Domestic cup      | **No** (add step) | Existing events: kickoff + result sync only                                  |

### Time window

```text
window_start    = calendar date of the invocation (Europe/Istanbul)
window_end      = window_start + 14 days (inclusive)
result_lookback = window_start - 1 day
```

When searching external sources for **new** fixtures, stay inside `window_start` → `window_end` only — do not scan the rest of the season, and do not add fixtures from `result_lookback`.

For kickoff sync, process in-scope events whose `start_date` falls in the window (including events already in DB from earlier imports).

For **result** sync, also include in-scope events whose kickoff falls on `result_lookback` when the title is still unscored. That day is result-only: confirm FT, write a score if it is missing, and leave kickoff discovery there alone. Do not rescan the season.

---

## Hard constraints (anti-hallucination)

1. **Never invent** kickoff times, scores, scorers, or cards.
2. Every factual claim must come from a **reliable public source** (official competition site, club site, or a well-known sports results source). Cite the source URL in the log.
3. **Unfinished match** → do not touch title/description for results. Leave as-is even if media speculate.
4. **Finished match** → update only if the event title is still **unscored** (no `N - N` score pattern). Skip if already scored unless the source proves a clear data error (then note it in the log; do not silently overwrite).
5. If kickoff was postponed and the new date is outside the window, still `UPDATE` `start_date`/`end_date` so the event leaves the wrong day on the calendar; record that in the log.
6. If a source is conflicting or incomplete → **skip that event**, log `skipped: ambiguous source`, write no migration for it.
7. **Add fixtures only when kickoff is confirmed** on source (date + time). If only the matchday is known → skip the add and log `skipped: kickoff not confirmed`. Use `12:00` placeholder only when the project already uses that pattern for a known matchday with TFF/PL/La Liga “saat sonra açıklanacak” — then plan a kickoff `UPDATE` when the time is published.

### “Günün maçları” / today-only checks

When the user asks to check **today’s matches** (`bugünün maçları`, `bugünü kontrol et`, etc.), scope the **result** work to events whose kickoff falls on **today’s calendar date** (`Europe/Istanbul`). Fixture discovery and kickoff sync for the wider two-week window may still apply if the runbook is invoked in full mode.

For those today events:

| User intent           | Agent action                                                    |
| --------------------- | --------------------------------------------------------------- |
| Check today’s matches | Result updates **only** for matches that have **finished (FT)** |
| Match still live / HT | Log `scheduled` or `live`; **no** title/description change      |
| Match not started yet | Log `scheduled`; kickoff update only if source differs          |

**“Finished” means FT — not live, not HT, not “First Half ends”.** Before writing a result:

1. At least one source must show an explicit **full-time / FT / final / maç sonu** status label (not merely a running score on the page).
2. **Hard reject (do not write a result migration)** if any of these are true on the primary source:
   - status / description is `Live`, `Second Half`, `First Half`, `HT`, `Half Time`, or equivalent
   - a **minute clock** is shown (`67'`, `80'`, `90+2'`, stoppage display) without an accompanying FT/final label
   - `completed: false` / `state: "in"` (or equivalent API fields) when available
3. Prefer two agreeing sources when the first is a live page that may lag; both must show FT — agreement on the **score alone** is not enough.
4. Halftime score, partial commentary, or a live ticker at invocation time → **skip** the result; log `skipped: not finished`.
5. If kickoff + 2 h has not passed (`Europe/Istanbul`) **and** status is not clearly FT, default to **skip**. Do not treat “likely finished” or “score looks final” as FT.
6. A scoreboard line that lists scorers **without** FT/final status is still live data — **skip**.

Wrong early score is worse than a missing score. When in doubt, leave unscored and log why. Never “catch up” a live score mid-match.

---

## Single job procedure

Execute steps in order. Treat **fixture add**, kickoff sync, and result sync as **one job**, one log file.

### Step 1 — Discover league + UEFA fixtures (2-week window)

For each tracked club, check official or reliable sources:

| Competition                  | Sources (examples)                                                               |
| ---------------------------- | -------------------------------------------------------------------------------- |
| Süper Lig                    | TFF, Skorjet                                                                     |
| Premier Lig                  | premierleague.com, club sites                                                    |
| La Liga                      | laliga.com, fcbarcelona.com, realmadrid.com                                      |
| Şampiyonlar Ligi             | uefa.com, club sites — **only fixtures where a domestic or UCL-only club plays** |
| Serie A                      | legaseriea.it — **only both-sides matches of the Italian five**                  |
| Avrupa Ligi / Konferans Ligi | uefa.com, club sites, AA/TRT — **only GS / FB / BJK / TS**                       |
| Uluslar Ligi / millî maçlar  | uefa.com, TFF, federation sites — **only tracked national teams**                |

Build a list of `Home - Away` fixtures with confirmed kickoff (`Europe/Istanbul`). For UCL, Serie A, UEL / UECL, and national teams, apply the inclusion rules above before adding to the list. `serie-a` is an in-scope slug together with the club, league, `sampiyonlar-ligi`, and `milli-takimlar` slugs.

Compare against DB (`title` + `start_date`, or `title` alone if kickoff was placeholder).

| DB state                      | Action                                        |
| ----------------------------- | --------------------------------------------- |
| Match missing entirely        | Plan `add_` migration per event-data-rules §2 |
| Match exists, kickoff differs | Plan kickoff `UPDATE`                         |
| Match exists, kickoff matches | No add; may still need result sync later      |

Derbies already in DB under one title → do not duplicate; link missing club slug if needed.

### Step 2 — Load DB window

Query published timed events linked to in-scope slugs (`galatasaray`, `fenerbahce`, `besiktas`, `trabzonspor`, `premier-lig`, `la-liga`, `serie-a`, `sampiyonlar-ligi`, `milli-takimlar`). Prefer joining through `event_categories` → `categories`.

Load:

- every in-scope event whose `start_date` falls in the window
- yesterday’s in-scope events (`result_lookback`) whose title is still unscored

Collect per event:

- `id`, `title`, `description`, `start_date`, `end_date`
- category slugs
- whether title already matches a scored pattern (`~ '[0-9] - [0-9]'`)

### Step 3 — Verify each event against a source

For each event in the window (existing + newly planned), and for each unscored in-scope event on `result_lookback`:

Yesterday is **result-only**. Do not add fixtures from that day. Do not change kickoff unless a postponed match already in the DB has a new confirmed time.

| Check                               | If source differs / match finished                                                                                            |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Kickoff date/time (Europe/Istanbul) | Plan `UPDATE` of `start_date` / `end_date` (`end = start + 2 hours`; if that is **00:00** TR, use **23:55** same kickoff day) |
| Match status                        | If **FT / finished** (see below) and title unscored → plan result update per event-data-rules §3                              |
| Match status                        | If **live, HT, or not started** → no result fields; only kickoff update if needed                                             |

**FT check (required before any result migration):** source shows `FT`, `Full time`, `Final`, `Maç sonu`, or equivalent — not `Live`, `HT`, `Second Half`, `First Half ends`, a minute clock (`80'`), or a score/scorer list without final status. Score presence ≠ finished.

Placeholder `12:00` kickoffs: if the source now has a confirmed kickoff, update them **even when the new kickoff falls slightly outside the current +14d discovery window** (existing DB rows only — do not use this to import the rest of the season).

### Step 4 — Write migrations

For each planned change, add an idempotent migration under `supabase/migrations/`:

| Change                  | Filename pattern                                                            |
| ----------------------- | --------------------------------------------------------------------------- |
| New league / UEFA match | `YYYYMMDDHHMMSS_add_<topic>.sql`                                            |
| Kickoff only            | `YYYYMMDDHHMMSS_update_<slug>_kickoff.sql` (or `fix_` for tiny corrections) |
| Result                  | `YYYYMMDDHHMMSS_update_<slug>_result.sql`                                   |

Migrations are `INSERT` and `UPDATE` only. Do not write `DELETE`, `TRUNCATE`, or `DROP`.

Do not invent SQL that does not match [`event-data-rules.md`](./event-data-rules.md).

If nothing changed → no migration files. Do not commit and do not call `apply_migration`.

### Step 4b — Branch, merge, then apply

Use one long-lived branch, `cursor-automations`. Do not open a new branch per run.

1. Fetch `origin`.
2. If `cursor-automations` does not exist, create it from `origin/main`.
3. If it exists, check it out and merge `origin/main` into it before editing.
4. Commit the migration files and the run log on `cursor-automations` and push that branch.
5. If a pull request from `cursor-automations` into `main` is already open, push to it. Do not open a second pull request. Then merge that pull request into `main`.
6. If no pull request is open and this run has commits, open one pull request into `main`, then merge it.
7. Apply those migrations to the remote **Takvim** Supabase project with `apply_migration` only after the commits are on `main`.
8. If Supabase is not connected, push the branch and stop. Do not claim the live calendar changed.

A later run the same day uses this same branch: merge `main` in first, then commit again. The branch stays; it is not replaced by a new one.

### Step 5 — Write the run log

Create:

```text
docs/logs/YYYY-MM-DD-haftalik-kontrol.md
```

Use the invocation date in `Europe/Istanbul` as `YYYY-MM-DD`. If a file for that day already exists, append a new `## Run <HH:MM TR>` section instead of overwriting.

#### Log template

```markdown
# Weekly fixture sync — YYYY-MM-DD

- Invoked: YYYY-MM-DD HH:MM (`Europe/Istanbul`)
- Window: YYYY-MM-DD → YYYY-MM-DD (+14d)
- Result lookback: YYYY-MM-DD (yesterday, unscored only)
- Branch: `cursor-automations`
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- UCL-only: Bayern Münih, Paris Saint-Germain, Inter, Juventus, Milan, Napoli, Roma
- Serie A (both sides only): Inter, Juventus, Milan, Napoli, Roma
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- <url> — <what it covered>

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                 | Competition | Kickoff (source) | In DB?      | Action                   |
| --------------------- | ----------- | ---------------- | ----------- | ------------------------ |
| Barcelona - Lyon      | UCL         | 2026-09-10 22:00 | no          | add fixture              |
| Viking - Bayern Münih | UCL         | 2026-10-13 22:00 | no          | add fixture              |
| Napoli - Roma         | Serie A     | 2026-10-24 19:00 | no          | add fixture              |
| Juventus - Lecce      | Serie A     | —                | —           | skipped: not both sides  |
| Beşiktaş - Marsilya   | UEL         | 2026-09-17 22:00 | no          | add fixture              |
| Lyon - Porto          | UCL         | —                | —           | skipped: no tracked club |
| Home - Away           | Süper Lig   | 2026-09-06 20:00 | yes (12:00) | update kickoff           |

## Events checked

| Event       | Kickoff (DB)     | Kickoff (source) | Status       | Action         |
| ----------- | ---------------- | ---------------- | ------------ | -------------- |
| Home - Away | 2026-08-06 20:00 | 2026-08-06 20:00 | scheduled    | none           |
| Home - Away | 2026-08-03 12:00 | 2026-08-03 21:30 | scheduled    | update kickoff |
| Home - Away | 2026-08-02 21:00 | 2026-08-02 21:00 | finished 2-1 | update result  |

## Migrations

- `supabase/migrations/...sql` — short note
- _(none)_

## Skipped

- <title> — reason (e.g. ambiguous source / not finished / kickoff not confirmed)

## Notes

- …
```

---

## Result update reminder

Only for **finished + unscored** events. Follow event-data-rules exactly:

- Title → `Home <h> - <a> Away`
- Description → goal list (`E'...'`), or `NULL` if no goals / empty
- Replace any pre-match round description with the goal list
- Idempotent `WHERE title = 'Home - Away' OR title = 'Home X - Y Away'`

### Description layout (no leading blank)

Home lines, then a blank separator, then away lines — **but only when both sides have at least one line** (goal or red card).

| Situation               | Description starts with                |
| ----------------------- | -------------------------------------- |
| Only home has lines     | First home line (no trailing blank)    |
| Only away has lines     | First away line (**no leading blank**) |
| Both sides have lines   | Home lines → blank → away lines        |
| Neither (0-0, no cards) | `NULL`                                 |

Never invent scorers. If FT score is known but scorer list is not verified → update title/score only and set description carefully per rules (or skip description and log the gap). Prefer skipping the whole result update over guessing minutes/names.

---

## Out of scope

- League fixtures for clubs **not** in the tracked list above
- Şampiyonlar Ligi pairings that do **not** involve a tracked club (domestic 12 or UCL-only 7)
- Domestic league matches of UCL-only clubs (Bayern, PSG, and the Italian five outside a both-sides Serie A pairing)
- Serie A matches where either side is outside Inter, Juventus, Milan, Napoli, Roma
- Avrupa Ligi / Konferans Ligi pairings that do **not** involve GS / FB / BJK / TS
- Avrupa Ligi / Konferans Ligi for PL / La Liga tracked clubs (those clubs: UCL + domestic only)
- Avrupa Ligi / Konferans Ligi for UCL-only clubs (Bayern Münih, Paris Saint-Germain, Inter, Juventus, Milan, Napoli, Roma)
- Millî takım maçları where **neither** side is a tracked national team
- **Hazırlık** maçları where **Türkiye does not play** (other tracked NTs’ friendlies are out of scope)
- Domestic cup **new** fixture imports (existing events: kickoff + result sync only)
- Non-football events unless explicitly requested
- Bulk full-season imports beyond the 2-week discovery window
- Guessing live scores or “about to finish” matches
- Writing results from **in-progress** matches, even if the current score is visible on a live page

---

## Agent checklist

1. Confirm this file was explicitly invoked
2. Compute Istanbul window: today → today+14d, plus yesterday for unscored results only
3. Check out `cursor-automations` (create from `origin/main` if missing; otherwise merge `origin/main` in first)
4. For each **tracked club**, discover fixtures in the window (domestic league for the 12; UCL for the 12 and the UCL-only 7; Serie A only when both sides are in the Italian five; UEL/UECL **only** GS/FB/BJK/TS); compare to DB; plan `add_` migrations for missing confirmed fixtures
5. For each **tracked national team**, discover Uluslar Ligi / turnuva fixtures (≥1 tracked side + confirmed kickoff); hazırlık **yalnızca Türkiye**; plan `add_` with `milli-takimlar`
6. Load in-scope events in the window, plus yesterday’s unscored in-scope events
7. If the user asked for **today’s matches**, filter result work to kickoffs on today’s date (yesterday’s result lookback still applies on a full run)
8. Verify each event against a reliable source (cite URLs)
9. For every result candidate, including yesterday: confirm **FT** on source(s) — never from live/HT/partial data; reject if minute clock or `Live`/`Second Half` is visible
10. Plan add + kickoff + **FT-only** result updates (no mid-match score writes). SQL is `INSERT` / `UPDATE` only
11. Write `docs/logs/YYYY-MM-DD-haftalik-kontrol.md`
12. Commit and push on `cursor-automations`, reuse the open pull request or open one, merge it into `main`, then `apply_migration` on the **Takvim** project
13. Summarize to the user: added / changed / skipped / unchanged counts, and whether the migrations were applied
