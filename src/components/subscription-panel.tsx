import { useMemo, useState } from 'react'
import { Check, Copy, ExternalLink } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { getCategoryColor } from '@/lib/categories'
import { resolveSubscribeFeedUrl } from '@/lib/feeds/urls'
import type { CategoryRow } from '@/lib/queries/categories'
import { toWebcalUrl } from '@/lib/site-url'
import { cn } from '@/lib/utils'

type SubscriptionPanelProps = {
  categories: CategoryRow[]
}

type DeviceGuide = 'apple' | 'google' | 'outlook'

type DeviceGuideContent = {
  label: string
  steps: string[]
  note?: string
  helpUrl: string
  helpLabel: string
}

const DEVICE_GUIDES: Record<DeviceGuide, DeviceGuideContent> = {
  apple: {
    label: 'iPhone / Mac',
    steps: [
      'Yukarıdaki abonelik URL’sini kopyalayın. iPhone veya Mac’te “Abone ol” düğmesi Takvim uygulamasını doğrudan açabilir.',
      'iPhone / iPad: Takvim uygulamasını açın → Takvimler → Takvim Ekle → Takvim Aboneliği Ekle → URL’yi yapıştırın → Abone Ol.',
      'Mac: Takvim → Dosya → Yeni Takvim Aboneliği → URL’yi yapıştırın → Abone Ol.',
      'Takvime bir ad ve renk verin. Hesap olarak iCloud seçerseniz aynı Apple Hesabıyla giriş yaptığınız diğer cihazlarda da görünür.',
    ],
    note: 'Bu bir aboneliktir; etkinlikler kaynak güncellendikçe otomatik yenilenir.',
    helpUrl: 'https://support.apple.com/tr-tr/102301',
    helpLabel: 'Apple Destek: Takvim aboneliği ekleme',
  },
  google: {
    label: 'Google / Android',
    steps: [
      'Abonelik URL’sini kopyalayın (https:// ile başlayan tam adres).',
      'Bilgisayarda calendar.google.com adresini tarayıcıda açın. URL ile takvim ekleme mobil uygulamada yapılamaz; ekleme sonrası telefona senkronize olur.',
      'Sol tarafta Diğer takvimler bölümünün yanındaki + simgesine tıklayın → URL’den abone ol.',
      'URL’yi yapıştırıp Takvim ekle’ye tıklayın. Takvim, sol menüde Diğer takvimler altında görünür.',
      'Telefonda görmek için Google Takvim uygulamasını açın → menü → ilgili takvimin yanındaki kutuyu işaretleyin.',
    ],
    note: 'Güncellemeler birkaç saatte bir gelir; hemen görünmeyebilir.',
    helpUrl: 'https://support.google.com/calendar/answer/37100?hl=tr',
    helpLabel: 'Google Destek: URL ile takvim ekleme',
  },
  outlook: {
    label: 'Outlook',
    steps: [
      'Abonelik URL’sini kopyalayın.',
      'outlook.com veya web üzerinde Outlook’ta oturum açın ve Takvim bölümüne geçin.',
      'Takvim ekle → Web’den abone ol.',
      'URL’yi yapıştırıp İçeri aktar’a tıklayın.',
    ],
    note: 'Abonelik, .ics dosyası indirip yüklemekten farklıdır: kaynak değiştikçe takviminiz de güncellenir (genelde birkaç saatte bir, bazen 24 saate kadar sürebilir). Dosyadan yükleme tek seferlik kalır.',
    helpUrl:
      'https://support.microsoft.com/tr-tr/outlook/import-or-subscribe-to-a-calendar-in-outlook-com-or-outlook-on-the-web',
    helpLabel: 'Microsoft Destek: Takvime abone olma',
  },
}

