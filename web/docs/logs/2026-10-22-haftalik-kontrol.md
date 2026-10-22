# 2026-10-22 Haftalık Kontrol

Koşu: 2026-10-22 (Europe/Istanbul). Fikstür penceresi ekleme işi bu koşuda yapılmadı; yalnızca geçmiş skorsuz maç kontrolü yapıldı.

## Adım 1: Skorsuz maç sorgusu

Sorgu sonucu: **11 satır** (start_date'e göre eskiden yeniye).

1. Fenerbahçe - Slavia Prague (2026-10-20 19:45)
2. Napoli - Bodø/Glimt (2026-10-20 22:00)
3. Roma - Slovan Bratislava (2026-10-20 22:00)
4. Liverpool - Villarreal (2026-10-20 22:00)
5. Manchester City - AEK Athens (2026-10-20 22:00)
6. Paris Saint-Germain - Barcelona (2026-10-20 22:00)
7. Como - Manchester United (2026-10-21 19:45)
8. Lille - Galatasaray (2026-10-21 19:45)
9. Real Madrid - RB Leipzig (2026-10-21 22:00)
10. Inter - Shakhtar Donetsk (2026-10-21 22:00)
11. Bayern Münih - Arsenal (2026-10-21 22:00)

## Kaynak erişim durumu

- site.api.espn.com: 403
- espn.com (scoreboard): boş sayfa
- flashscore.com: içerik boş (skor yok); flashscore.com.tr: skor yok
- sofascore.com (API ve sayfa): 403
- skysports.com (sonuç sayfası): çalıştı, 11 maçın da skoru alındı (dakika yok)
- fotmob.com: skor yok
- livescore.com: 404; footballwebpages.co.uk: 403; uefa.com: skor yok
- bbc.co.uk, haberturk, fenerbahce.org vb. doğrudan çekim: engelli / alan adı çözümlenemedi
- Web araması (ESPN, Sofascore, Sky Sports, Goal, VAVEL, kulüp raporları vb. özetleri): skor ve gol dakikaları için ikinci kaynak olarak kullanıldı

## Güncellenen (9)

Skor Sky Sports + arama sonuçlarındaki en az bir bağımsız raporla eşleşti.

- Fenerbahçe 2 - 2 Slavia Prague (Kacor golü kaynaklarda 89'/90', 90' yazıldı)
- Roma 4 - 0 Slovan Bratislava
- Liverpool 4 - 3 Villarreal
- Manchester City 5 - 1 AEK Athens
- Paris Saint-Germain 4 - 2 Barcelona
- Como 4 - 1 Manchester United
- Real Madrid 4 - 1 RB Leipzig
- Inter 1 - 0 Shakhtar Donetsk
- Bayern Münih 2 - 2 Arsenal

Migration: `20261022220000_update_cl_3_hafta_results.sql` — 9 maç için skor ve gol güncellemesi (apply_migration ile uygulandı).

## Atlanan / doğrulanamayan (hâlâ skorsuz)

- **Lille - Galatasaray** (skor 2-4, Sky Sports + haberler): 52' dakikadaki Galatasaray golünün sahibi kaynaklarda çelişiyor (Torreira / Bentaleb kk / Berke Özer). Gol satırı uydurulmadı, maç atlandı.
- **Napoli - Bodø/Glimt** (skor 4-3): Sofascore ile diğer kaynaklar Fet golünde 90' / 90+4' (1 dakikadan fazla fark) ve Helmersen/Bjørtuft dakikalarında çelişiyor. Maç atlandı.

Bu iki maç geçmişte skorsuz kalmaya devam ediyor.

## Diğer

- Yeni maç eklenmedi. Değişmeyen maç sayısı: bu kontrolde ilgisiz.
