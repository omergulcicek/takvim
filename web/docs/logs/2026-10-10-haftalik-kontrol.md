# Weekly fixture sync — 2026-10-10

- Invoked: 2026-10-10 16:41 (`Europe/Istanbul`)
- Window: 2026-10-10 → 2026-10-24 (+14d)
- Tracked clubs: Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor; Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea; Barcelona, Real Madrid
- Tracked national teams: İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye

## Sources

- ESPN scoreboard `eng.1` / `esp.1` / `tur.1` / `uefa.champions` / `uefa.europa` / `uefa.europa.conf` / `uefa.nations`, 10–24 Eki
- https://www.bbc.co.uk/sport/football/live/c620rnn3zg17t — Arsenal 2-1 Leeds United, FT; Calafiori 62', Guimarães 70', Justin 55'
- https://www.bbc.co.uk/sport/football/scores-fixtures/2026-10-10 — aynı skor, Full time
- https://www.bbc.co.uk/sport/football/scores-fixtures/2026-10-24 — Villa–City 12:30, Arsenal–Everton 15:00, Chelsea–Tottenham 17:30 (UK)
- https://www.footballwebpages.co.uk/uefa-europa-league/20261022 — Beşiktaş - Crystal Palace, Matchday 3, 20:00 UK
- https://www.footballwebpages.co.uk/uefa-conference-league/20261022 — Trabzonspor - Heart of Midlothian, Matchday 2, 17:45 UK
- https://www.cpfc.co.uk/match/2685562/men/uefa-europa-league/2026-27/be-ikta--vs-crystal-palace-2026-10-22/ — 22 Eki 19:00 UTC

## Fixture discovery (league + UEFA + NT, 2-week window)

| Event                             | Competition | Kickoff (source) | In DB? | Action        |
| --------------------------------- | ----------- | ---------------- | ------ | ------------- |
| Beşiktaş - Crystal Palace         | UEL 3       | 2026-10-22 22:00 | no     | add fixture   |
| Trabzonspor - Heart of Midlothian | UECL 2      | 2026-10-22 19:45 | no     | add fixture   |
| Aston Villa - Manchester City     | Premier Lig | 2026-10-24 14:30 | no     | add fixture   |
| Arsenal - Everton                 | Premier Lig | 2026-10-24 17:00 | no     | add fixture   |
| Chelsea - Tottenham               | Premier Lig | 2026-10-24 19:30 | no     | add fixture   |
| 10–21 Eki lig / UCL / UEL / UECL  | —           | DB ile aynı      | yes    | none          |
| Millî takım                       | —           | —                | —      | pencerede yok |

## Events checked

| Event                    | Kickoff (DB)     | Kickoff (source) | Status       | Action                |
| ------------------------ | ---------------- | ---------------- | ------------ | --------------------- |
| Arsenal - Leeds United   | 2026-10-10 14:30 | 2026-10-10 14:30 | finished 2-1 | update result         |
| Samsunspor - Trabzonspor | 2026-10-10 16:00 | 2026-10-10 16:00 | live 41'     | skipped: not finished |
| 10–21 Eki diğerleri      | DB ile aynı      | ESPN ile aynı    | scheduled    | none                  |

## Migrations

- `supabase/migrations/20261010164500_update_arsenal_leeds_united_result.sql` — 2-1; Calafiori 62', Guimarães 70', Justin 55'
- `supabase/migrations/20261010164501_add_uel_uecl_oct22.sql` — Beşiktaş - Crystal Palace, Trabzonspor - Heart of Midlothian
- `supabase/migrations/20261010164502_add_premier_lig_oct24.sql` — Villa–City, Arsenal–Everton, Chelsea–Tottenham

## Skipped

- Samsunspor - Trabzonspor — ilk yarı 41', FT değil
- Hazırlık (non-TR) ve takip edilmeyen UCL/UEL/UECL eşleşmeleri — kapsam dışı
- 11–21 Eki mevcut maçlar — saat aynı, oynanmadı

## Notes

- **5** eklendi, **1** skor yazıldı, **0** kickoff değişti.
- 22:00 Beşiktaş bitişi 23:55.
- La Liga ve Süper Lig’de 22–24 Eki takip edilen kulüp maçı yok.

## Run 17:49 TR

