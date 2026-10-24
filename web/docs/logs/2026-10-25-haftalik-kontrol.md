# Haftalık Kontrol — 2026-10-25

## Skorsuz maçlar (ADIM 1)

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. **4 satır**:

| Başlangıç (İstanbul) | Maç | Kategori |
| --- | --- | --- |
| 2026-10-24 14:30 | Aston Villa - Manchester City | premier-lig |
| 2026-10-24 17:00 | Arsenal - Everton | premier-lig |
| 2026-10-24 19:00 | Napoli - Roma | serie-a |
| 2026-10-24 19:30 | Chelsea - Tottenham | premier-lig |

## Kaynak erişimi

- site.api.espn.com: erişildi (skor + gol dakikaları)
- fotmob.com: erişildi (skor + gol dakikaları, ikinci kaynak)
- sofascore.com: 403
- flashscore.com: 200 döndü ancak kullanılmadı (iki kaynak yeterli oldu)
- skysports.com: 301 yönlendirme, kullanılmadı
- bbc.co.uk, livescore.com: 200, kullanılmadı

## Güncellenen (4)

- Aston Villa 2 - 1 Manchester City (ESPN = FotMob, dakikalar uyuşuyor)
- Arsenal 2 - 0 Everton (ESPN = FotMob)
- Napoli 3 - 3 Roma (ESPN = FotMob)
- Chelsea 0 - 2 Tottenham (ESPN = FotMob; Penders 77' kendi kalesine, Tottenham bloğunda)

Atlanan / doğrulanamayan: yok.

## Migration

- `20261025020000_update_hafta_sonu_sonuclari.sql` — 4 Premier Lig / Serie A maçının skor ve gol bilgisini günceller (apply_migration ile uygulandı).

## Sonuç

Uygulama sonrası aynı sorgu **0 satır** döndü. Geçmişte skorsuz maç kalmadı. Yeni maç eklenmedi.
