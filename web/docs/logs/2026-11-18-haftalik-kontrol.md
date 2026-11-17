# Haftalık Kontrol — 2026-11-18

Koşu 02:05 TR. Dal: `claude/dazzling-babbage-asw5ex` (platformun atadığı dal).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **1**

| Maç               | Başlangıç (TR)   |
| ----------------- | ---------------- |
| Galler - Portekiz | 2026-11-17 22:45 |

- Güncellenen: **Galler 2 - 3 Portekiz** (Uluslar Ligi). Skor ve FT ESPN ile FotMob'da aynı. Goller: Brooks 13', Thomas 40' / Bruno Fernandes 11', Pedro Neto 43', Forbs 70'. Pedro Neto 74' ikinci sarı ile kırmızı kart: ESPN ve FotMob'da oyuncu adı ve dakika aynı, yazıldı.
- Atlanan: yok. Uygulama sonrası aynı sorgu 0 satır.

## Adım 2 — Fikstür

Pencere 2026-11-18 → 2026-12-02. Sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya), dört Süper Lig kulübü, Premier Lig, La Liga, Şampiyonlar Ligi, Avrupa/Konferans Ligi tarandı (ESPN gün gün, FotMob 18-20 Kasım ve 1-2 Aralık). Takvim'de olmayan **7 maç** bulundu ve eklendi (saatler iki kaynakta aynı):

- Real Sociedad - Real Madrid — 02.12 21:00 (`la-liga`)
- Chelsea - Crystal Palace — 02.12 22:30 (`premier-lig`)
- Liverpool - Sunderland — 02.12 22:30 (`premier-lig`)
- Manchester City - Leeds United — 02.12 22:30 (`premier-lig`)
- Brentford - Arsenal — 02.12 23:15 (`premier-lig`)
- Newcastle United - Manchester United — 02.12 23:15 (`premier-lig`)
- Barcelona - Atlético Madrid — 02.12 23:30 (`la-liga`)

Eklenmeyen: Şili - İspanya (28.11, hazırlık; yalnızca Türkiye hazırlıkları eklenir). 18-20 Kasım ve 1 Aralık'ta kapsam içi erkek A takım maçı yok (kadın ve U17 maçları kapsam dışı). 11-21 / 11-30 arası mevcut maçların tamamı Takvim'de ve saatleri ESPN ile uyumlu.

## Adım 3 — Saatler

Sorgu: pencerede `12:00` placeholder. Placeholder sayısı: **0** (eklenen maçlar dahil, sorgu sonrasında da 0). Netleşen/netleşmeyen yok, uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                    |
| ----------------- | ---------------------------------------- |
| site.api.espn.com | Erişildi                                 |
| fotmob.com        | Erişildi (maç listesi ve maç detayı)     |
| diğerleri         | Gerek olmadı, denenmedi                  |

## Migration

- `20261118020500_update_galler_portekiz_sonuc.sql` — Galler - Portekiz sonucu, goller ve kırmızı kart. Uygulandı.
- `20261118020600_add_fikstur_penceresi_20261118.sql` — 2 Aralık'taki 7 Premier Lig / La Liga maçı. Uygulandı.
- Adım 3 için dosya yok (iş çıkmadı).

## Kalan iş

Skorsuz maç: yok. Pencerede placeholder saat: yok.
