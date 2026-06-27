import { useState } from 'react'

import { Button } from '@/components/ui/button'
import { Apple } from '@/components/ui/svgs/apple'
import { Google } from '@/components/ui/svgs/google'
import { MicrosoftOutlook } from '@/components/ui/svgs/microsoftOutlook'
import {
  SECTION_DESC_CLASS,
  SECTION_HEADING_CLASS,
  SECTION_NARROW_CLASS,
  SECTION_SCROLL_CLASS,
  SITE_SECTIONS,
} from '@/lib/site-nav'
import { cn } from '@/lib/utils'

type DeviceGuide = 'apple' | 'google' | 'outlook'

const DEVICE_ICONS: Record<DeviceGuide, typeof Apple> = {
  apple: Apple,
  google: Google,
  outlook: MicrosoftOutlook,
}

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
      'Abonelik bölümündeki URL’yi kopyalayın. iPhone veya Mac’te “Abone ol” düğmesi Takvim uygulamasını doğrudan açabilir.',
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

export function HowToSubscribeSection() {
  const [deviceGuide, setDeviceGuide] = useState<DeviceGuide>('apple')

  return (
    <section
      id={SITE_SECTIONS.nasilEkle}
      className={cn(SECTION_SCROLL_CLASS, SECTION_NARROW_CLASS)}
    >
      <h2 className={SECTION_HEADING_CLASS}>Nasıl eklerim?</h2>
      <p className={cn('mt-1', SECTION_DESC_CLASS)}>
        Kullandığınız uygulamayı seçin ve adımları izleyin.
      </p>
      <div className="mt-4 flex gap-2 sm:flex-wrap">
        {(Object.keys(DEVICE_GUIDES) as DeviceGuide[]).map((key) => {
          const Icon = DEVICE_ICONS[key]
          const selected = deviceGuide === key

          return (
            <Button
              key={key}
              type="button"
              size="sm"
              variant="outline"
              className={cn(
                'h-auto min-w-0 flex-1 basis-0 flex-col gap-1 px-1 py-2.5 text-center whitespace-normal sm:h-8 sm:flex-none sm:basis-auto sm:flex-row sm:gap-2 sm:px-3 sm:py-0 sm:text-left',
                selected &&
                  'border-primary bg-background font-medium shadow-sm ring-1 ring-ring',
              )}
              onClick={() => setDeviceGuide(key)}
            >
              <Icon aria-hidden className="size-5 shrink-0 sm:size-4" />
              <span className="text-[10px] leading-tight sm:text-xs">
                {DEVICE_GUIDES[key].label}
              </span>
            </Button>
          )
        })}
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
    </section>
  )
}