Geçmişte bitmiş, skorsuz tüm futbol etkinlikleri tarandı (kickoff + 100 dk geçmiş, başlıkta skor yok).

| Event                    | Kickoff          | Status       | Action                |
| ------------------------ | ---------------- | ------------ | --------------------- |
| Çekya - İngiltere        | 2026-09-29 21:45 | finished 0-2 | update result         |
| İspanya - Hırvatistan    | 2026-09-29 21:45 | finished 4-1 | update result         |
| Galatasaray - Kasımpaşa  | 2026-10-09 20:00 | finished 3-1 | update result         |
| Samsunspor - Trabzonspor | 2026-10-10 16:00 | live 90'     | skipped: not finished |

### Sources

- https://www.englandfootball.com/england/mens-senior-team/fixtures-results/2026-27/nations-league/czechia-england-uefa-nations-league-tuesday-29-september-2026-match-centre — 0-2, Gordon 47', Kane 69', Šulc kırmızı
- https://www.bbc.com/sport/football/live/c5x2z793kwwjt — aynı skor, FT
- https://rfef.es/en/noticias/Lamine-Yamal-Shines-as-Spain-Dazzle-at-the-Champions-Celebration — 4-1; Yamal 2' ve 63', Pubill 31', Beljo 28', Williams 88'
- https://www.bbc.com/sport/football/live/c83v4061dv9kt — aynı skor; Williams 89'
- https://www.hurriyet.com.tr/sporarena/galatasaray-3-1-kasimpasa-super-lig-maci-ozeti-43334783 — 3-1, maç sonu; Bardakçı 45', Torreira kırmızı 65', Rak-Sakyi 68', Barış Alper 90', Lemina 90+6
- ESPN `tur.1` 10 Eki — Samsunspor 0-3 Trabzonspor, ikinci yarı 90', FT değil

### Migrations

- `supabase/migrations/20261010174900_update_czechia_england_result.sql` — 0-2
- `supabase/migrations/20261010174901_update_spain_croatia_result.sql` — 4-1; Williams dakikası BBC/ESPN 89', RFEF 88' — 89' yazıldı
- `supabase/migrations/20261010174902_update_galatasaray_kasimpasa_result.sql` — 3-1

### Notes

- **3** eski skor yazıldı. Başka skorsuz bitmiş maç yok.
- Samsunspor - Trabzonspor hâlâ 90', skor yazılmadı.

## Run 18:00 TR

Trabzonspor maçı bittiği için pencere yeniden tarandı.

| Event                         | Kickoff (DB)     | Status       | Action                |
| ----------------------------- | ---------------- | ------------ | --------------------- |
| Samsunspor - Trabzonspor      | 2026-10-10 16:00 | finished 0-3 | update result         |
| Chelsea - Bournemouth         | 2026-10-10 17:00 | HT           | skipped: not finished |
| Ç. Rizespor - Fenerbahçe      | 2026-10-10 19:00 | scheduled    | none                  |
| Manchester United - Tottenham | 2026-10-10 19:30 | scheduled    | none                  |
| Barcelona - Getafe            | 2026-10-10 19:30 | scheduled    | none                  |
| Real Madrid - Villarreal      | 2026-10-10 22:00 | scheduled    | none                  |

### Sources

- ESPN `tur.1` 10 Eki — Samsunspor 0-3 Trabzonspor, FT; Muçi 27', Nwaiwu 38', Djú 40', Kabasakal kırmızı 43'
- https://www.star.com.tr/spor/mac-sonucu-samsunspor-0-3-trabzonspor-haber-2045695/ — maç sonucu 0-3; Muçi 28', Nwaiwu 38', Dju 40', Kabasakal 43'
- https://www.sabah.com.tr/spor/futbol/2026/10/10/son-dakika-trabzonspor-farkli-kazandi-samsunspor-evinde-maglup — özet 28', dakika dökümü 27'
- ESPN `eng.1` — Chelsea - Bournemouth HT

### Migrations

- `supabase/migrations/20261010180000_update_samsunspor_trabzonspor_result.sql` — 0-3; Muçi dakikası ESPN ve Sabah dökümü 27', Star özeti 28' — 27' yazıldı

### Notes

- **1** skor yazıldı. Yeni fikstür veya kickoff farkı yok.
