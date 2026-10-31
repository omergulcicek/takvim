# Haftalık Kontrol — 2026-11-01

Koşu: 02:04 TR. Dal: `claude/dazzling-babbage-96fb0l` (platformun atadığı dal; `claude-automations` değil).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **7**

| Maç                           | Başlangıç (TR)   | Sonuç |
| ----------------------------- | ---------------- | ----- |
| Konyaspor - Galatasaray       | 2026-10-30 20:00 | 0 - 4 |
| Chelsea - Manchester United   | 2026-10-31 15:30 | 2 - 0 |
| Manchester City - Brighton    | 2026-10-31 18:00 | 0 - 1 |
| Fenerbahçe - Göztepe          | 2026-10-31 19:00 | 1 - 2 |
| Tottenham - Crystal Palace    | 2026-10-31 20:30 | 2 - 0 |
| Milan - Inter                 | 2026-10-31 22:45 | 3 - 1 |
| Barcelona - Alavés            | 2026-10-31 23:00 | 6 - 1 |

- Güncellenen: 7 maçın hepsi. Skor ve FT durumu ESPN ve FotMob'da aynı; goller ve dakikalar iki kaynakta uyumlu.
- Kırmızı kartlar (iki kaynakta aynı oyuncu ve dakika): Lisandro Martínez 63' (ikinci sarı, FotMob "YellowRed"), Jean-Philippe Mateta 13'.
- Not: Konyaspor - Galatasaray'da Batrakov 49' golü her iki kaynakta da Galatasaray bloğunda ve kendi kalesine işareti olmadan geçiyor; kaynaktaki haliyle yazıldı.
- Atlanan: yok.
- Uygulama sonrası aynı sorgu: 0 satır.

## Adım 2 — Fikstür

Pencere: 2026-11-01 → 2026-11-15. FotMob'dan 15 günün tüm maçları tarandı (kategorilerdeki kulüpler, Serie A için beş kulüp, sekiz millî takım); ESPN ile Konferans/Avrupa Ligi ve Uluslar Ligi günleri çapraz kontrol edildi. Sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kontrol edildi.

Eklenen (4):

- Trabzonspor - Freiburg — 2026-11-05 20:45 (Konferans Ligi, `trabzonspor`)
- Portekiz - Danimarka — 2026-11-14 22:45 (Uluslar Ligi 5. hafta)
- Fransa - Türkiye — 2026-11-15 22:45 (Uluslar Ligi 6. hafta)
- İspanya - İngiltere — 2026-11-15 22:45 (Uluslar Ligi 6. hafta)

Eklenmeyen:

- Milan - Ferencváros, AZ Alkmaar - Juventus (Avrupa Ligi): Milan ve Juventus için kategori yok.
- Serie A (Roma - Sassuolo, Inter - Como, Napoli - Lazio, Genoa - Milan, Fiorentina - Juventus): iki taraf da beş kulübün içinde değil.
- Arjantin - Uruguay, Japonya - Brezilya: hazırlık maçı, yalnızca Türkiye için eklenir.
- Kadın takımı maçları: kapsam dışı.

## Adım 3 — Saatler

Sorgu: `start_date > now() AND start_date < now() + interval '14 days' AND to_char(start_date AT TIME ZONE 'Europe/Istanbul','HH24:MI') = '12:00'`. Placeholder sayısı: **0**. Netleşecek saat yok, uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                            |
| ----------------- | ------------------------------------------------ |
| site.api.espn.com | Erişildi (tur.1 `dates` aralığı 400 verdi, tek gün sorgusu çalıştı) |
| fotmob.com        | Erişildi (`/api/data/matches`, `/api/data/matchDetails`) |
| Diğerleri         | Denenmedi, gerek olmadı                          |

## Migration

- `20261101020000_update_haftalik_sonuclar_20261101.sql` — 7 maçın sonucu ve golleri. Uygulandı.
- `20261101020100_add_fikstur_penceresi_20261101.sql` — 4 eksik maç eklendi. Uygulandı.
- Saat migration'ı: yok (Adım 3 iş çıkarmadı).

## Kalan iş

- Skorsuz maç: yok.
- Pencere içinde placeholder saat: yok.
