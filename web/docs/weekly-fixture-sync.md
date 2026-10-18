# Haftalık Fikstür Senkronizasyonu

Görev her gün 02:00 (Europe/Istanbul) çalışır. Bu dosya tek kaynaktır.

## Kurallar

- Proje: "Takvim" (`ieqzwanwsikryweutnvk`). Yalnızca `INSERT` ve `UPDATE`.
- SQL ve kategori kuralları: `web/docs/event-data-rules.md`.
- Fikstür penceresi: bugün → bugün+14 gün. Sonuç kontrolü: yalnızca dün.
- Takım listede değilse maç eklenmez. Lig Kupası ve Türkiye Kupası eklenmez.
- Saat kesin değilse `12:00` (Europe/Istanbul). Netleşince güncellenir.
- Ertelenen maçta tarih güncellenir. İptal: `Ev - Deplasman (İptal)`.
- Kaynak: en az iki güvenilir kaynak. Bilgi yoksa veya çelişiyorsa atla.

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
- Dal: `claude-automations`. Varsa önce `main`'i merge et.
- Migration veya kod değişikliği varsa: commit, push, PR, merge, sonra `apply_migration`.
- Yalnızca log değiştiyse: commit, push. PR yok.
- Hiçbir şey değişmediyse: commit, PR, `apply_migration` yok.

## Log

`web/docs/logs/YYYY-MM-DD-haftalik-kontrol.md`. Migration listesi: dosya adı ve tek satır Türkçe özet. Rapor: eklenen, güncellenen, atlanan (neden), değişmeyen maç sayıları.
