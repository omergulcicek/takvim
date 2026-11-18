# Haftalık Kontrol — 2026-11-19

`BUGUN` = 2026-11-19 (koşu 02:03 TR). Pencere: 2026-11-19 → 2026-12-03. Dal: `claude/dazzling-babbage-kzfsd3` (platform ataması).

## Adım 1 — Sonuçlar

Sorgu (alt sınır yok): `NOT (title ~ '[0-9] - [0-9]') AND title LIKE '% - %' AND start_date + interval '3 hours' < now()`. Sonuç: **0 satır**. Güncellenen: yok. Atlanan: yok.

## Adım 2 — Fikstür

Kontrol edilen: ESPN'den 12 takip kulübü (GS, FB, BJK, TS, Arsenal, Liverpool, Man City, Man United, Tottenham, Chelsea, Barcelona, Real Madrid) için Süper Lig (18), Premier Lig (30), La Liga (22), Şampiyonlar Ligi (18), Avrupa Ligi (18), Konferans Ligi (18) takvimi tarandı; kapsam içi ~45 maç Takvim ile karşılaştırıldı (ev/deplasman, saat dahil). Millî takımlar (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya): ESPN'de pencerede resmî maç, eleme veya Türkiye hazırlık maçı yok (FIFA arası yok) — sekizi de kontrol edildi.

Eklenen (1): `Tottenham - Fulham` — 2026-12-03 23:00 TR, `premier-lig` (ESPN + FotMob aynı saat).
Eklenmeyen: kapsam dışı takımlı maçlar (takip kulübü içermeyen lig/UCL maçları).

## Adım 3 — Saatler

Sorgu (`12:00` TR placeholder, gelecek, 14 gün içi): **0 satır**. Netleşen: yok. Uyarı: yok.

## Kaynaklar

| Kaynak            | Durum                                         |
| ----------------- | --------------------------------------------- |
| site.api.espn.com | Erişildi (günlük scoreboard)                  |
| fotmob.com        | Erişildi (Tottenham - Fulham saati doğrulandı) |
| Diğerleri         | Sorgulanmadı (gerek olmadı)                   |

## Migration

- `20261119020500_add_fikstur_penceresi_20261119.sql` — Tottenham - Fulham (3 Ara) eklendi; bitiş saati düzeltmesi (`fix_tottenham_fulham_bitis_saati`) aynı dosyada. `apply_migration` ile uygulandı, SELECT ile doğrulandı.

## Kalan iş

Skorsuz geçmiş maç: yok. Pencere içi placeholder saat: yok. 72 saat içi belirsiz saat: yok.
