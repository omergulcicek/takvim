# Haftalık Kontrol — 2026-11-20

Dal: `claude/dazzling-babbage-d5hsd6` (platform atadı)

## Koşu 02:00 TR

### Adım 1 — Sonuçlar
- Sorgu çalıştırıldı: skorsuz geçmiş maç sayısı **0**. Güncellenen yok, atlanan yok.

### Adım 2 — Fikstür
- Pencere 2026-11-20 → 2026-12-04. Süper Lig, Premier Lig, La Liga, Şampiyonlar Ligi, Avrupa Ligi, Konferans Ligi, Uluslar Ligi ve hazırlık fikstürleri ESPN ile tarandı; Süper Lig ayrıca FotMob ile doğrulandı.
- Millî takımlar (İspanya, Fransa, İngiltere, Portekiz, Almanya, Türkiye, Arjantin, Brezilya — sekizi de kontrol edildi): pencerede maç yok (ESPN `uefa.nations` ve `fifa.friendly` boş).
- Takvim'de ~40 maç kontrol edildi; eksik maç yok. Takvim'de olmayan ESPN maçları (ör. Atlético, Villarreal, Brighton, Everton, Milan, Juventus) kapsam dışı.
- Tarih düzeltmesi: `Galatasaray - Ç. Rizespor` 6 Aralık 12:00 (placeholder) idi; ESPN ve FotMob 4 Aralık 20:00 TR olarak eşleşiyor → güncellendi.

### Adım 3 — Saatler
- Pencerede `12:00` placeholder sorgusu çalıştırıldı: **0 satır** (sorgu anında). 72 saat içinde placeholder yok, uyarı yok.
- Not: yukarıdaki Rizespor maçı pencere dışı 6 Aralık placeholder'ıydı; saati netleşip öne çekildi.

### Kaynaklar
- site.api.espn.com: erişildi (aralık sorgusu 400 verdi, gün gün sorgulandı)
- fotmob.com: erişildi
- Diğer kaynaklar denenmedi (gerek olmadı).

### Migration
- `20261120020000_update_galatasaray_rizespor_tarih.sql` — Galatasaray - Rizespor maçını 4 Aralık 20:00'a aldı (`apply_migration` ile uygulandı, doğrulandı).

### Kalan iş
- Skorsuz maç: yok. Pencere içinde placeholder saat: yok.
