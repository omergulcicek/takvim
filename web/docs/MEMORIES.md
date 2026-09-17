# Project Memories & Context

This file serves as a persistent memory bank for the project. It documents key decisions, context, and evolution of the codebase that might not be obvious from the code itself.

## Context

- **Project Goal:** Kategori bazlı takvim aboneliği; lig/kupa maçları ve diğer etkinlikler.
- **Core Domain:** Calendar events + ICS feed subscriptions (club/category based).

## Key Decisions

- **2026-08-17 - Maç bitişi 00:00:** `end = start + 2 saat` tam **00:00** (`Europe/Istanbul`) olursa **23:55** (aynı kickoff günü) yaz. Aksi halde ICS/Apple/Google maçı ertesi güne koyar. `00:15` / `00:30` olduğu gibi kalır.
- **2026-08-17 - Premier Lig / La Liga description:** Lig maçlarına `description` yazılmaz (`NULL`). Title formatı: `Ev Sahibi - Deplasman`. Süre: başlangıç + 2 saat (`00:00` → 23:55). Timezone: `Europe/Istanbul`. Yalnızca lig kategorisine bağlanır (`premier-lig` / `la-liga`); ayrı kulüp kategorisi yok.
- **2026-08-02 - Süper Lig description:** Süper Lig maçlarına `description` yazılmaz (`NULL`). Title formatı: `Ev Sahibi - Deplasman`. Süre: başlangıç + 2 saat. Timezone: `Europe/Istanbul`. Sadece ilgili kulüp kategorisine bağlanır (ayrı Süper Lig kategorisi yok).
- **2026-08-03 - Event kural seti:** Tam şablon → [`docs/event-data-rules.md`](./event-data-rules.md) (maç ekleme, gol/sonuç, şahsiyet, tarihi olay). Eski ad: `event-ekleme-kurallari.md`.
- **2026-08-29 - Weekly fixture sync:** Runbook → [`docs/weekly-fixture-sync.md`](./weekly-fixture-sync.md). **12 kulüp:** GS, FB, BJK, TS; Arsenal, Liverpool, Man City, Man United, Tottenham, Chelsea; Barcelona, Real Madrid. Pencere: +14 gün. İş: (1) **lig + UCL** maçlarını ekle (UCL yalnızca ≥1 takip kulübü varsa — örn. Barcelona–Lyon evet, Lyon–Porto hayır), (2) kickoff düzelt, (3) yalnızca **FT** skor. Log: `docs/logs/YYYY-MM-DD-haftalik-kontrol.md`.
- **2026-08-03 - Saat belirsiz:** Kickoff henüz net değilse maçı atlama; `12:00` (`Europe/Istanbul`) placeholder ile ekle, saat netleşince `UPDATE` et.

## Evolution

