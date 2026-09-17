# Event Data Rules

Canonical rule set for inserting and updating Supabase calendar events in this repo. Derived from existing migration patterns and `docs/MEMORIES.md`.

> **Apply path:** write `supabase/migrations/YYYYMMDDHHMMSS_<verb>_<slug>.sql` → apply remotely with `apply_migration`.  
> Never use legacy `events.category_id`. Always use the `event_categories` junction table.

When this file is referenced for match results or kickoff changes, also follow templates below exactly. For the weekly sync workflow, see [`docs/weekly-fixture-sync.md`](./weekly-fixture-sync.md).

---

## 1. Global rules

| Rule             | Detail                                                                                                                                                                                                                                                                                                                              |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Timezone         | Timed matches: `('YYYY-MM-DD HH:MM:SS'::timestamp AT TIME ZONE 'Europe/Istanbul')`                                                                                                                                                                                                                                                  |
| Duration (match) | `end_date = start_date + interval '2 hours'`. If that lands on **00:00** (`Europe/Istanbul`), use **23:55** on the kickoff day instead — so ICS / Apple / Google do not place the match on the next calendar day. Leave `00:15` / `00:30` and other after-midnight ends as-is. Extra time/penalties may still extend past midnight. |
| Status           | `'published'`                                                                                                                                                                                                                                                                                                                       |
| Idempotent       | `NOT EXISTS` (title ± start_date) + `ON CONFLICT DO NOTHING` (junction)                                                                                                                                                                                                                                                             |
| Unknown kickoff  | Use **12:00** placeholder (`Europe/Istanbul`); `UPDATE` when kickoff is confirmed                                                                                                                                                                                                                                                   |
| Language         | Title/description in Turkish; club names match on-screen / official spelling                                                                                                                                                                                                                                                        |

### Migration filename

```text
YYYYMMDDHHMMSS_<verb>_<topic>.sql
```

| Verb                   | When                         |
| ---------------------- | ---------------------------- |
| `add_`                 | New event                    |
| `update_*_result`      | Match result (score + goals) |
| `update_*_description` | Description fix              |
| `fix_`                 | Small correction             |
| `replace_`             | Opponent / match swap        |

Start every migration with a short Turkish comment describing the change.

---

## 2. Add a football match

### 2.1 Title (pre-match)

```text
Home - Away
```

Examples: `Galatasaray - Çorum FK`, `Hradec Králové - Beşiktaş`, `Fenerbahçe - Sturm Graz`

Do **not** put the score in the title before kickoff.

### 2.2 Description (pre-match)

| Competition                 | Description                                                                       |
| --------------------------- | --------------------------------------------------------------------------------- |
| Süper Lig                   | **`NULL`** — omit                                                                 |
| La Liga                     | **`NULL`** — omit                                                                 |
| Premier Lig                 | **`NULL`** — omit                                                                 |
| Europa League qualifying    | `'Avrupa Ligi … eleme turu ilk maç'` / `'… rövanş maçı'`                          |
| Champions League qualifying | `'Şampiyonlar Ligi … eleme turu ilk maç'` / `'… rövanş maçı'`                     |
| UEFA Nations League         | `'Uluslar Ligi lig aşaması — N. hafta'`                                           |
| National-team friendly      | `'Hazırlık maçı'` — **yalnızca Türkiye** maçları (diğer NT hazırlıkları eklenmez) |

### 2.3 Category links

| Match type       | `event_categories` slugs                                                                                                   |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Süper Lig        | Club slug(s): `galatasaray` \| `fenerbahce` \| `besiktas` \| `trabzonspor` — derbies link **both** clubs to the same event |
| La Liga          | `la-liga`                                                                                                                  |
| Premier Lig      | `premier-lig`                                                                                                              |
| Champions League | Club **+** `sampiyonlar-ligi`                                                                                              |
| Europa League    | Club only for now (no `avrupa-ligi` category)                                                                              |
| Millî Takımlar   | `milli-takimlar` (Dünya Kupası, Uluslar Ligi, Copa América vb.)                                                            |

> There is **no** separate Süper Lig category.

### 2.4 SQL template (add match)

```sql
-- Short note: which match / competition

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Home - Away',
    NULL, -- or Europa/UCL round text
    ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    -- 22:00 kickoff → end is 00:00; write 23:55 on the kickoff day instead:
    -- ('2026-08-21 23:55:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Home - Away'
      AND e.start_date = ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('club-slug') -- UCL: IN ('club-slug', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
```

### 2.5 Checklist (new match)

1. Title: `Home - Away` (no score)
2. Kickoff known? If not → `12:00` placeholder
3. `Europe/Istanbul` + `+ 2 hours`; if end would be `00:00`, use **23:55** same kickoff day
4. Süper Lig → `description NULL`, club only
5. La Liga / Premier Lig → `description NULL`, competition slug only
6. UCL → round description + club + `sampiyonlar-ligi`
7. `NOT EXISTS` + `ON CONFLICT DO NOTHING`
8. `is_all_day = false`, `recurrence = 'none'`, `status = 'published'`

---

## 3. Match result and goals

When a match finishes, **do not insert a new row**. `UPDATE` the existing event.

### 3.1 Title (post-match)

```text
Home <home_goals> - <away_goals> Away
```

Examples: `Beşiktaş 1 - 0 FC Midtjylland`, `FC Midtjylland 0 - 2 Beşiktaş`

### 3.2 Description (goal list)

Format (escape string `E'...'`):

```text
<Home scorers, one entry per line>

<blank line>

<Away scorers, one entry per line>
```

