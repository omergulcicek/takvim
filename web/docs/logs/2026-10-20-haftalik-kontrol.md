# Haftalık Kontrol — 2026-10-20

Durum: BAŞARISIZ (skorsuz maç sorgusu kurulamadı)

## Pencere
- Sonuç kontrolü: 2026-10-17, 2026-10-18, 2026-10-19 (Europe/Istanbul)
- Fikstür: 2026-10-20 → 2026-11-03

## Adım 1 — Skorsuz maçlar
- Supabase (`ieqzwanwsikryweutnvk`) `public.events` şeması `list_tables` ile kontrol edildi.
- Kolonlar: id, title, description, start_date, end_date, location, is_all_day, status, tags, source_url, created_at, updated_at, recurrence, subject_id, kind, occurrence_date, calendar_system, hijri_*.
- **Skor kolonu yok.** Skor yalnızca başlıkta (`Ev X - Y Deplasman`) tutuluyor.
- Prompt başlığa göre (regex/LIKE) kontrolü yasakladığı için NULL kontrolü yapılamadı; sorgu çalıştırılmadı.
- Skorsuz maç sayısı: **belirlenemedi** (0 değil).

## Adım 2 — Kaynaklar
- Hiçbir maç belirlenemediği için kaynaklara istek atılmadı. Erişim durumu: denenmedi.

## Adım 3 — Yazma
- Migration yok, `apply_migration` çağrılmadı. Güncellenen: 0, eklenen: 0.

## Atlanan / doğrulanamayan / skorsuz kalan
- Pencere (17–19 Ekim) içindeki skorsuz maçlar doğrulanmadı; durumları bilinmiyor.

## Öneri
- Prompta, başlıkta `[0-9] - [0-9]` olmayan maçları tespit etmeye izin veren bir kural eklenmeli (event-data-rules.md §3.4 bu deseni zaten kullanıyor) veya events tablosuna skor kolonu eklenmeli.
