# Weekly fixture sync — 2026-08-18

- Invoked: 2026-08-18 23:55 (`Europe/Istanbul`)
- Window: 2026-08-18 → 2026-08-25
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.sofascore.com/football/match/fenerbahce-olympique-lyonnais/ZHsclb — FT 1-1; Greenwood 47'; Openda 40'; kickoff 19:00 UTC (= 22:00 TR)
- https://spor.haber7.com/canli-anlatim/1892-fenerbahce-sk-olympique-lyon — Maç bitti 1-1; Greenwood 47'; Openda 40'; kickoff 22:00 TR
- https://www.sporx.com/fenerbahce-lyon-maci-canli-5987803 — MS 1-1 (İY 0-1)
- https://www.haberler.com/spor/futbol-uefa-sampiyonlar-ligi-play-off-20156333-haberi/ — İY 0-1; Openda 40' (AA)
- https://www.takvim.com.tr/spor/2026/08/07/super-ligde-2-ve-3-haftanin-programi-aciklandi — TFF 2. hafta: Erzurumspor–GS 21.08 21:30; FB–Konyaspor 22.08 21:30; TS–Başakşehir 23.08 19:00; Alanyaspor–BJK 23.08 21:30
- https://www.birgun.net/haber/super-lig-2-hafta-fiksturu-ve-puan-durumu-729961 — aynı TFF 2. hafta programı
- https://www.fotomac.com.tr/avrupaligi/2026/08/18/trabzonspor-ferencvaros-maci-ne-zaman-saat-kacta — TS–Ferencváros 20.08 20:00
- https://www.aspor.com.tr/avrupa-ligi/2026/08/17/besiktas-kauno-zalgiris-maci-ne-zaman-saat-kacta-hangi-kanalda — BJK–Kauno Žalgiris 20.08 20:00

## Events checked

| Event                        | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ---------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Fenerbahçe - Lyon            | 2026-08-18 22:00 | 2026-08-18 22:00 | finished 1-1 | update result |
| Beşiktaş - Kauno Žalgiris    | 2026-08-20 20:00 | 2026-08-20 20:00 | scheduled    | none          |
| Trabzonspor - Ferencváros    | 2026-08-20 20:00 | 2026-08-20 20:00 | scheduled    | none          |
| Erzurumspor FK - Galatasaray | 2026-08-21 21:30 | 2026-08-21 21:30 | scheduled    | none          |
| Fenerbahçe - Konyaspor       | 2026-08-22 21:30 | 2026-08-22 21:30 | scheduled    | none          |
| Trabzonspor - Başakşehir     | 2026-08-23 19:00 | 2026-08-23 19:00 | scheduled    | none          |
| Alanyaspor - Beşiktaş        | 2026-08-23 21:30 | 2026-08-23 21:30 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260818235500_update_fenerbahce_lyon_result.sql` — title `Fenerbahçe 1 - 1 Lyon`; Greenwood 47'; Openda 40' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **7** timed events for the five categories.
- Bugün: Fenerbahçe–Lyon UCL play-off ilk maç FT 1-1 (İY 0-1). Kickoff 22:00 TR, DB ile uyumlu; `end_date` 23:55 (00:00 kuralı) kaldı.
- Goller: Mason Greenwood 47' (FB); Loïs Openda 40' (Lyon). Kırmızı kart yok. Play-off turu metni gol listesiyle değiştirildi.
- Kalan 6 maçın kickoff’ları TFF / UEFA kaynaklarıyla uyumlu; sonuç yazılmadı (henüz oynanmadı).
- 1 changed (result), 6 unchanged (upcoming), 0 skipped.
