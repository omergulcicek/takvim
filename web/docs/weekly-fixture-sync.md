# Haftalık Fikstür Senkronizasyonu

Görev her gün 02:00 (Europe/Istanbul) çalışır. Bu dosya tek kaynaktır.

## Kurallar

- Proje: "Takvim" (`ieqzwanwsikryweutnvk`). Yalnızca `INSERT` ve `UPDATE`.
- SQL ve kategori kuralları: `web/docs/event-data-rules.md`.
- Fikstür penceresi: bugün → bugün+14 gün.
- Sonuç kontrolü: dün dahil son 3 gün içindeki skorsuz kapsam içi maçlar. Bu aralıktan yeni maç eklenmez.
- Takım listede değilse maç eklenmez. Lig Kupası ve Türkiye Kupası eklenmez.
- Saat kesin değilse `12:00` (Europe/Istanbul). Netleşince güncellenir.
- Ertelenen maçta tarih güncellenir. İptal: `Ev - Deplasman (İptal)`.
- Görev her koşulda tamamlanır ve log yazılır. Bir kaynağın hatası görevi durdurmaz.

## Kaynaklar

Sıra: sonuç siteleri, resmi siteler, haber siteleri.

- Sonuç: flashscore.com, flashscore.com.tr, sofascore.com, livescore.com, fotmob.com, site.api.espn.com, espn.com, footballwebpages.co.uk
- Resmi: premierleague.com, laliga.com, fcbarcelona.com, realmadrid.com, uefa.com, legaseriea.it, tff.org
- Haber: bbc.co.uk, skysports.com, fanatik.com.tr, milliyet.com.tr

Hata yönetimi:

- Bir kaynak hata verirse (403, zaman aşımı, boş sayfa, alan adı çözümlenemiyor) o kaynak atlanır ve sıradaki kaynağa geçilir.
- Kaynak hatası görevin başarısız olduğu anlamına gelmez.
- Hiçbir kaynak yanıt vermezse maç atlanır. Logda "kaynak erişilemedi" yazılır.

Doğrulama:

- Bitiş (FT) ve skor en az iki farklı kaynakta aynı olmalı.
- Gol dakikaları tek kaynaktan alınabilir. Diğer kaynakla 1 dakikadan fazla çelişiyorsa maç atlanır.
- Kaynaklar çelişiyorsa veya bilgi yoksa maç atlanır. Bilgi uydurulmaz.

## Skor

Yalnızca tamamlanmış maçların skoru yazılır. Devam eden maçlar atlanır.

- Başlık: `Ev X - Y Deplasman`. Örnek: `Türkiye 4 - 2 Fransa`.
- Kendi kalesine golü, golden faydalanan takımın bloğunda yazılır.
- Açıklama formatı (dummy veri):

```text
Arda Güler 10'
Kenan Yıldız 21'
Ozan Kabak 49'
Ibrahima Konaté 62' (Kendi Kalesine)

Kylian Mbappé 3', 7'
Ousmane Dembélé 75' (Kırmızı kart)
```

- Tek taraf satır varsa boş satır yok. Olay yoksa `NULL`.

## Migration ve git

- Dosya: `web/supabase/migrations/YYYYMMDDHHMMSS_<fiil>_<konu>.sql`. Fiil `add` veya `update`. Konu Türkçe, ASCII: `turkiye_fransa`.
- Dosya içindeki yorumlar Türkçe. SQL anahtar kelimeleri ve tablo/kolon adları hariç.
- Yazmadan önce Takvim'de aynı değişiklik var mı kontrol et.
- Dal: `claude-automations`. Platform başka bir `claude/` dalı atarsa o dalı kullan. Her durumda önce `main`'i merge et.
- Migration veya kod değişikliği varsa: commit, push, PR, merge, sonra `apply_migration`.
- Yalnızca log değiştiyse: commit, push. PR yok.
- Hiçbir değişiklik yoksa: commit yok, PR yok, `apply_migration` yok.

## Log

`web/docs/logs/YYYY-MM-DD-haftalik-kontrol.md`. Her çalıştırmada yazılır. İçerik: kullanılan kaynaklar, erişilemeyen kaynaklar, eklenen, güncellenen ve atlanan maçlar (neden), değişmeyen maç sayısı, migration listesi (dosya adı ve tek satır Türkçe özet).
