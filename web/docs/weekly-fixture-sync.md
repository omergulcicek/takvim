# Fikstür Senkronizasyonu

Görev her gün 02:00 (Europe/Istanbul) çalışır. **Bu dosya tek kaynaktır.** Zamanlayıcı promptu yalnızca bu dosyaya yönlendirir; kural eklemez, kural ezmez. Bir şey değişecekse burada değişir.

SQL ve kategori kuralları: [`event-data-rules.md`](./event-data-rules.md).

## Değişkenler

| Ad      | Değer                                                            |
| ------- | ---------------------------------------------------------------- |
| `BUGUN` | Koşunun çalıştığı günün Europe/Istanbul tarihi (`YYYY-MM-DD`)    |
| Proje   | Takvim — `ieqzwanwsikryweutnvk`                                  |
| Pencere | `BUGUN` → `BUGUN + 14 gün`                                       |
| Kapsam  | Kategorilerde tanımlı takımlar. Lig Kupası ve Türkiye Kupası yok |

Yalnızca `INSERT` ve `UPDATE`. Silme yok.

---

## Adımlar

> **Adımlar birbirinden bağımsızdır.** Bir adımın boş sonuç vermesi sonraki adımı atlamanın gerekçesi değildir. Her adım kendi sorgusunu çalıştırır, kendi sonucunu loglar. "Bugün yapacak iş yok" kararı ancak üç adımın üçü de kendi sorgusunu çalıştırdıktan sonra verilebilir.

### Adım 1 — Geçmiş skorsuz maçlar

Bitmiş olması beklenen ama skoru yazılmamış maçları bul:

```sql
NOT (title ~ '[0-9] - [0-9]')
  AND title LIKE '% - %'
  AND start_date + interval '3 hours' < now()
```

Alt sınır yok. `start_date`'e göre eskiden yeniye sırala, en eskiden başla. Her maç için skoru ve olayları doğrula (bkz. Doğrulama). Satır sayısını ve listeyi logla.

### Adım 2 — Fikstür penceresi

Pencerede (`BUGUN` → `+14 gün`) kapsam içi takımların oynayacağı maçları kaynaklardan çıkar ve Takvim'de olmayanları ekle.

- Bu adım **her koşuda** çalışır. Adım 1 boş dönse de çalışır.
- Takım kapsam listesinde değilse maç eklenmez.
- Geçmiş maçlardan yeni maç eklenmez.
- Ekleme yoksa logda "pencerede eksik maç yok" yazılır ve kaç maç kontrol edildiği belirtilir.
- **Millî takımlar yalnızca Türkiye'den ibaret değildir.** Kapsam: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya. Resmî turnuva ve eleme maçları sekizi için de eklenir; **hazırlık maçı yalnızca Türkiye** için eklenir. Logda sekiz takımın kontrol edildiği belirtilir, yalnızca Türkiye yazılmaz.

### Adım 3 — Saat taraması

Penceredeki **gelecek** maçlardan saati `12:00` (Europe/Istanbul) placeholder olanları sorgula ve her biri için kesin başlama saatini aramaya çalış.

```sql
start_date > now()
  AND start_date < now() + interval '14 days'
  AND to_char(start_date AT TIME ZONE 'Europe/Istanbul', 'HH24:MI') = '12:00'
```

- Saat iki kaynakta aynıysa güncelle. Değilse `12:00` kalır ve logda "saat netleşmedi" olarak yazılır.
- Bu adım **her koşuda** çalışır; placeholder sayısı sıfır olsa bile sorgu çalıştırılır ve sonuç loglanır.
- Maç 72 saatten yakınsa ve saat hâlâ netleşmediyse logda ayrıca **uyarı** satırı açılır.
- Pencere dışındaki (14 günden uzak) placeholder'lar normaldir; o maçların saati henüz açıklanmamıştır. Bu adımın kapsamı dışındadır, eksik sayılmaz.

### Adım 4 — Migration ve uygulama

Her değişiklik için `web/supabase/migrations/YYYYMMDDHHMMSS_<fiil>_<konu>.sql`. Fiil `add` veya `update`, konu Türkçe ve ASCII (`turkiye_fransa`). Dosya içi yorumlar Türkçe.

Yazmadan önce aynı değişiklik Takvim'de var mı kontrol et. Dosyayı yaz, commit et, `apply_migration` ile uygula. Bir migration başarısız olursa logla ve sonrakilere devam et.

### Adım 5 — Log

`web/docs/logs/<BUGUN>-haftalik-kontrol.md`. **Her koşuda yazılır**, değişiklik olmasa bile.

Üç adımın üçü de ayrı başlık altında raporlanır. Bir adım hiç iş çıkarmadıysa bunu sorgu sonucuyla birlikte yazar; adım başlığı logdan düşürülmez.

