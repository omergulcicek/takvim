# Weekly fixture sync — 2026-10-13

- Invoked: 2026-10-13 02:04 (`Europe/Istanbul`)
- Window: 2026-10-13 → 2026-10-27 (+14d)
- Yesterday (results only, no new fixtures): 2026-10-12
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- https://site.api.espn.com/apis/site/v2/sports/soccer/{eng.1,esp.1,tur.1,uefa.champions,uefa.europa,uefa.europa.conf,uefa.nations,fifa.friendly}/scoreboard?dates=YYYYMMDD — 12–27 Eki, gün gün fikstür ve durum
- https://site.api.espn.com/apis/site/v2/sports/soccer/uefa.nations/scoreboard?dates=20261112 — sonraki millî pencere 12–15 Kasım; bu pencerede maç yok
- https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.friendly/scoreboard — 12–27 Eki hazırlık yok

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                                  | Competition             | Kickoff (source, TR) | In DB? | Action                                 |
| -------------------------------------- | ----------------------- | -------------------- | ------ | -------------------------------------- |
| 13–26 Eki takip lig / UCL / UEL / UECL | —                       | kaynakla aynı        | yes    | kickoff değişmedi                      |
| 27 Eki                                 | lig / UCL / UEL / UECL  | —                    | —      | maç yok                                |
| Millî takım                            | Uluslar Ligi / hazırlık | —                    | —      | pencerede maç yok; sonraki 12–15 Kasım |

## Events checked

| Event             | Kickoff (DB) | Kickoff (source) | Status    | Action                     |
| ----------------- | ------------ | ---------------- | --------- | -------------------------- |
| 13–26 Eki, 39 maç | DB saati     | kaynakla aynı    | scheduled | none                       |
| 12 Eki in-scope   | —            | —                | —         | DB'de takip edilen maç yok |

## Migrations

- _(none)_

## Skipped

- Newcastle United - Coventry City (12 Eki, FT) — takip edilen kulüp yok; dünden fikstür eklenmedi
- Sevilla - Levante (12 Eki, FT) — takip edilen kulüp yok; dünden fikstür eklenmedi
- Göztepe - Eyüpspor (12 Eki, FT) — takip edilen kulüp yok; dünden fikstür eklenmedi
- Avrupa Ligi / Konferans Ligi maç günleri — yalnızca Beşiktaş ve Trabzonspor kapsamda; ikisi de DB'de, saat aynı
- Chelsea ve Tottenham bu pencerede Avrupa maçı oynamıyor; İngiliz kulüpleri için UEL/UECL zaten ekleme kapsamı dışında
- Uluslar Ligi 12–15 Kasım — pencere dışı (Türkiye, İspanya, Fransa, İngiltere, Almanya, Portekiz). Hazırlık yok
- 1 Kasım Süper Lig 12:00 yer tutucuları (Fenerbahçe–Göztepe, Kasımpaşa–Beşiktaş, Trabzonspor–Gaziantep FK, Konyaspor–Galatasaray) — kickoff penceresi 13–27 Eki; güncellenmedi

## Notes

- Added **0**, changed **0**, kickoff update **0**, unchanged **39**, skipped **3** (12 Eki, takip edilen taraf yok)
- 39 maçın tamamı `STATUS_SCHEDULED`; FT skoru yazılmadı
- 27 Eki Premier Lig, La Liga, Süper Lig, UCL, UEL, UECL, Uluslar Ligi ve hazırlık skor tabloları boş
- Migration yok; `apply_migration` çağrılmadı
