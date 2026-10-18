# Haftalık Fikstür Senkronizasyonu

Görev her gün 02:00 (Europe/Istanbul) çalışır. Bu dosya görev metniyle aynı kuralları içerir. Çelişirse görev metni geçerlidir.

## Kurallar

- Proje: "Takvim" (`ieqzwanwsikryweutnvk`). Başka projeye yazılmaz.
- Yalnızca `INSERT` ve `UPDATE`. `DELETE`, `TRUNCATE`, `DROP` yasak.
- Fikstür penceresi: bugün → bugün+14 gün. Sonuç kontrolü: yalnızca dün.
- Takım listede değilse maç eklenmez. Lig Kupası ve Türkiye Kupası eklenmez.
- Kapsam, kategoriler ve SQL şablonları: `web/docs/event-data-rules.md`.
- Saat kesin değilse `12:00` (Europe/Istanbul) yazılır. Netleşince güncellenir.
- Ertelenen maçta tarih güncellenir. İptal edilen maçın başlığı `Ev - Deplasman (İptal)` olur.
- Kaynak: en az iki güvenilir kaynak. Çelişki veya bilgi yoksa atla, uydurma.

## Skor kuralları

- Skor yalnızca kaynakta `FT`, `Full time`, `Final` veya `Maç sonu` varsa yazılır.
- Canlı, devre arası, dakika (`67'`) görünüyorsa yazılmaz.
- Başlıkta zaten `N - N` varsa dokunulmaz.
- Kendi kalesine golü, golü yiyen takımda değil, golden faydalanan takımın bloğunda yazılır.
- SQL'de dakika işareti iki kez yazılır: `31''`.

## Yeni maç (şablon)

```sql
-- Dummy örnek: Türkiye - Fransa, gerçek maç değil
WITH e AS (
  INSERT INTO public.events (title, description, start_date, end_date, is_all_day, status, recurrence)
  SELECT
    'Türkiye - Fransa',
    NULL,
    '2026-11-14 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul',
    '2026-11-14 23:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events
    WHERE title = 'Türkiye - Fransa'
      AND start_date = '2026-11-14 21:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT e.id, c.id
FROM e
CROSS JOIN public.categories c
WHERE c.slug IN ('milli-takimlar')
ON CONFLICT DO NOTHING;
```

## Sonuç (şablon, dummy veri)

Senaryo: Türkiye 4 - 2 Fransa. Kapsananlar: normal gol, kendi kalesine golü, aynı oyuncunun çoklu golü, kırmızı kart.

```sql
-- Dummy örnek: Türkiye 4 - 2 Fransa, gerçek maç değil
UPDATE public.events
SET
  title = 'Türkiye 4 - 2 Fransa',
  description = E'Arda Güler 10''\nKenan Yıldız 21''\nOzan Kabak 49''\nIbrahima Konaté 62'' (Kendi Kalesine)\n\nKylian Mbappé 3'', 7''\nOusmane Dembélé 75'' (Kırmızı kart)'
WHERE title = 'Türkiye - Fransa'
  AND status = 'published';
```

Açıklama biçimi:

```text
Arda Güler 10'
Kenan Yıldız 21'
Ozan Kabak 49'
Ibrahima Konaté 62' (Kendi Kalesine)

Kylian Mbappé 3', 7'
Ousmane Dembélé 75' (Kırmızı kart)
```

- Ev sahibi blok, boş satır, deplasman blok.
- Yalnızca bir taraf satır içeriyorsa boş satır yoktur.
- Hiç olay yoksa açıklama `NULL`.

## Migration ve git

- Dosya: `web/supabase/migrations/YYYYMMDDHHMMSS_<fiil>_<konu>.sql`. İlk satır Türkçe yorum.
- Yazmadan önce Takvim'de aynı değişiklik olup olmadığını kontrol et.
- Dal: `claude-automations`. Varsa önce `main`'i merge et.
- Log: `web/docs/logs/YYYY-MM-DD-haftalik-kontrol.md`.
- Migration veya kod değişikliği varsa: commit, push, PR, merge. Sonra her yeni migration için Takvim'de `apply_migration`.
- Yalnızca log değiştiyse: commit, push. PR yok.
- Hiçbir şey değişmediyse: commit yok, PR yok, `apply_migration` yok.
- "Canlı takvim değişti" yalnızca `apply_migration` başarılıysa söylenir.

## Rapor

Eklenen, güncellenen, atlanan (neden), değişmeyen maç sayıları ve migration durumu.