| Bölüm             | İçerik                                                            |
| ----------------- | ----------------------------------------------------------------- |
| Adım 1 — Sonuçlar | Skorsuz maç sayısı ve listesi, güncellenen, atlanan (nedeniyle)   |
| Adım 2 — Fikstür  | Kontrol edilen maç sayısı, eklenen maçlar, eklenmeyenler (neden)  |
| Adım 3 — Saatler  | Placeholder sayısı, netleşen saatler, netleşmeyenler, uyarılar    |
| Kaynaklar         | Kaynak bazında erişim durumu (erişildi / 403 / 404 / zaman aşımı) |
| Migration         | Dosya adı ve tek satır Türkçe özet                                |
| Kalan iş          | Hâlâ skorsuz maçlar, **pencere içinde** hâlâ placeholder saatler  |

### Adım 6 — Push

Önce `main`'i çalışma dalına merge et, sonra push et.

- Tercih edilen dal: `claude-automations`.
- Platform koşuya kendi `claude/...` dalını atadıysa o dal kullanılır; bu bir hata değildir, logda dal adı yazılır.
- PR açılmaz, merge beklenmez. Migration zaten `apply_migration` ile uygulanmıştır.

---

## Kaynaklar

Sıra: sonuç siteleri, resmî siteler, haber siteleri.

| Tür              | Kaynaklar                                                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Sonuç ve fikstür | flashscore.com, flashscore.com.tr, sofascore.com, livescore.com, fotmob.com, site.api.espn.com, espn.com, footballwebpages.co.uk |
| Kart ve olay     | site.api.espn.com ve fotmob.com (ikisi de kart verisi taşır, koşu ortamından erişilebiliyor), tff.org (resmî maç raporu)         |
| Resmî            | premierleague.com, laliga.com, fcbarcelona.com, realmadrid.com, uefa.com, legaseriea.it, tff.org                                 |
| Haber            | bbc.co.uk, skysports.com, fanatik.com.tr, milliyet.com.tr                                                                        |

Koşu ortamından sürekli 403 dönen kaynaklar: **sofascore.com, mackolik.com, footballwebpages.co.uk**. Bunlar listede kalır ama sıraya en sona konur; ilk tercih `site.api.espn.com` ve `fotmob.com`'dur.

Bir kaynak hata verirse (403, 404, zaman aşımı, boş sayfa, alan adı çözümlenemiyor) o kaynak atlanır ve sıradakine geçilir. Kaynak hatası görevin başarısız olduğu anlamına gelmez. Hiçbir kaynak yanıt vermezse maç atlanır ve logda "kaynak erişilemedi" yazılır.

## Doğrulama

- Bitiş (FT) ve skor **en az iki farklı kaynakta** aynı olmalı.
- Gol dakikaları tek kaynaktan alınabilir. Diğer kaynakla 1 dakikadan fazla çelişiyorsa maç atlanır.
- **Kırmızı kart:** kartın varlığı ve oyuncu adı en az iki kaynakta aynı olmalı. Kartın varlığı doğrulanıp oyuncu adı doğrulanamazsa kart satırı yazılmaz, ancak logda "kart doğrulanamadı" satırı açılır — sessizce düşürülmez.
- Kaynaklar çelişiyorsa veya bilgi yoksa maç atlanır. **Bilgi uydurulmaz.**
- Önceki koşunun yazdığı varsayılarak kontrol atlanmaz.

## Skor ve olay formatı

Yalnızca tamamlanmış maçların skoru yazılır. Devam eden maçlar atlanır.

- Başlık: `Ev X - Y Deplasman`. Örnek: `Türkiye 4 - 2 Fransa`.
- Kendi kalesine golü, golden faydalanan takımın bloğunda yazılır.
- Saat kesin değilse `12:00` (Europe/Istanbul) yazılır ve Adım 3 tarafından takip edilir.

```text
Arda Güler 10'
Kenan Yıldız 21'
Ozan Kabak 49'
Ibrahima Konaté 62' (Kendi Kalesine)

Kylian Mbappé 3', 7'
Ousmane Dembélé 75' (Kırmızı kart)
```

Tek taraf satır varsa boş satır yok. Olay yoksa `NULL`.

Ertelenen maçta tarih güncellenir. İptal: `Ev - Deplasman (İptal)`.

## Bitiş kriterleri

Final mesajının ilk satırı `TAMAM`, `KISMİ` veya `BAŞARISIZ`.

| Sonuç       | Koşul                                                                                                          |
| ----------- | -------------------------------------------------------------------------------------------------------------- |
| `TAMAM`     | Üç adım da çalıştı; geçmişte skorsuz maç kalmadı; pencerede eksik maç yok; 72 saat içinde placeholder saat yok |
| `KISMİ`     | Üç adım da çalıştı ama yukarıdakilerden biri karşılanmadı (kaynak bulunamadı, saat netleşmedi vb.)             |
| `BAŞARISIZ` | Sorgu veya araç çalışmadı. Tek bir kaynağın hatası `BAŞARISIZ` değildir                                        |

Bir adım hiç çalıştırılmadıysa sonuç `TAMAM` olamaz.
