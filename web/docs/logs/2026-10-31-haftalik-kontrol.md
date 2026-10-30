# Haftalık Kontrol — 2026-10-31

Koşu: 02:04 TR. Dal: `claude/dazzling-babbage-x6dqgv`. Pencere: 2026-10-31 → 2026-11-14.

## Adım 1 — Sonuçlar

Sorgu çalıştı: 1 skorsuz maç.

- Konyaspor - Galatasaray (2026-10-30 20:00 TR) — **atlandı**. Web aramasında birkaç yayın organı 0-4 bitti dedi, ancak gol listesi (Osimhen, Akgün, Batrakov, Leao pen.) tek bir arama özetinden geldi ve ikinci aramada doğrulanamadı. Kırmızı kart olup olmadığı da doğrulanamadı. Haber sayfaları (hurriyet.com.tr, sporx.com) bu ortamdan çözümlenemedi. Bilgi uydurulmadı, maç bir sonraki koşuya kaldı.

Güncellenen: 0. Atlanan: 1.

## Adım 2 — Fikstür

Sorgu çalıştı: pencerede Takvim'de 38 maç var (en son 2026-11-13 Sırbistan - Almanya). Eksik maç tespiti için kaynaklar kontrol edilemedi: ESPN API 403, fotmob 404. Arama motoru yalnızca İngiltere'nin Uluslar Ligi maçlarını (12 Kasım İngiltere - Hırvatistan, 15 Kasım İspanya - İngiltere) gösterdi; bu iki maçtan 12 Kasım olanı Takvim'de var. 15 Kasım pencere dışı. Portekiz, Arjantin, Brezilya ve Almanya/Fransa/İspanya için ek kaynak doğrulaması yapılamadı. Sekiz millî takımın hepsi kontrol edilmeye çalışıldı, yeni maç eklenmedi.

Eklenen: 0. Eklenmeyen nedeni: kaynak erişilemedi / doğrulanamadı.

## Adım 3 — Saatler

Sorgu çalıştı: penceredeki 12:00 placeholder sayısı **0**. Netleştirilecek saat yok, 72 saat uyarısı yok.

## Kaynaklar

| Kaynak | Durum |
| --- | --- |
| site.api.espn.com | 403 |
| fotmob.com | 404 |
| hurriyet.com.tr, sporx.com | alan adı çözümlenemedi |
| Web araması (standard/extended) | erişildi, gol/kart ayrıntısı yetersiz |

## Migration

Oluşturulmadı (üç adım da iş çıkarmadı).

## Kalan iş

- Skorsuz: Konyaspor - Galatasaray (2026-10-30).
- Pencere içi placeholder saat: yok.
- Fikstür penceresi kaynaklardan tam doğrulanamadı.
