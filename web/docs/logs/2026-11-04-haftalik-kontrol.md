# Haftalık Kontrol — 2026-11-04

Koşu 02:04 TR. `BUGUN` = 2026-11-04. Dal: `claude/dazzling-babbage-tgovbi` (platformun atadığı dal).

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **6**

| Maç                                 | Başlangıç (TR)   | Sonuç |
| ----------------------------------- | ---------------- | ----- |
| Galatasaray - VfB Stuttgart         | 2026-11-03 20:45 | 2 - 0 |
| Atlético Madrid - Bayern Münih      | 2026-11-03 23:00 | 0 - 2 |
| Barcelona - Aston Villa             | 2026-11-03 23:00 | 3 - 0 |
| Feyenoord - Inter                   | 2026-11-03 23:00 | 0 - 3 |
| Manchester United - Roma            | 2026-11-03 23:00 | 3 - 2 |
| Villarreal - Paris Saint-Germain    | 2026-11-03 23:00 | 0 - 6 |

- Güncellenen: 6 maçın tamamı. Skor ve FT, ESPN ve FotMob'da aynı.
- Gol dakikaları ESPN ile FotMob arasında en fazla 1 dakika farklı (Malen penaltısı 17'/18'); ESPN dakikası yazıldı.
- Kırmızı kart: Matheus Cunha 90+1' (Man. United) — iki kaynakta da aynı oyuncu ve dakika; yazıldı.
- Oyuncu adı yazımı kaynaklar arasında farklı olan kayıtlar (Alexey/Aleksey Batrakov, Yann/Yann Aurel Bisseck, Pio/Francesco Pio Esposito) aynı oyuncu olarak kabul edildi; ESPN yazımı kullanıldı.
- Atlanan: yok. Kart doğrulanamadı: yok.
- Uygulama sonrası aynı sorgu **0 satır** döndü.

## Adım 2 — Fikstür

Pencere 2026-11-04 → 2026-11-18. Kapsam kontrolü ESPN'de Süper Lig, La Liga, Premier Lig, Serie A, Şampiyonlar Ligi, Avrupa Ligi, Uluslar Ligi ve hazırlık takvimi gün gün tarandı. Millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya — sekizi de kontrol edildi.

- Kontrol edilen kapsam içi maç: 28 (Takvim'deki pencere maçı sayısı 29; fark `now()` kesim saatindendir). Hepsi Takvim'de var, tarih/saat ESPN ile uyumlu.
- Eklenen: **yok — pencerede eksik maç yok.**
- Eklenmeyen (neden): Arjantin ve Brezilya hazırlık maçları (hazırlık yalnızca Türkiye); Serie A maçlarında iki taraf da Inter/Juventus/Milan/Napoli/Roma olmadığı için; kapsam dışı kulüplerin UCL/UEL maçları.

## Adım 3 — Saatler

Sorgu: pencere içi, `12:00` (Europe/Istanbul) placeholder. Placeholder sayısı: **0**. Netleşen: yok. Netleşmeyen: yok. Uyarı: yok.

## Kaynaklar

| Kaynak                | Durum                                                                |
| --------------------- | -------------------------------------------------------------------- |
| site.api.espn.com     | Erişildi: skorlar, goller, kartlar, fikstür                          |
| fotmob.com            | Erişildi: `api/data/matches` ve `matchDetails` (skor, gol, kart)     |
| flashscore.com        | Erişildi (200), içerik betikle yüklendiği için kullanılmadı          |
| skysports.com, uefa.com | Erişildi (200), kullanılmadı                                       |
| livescore.com         | 301 yönlendirme                                                      |
| bbc.co.uk             | 404                                                                  |
| sofascore.com         | Denenmedi (bilinen 403)                                              |

## Migration

- `20261104020500_update_sampiyonlar_ligi_3_kasim_sonuclari.sql` — 3 Kasım Şampiyonlar Ligi maçlarının sonuçları ve golleri. `apply_migration` ile uygulandı.
- Adım 2 ve Adım 3 için iş çıkmadığından fikstür/saat migration'ı oluşturulmadı.

## Kalan iş

- Skorsuz maç: yok.
- Pencere içinde placeholder saat: yok.
