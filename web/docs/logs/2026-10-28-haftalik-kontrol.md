# Haftalık kontrol — 2026-10-28

`BUGUN` = 2026-10-28 (Europe/Istanbul). Pencere: 2026-10-28 → 2026-11-11. Dal: `claude/dazzling-babbage-amfuun`.

## Adım 1 — Sonuçlar

Sorgu (`NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok): **0 satır**. Skorsuz geçmiş maç yok; güncellenen 0, atlanan 0.

## Adım 2 — Fikstür

ESPN scoreboard ve FotMob fikstürü (Süper Lig, Premier Lig, La Liga, Serie A, Şampiyonlar Ligi, Avrupa Ligi) pencere için karşılaştırıldı; ikisi birbiriyle aynı çıktı. Takvim'de olan 16 maç kontrol edildi, hepsinin saati kaynaklarla uyumlu.

Eklenen 20 maç (başlama saatleri iki kaynakta aynı):

- Premier Lig: Leeds United - Tottenham, Arsenal - Hull City, Nottingham Forest - Manchester City, Crystal Palace - Liverpool, Sunderland - Chelsea, Manchester United - Aston Villa
- La Liga: Valencia - Real Madrid, Atlético Madrid - Barcelona
- Şampiyonlar Ligi: Galatasaray - VfB Stuttgart, Atlético Madrid - Bayern Münih, Barcelona - Aston Villa, Feyenoord - Inter, Manchester United - Roma, Villarreal - Paris Saint-Germain, AEK Athens - Real Madrid, Fenerbahçe - Liverpool, Porto - Napoli, RB Leipzig - Manchester City, Slavia Prague - Arsenal
- Avrupa Ligi: Celtic - Beşiktaş

Eklenmeyenler: kapsam dışı takımlar (örn. Serie A'da iki taraf da Inter/Juventus/Milan/Napoli/Roma olmayan maçlar, kapsam dışı Süper Lig/Premier Lig/La Liga maçları, Şampiyonlar Ligi'nde kapsam takımı olmayan 7 maç, Avrupa Ligi'nde club kategorisi olmayan Milan/Juventus maçları). Millî takım: pencerede Türkiye maçı yok.

## Adım 3 — Saatler

Sorgu (gelecek 14 gün, 12:00 Europe/Istanbul): **4 placeholder**. Hepsi ESPN + FotMob'da aynı saatle netleşti:

- Galatasaray - Amed SK: 8 Kas 12:00 → **7 Kas 19:00** (tarih de kaynaklarda 7 Kas)
- Çorum FK - Fenerbahçe: 8 Kas 16:00
- Alanyaspor - Trabzonspor: 8 Kas 18:30
- Beşiktaş - Gençlerbirliği: 8 Kas 21:00

Netleşmeyen yok. 72 saat içinde placeholder yok, uyarı yok.

## Kaynaklar

| Kaynak | Durum |
| --- | --- |
| site.api.espn.com | erişildi (gün gün sorgu; tarih aralığı parametresi 400 verdi) |
| fotmob.com | erişildi (sayfa verisi; `/api/leagues` 404) |
| flashscore.com.tr | erişildi, kullanılmadı |
| sofascore.com | 403 |
| footballwebpages.co.uk | 403 |
| mackolik.com | 403 (proxy) |
| livescore.com, tff.org | kullanılmadı |

## Migration

- `20261028233000_add_fikstur_penceresi_20261028.sql` — pencerede eksik 20 maç eklendi.
- `20261028233100_update_super_lig_saat_netlesme.sql` — 4 Süper Lig maçının placeholder saati/tarihi netleştirildi.

Her ikisi `apply_migration` ile uygulandı; sonuç `SELECT` ile doğrulandı (başlık, saat, kategori).

## Kalan iş

- Hâlâ skorsuz maç: yok
- Hâlâ placeholder saat: yok
- Pencerede eksik maç: yok
