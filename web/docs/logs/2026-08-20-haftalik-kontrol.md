# Weekly fixture sync — 2026-08-20

- Invoked: 2026-08-20 21:51 (`Europe/Istanbul`)
- Window: 2026-08-20 → 2026-08-27
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.sofascore.com/football/match/fk-kauno-zalgiris-besiktas-jk/albsQoH — FT 3-0; Oh 6', Murillo 12', Kökçü 60' (Pen.); kickoff 17:00 UTC (= 20:00 TR)
- https://spor.haber7.com/canli-anlatim/1894-besiktas-jk-fk-kauno-zalgiris — aynı skor; Oh 6', Murillo 12', Kökçü 59' penaltı
- https://www.sporx.com/besiktas-fk-kauno-zalgiris-maci-canli-5987964 — MS 3-0 (İY 2-0); aynı goller
- https://www.haberler.com/spor/uefa-avrupa-ligi-besiktas-2-kauno-zalgiris-0-ilk-20162517-haberi/ — İY 2-0; Oh 6', Murillo 12' (İHA)
- https://www.sofascore.com/football/match/trabzonspor-ferencvaros-tc/ANsblb — FT 0-1; Zachariassen 17'; kickoff 17:00 UTC (= 20:00 TR)
- https://www.sporx.com/trabzonspor-ferencvaros-maci-canli-5987955 — 0-1; Zachariassen 17'
- https://24.hu/sport/foci/2026/08/20/europa-liga-selejtezo-trabzonspor-ferencvaros/ — 0-1; Zachariassen 17'
- https://www.tgrthaber.com/spor/trendyol-super-lig-2-ve-3-hafta-maclari-galatasaray-fenerbahce-besiktas-maclari-ne-za-3352159 — TFF 2. hafta: Erzurumspor–GS 21.08 21:30; FB–Konyaspor 22.08 21:30; TS–Başakşehir 23.08 19:00; Alanyaspor–BJK 23.08 21:30
- https://www.birgun.net/haber/erzurumspor-galatasaray-maci-hangi-gun-saat-kacta-ve-hangi-kanalda-730071 — Erzurumspor–GS 21.08 21:30

## Events checked

| Event                        | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ---------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Beşiktaş - Kauno Žalgiris    | 2026-08-20 20:00 | 2026-08-20 20:00 | finished 3-0 | update result |
| Trabzonspor - Ferencváros    | 2026-08-20 20:00 | 2026-08-20 20:00 | finished 0-1 | update result |
| Erzurumspor FK - Galatasaray | 2026-08-21 21:30 | 2026-08-21 21:30 | scheduled    | none          |
| Fenerbahçe - Konyaspor       | 2026-08-22 21:30 | 2026-08-22 21:30 | scheduled    | none          |
| Trabzonspor - Başakşehir     | 2026-08-23 19:00 | 2026-08-23 19:00 | scheduled    | none          |
| Alanyaspor - Beşiktaş        | 2026-08-23 21:30 | 2026-08-23 21:30 | scheduled    | none          |
| Lyon - Fenerbahçe            | 2026-08-26 22:00 | 2026-08-26 22:00 | scheduled    | none          |
| Kauno Žalgiris - Beşiktaş    | 2026-08-27 20:00 | 2026-08-27 20:00 | scheduled    | none          |
| Ferencváros - Trabzonspor    | 2026-08-27 21:30 | 2026-08-27 21:30 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260820215500_update_besiktas_kauno_zalgiris_result.sql` — title `Beşiktaş 3 - 0 Kauno Žalgiris`; Oh 6', Murillo 12', Kökçü 60' (Penaltı) (apply_migration OK)
- `supabase/migrations/20260820215501_update_trabzonspor_ferencvaros_result.sql` — title `Trabzonspor 0 - 1 Ferencváros`; Zachariassen 17' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **9** timed events for the five categories.
- Bugün: Beşiktaş–Kauno Žalgiris FT 3-0 (İY 2-0); Trabzonspor–Ferencváros FT 0-1 (İY 0-1). Kickoff’lar 20:00 TR, DB ile uyumlu.
- BJK golleri yalnızca ev sahibi tarafında; TS golü yalnızca deplasman — description’da boş satır yok.
- Kökçü penaltı dakikası Sofascore FT’de 60'; Haber7/Sporx canlıda 59' — Sofascore FT kabul edildi.
- Kalan 7 maçın kickoff’ları TFF / UEFA kaynaklarıyla uyumlu; sonuç yazılmadı.
- 2 changed (result), 7 unchanged (upcoming), 0 skipped.
