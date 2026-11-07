# Haftalık Kontrol — 2026-11-08

`BUGUN` = 2026-11-08. Pencere: 2026-11-08 → 2026-11-22. Koşu 02:04 TR. Dal: `claude/dazzling-babbage-zii07n` (platform atadı).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **5**

| Maç                                 | Başlangıç (TR)   | Sonuç |
| ----------------------------------- | ---------------- | ----- |
| Leeds United - Tottenham            | 2026-11-07 15:30 | 1 - 0 |
| Arsenal - Hull City                 | 2026-11-07 18:00 | 1 - 0 |
| Galatasaray - Amed SK               | 2026-11-07 19:00 | 4 - 3 |
| Nottingham Forest - Manchester City | 2026-11-07 20:30 | 3 - 1 |
| Valencia - Real Madrid              | 2026-11-07 23:00 | 0 - 3 |

- Güncellenen: 5 maçın tamamı. Skor ve FT, ESPN ve FotMob'da aynı. Gol dakikaları iki kaynakta aynı.
- Galatasaray - Amed SK: 45' Alban Lafont kendi kalesine golü, Galatasaray bloğunda. 90+2' golün oyuncu adı kaynaklarda farklı yazılmış (ESPN "Yira Sor", FotMob "Collins Sor"); iki adın birleşimi "Yira Collins Sor" yazıldı.
- Valencia - Real Madrid: José Gayà 79' kırmızı kartı ESPN ve FotMob'da aynı, yazıldı. Kart doğrulanamadı durumu yok.
- Atlanan: yok.
- Uygulama sonrası aynı sorgu: 0 satır.

## Adım 2 — Fikstür

Kontrol: FotMob günlük listeleri 8–22 Kasım (15 gün) + ESPN lig tablosu (eng.1, esp.1, tur.1) 21–22 Kasım. Kapsam: GS, FB, BJK, TS, Arsenal, Liverpool, Man City, Man United, Tottenham, Chelsea, Barcelona, Real Madrid; millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya (sekizi kontrol edildi).

Eklenen (6, ESPN + FotMob saatleri aynı):

- Manchester City - Fulham — 21 Kas 15:30 (`premier-lig`)
- Chelsea - Leeds United — 21 Kas 18:00 (`premier-lig`)
- Newcastle United - Arsenal — 21 Kas 20:30 (`premier-lig`)
- Liverpool - Manchester United — 22 Kas 19:30 (`premier-lig`)
- Real Madrid - Celta Vigo — 21 Kas 23:00 (`la-liga`)
- Barcelona - Villarreal — 22 Kas 16:00 (`la-liga`)

Zaten Takvim'de olan: 8 Kas günü 7 maç, Millî takım 12–17 Kas 10 maç (Nations League), Süper Lig 4 maç (21–22 Kas).

Eklenmeyen:

- Arjantin - Uruguay, Japonya - Brezilya, Singapur - Brezilya, Arjantin - Kosta Rika: hazırlık, yalnızca Türkiye için eklenir. Arjantin ve Brezilya'nın resmî maçı pencerede yok.
- Zenit - Trabzonspor (15 Kas): kulüp hazırlık maçı, kapsam dışı.
- Kapsamda olmayan takımların lig maçları (ör. Brighton - Brentford): eklenmedi.
- Pencerede Şampiyonlar Ligi / Avrupa Ligi maçı yok.

## Adım 3 — Saatler

- Runbook sorgusu (`start_date < now() + 14 days`, `12:00`): **0 satır**. 72 saat içinde placeholder yok, uyarı yok.
- Ek kontrol: sorgu 22 Kas 02:04'te bittiği için 22 Kas 12:00 placeholder'ları dışarıda kalıyordu; pencerenin son günü (22 Kas) dahil edilerek 4 Süper Lig maçı bulundu ve ESPN + FotMob'da aynı saatle netleştirildi:
  - Galatasaray - Samsunspor — 22 Kas 12:00 → **21 Kas 16:00** (tarih de düzeltildi)
  - Kocaelispor - Fenerbahçe — 22 Kas 12:00 → **21 Kas 19:00** (tarih de düzeltildi)
  - Konyaspor - Beşiktaş — 22 Kas 12:00 → 22 Kas 16:00
  - Trabzonspor - Eyüpspor — 22 Kas 12:00 → 22 Kas 19:00
- Netleşmeyen: yok. Uyarı: yok.

## Kaynaklar

| Kaynak            | Durum                                                      |
| ----------------- | ---------------------------------------------------------- |
| site.api.espn.com | Erişildi (skor, olay, fikstür). `uefa.nations` boş döndü   |
| fotmob.com        | Erişildi (günlük liste, maç detayı)                        |
| Diğerleri         | Denenmedi (iki kaynak yeterli oldu)                        |

## Migration

- `20261108020000_update_haftalik_sonuclar_20261107.sql` — 7 Kasım'da biten 5 maçın skoru ve golleri.
- `20261108020100_add_fikstur_penceresi_20261108.sql` — Pencerede eksik 6 Premier Lig / La Liga maçı.
- `20261108020200_update_super_lig_saat_netlesme_20261108.sql` — 4 Süper Lig maçının tarih ve saati.

Üçü de `apply_migration` ile uygulandı, başarılı.

## Kalan iş

- Skorsuz maç: yok (0 satır).
- Pencere içinde placeholder saat: yok.
