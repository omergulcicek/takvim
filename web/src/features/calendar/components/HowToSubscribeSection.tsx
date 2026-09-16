import { useState } from "react";

import { AnimatePresence, motion, useReducedMotion } from "framer-motion";

import { cn } from "@/lib/utils";

import { Button } from "@/components/ui/button";
import { Apple } from "@/components/ui/svgs/apple";
import { Google } from "@/components/ui/svgs/google";
import { MicrosoftOutlook } from "@/components/ui/svgs/microsoftOutlook";
import {
  SECTION_DESC_CLASS,
  SECTION_HEADING_CLASS,
  SECTION_NARROW_CLASS,
  SECTION_SCROLL_CLASS,
  SITE_SECTIONS,
} from "@/features/calendar/data/site-nav";
import { easeOut } from "@/features/calendar/helpers/motion";

type DeviceGuide = "apple" | "google" | "outlook";

const DEVICE_ICONS: Record<DeviceGuide, typeof Apple> = {
  apple: Apple,
  google: Google,
  outlook: MicrosoftOutlook,
};

type DeviceGuideContent = {
  label: string;
  steps: string[];
  note?: string;
  helpUrl: string;
  helpLabel: string;
};

const DEVICE_GUIDES: Record<DeviceGuide, DeviceGuideContent> = {
  apple: {
    label: "iPhone / Mac",
    steps: [
      "Abonelik bölümündeki URL’yi kopyalayın. iPhone veya Mac’te “Abone ol” düğmesi Takvim uygulamasını doğrudan açabilir.",
      "iPhone / iPad: Takvim uygulamasını açın → Takvimler → Takvim Ekle → Takvim Aboneliği Ekle → URL’yi yapıştırın → Abone Ol.",
      "Mac: Takvim → Dosya → Yeni Takvim Aboneliği → URL’yi yapıştırın → Abone Ol.",
      "Takvime bir ad ve renk verin. Hesap olarak iCloud seçerseniz aynı Apple Hesabıyla giriş yaptığınız diğer cihazlarda da görünür.",
    ],
    note: "Bu bir aboneliktir; etkinlikler kaynak güncellendikçe otomatik yenilenir.",
    helpUrl: "https://support.apple.com/tr-tr/102301",
    helpLabel: "Apple Destek: Takvim aboneliği ekleme",
  },
  google: {
    label: "Google / Android",
    steps: [
      "Abonelik URL’sini kopyalayın (https:// ile başlayan tam adres).",
      "Bilgisayarda calendar.google.com adresini tarayıcıda açın. URL ile takvim ekleme mobil uygulamada yapılamaz; ekleme sonrası telefona senkronize olur.",
      "Sol tarafta Diğer takvimler bölümünün yanındaki + simgesine tıklayın → URL’den abone ol.",
      "URL’yi yapıştırıp Takvim ekle’ye tıklayın. Takvim, sol menüde Diğer takvimler altında görünür.",
      "Telefonda görmek için Google Takvim uygulamasını açın → menü → ilgili takvimin yanındaki kutuyu işaretleyin.",
    ],
    note: "Güncellemeler birkaç saatte bir gelir; hemen görünmeyebilir.",
    helpUrl: "https://support.google.com/calendar/answer/37100?hl=tr",
    helpLabel: "Google Destek: URL ile takvim ekleme",
  },
  outlook: {
    label: "Outlook",
    steps: [
      "Abonelik URL’sini kopyalayın.",
      "outlook.com veya web üzerinde Outlook’ta oturum açın ve Takvim bölümüne geçin.",
      "Takvim ekle → Web’den abone ol.",
      "URL’yi yapıştırıp İçeri aktar’a tıklayın.",
    ],
    note: "Abonelik, .ics dosyası indirip yüklemekten farklıdır: kaynak değiştikçe takviminiz de güncellenir (genelde birkaç saatte bir, bazen 24 saate kadar sürebilir). Dosyadan yükleme tek seferlik kalır.",
    helpUrl:
      "https://support.microsoft.com/tr-tr/outlook/import-or-subscribe-to-a-calendar-in-outlook-com-or-outlook-on-the-web",
    helpLabel: "Microsoft Destek: Takvime abone olma",
  },
};

