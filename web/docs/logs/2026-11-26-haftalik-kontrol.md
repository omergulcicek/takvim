# Haftalık kontrol — 2026-11-26 (koşu 02:04 TR)

Dal: `claude/dazzling-babbage-a1c8h2`

## Adım 1 — Sonuçlar
Sorgu 7 skorsuz maç döndürdü (hepsi 25 Kasım Şampiyonlar Ligi). Hepsi güncellendi (skor ESPN + Sky Sports ile çift doğrulandı, goller ESPN):
Sabah 1-4 Barcelona, PSG 2-2 Roma, Lille 2-1 Bayern Münih (Pavlovic k.k.), Shakhtar 0-1 Fenerbahçe, Club Brugge 0-3 Liverpool, Sporting 2-2 Manchester United, Inter 2-0 Stuttgart. Atlanan: yok.
- **Kart doğrulanamadı:** Sporting - Manchester United, Youri Tielemans kırmızı kart 90+3' yalnızca ESPN'de; ikinci kaynakta teyit edilemedi, kart satırı yazılmadı.

## Adım 2 — Fikstür
ESPN günlük skorbordları (eng.1, esp.1, tur.1, ita.1, UCL, UEL, UECL, fifa.friendly, uefa.nations) 26 Kas–10 Ara için DB ile karşılaştırıldı; kapsamdaki ~60 maç kontrol edildi. Sekiz millî takım (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) kontrol edildi: pencerede resmî maç yok; İngiltere-Ukrayna hazırlık maçı kapsam dışı (hazırlık yalnızca Türkiye).
Eklenen: Trabzonspor - Jablonec (Konferans Ligi, 5. hafta), Bayer Leverkusen - Beşiktaş (Avrupa Ligi), ikisi 10 Ara. Kaynak yalnızca ESPN; saat 12:00 placeholder.

## Adım 3 — Saatler
Sorgu çalıştı: migration öncesi pencerede 12:00 placeholder sayısı 0. Migration sonrası 2 yeni placeholder (10 Ara, yukarıdaki maçlar). Sky Sports sayfalarında Aralık fikstürü yok, ikinci kaynak bulunamadı → saat netleşmedi. 72 saat içinde placeholder yok; uyarı yok.

## Kaynaklar
site.api.espn.com erişildi; skysports.com erişildi (yalnızca skor/Kas fikstürü); fotmob.com WebFetch'te veri yok (sayfa boş); fotmob API'ye doğrudan istek izin sistemi tarafından reddedildi, denenmedi; flashscore/livescore/bbc kullanılamadı (404/veri yok).

## Migration
- `20261126022000_update_sampiyonlar_ligi_25_kasim_sonuclari.sql` — 7 maçın skor ve gol listesi.
- `20261126022100_add_avrupa_trabzonspor_besiktas_10_aralik.sql` — 2 Avrupa maçı eklendi.

## Kalan iş
- Skorsuz maç: 0. Kart doğrulanamadı: Tielemans.
- Pencere içi placeholder: Trabzonspor - Jablonec, Bayer Leverkusen - Beşiktaş (10 Ara 12:00).
