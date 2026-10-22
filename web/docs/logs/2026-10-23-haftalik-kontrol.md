# Haftalık kontrol — 2026-10-23

## Skorsuz maç sorgusu

Takvim (`ieqzwanwsikryweutnvk`), alt sınır yok, `NOT (title ~ '[0-9] - [0-9]')`, `title LIKE '% - %'`, `start_date + interval '3 hours' < now()`, eskiden yeniye.

- Sonuç: **2 satır**
  1. Trabzonspor - Heart of Midlothian (22 Eki 19:45, Konferans Ligi)
  2. Beşiktaş - Crystal Palace (22 Eki 22:00, Avrupa Ligi)

## Kaynak erişimi

- sofascore.com: 403
- flashscore.com: yanıt var ama maç verisi yok
- site.api.espn.com: 403
- fotmob.com: sayfada maç verisi yok
- uefa.com: sayfada skor/gol verisi yok
- skysports.com: erişildi (Beşiktaş maçı, gol dakikaları)
- Habertürk, CNN Türk, beIN, NTV, Hürriyet, vavel.com: doğrudan erişim yok (alan adı çözümlenemedi); yalnızca web aramasında özet olarak görüldü
- Skor ve gol bilgisi web arama sonuçlarındaki çok sayıda haber sitesinden alındı (TFF/UEFA resmi sayfası doğrulamadı).

## Güncellenen

- Trabzonspor 2 - 0 Heart of Midlothian: Salah 32' (P), Dju 58'. Skor ve dakikalar tüm kaynaklarda tutarlı.
- Beşiktaş 2 - 2 Crystal Palace: Ndidi 45+1', Olaitan 73'; Pino 51', Mateta 55'. Skor tüm kaynaklarda aynı. Ndidi golü kaynaklara göre 45+1 (Sky Sports) / 45+2 (çoğu Türk site); 1 dakikalık fark, Sky Sports değeri yazıldı. Pino golü bazı kaynaklarda 50/53 geçiyor, Sky Sports ve çoğunluk 51 yazdığı için 51 kullanıldı.

## Atlanan / doğrulanamayan

Yok.

## Hâlâ skorsuz kalan maç

Yok (kontrol sorgusu sonrası 0 satır).

## Migration

- `20261023020000_update_trabzonspor_hearts_besiktas_crystal_palace_result.sql` — İki maçın skor ve gol bilgisini günceller (apply_migration ile uygulandı).
