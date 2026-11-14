# Haftalık Kontrol — 2026-11-15

Koşu: 02:15 TR. Dal: `claude/dazzling-babbage-pibsd6` (platform atadı). BUGUN = 2026-11-15, pencere 2026-11-15 → 2026-11-29. Üç adım da kendi sorgusunu çalıştırdı.

## Adım 1 — Sonuçlar

Sorgu: `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`, alt sınır yok. Satır sayısı: **3**

| Maç                    | Başlangıç (TR)   | Sonuç                           |
| ---------------------- | ---------------- | ------------------------------- |
| Çekya - İspanya        | 2026-11-12 22:45 | Güncellendi: 0 - 2              |
| Sırbistan - Almanya    | 2026-11-13 22:45 | Güncellendi: 1 - 3              |
| Portekiz - Danimarka   | 2026-11-14 22:45 | Güncellendi: 1 - 4              |

- Skorlar ESPN ve FotMob'da aynı; goller ve dakikalar ESPN + FotMob.
- Højlund'un 1. golü ESPN 49', FotMob 50' (1 dk fark, sınır içinde); ESPN dakikası yazıldı.
- **Kart doğrulanamadı:** Ladislav Krejcí (Çekya) kırmızı kartı ESPN 72', FotMob 69'; Vanja Dragojević (Sırbistan) kırmızı kartı ESPN 76', FotMob 74'. Kart ve oyuncu iki kaynakta aynı ama dakika 1 dakikadan fazla çeliştiği için satır yazılmadı. Andrija Živković kırmızı kartı (89') iki kaynakta aynı, yazıldı.
- Uygulama sonrası kontrol: üç maç skorlu başlık ve gol listesiyle DB'de görüldü.

## Adım 2 — Fikstür

Kontrol: 8 millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) için ESPN 15–29 Kasım; kulüp tarafında Süper Lig, Premier Lig, La Liga, Serie A, Şampiyonlar Ligi, Avrupa Ligi (ESPN + FotMob 21–29 Kasım). Kapsam içi yaklaşık 45 maç kontrol edildi.

Eklenen (4):
- Everton - Liverpool — 29 Kasım 15:00 (`premier-lig`)
- Sunderland - Tottenham — 29 Kasım 17:05 (`premier-lig`)
- Deportivo A Coruña - Barcelona — 29 Kasım 18:15 (`la-liga`)
- Arsenal - Manchester City — 29 Kasım 19:30 (`premier-lig`)

Eklenmeyen:
- Millî takım: 15–17 Kasım Fransa-Türkiye, İspanya-İngiltere, Almanya-Hollanda, Galler-Portekiz zaten DB'de. 18–29 Kasım'da sekiz takımın resmî maçı yok; Arjantin-Uruguay (13 Kas), Brezilya-Japonya (14 Kas), Arjantin-Kosta Rika (17 Kas), Brezilya-Singapur (17 Kas), İspanya-Şili (28 Kas, kadın ve erkek) hazırlık olduğu için eklenmedi (yalnızca Türkiye hazırlığı eklenir).
- Serie A: kapsamdaki iki takımın karşılaştığı maç yok. Atlético Madrid (UCL Viking maçı dahil) ve Newcastle kapsam dışı takım.

## Adım 3 — Saatler

Runbook sorgusu (`start_date > now() AND start_date < now() + interval '14 days'` ve saat 12:00): **0 satır**.
Pencere BUGUN + 14 gün (29 Kasım) sınırında, sorgu dışında kalan 3 placeholder (29 Kasım 12:00) ayrıca ele alındı ve iki kaynakta (ESPN + FotMob) aynı çıktığı için güncellendi:
- Fenerbahçe - Erzurumspor FK → 29 Kasım 19:00
- Göztepe - Trabzonspor → **30 Kasım** 19:00 (tarih de düzeltildi)
- Beşiktaş - Galatasaray → **30 Kasım** 21:00 (tarih de düzeltildi)

Netleşmeyen: yok. 72 saat içinde placeholder: yok, uyarı yok.

## Kaynaklar

| Kaynak            | Durum                                         |
| ----------------- | --------------------------------------------- |
| site.api.espn.com | Erişildi (scoreboard + summary; `curl --compressed`) |
| fotmob.com        | Erişildi (matches + matchDetails)             |
| flashscore.com    | Ana sayfa 200, kullanılmadı                   |
| Diğerleri         | Denenmedi (gerek olmadı)                      |

Not: Python `urllib` ile ESPN 403 verdi, `curl` ile sorun yok.

## Migration

- `20261115020600_update_milli_takimlar_uluslar_ligi_sonuclari.sql` — Uluslar Ligi'nde üç maçın skoru ve golleri.
- `20261115020700_add_fikstur_penceresi_20261115.sql` — 29 Kasım'daki 4 eksik maç eklendi.
- `20261115020800_update_super_lig_saat_netlesme.sql` — Süper Lig 29-30 Kasım üç maçın saati/tarihi netleşti.

Üçü de `apply_migration` ile uygulandı.

## Kalan iş

- Skorsuz geçmiş maç: yok.
- Pencerede placeholder saat: yok.
- Kart satırı yazılamadı: Krejcí (Çekya-İspanya) ve Dragojević (Sırbistan-Almanya) kırmızı kartları; dakika çelişkisi.