- **2026-09-17 - Hazırlık kuralı:** Millî takım **hazırlık** maçları yalnızca **Türkiye** için eklenir; diğer takip edilen ülkelerin dostluk maçları (örn. Brezilya–Avustralya) kapsam dışı.
- **2026-09-17 - Tracked national teams:** Weekly sync’e 8 millî takım eklendi — İspanya, Arjantin, Fransa, İngiltere, Brezilya, Portekiz, Almanya, Türkiye. Kategori: `milli-takimlar`; yalnızca ≥1 takip edilen taraf + net kickoff.
- **2026-09-17 - Millî Takımlar:** `dunya-kupasi` → `milli-takimlar` (`Millî Takımlar`). Desc: Dünya Kupası, Uluslar Ligi, Copa América vb. Eski feed slug’ı `LEGACY_CATEGORY_SLUGS` ile yönlendirilir.
- **2026-09-17 - Barcelona–Racing erken skor:** Live iken 4-2 yazılmıştı; FT **6-2** ile düzeltildi. Runbook FT check sıkılaştırıldı: dakika saati / `Live` / `Second Half` varken migration yok; skor varlığı ≠ FT.
- **2026-08-23 - Espanyol–Real Madrid düzeltme:** Maç devam ederken 1-1 yazılmıştı; FT **1-2** (Calatrava 30'; Bellingham 9', Espí 90'). Runbook’a FT zorunluluğu ve “günün maçları” tanımı eklendi.
- **2026-08-22 - Weekly sync kapsamı:** `premier-lig` ve `la-liga` eklendi; penceredeki tüm futbol maçları (yalnızca Türkiye kulüpleri değil). Arsenal–Coventry FT 3-0 catch-up.
- **2026-08-17 - 00:00 bitiş clamp:** Timed maçlarda TR `00:00` bitiş → kickoff günü `23:55`.
- **2026-08-17 - Premier Lig fikstürü:** Arsenal, Liverpool, Manchester City, Manchester United, Tottenham ve Chelsea'nin Ağustos–Eylül maçları → `premier-lig`. Biten maçlar, saati belirsiz kayıtlar ve Lig Kupası atlandı. Derbiler tek event.
- **2026-08-17 - Premier Lig ve La Liga:** Futbol grubuna `premier-lig` ve `la-liga` kategorileri eklendi. Lig maçlarında `description NULL`; yalnızca lig slug'ı bağlanır (ayrı kulüp kategorisi yok). La Liga'ya Barcelona ve Real Madrid'in Ağustos–Eylül fikstürü eklendi.
- **2026-08-03 - Trabzonspor 2026/27 Süper Lig fikstürü:** 34 maç → `trabzonspor`. Opener `Kasımpaşa - Trabzonspor` (15.08 **19:00**, net saat korundu); diğerleri `12:00`. GS/FB/BJK derbilerine `trabzonspor` eklendi.
- **2026-08-03 - Beşiktaş 2026/27 Süper Lig fikstürü:** 33 maç (opener `Beşiktaş - Eyüpspor` hariç zaten vardı) → `besiktas`, `12:00` placeholder. GS/FB derbileri mevcut event’e `besiktas` eklendi. Önceden atlanan `Alanyaspor - Beşiktaş` (23.08) eklendi.
- **2026-08-03 - Fenerbahçe 2026/27 Süper Lig fikstürü:** 33 maç (opener `Gençlerbirliği - Fenerbahçe` hariç zaten vardı) → `fenerbahce`, `12:00` placeholder. GS derbileri tek event: `galatasaray` + `fenerbahce`.
- **2026-08-03 - Galatasaray 2026/27 Süper Lig fikstürü:** 34 maç → `galatasaray`, hepsi `12:00` placeholder. Opener title `Galatasaray - Çorum FK` (eski `Çorum` + 21:30 güncellendi). Deplasman: `Çorum FK - Galatasaray`.
- **2026-08-03 - Büyük kulüp derbisi:** Aynı maç için tek event; her iki kulüp kategorisi `event_categories` ile bağlanır (çift satır yok).
- **2026-08-02 - Süper Lig açılış maçları:**
  - `Galatasaray - Çorum FK` → `galatasaray` (2026-08-14 12:00 placeholder; önce 21:30 / `Çorum`)
  - `Gençlerbirliği - Fenerbahçe` → `fenerbahce` (2026-08-15 21:30–23:30)
- **2026-08-02 - Beşiktaş Ağustos maçları:**
  - `Hradec Králové - Beşiktaş` → `besiktas` (2026-08-06 20:00, Avrupa Ligi 3. eleme 1/2)
  - `Beşiktaş - Hradec Králové` → `besiktas` (2026-08-13 20:00, Avrupa Ligi 3. eleme 2/2)
  - `Beşiktaş - Eyüpspor` → `besiktas` (2026-08-16 21:30, Süper Lig; description yok)
  - `Alanyaspor - Beşiktaş` → `besiktas` (2026-08-23 12:00 placeholder; önce atlanmıştı)
