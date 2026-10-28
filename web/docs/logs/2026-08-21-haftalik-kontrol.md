# Weekly fixture sync — 2026-08-21

- Invoked: 2026-08-21 23:35 (`Europe/Istanbul`)
- Window: 2026-08-21 → 2026-08-28
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.haberler.com/spor/erzurumspor-fk-galatasaray-0-4-20165917-haberi/ — FT 0-4; Sallai 12', Yunus 20', Osimhen 45'/80' (DHA); kickoff Kazım Karabekir
- https://www.sabah.com.tr/spor/futbol/2026/08/21/son-dakika-galatasaray-rahat-kazandi-erzurumspor-fk-puanla-tanisamadi — aynı skor ve dakikalar (80')
- https://www.cumhuriyet.com.tr/spor/victor-osimhen-yildizlasti-galatasaray-deplasmanda-4-golle-guldu-2531169 — aynı skor; Osimhen 45'/80'
- https://www.espn.com/soccer/match/_/gameId/401888313/galatasaray-erzurum-bb — FT 0-4; Sallai 12', Yunus 20', Osimhen 45'/79'
- https://www.bbc.com/sport/football/live/ck78gg25jzjvt — FT 0-4; Osimhen 45'/79'
- https://www.birgun.net/haber/fenerbahce-konyaspor-maci-hangi-gun-saat-kacta-ve-hangi-kanalda-730473 — FB–Konyaspor 22.08 21:30
- https://www.gzt.com/spor/super-lig-2-hafta-hangi-maclar-var-3-hafta-mac-programi-galatasaray-fenerbahce-besiktas-ve-trabzonspor-maclari-4249056 — TFF: TS–Başakşehir 23.08 19:00; Alanyaspor–BJK 23.08 21:30
- https://www.turkiyegazetesi.com.tr/spor/fenerbahcenin-konugu-konyaspor-super-ligde-51inci-randevu-1810643 — FB–Konyaspor 22.08 21:30

## Events checked

| Event                        | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ---------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Erzurumspor FK - Galatasaray | 2026-08-21 21:30 | 2026-08-21 21:30 | finished 0-4 | update result |
| Fenerbahçe - Konyaspor       | 2026-08-22 21:30 | 2026-08-22 21:30 | scheduled    | none          |
| Trabzonspor - Başakşehir     | 2026-08-23 19:00 | 2026-08-23 19:00 | scheduled    | none          |
| Alanyaspor - Beşiktaş        | 2026-08-23 21:30 | 2026-08-23 21:30 | scheduled    | none          |
| Lyon - Fenerbahçe            | 2026-08-26 22:00 | 2026-08-26 22:00 | scheduled    | none          |
| Kauno Žalgiris - Beşiktaş    | 2026-08-27 20:00 | 2026-08-27 20:00 | scheduled    | none          |
| Ferencváros - Trabzonspor    | 2026-08-27 21:30 | 2026-08-27 21:30 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260821233500_update_erzurumspor_galatasaray_result.sql` — title `Erzurumspor FK 0 - 4 Galatasaray`; Sallai 12', Yunus 20', Osimhen 45'/80' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **7** timed events for the five categories.
- Bugün: Erzurumspor FK–Galatasaray FT 0-4 (İY 0-3). Kickoff 21:30 TR, DB ile uyumlu.
- Goller yalnızca deplasman (GS); description’da boş satır yok.
- Osimhen 4. gol dakikası: DHA/Sabah/Cumhuriyet **80'**; ESPN/BBC **79'**. Türk FT özetleri (80') kabul edildi.
- Kalan 6 maçın kickoff’ları TFF / UEFA kaynaklarıyla uyumlu; sonuç yazılmadı.
- 1 changed (result), 6 unchanged (upcoming), 0 skipped.

## Run 00:05 TR (22.08)

Catch-up: scope expanded to include `premier-lig` / `la-liga`. Arsenal–Coventry was in the window but skipped under the old five-slug rule.

### Sources

- https://www.sofascore.com/football/match/arsenal-coventry-city/lsR — FT 3-0; Havertz 15', Saka 23', Ødegaard 49'; kickoff 19:00 UTC (= 22:00 TR)
- https://www.skysports.com/football/arsenal-vs-coventry-city/report/559444 — aynı skor ve dakikalar
- https://www.bbc.com/sport/football/live/cmy0jjenxx24t — FT 3-0; Havertz, Saka, Odegaard

### Events checked

| Event              | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ------------------ | ---------------- | ---------------- | ------------ | ------------- |
| Arsenal - Coventry | 2026-08-21 22:00 | 2026-08-21 22:00 | finished 3-0 | update result |

### Migrations

- `supabase/migrations/20260822000500_update_arsenal_coventry_result.sql` — title `Arsenal 3 - 0 Coventry`; Havertz 15', Saka 23', Ødegaard 49' (apply_migration OK)

### Notes

- Runbook updated: in-scope slugs now include `premier-lig` and `la-liga`.
- Remaining PL/La Liga fixtures in the window are still upcoming (not finished).
