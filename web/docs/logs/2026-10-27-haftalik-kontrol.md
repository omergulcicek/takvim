# Haftalık kontrol — 2026-10-27

## Skorsuz maç sorgusu

Takvim (`ieqzwanwsikryweutnvk`), alt sınır yok, `NOT (title ~ '[0-9] - [0-9]')`, `title LIKE '% - %'`, `start_date + interval '3 hours' < now()`, eskiden yeniye.

- Sonuç: **3 satır** (hepsi 26 Eki 2026).
  1. Ç. Rizespor - Trabzonspor (19:00)
  2. Beşiktaş - Başakşehir (19:00)
  3. Galatasaray - Fenerbahçe (21:30)

## Kaynak erişimi

- site.api.espn.com: 403 (WebFetch), atlandı.
- hurriyet.com.tr, star.com.tr, dailysabah.com, beinsports.com.tr: WebFetch ile alan adı çözümlenemedi; içerik WebSearch sonuçlarından alındı.
- flashscore, sofascore, skysports, fotmob: doğrudan sorgulanmadı; sonuçlar WebSearch üzerinden birden çok haber sitesinden (Habertürk, Hürriyet, Star, Akşam, DHA, beIN Sports, Daily Sabah, Sporkolik vb.) doğrulandı.

## Güncellenen (2)

- Galatasaray 2 - 1 Fenerbahçe — Osimhen 29', 44'; Kahveci 62' (kaynaklarda 61'/63'/43' ±1 dk farkı, çoğunluk alındı).
- Beşiktaş 2 - 0 Başakşehir — Oh Hyeon-Gyu 76'; Olaitan 89'.

## Atlanan / doğrulanamayan (1)

- Ç. Rizespor - Trabzonspor: skor 3-4 kaynaklarda tutarlı, ancak Laçi golü 68'/69'/70' ve Franculino'nun son golü 83'/85' olarak verilmiş; 1 dakikadan fazla çelişki nedeniyle kurala göre atlandı. **Hâlâ skorsuz.**

## Sonuç

- Hâlâ skorsuz kalan maç: **Ç. Rizespor - Trabzonspor** (26 Eki 2026)
- Migration: `20261027020000_update_super_lig_9_hafta_sonuclari.sql` — Galatasaray-Fenerbahçe ve Beşiktaş-Başakşehir sonuçları (apply_migration ile uygulandı, SELECT ile doğrulandı).
- Yeni maç eklenmedi (fikstür penceresi bu koşuda işlenmedi).