export function SubscriptionPanel({ categories }: SubscriptionPanelProps) {
  const allSlugs = useMemo(
    () => categories.map((category) => category.slug),
    [categories],
  )
  const [selectedSlugs, setSelectedSlugs] = useState<Set<string>>(
    () => new Set(allSlugs),
  )
  const [deviceGuide, setDeviceGuide] = useState<DeviceGuide>('apple')
  const [copied, setCopied] = useState(false)

  const selectedList = useMemo(
    () => allSlugs.filter((slug) => selectedSlugs.has(slug)),
    [allSlugs, selectedSlugs],
  )

  const feedUrl = useMemo(
    () => resolveSubscribeFeedUrl(selectedList, allSlugs),
    [selectedList, allSlugs],
  )

  const selectedNames = useMemo(
    () =>
      categories
        .filter((category) => selectedSlugs.has(category.slug))
        .map((category) => category.name),
    [categories, selectedSlugs],
  )

  function toggleSlug(slug: string, checked: boolean) {
    setSelectedSlugs((prev) => {
      const next = new Set(prev)
      if (checked) {
        next.add(slug)
      } else {
        next.delete(slug)
      }
      return next
    })
    setCopied(false)
  }

  function selectAll() {
    setSelectedSlugs(new Set(allSlugs))
    setCopied(false)
  }

  function clearAll() {
    setSelectedSlugs(new Set())
    setCopied(false)
  }

  async function copyFeedUrl() {
    if (!feedUrl) return
    await navigator.clipboard.writeText(feedUrl)
    setCopied(true)
  }

  function subscribeWithWebcal() {
    if (!feedUrl) return
    window.location.href = toWebcalUrl(feedUrl)
    void copyFeedUrl()
  }

  return (
    <section className="mt-10 rounded-xl border bg-card p-5 sm:p-6">
      <div className="flex flex-col gap-1">
        <h2 className="text-lg font-semibold">Takvim Aboneliği</h2>
        <p className="text-sm text-muted-foreground">
          Kategorileri seçin, abonelik URL’sini kopyalayın ve takvim uygulamanıza
          ekleyin. Abonelik, dosya indirmekten farklıdır — etkinlikler otomatik
          güncellenir.
        </p>
      </div>

      <div className="mt-4 flex flex-wrap gap-2">
        <Button type="button" variant="outline" size="sm" onClick={selectAll}>
          Hepsi
        </Button>
        <Button type="button" variant="outline" size="sm" onClick={clearAll}>
          Temizle
        </Button>
      </div>

      <div className="mt-4 grid gap-2 sm:grid-cols-2">
        {categories.map((category) => {
          const color = getCategoryColor(category.slug)
          const checked = selectedSlugs.has(category.slug)
          const id = `subscribe-${category.slug}`

          return (
            <Label
              key={category.slug}
              htmlFor={id}
              className="flex cursor-pointer items-start gap-3 rounded-md border border-transparent px-2 py-2 transition-colors hover:bg-accent"
            >
              <Checkbox
                id={id}
                checked={checked}
                onCheckedChange={(value) =>
                  toggleSlug(category.slug, value === true)
                }
                className="mt-0.5"
              />
              <span
                className={cn('mt-1 size-2.5 shrink-0 rounded-full', color.dot)}
                aria-hidden
              />
              <span className="min-w-0 flex-1">
                <span className="block text-sm font-medium">{category.name}</span>
                {category.desc && (
                  <span className="mt-0.5 block text-xs font-normal text-muted-foreground">
                    {category.desc}
                  </span>
                )}
              </span>
            </Label>
          )
        })}
      </div>

      <div className="mt-5 rounded-lg border bg-muted/30 p-4">
        <p className="text-sm font-medium">Abonelik URL’si</p>
        {selectedList.length === 0 ? (
          <p className="mt-2 text-sm text-muted-foreground">
            En az bir kategori seçin.
          </p>
        ) : (
          <>
            <p className="mt-2 break-all font-mono text-xs sm:text-sm">
              {feedUrl}
            </p>
            <p className="mt-2 text-xs text-muted-foreground">
              Seçili: {selectedNames.join(', ')}
            </p>
            <div className="mt-3 flex flex-wrap gap-2">
              <Button type="button" size="sm" onClick={() => void copyFeedUrl()}>
                {copied ? (
                  <>
                    <Check className="size-4" />
                    Kopyalandı
                  </>
                ) : (
                  <>
                    <Copy className="size-4" />
                    URL’yi kopyala
                  </>
                )}
              </Button>
              <Button
                type="button"
                size="sm"
                variant="secondary"
                onClick={subscribeWithWebcal}
              >
                <ExternalLink className="size-4" />
                Abone ol
              </Button>
            </div>
          </>
        )}
      </div>

      <div className="mt-5">
        <p className="text-sm font-medium">Nasıl eklerim?</p>
        <p className="mt-1 text-xs text-muted-foreground">
          Kullandığınız uygulamayı seçin ve adımları izleyin.
        </p>
        <div className="mt-2 flex flex-wrap gap-2">
          {(Object.keys(DEVICE_GUIDES) as DeviceGuide[]).map((key) => (
            <Button
              key={key}
              type="button"
              size="sm"
              variant={deviceGuide === key ? 'default' : 'outline'}
              onClick={() => setDeviceGuide(key)}
            >
              {DEVICE_GUIDES[key].label}
            </Button>
          ))}
        </div>
        <ol className="mt-3 list-decimal space-y-2 pl-5 text-sm text-muted-foreground">
          {DEVICE_GUIDES[deviceGuide].steps.map((step) => (
            <li key={step}>{step}</li>
          ))}
        </ol>
        {DEVICE_GUIDES[deviceGuide].note && (
          <p className="mt-3 text-xs text-muted-foreground">
            {DEVICE_GUIDES[deviceGuide].note}
          </p>
        )}
        <p className="mt-3 text-xs">
          <a
            href={DEVICE_GUIDES[deviceGuide].helpUrl}
            target="_blank"
            rel="noreferrer"
            className="font-medium text-primary underline-offset-4 hover:underline"
          >
            {DEVICE_GUIDES[deviceGuide].helpLabel}
          </a>
        </p>
      </div>
    </section>
  )
}
