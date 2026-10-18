# Haftalık Fikstür Senkronizasyonu (Runbook)

Görev: Takvim fikstür senkronizasyonu. Her gün 02:00 (Europe/Istanbul) çalışır.

Repo: omergulcicek/takvim. Kurallar: web/docs/event-data-rules.md. Bu metin çelişirse bu metin geçerlidir.
Supabase: yalnızca "Takvim" (ID: ieqzwanwsikryweutnvk). SQL yalnızca INSERT ve UPDATE. DELETE, TRUNCATE, DROP yasak.

TARİHLER (Europe/Istanbul)
- Pencere: bugün → bugün+14 gün. Fikstür ve saat kontrolü yalnızca bu pencerede.
- Sonuç: yalnızca dün. Dünden yeni maç eklenmez.

EKLENECEK MAÇLAR (lig/turnuva; takım listede değilse eklenmez)
- Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor: Süper Lig, Şampiyonlar Ligi, Avrupa Ligi, Konferans Ligi.
- Arsenal, Liverpool, Manchester City, Manchester United, Tottenham, Chelsea: Premier Lig ve Şampiyonlar Ligi.
- Barcelona, Real Madrid: La Liga ve Şampiyonlar Ligi.
- Bayern Münih, Paris Saint-Germain, Inter, Juventus, Milan, Napoli, Roma: yalnızca Şampiyonlar Ligi. Bu takımların lig maçı eklenmez.
- Serie A: yalnızca Inter, Juventus, Milan, Napoli, Roma'nın birbirleriyle oynadığı maçlar. Bu beş takımın Şampiyonlar Ligi maçı Serie A değil, yalnızca Şampiyonlar Ligi'dir.
- Avrupa Ligi ve Konferans Ligi: yalnızca Galatasaray, Fenerbahçe, Beşiktaş, Trabzonspor maçları. Ayrı kategori yok; yalnızca takım kategorisi bağlanır.
- Milli takımlar: İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya. En az biri oynuyorsa milli-takimlar. Hazırlık maçı yalnızca Türkiye oynuyorsa.
- HARİÇ: Lig Kupası, Türkiye Kupası ve listede olmayan her maç.

KATEGORİ SLUG'LARI
galatasaray, fenerbahce, besiktas, trabzonspor, premier-lig, la-liga, serie-a, sampiyonlar-ligi, milli-takimlar. Avrupa Ligi ve Konferans Ligi için slug yok.

YENİ MAÇ EKLEME
- Başlık: "Ev - Deplasman". Skor başlığa yazılmaz.
- Aynı başlık ve start_date zaten varsa ekleme.
- Saat kaynakta net değilse 12:00 (Europe/Istanbul) yaz. Saat netleşince UPDATE yap.
- end_date = start_date + 2 saat. Bitiş 00:00 olursa 23:55 yaz.
- Açıklama: event-data-rules.md §2.2'ye göre. Lig maçlarında NULL.

SAAT, ERTELEME, İPTAL
- Kaynak farklı saat veriyorsa start_date ve end_date güncelle.
- Ertelenen maçta yeni tarihi yaz; pencere dışında olsa bile.
- İptal edilen maçın başlığı: "Ev - Deplasman (İptal)". Skor yazma, açıklamaya dokunma.

SKOR (yalnızca dünün skorsuz maçları)
- Kaynakta FT, Full time, Final veya Maç sonu etiketi yoksa yazma. Dakika (örn. 67'), Canlı, Devre arası, Second Half görürsen yazma.
- Skor zaten yazılmışsa (başlıkta "N - N") dokunma.
- Başlık: "Ev X - Y Deplasman".
- Açıklama: ev satırları, boş satır, deplasman satırları. Yalnızca bir taraf satır içeriyorsa boş satır yok. Hiç gol yoksa NULL.
- Satır biçimi: "İsim dk'" (SQL'de dakika işareti iki kez yazılır: 31''). Penaltı: "(Penaltı)". Kırmızı kart: "(Kırmızı kart)". Kendi kalesine: "(Kendi Kalesine)".
- Aynı oyuncunun birden fazla golü tek satırda: "Folarin Balogun 31'', 45+5''".
- Mevcut "(kk)" kayıtlarına dokunma. Yeni kayıtta "(Kendi Kalesine)" kullan.

KAYNAK
- En az iki güvenilir kaynak kullan (resmi lig/kulüp sitesi veya bilinen spor sonuç sitesi). Kaynak URL'lerini logla.
- Kaynaklar çelişirse veya bilgi bulunamazsa maçı atla ve logla. Uydurma.

MIGRATION
- Dosya: web/supabase/migrations/YYYYMMDDHHMMSS_<fiil>_<konu>.sql. Fiil: add_, update_<slug>_kickoff, update_<slug>_result, fix_.
- Dosyanın ilk satırı Türkçe yorum.
- Her değişiklik idempotent: NOT EXISTS, ON CONFLICT DO NOTHING.
- Yazmadan önce Takvim'de aynı değişiklik var mı kontrol et.
- Değişiklik yoksa dosya yazma.

GİT
1. Dal: claude-automations. Yoksa main'den oluştur. Varsa önce main'i merge et.
2. Log: web/docs/logs/YYYY-MM-DD-haftalik-kontrol.md. Dosya varsa sonuna "## Run HH:MM TR" bölümü ekle.
3. Migration veya kod değişikliği varsa: commit, push. Açık PR yoksa claude-automations → main PR aç. PR'ı main'e merge et. Sonra her yeni migration için Takvim'de apply_migration çağır. Araç yoksa görevi başarısız say.
4. Yalnızca log değiştiyse: commit, push. PR açma.
5. Hiçbir şey değişmediyse: commit, PR, apply_migration yok.
6. "Canlı takvim değişti" yalnızca apply_migration başarılıysa söylenir.

LOG (web/docs/logs/...)
- Çalıştırma zamanı, pencere, dün, dal.
- Kaynak URL'leri.
- Eklenenler, güncellenenler, atlananlar (neden), değişmeyenler.
- Oluşturulan migration dosyaları.

RAPOR
Eklenen, değişen, atlanan, değişmeyen sayıları. Migration'ların uygulanıp uygulanmadığı. Atlananların nedenleri.
