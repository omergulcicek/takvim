# Haftalık Kontrol — 2026-11-22

Koşu 22:03 TR. Dal: `claude/dazzling-babbage-1tyqw7` (platformun atadığı dal).

## Adım 1 — Sonuçlar

Sorgu (alt sınır yok) **10** satır döndü: Manchester City - Fulham, Galatasaray - Samsunspor, Chelsea - Leeds United, Tottenham - Ipswich, Kocaelispor - Fenerbahçe, Newcastle United - Arsenal, Real Madrid - Celta Vigo, Barcelona - Villarreal, Konyaspor - Beşiktaş, Trabzonspor - Eyüpspor.

- Güncellenen: 10 maçın tamamı. Skor ESPN ve FotMob'da aynı; gol oyuncuları ve dakikaları iki kaynakta aynı.
- Kırmızı kart: Barcelona - Villarreal'de Fermín López 75' ve Pau Navarro 90+3' (ikinci sarı); iki kaynakta aynı, yazıldı. Pau Navarro'nun kendi kalesine golü 67' Barcelona bloğunda.
- Atlanan: yok. Liverpool - Manchester United (19:30) henüz +3 saat eşiğini geçmediği için sorguya girmedi; sonraki koşuya kalır.

## Adım 2 — Fikstür

Pencere 2026-11-22 → 2026-12-06. ESPN günlük skorbordu: Premier Lig, La Liga, Süper Lig, Şampiyonlar Ligi, Avrupa Ligi, hazırlık, Uluslar Ligi, UEFA ve CONMEBOL elemeleri; Takvim'deki ~41 maç karşılaştırıldı.

- Eklenen: yok. Pencerede eksik maç yok.
- Millî takımlar (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya) sekizi için kontrol edildi: pencerede resmî maç yok. Tek millî maç İngiltere - Ukrayna hazırlığı (5 Aralık); hazırlık yalnızca Türkiye için eklendiğinden eklenmedi.
- Konferans Ligi (CSKA Sofya - Trabzonspor) Takvim'de zaten var, ESPN'de ayrıca sorgulanmadı.

## Adım 3 — Saatler

Sorgu 2 placeholder (12:00) döndürdü, ikisi de 6 Aralık (14 gün sınırında, 72 saatten uzak).

- Beşiktaş - Samsunspor → 16:00 (ESPN 13:00Z, FotMob 13:00Z, Livescore 16:00 TR)
- Trabzonspor - Çorum FK → 19:00 (ESPN 16:00Z, FotMob 16:00Z, Livescore 19:00 TR)
- Netleşmeyen: yok. Uyarı: yok. Uygulama sonrası sorgu 0 satır.

## Kaynaklar

| Kaynak               | Durum                                        |
| -------------------- | -------------------------------------------- |
| site.api.espn.com    | Erişildi                                     |
| fotmob.com           | Erişildi (`/api/data/matches`, `matchDetails`) |
| prod-public-api.livescore.com | Erişildi (yalnızca saat)            |
| flashscore.com       | 200, ancak veri JS ile yükleniyor; kullanılmadı |
| sofascore.com, mackolik.com, footballwebpages.co.uk | Denenmedi (bilinen 403) |

## Migration

- `20261122220500_update_hafta_sonuclari_20261121_22.sql` — 10 maçın skoru ve golleri. `apply_migration` ile uygulandı.
- `20261122220600_update_super_lig_saat_netlesme_20261206.sql` — 6 Aralık iki Süper Lig maçının saati. Uygulandı.
- Adım 2 için dosya yok (iş çıkmadı).

## Kalan iş

- Skorsuz maç: 0 (uygulama sonrası sorgu). Liverpool - Manchester United 4 - 0 (ESPN/FotMob, Yoro kırmızı kart 8') bir sonraki koşuda işlenecek.
- Pencere içi placeholder saat: 0.
