# Haftalık Kontrol — 2026-11-27

Dal: `claude/dazzling-babbage-ukwi87` (platformun atadığı dal). BUGUN = 2026-11-27 (Europe/Istanbul, koşu 02:04 TR). Pencere: 2026-11-27 → 2026-12-11.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **2**

| Maç                           | Başlangıç (TR)   |
| ----------------------------- | ---------------- |
| Beşiktaş - Hapoel Be'er Sheva | 2026-11-26 20:45 |
| CSKA Sofya - Trabzonspor      | 2026-11-26 23:00 |

Güncellenen:

- **Beşiktaş 2 - 1 Hapoel Be'er Sheva** — skor ESPN ve FotMob'da aynı. Goller: Olaitan 75', Kökçü 90', East 90+3' (FotMob 90+4', ≤1 dk fark; ESPN dakikası yazıldı). Kırmızı kart yok.
- **CSKA Sofya 1 - 2 Trabzonspor** — skor ESPN ve FotMob'da aynı. Goller: Salah 69', Saviolo 90+3', Sidny Lopes Cabral 32' kendi kalesine (FotMob 33', ≤1 dk fark; ESPN dakikası yazıldı, CSKA bloğunda). Kırmızı kart yok.

Atlanan: yok. Kart doğrulanamadı: yok.

Uygulama sonrası aynı sorgu **0 satır** döndü.

## Adım 2 — Fikstür

Pencere (27 Kas – 11 Ara) ESPN günlük skor tablosundan tarandı: Premier Lig (Big-6 maçları 15), La Liga (Barcelona/Real Madrid maçları 6), Süper Lig (dört kulüp, 7 maç), Şampiyonlar Ligi (11 kapsam içi maç), Avrupa/Konferans Ligi (Beşiktaş, Trabzonspor: 2 maç). Millî takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya sekizi de kontrol edildi (resmî maç yok; yalnızca İngiltere–Ukrayna hazırlık maçı 5 Ara var, Türkiye dışı olduğu için eklenmedi).

Toplam kapsam içi **41 maç** kontrol edildi, hepsi Takvim'de mevcut. **Pencerede eksik maç yok.** Eklenen: yok.

Not (değiştirilmedi): `Trabzonspor - Jablonec` açıklaması "5. hafta" diyor; ESPN/FotMob'a göre 5. hafta 26 Kas'ta oynandı, bu maç 6. hafta olmalı. Doğrulanmadığı için dokunulmadı.

## Adım 3 — Saatler

Sorgu çalıştırıldı: **2 placeholder** (ikisi de 10 Ara, 72 saatten uzak).

| Maç                         | Eski  | Yeni (TR) | Kaynak          |
| --------------------------- | ----- | --------- | --------------- |
| Trabzonspor - Jablonec      | 12:00 | 20:45     | ESPN + FotMob   |
| Bayer Leverkusen - Beşiktaş | 12:00 | 23:00     | ESPN + FotMob   |

Netleşmeyen: yok. Uyarı (72 saat içinde placeholder): yok. Uygulama sonrası sorgu **0 satır**.

## Kaynaklar

| Kaynak            | Durum                                            |
| ----------------- | ------------------------------------------------ |
| site.api.espn.com | Erişildi (skor tablosu, maç özeti, olaylar)      |
| fotmob.com        | Erişildi (maç listesi, matchDetails)             |
| Diğerleri         | Denenmedi (iki kaynak yeterli oldu)              |

## Migration

- `20261127021500_update_avrupa_kupalari_sonuclari.sql` — Beşiktaş ve Trabzonspor'un 26 Kas sonuçları ve golleri. Uygulandı.
- `20261127021600_update_avrupa_kupalari_saat_netlesme.sql` — 10 Ara iki maçın kesin saatleri. Uygulandı.
- Adım 2 için dosya yok (iş çıkmadı).

## Kalan iş

- Skorsuz maç: yok.
- Pencere içinde placeholder saat: yok.
- Gözlem: Son log 28 Ekim'di; arada koşu logu yok.