export function HowToSubscribeSection() {
  const [deviceGuide, setDeviceGuide] = useState<DeviceGuide>("apple");
  const prefersReducedMotion = useReducedMotion();
  const guide = DEVICE_GUIDES[deviceGuide];

  return (
    <section
      id={SITE_SECTIONS.nasilEkle}
      className={cn(SECTION_SCROLL_CLASS, SECTION_NARROW_CLASS)}
    >
      <h2 className={cn(SECTION_HEADING_CLASS, "text-balance")}>Nasıl eklerim?</h2>
      <p className={cn("mt-1.5", SECTION_DESC_CLASS, "text-pretty")}>
        Kullandığınız uygulamayı seçin ve adımları izleyin.
      </p>

      <div
        role="tablist"
        aria-label="Takvim uygulaması"
        className="mt-5 flex gap-1 rounded-xl bg-muted/50 p-1 shadow-surface"
      >
        {(Object.keys(DEVICE_GUIDES) as DeviceGuide[]).map((key) => {
          const Icon = DEVICE_ICONS[key];
          const selected = deviceGuide === key;

          return (
            <Button
              key={key}
              type="button"
              role="tab"
              aria-selected={selected}
              size="sm"
              variant="ghost"
              static
              className={cn(
                "h-auto min-w-0 flex-1 basis-0 flex-col gap-1 px-2 py-2.5 text-center whitespace-normal sm:h-9 sm:flex-row sm:gap-2 sm:px-3 sm:py-0 sm:text-left",
                "transition-[background-color,color,box-shadow] duration-150 ease-out-strong",
                selected
                  ? "bg-background font-medium text-foreground shadow-surface"
                  : "text-muted-foreground hover:text-foreground",
              )}
              onClick={() => setDeviceGuide(key)}
            >
              <Icon aria-hidden className="size-5 shrink-0 sm:size-4" />
              <span className="text-[10px] leading-tight sm:text-xs">
                {DEVICE_GUIDES[key].label}
              </span>
            </Button>
          );
        })}
      </div>

      <AnimatePresence initial={false} mode="wait">
        <motion.div
          key={deviceGuide}
          initial={prefersReducedMotion ? false : { opacity: 0, y: 8, filter: "blur(4px)" }}
          animate={{ opacity: 1, y: 0, filter: "blur(0px)" }}
          exit={
            prefersReducedMotion
              ? { opacity: 0 }
              : {
                  opacity: 0,
                  y: -8,
                  filter: "blur(4px)",
                  transition: { duration: 0.15, ease: easeOut },
                }
          }
          transition={{ duration: 0.25, ease: easeOut }}
          className="mt-4"
        >
          <ol className="relative space-y-0">
            {guide.steps.map((step, index) => {
              const stepNumber = index + 1;
              const isLast = index === guide.steps.length - 1;

              return (
                <li key={step} className="relative flex gap-3 pb-5 last:pb-0">
                  {!isLast ? (
                    <span
                      aria-hidden
                      className="absolute top-7 bottom-0 left-[15px] w-px bg-border"
                    />
                  ) : null}
                  <span
                    className={cn(
                      "relative z-10 flex size-8 shrink-0 items-center justify-center",
                      "rounded-full bg-muted text-xs font-semibold text-foreground tabular-nums",
                      "ring-2 ring-background",
                    )}
                    aria-hidden
                  >
                    {stepNumber}
                  </span>
                  <p className="min-w-0 flex-1 pt-1.5 text-sm text-pretty text-muted-foreground">
                    <span className="sr-only">Adım {stepNumber}: </span>
                    {step}
                  </p>
                </li>
              );
            })}
          </ol>
          {guide.note && (
            <p className="mt-3 text-xs text-pretty text-muted-foreground">{guide.note}</p>
          )}
          <p className="mt-3 text-xs">
            <a
              href={guide.helpUrl}
              target="_blank"
              rel="noreferrer"
              className="font-medium text-primary underline-offset-4 transition-opacity duration-150 hover:underline"
            >
              {guide.helpLabel}
            </a>
          </p>
        </motion.div>
      </AnimatePresence>
    </section>
  );
}
