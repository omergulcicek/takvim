# Weekly fixture sync — 2026-10-19

- Pencere: 2026-10-19 → 2026-11-02 (+14d)
- Sonuç kontrolü: 2026-10-16 → 2026-10-18

## Kaynaklar

- ESPN scoreboard API (site.api.espn.com) — skor ve gol dakikaları
- skysports.com — skor doğrulaması (ikinci kaynak)

## Erişilemeyen kaynaklar

- bbc.co.uk — erişilemedi
- fotmob.com API — HTTP 404

## Migrations

- `20261018230001_update_leeds_manchester_united_result.sql` — Leeds United 1 - 1 Manchester United sonucu ve goller yazıldı
- `20261018230002_update_nottingham_forest_arsenal_result.sql` — Nottingham Forest 0 - 1 Arsenal sonucu ve gol yazıldı
- `20261018230003_update_real_madrid_sevilla_result.sql` — Real Madrid 4 - 1 Sevilla sonucu ve goller yazıldı

Üçü de `apply_migration` ile Takvim'e uygulandı.

## Skipped

- Pencerenin yeni maçları — kaynaklardan fikstür taraması yapılamadı (kaynak erişilemedi); mevcut kayıtlar değiştirilmedi

## Notes

- Eklenen **0**, güncellenen **3**, atlanan **1**, değişmeyen: 17 Eki sonuçları (6 maç) zaten skorlu, pencere maçları değişmedi
