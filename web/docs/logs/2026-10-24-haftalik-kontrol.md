# Haftalık Kontrol — 2026-10-24

Çalışma zamanı: 2026-10-23 23:09 UTC (2026-10-24 02:09 Europe/Istanbul).

## Adım 1: Geçmişteki skorsuz maçlar

Sorgu (alt sınır yok, Lig Kupası ve Türkiye Kupası hariç, `start_date + interval '3 hours' < now()`, eskiden yeniye):

```sql
select ... from events e
where not (e.title ~ '[0-9] - [0-9]') and e.title like '% - %'
  and e.start_date + interval '3 hours' < now()
  and e.title not ilike '%Lig Kupası%' and e.title not ilike '%Türkiye Kupası%'
order by e.start_date asc
```

Sonuç: `[]` — **0 satır**.

Doğrulama sorgusu: toplam maç başlıklı kayıt 379, skorlu 269, kapsam filtresiz geçmiş skorsuz 0.

## Adım 2–3

Skorsuz maç olmadığı için atlandı. Kaynak sorgulanmadı (kaynak erişim durumu: kullanılmadı). Migration yok.

## Özet

- Skorsuz maç sayısı: 0
- Güncellenen: 0, atlanan: 0, doğrulanamayan: 0
- Hâlâ skorsuz kalan geçmiş maç: yok
- Migration: yok