Line patterns:

```text
Player Name <minute>''
Player Name <minute>'' (Penaltı)
Player Name <minute>'' (Kırmızı kart)
Player Name 37'', 45+1'', 87'' (Penaltı)   -- same player, multiple goals
```

| Rule             | Detail                                                                                                                                               |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| Apostrophe       | In SQL minutes use `37''` → displays as `37'`                                                                                                        |
| Order            | Home lines first, blank line, then away — **omit the blank (and the empty side) when only one side has lines**; never start or end with a blank line |
| Annotations      | `(Penaltı)`, `(Kırmızı kart)`, own goal: `(kk)`                                                                                                      |
| No goals         | `description = NULL` (`NULLIF(E'', '')`)                                                                                                             |
| Round text       | On result, replace round description with the goal list                                                                                              |
| Idempotent WHERE | Old title **or** scored title: `WHERE title = 'A - B' OR title = 'A 1 - 0 B'`                                                                        |

### 3.3 SQL template (result)

```sql
-- Home X - Y Away (Competition)

UPDATE public.events
SET
  title = 'Home 1 - 0 Away',
  description = NULLIF(E'Scorer 26''

Opponent Scorer 70'' (Penaltı)', '')
WHERE title = 'Home - Away'
   OR title = 'Home 1 - 0 Away';
```

### 3.4 World Cup differences

- Flags in title: `🇫🇷 Fransa 0 - 2 İspanya 🇪🇸`
- Extra time / penalties: `end_date` may exceed 2 hours (`2 hours 30 minutes`, `3 hours 15 minutes`)
- WHERE: category + team `LIKE` + still unscored: `NOT (title ~ '[0-9] - [0-9]')`

---

## 4. Notable people (`onemli-sahsiyetler`)

1. Insert `subjects` (biography + `source_url`, usually Wikipedia)
2. Insert anniversary event(s) → link via `event_categories`

### Title

| Kind  | Title                      | `kind`  |
| ----- | -------------------------- | ------- |
| Birth | `{Name}: Doğum Yıl Dönümü` | `birth` |
| Death | `{Name}: Vefat Yıl Dönümü` | `death` |

### Date (all-day, Gregorian)

Write the Istanbul calendar day as a UTC+3 window:

```text
start: 'YYYY-MM-DD 21:00:00+00'   -- TR midnight 00:00 (previous day 21:00 UTC)
end:   'YYYY-MM-DD+1 20:59:59+00'
is_all_day: true
recurrence: 'yearly'
```

### Other

- Event `description`: usually `NULL` (copy lives on the subject)
- Do not repeat the date inside the subject description
- `subject_id` is required

---

## 5. Historical events (`tarihi-olaylar`)

1. Subject (event name + narrative + source)
2. Event: title is usually the subject name or `… Anma Günü`
3. `kind = 'commemoration'` (use `start` / `end` for war begin/end)
4. `calendar_system = 'gregorian'`, `recurrence = 'yearly'`, `is_all_day = true`
5. Event description usually `NULL`

If the subject is missing, insert it; if it exists, resolve the id with `UNION ALL` (see Kanije migration).

---

## 6. Religious / cultural days (summary)

| Category                   | Typical fields                                   |
| -------------------------- | ------------------------------------------------ |
| `dini-gunler`              | Hijri; `recurrence = 'hijri_yearly'`; no subject |
| `islam-tarihi`             | Hijri commemorations                             |
| `milli-ve-kulturel-gunler` | All-day yearly; usually no subject               |

Hijri days often manage `start_date`/`end_date` via override tables; inspect existing religious-day migrations before adding new ones.

---

## 7. Field summary

| Field              | Match (timed)                   | Anniversary / commemoration             |
| ------------------ | ------------------------------- | --------------------------------------- |
| `title`            | Home - Away / scored            | `{Name}: … Yıl Dönümü` or event name    |
| `description`      | Round / goals / `NULL` (SL)     | Usually `NULL`                          |
| `start` / `end`    | Istanbul + 2h (`00:00` → 23:55) | All-day UTC window                      |
| `is_all_day`       | `false`                         | `true`                                  |
| `recurrence`       | `none`                          | `yearly`                                |
| `event_categories` | Club ± competition              | Category slug                           |
| `subject_id`       | —                               | Required                                |
| `kind`             | —                               | `birth` / `death` / `commemoration` / … |
| `calendar_system`  | (default)                       | `gregorian` or `hijri`                  |

---

## 8. When adding a new category

Update UI maps as well as SQL seeds:

- `src/features/calendar/helpers/categories.ts` → color map
- `src/features/calendar/helpers/category-groups.ts` → group order

---

## 9. Workflow (agent / human)

1. User provides screenshot / data → first give a **short text summary** of what will be added
2. After approval, write the migration and apply it remotely
3. Verify with `SELECT`: title, kickoff (TR), categories, description
4. Note Süper Lig / special decisions in `docs/MEMORIES.md` Evolution when needed

### Quick decision table

| Situation                 | Action                                              |
| ------------------------- | --------------------------------------------------- |
| Süper Lig match           | No description; club only                           |
| La Liga / Premier Lig     | No description; competition slug only               |
| Europa / UCL qualifying   | Round description; UCL also adds `sampiyonlar-ligi` |
| Kickoff unknown           | `12:00` placeholder; update when confirmed          |
| Match finished            | `update_*_result`: scored title + goal description  |
| Person / historical event | Subject + yearly all-day event                      |
| Opponent changed          | `replace_`: delete old, add new                     |
