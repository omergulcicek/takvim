# Haftalık Fikstür Senkronizasyonu

Görev her gün 02:00 (Europe/Istanbul) çalışır. Bu dosya görev metniyle aynı kuralları içerir. Çelişki olursa görev metni geçerlidir.

## Veritabanı

- Proje: "Takvim" (`ieqzwanwsikryweutnvk`). Başka projeye yazılmaz.
- Yalnızca `INSERT` ve `UPDATE`. `DELETE`, `TRUNCATE`, `DROP` yasak.
- Kurallar: `web/docs/event-data-rules.md`.

## Tarihler (Europe/Istanbul)

- Fikstür penceresi: bugün → bugün+14 gün.
- Sonuç kontrolü: yalnızca dün.

## Kapsam

Takım listede değilse maç eklenmez.

| Takımlar | Eklenecek lig/turnuva |
| --- | --- |
| Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor | Süper Lig, Şampiyonlar Ligi, Avrupa Ligi, Konferans Ligi |
| Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea | Premier Lig, Şampiyonlar Ligi |
| Barcelona, Real Madrid | La Liga, Şampiyonlar Ligi |
| Bayern Münih, Paris Saint-Germain, Inter, Juventus, Milan, Napoli, Roma | Yalnızca Şampiyonlar Ligi |
| İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya | Milli takım maçları. Hazırlık maçı yalnızca Türkiye oynuyorsa |

Ek kurallar:

- Serie A: yalnızca Inter, Juventus, Milan, Napoli, Roma'nın birbirine karşı oynadığı maçlar. Bu beş takım Şampiyonlar Ligi'nde karşılaşırsa yalnızca `sampiyonlar-ligi` bağlanır.
- Avrupa Ligi ve Konferans Ligi: yalnızca Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor maçları.
- Lig Kupası ve Türkiye Kupası eklenmez.

Kategori slug'ları: `galatasaray`, `fenerbahce`, `besiktas`, `trabzonspor`, `premier-lig`, `la-liga`, `serie-a`, `sampiyonlar-ligi`, `milli-takimlar`.
Avrupa Ligi ve Konferans Ligi için slug yoktur. Maç yalnızca takım slug'ına bağlanır.

## Yeni maç

- Başlık: `Ev - Deplasman`. Skor başlığa yazılmaz.
- Aynı başlık ve aynı `start_date` zaten varsa eklenmez.
- Kaynakta saat kesin değilse `12:00` (Europe/Istanbul) yazılır. Saat netleşince güncellenir.
- Alanlar: `status = 'published'`, `recurrence = 'none'`, `is_all_day = false`.
- `end_date = start_date + 2 saat`. Bitiş `00:00` olursa `23:55` yazılır.
- Açıklama: lig maçlarında `NULL`. Şampiyonlar Ligi, Avrupa Ligi, Konferans Ligi ve milli maçlarda tur metni (`event-data-rules.md` §2.2).
- Kategori bağlantısı: `event_categories` üzerinden, `ON CONFLICT DO NOTHING`.

## Saat, erteleme, iptal

- Kaynak saat farklıysa `start_date` ve `end_date` güncellenir.
- Ertelenen maçta yeni tarih yazılır, pencere dışında olsa bile.
- İptal edilen maçın başlığı `Ev - Deplasman (İptal)` olur. Skor yazılmaz, açıklamaya dokunulmaz.

## Skor (yalnızca dünün skorsuz maçları)

- Kaynakta `FT`, `Full time`, `Final` veya `Maç sonu` etiketi olmalı.
- Canlı, devre arası, dakika (`67'`) veya `Second Half` görünüyorsa skor yazılmaz.
- Başlıkta zaten `N - N` varsa dokunulmaz.
- Başlık: `Ev X - Y Deplasman`.
- Açıklama: ev satırları, boş satır, deplasman satırları. Yalnızca bir taraf satır içeriyorsa boş satır yok. Gol yoksa `NULL`.
- Satır: `İsim dk'`. SQL'de dakika işareti iki kez yazılır: `31''`.
- Penaltı: `(Penaltı)`. Kırmızı kart: `(Kırmızı kart)`. Kendi kalesine: `(Kendi Kalesine)`.
- Aynı oyuncunun golleri tek satırda: `Folarin Balogun 31'', 45+5''`.
- Eski `(kk)` kayıtlara dokunulmaz. Yeni kayıtlarda `(Kendi Kalesine)` kullanılır.

## Kaynak

- En az iki güvenilir kaynak kullanılır: resmi lig veya kulüp sitesi ya da bilinen spor sonuç sitesi.
- Kaynaklar çelişirse veya bilgi yoksa maç atlanır. Bilgi uydurulmaz.

## Migration

- Dosya: `web/supabase/migrations/YYYYMMDDHHMMSS_<fiil>_<konu>.sql`.
- Fiil: `add_`, `update_<slug>_kickoff`, `update_<slug>_result`, `fix_`.
- İlk satır Türkçe yorum.
- Idempotent: `NOT EXISTS`, `ON CONFLICT DO NOTHING`.
- Yazmadan önce Takvim'de aynı değişiklik olup olmadığı kontrol edilir.
- Değişiklik yoksa dosya yazılmaz.

## Git

1. Dal: `claude-automations`. Yoksa `main`'den oluştur. Varsa önce `main`'i merge et.
2. Log: `web/docs/logs/YYYY-MM-DD-haftalik-kontrol.md`. Dosya varsa sonuna `## Run HH:MM TR` bölümü ekle.
3. Migration veya kod değişikliği varsa: commit, push, `claude-automations` → `main` PR (açık PR yoksa), merge. Sonra her yeni migration için Takvim'de `apply_migration`. Araç yoksa görev başarısız sayılır.
4. Yalnızca log değiştiyse: commit, push. PR açılmaz.
5. Hiçbir değişiklik yoksa: commit, PR, `apply_migration` yok.
6. "Canlı takvim değişti" ifadesi yalnızca `apply_migration` başarılıysa kullanılır.

## Rapor

Eklenen, güncellenen, atlanan (neden) ve değişmeyen maç sayıları. Migration uygulandı mı.
