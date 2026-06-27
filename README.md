# Takvim Aboneliği

Dini günlerden İslam tarihine, milli bayramlardan Türk edebiyatına uzanan **özenle seçilmiş etkinlik takvimlerini** keşfedin. Web sitesinde aylık takvimde gezin, etkinlik ayrıntılarını okuyun ve seçtiğiniz kategorileri **ICS aboneliği** ile doğrudan iPhone, Google Takvim veya Outlook takviminize ekleyin.

**Canlı site:** [https://takvim-abonelik.vercel.app](https://takvim-abonelik.vercel.app)

## Özellikler

- Aylık takvim görünümü; etkinliklere tıklayarak açıklama, kaynak ve Hicri tarih bilgisine ulaşın
- Kategori bazlı filtreleme ve abonelik URL’si oluşturma
- Hicri takvime göre tekrarlayan dini günler (Diyanet Miladi tarih override’ları ile)
- Açık/koyu tema desteği
- Apple Takvim, Google Takvim ve Outlook için adım adım abonelik rehberi

## Takvim Kategorileri

| Kategori | Slug | Açıklama |
| --- | --- | --- |
| Dini Günler | `dini-gunler` | Diyanet İşleri Başkanlığı'nın ilan ettiği dini günler, kandiller, bayramlar ve mübarek geceler. |
| İslam Tarihi | `islam-tarihi` | İslam tarihinde Hicri takvime göre anılan savaşlar, antlaşmalar, fetihler ve dönüm noktaları. |
| Milli ve Kültürel Günler | `milli-ve-kulturel-gunler` | Türkiye'de kutlanan milli anma günleri, kültürel bayramlar ve farkındalık haftaları. |
| İslam Alimleri | `islam-alimleri` | İslam alimleri, müfessirler ve İslam düşünürlerinin doğum ve vefat yıl dönümleri. |
| Savaş ve Fetihler | `savas-ve-fetihler` | Selçuklu'dan Kurtuluş Savaşı'na meydan muharebeleri, fetihler, kuşatmalar ve seferler. |
| Türk Edebiyatı | `turk-edebiyati` | Türk edebiyatının önemli şair, romancı ve yazarları; doğum ve vefat yıl dönümleri. |

## Takvim Aboneliği Nasıl Yapılır?

Site altındaki **Takvim Aboneliği** bölümünden istediğiniz kategorileri seçin, oluşan URL’yi kopyalayın veya **Abone ol** düğmesine basın. Abonelik, `.ics` dosyası indirip yüklemekten farklıdır — kaynak güncellendikçe takviminiz de otomatik yenilenir.

### iPhone / Mac (Apple Takvim)

1. Abonelik URL’sini kopyalayın. iPhone veya Mac’te **Abone ol** düğmesi Takvim uygulamasını doğrudan açabilir.
2. **iPhone / iPad:** Takvim → Takvimler → Takvim Ekle → Takvim Aboneliği Ekle → URL’yi yapıştırın → Abone Ol.
3. **Mac:** Takvim → Dosya → Yeni Takvim Aboneliği → URL’yi yapıştırın → Abone Ol.
4. Takvime bir ad ve renk verin. iCloud hesabı seçerseniz diğer Apple cihazlarınızda da görünür.

[Apple Destek: Takvim aboneliği ekleme](https://support.apple.com/tr-tr/102301)

### Google / Android (Google Takvim)

1. Abonelik URL’sini kopyalayın (`https://` ile başlayan tam adres).
2. Bilgisayarda [calendar.google.com](https://calendar.google.com) adresini açın. URL ile takvim ekleme mobil uygulamada yapılamaz; ekleme sonrası telefona senkronize olur.
3. Sol tarafta **Diğer takvimler** bölümünün yanındaki **+** simgesine tıklayın → **URL’den abone ol**.
4. URL’yi yapıştırıp **Takvim ekle**’ye tıklayın.
5. Telefonda görmek için Google Takvim uygulamasında ilgili takvimin yanındaki kutuyu işaretleyin.

Güncellemeler birkaç saatte bir gelir; hemen görünmeyebilir.

[Google Destek: URL ile takvim ekleme](https://support.google.com/calendar/answer/37100?hl=tr)

### Outlook

1. Abonelik URL’sini kopyalayın.
2. [outlook.com](https://outlook.com) veya web üzerinde Outlook’ta oturum açın ve Takvim bölümüne geçin.
3. **Takvim ekle** → **Web’den abone ol**.
4. URL’yi yapıştırıp **İçeri aktar**’a tıklayın.

[Microsoft Destek: Takvime abone olma](https://support.microsoft.com/tr-tr/outlook/import-or-subscribe-to-a-calendar-in-outlook-com-or-outlook-on-the-web)

## ICS Feed URL’leri

| Feed | URL |
| --- | --- |
| Tüm kategoriler | `https://takvim-abonelik.vercel.app/feeds/all.ics` |
| Tek kategori | `https://takvim-abonelik.vercel.app/feeds/{slug}.ics` |
| Seçili kategoriler | `https://takvim-abonelik.vercel.app/feeds/subscribe.ics?k=slug1,slug2` |

Örnek: yalnızca Dini Günler → `/feeds/dini-gunler.ics`

### Teknoloji yığını

- [TanStack Start](https://tanstack.com/start) + [TanStack Router](https://tanstack.com/router) — SSR ve yönlendirme
- [TanStack Query](https://tanstack.com/query) — sunucu verisi önbellekleme
- [Supabase](https://supabase.com) — Postgres veritabanı
- [React 19](https://react.dev) + [Tailwind CSS 4](https://tailwindcss.com)
- [date-fns](https://date-fns.org) + Diyanet Hicri anchor’ları — Miladi/Hicri tarih dönüşümü
- [Vite 8](https://vite.dev) + [Nitro](https://nitro.build) — derleme ve sunucu
