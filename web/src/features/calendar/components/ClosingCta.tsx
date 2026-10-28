import type { MouseEvent } from "react";

import { cn } from "@/lib/utils";

import { Button } from "@/components/ui/button";
import {
  navTargetHref,
  scrollToNavTarget,
  SECTION_HEADING_CLASS,
  SECTION_NARROW_CLASS,
  SITE_SECTIONS,
} from "@/features/calendar/data/site-nav";

/**
 * SSS'yi okuyup ikna olan ziyaretçi sayfanın sonunda kalıyordu; abonelik
 * bölümüne dönmek için yukarı kaydırmak zorundaydı.
 */
export function ClosingCta() {
  function handleClick(event: MouseEvent<HTMLAnchorElement>) {
    event.preventDefault();
    scrollToNavTarget(SITE_SECTIONS.abonelik);
  }

  return (
    <section className={SECTION_NARROW_CLASS}>
      <div className="flex flex-col items-center gap-4 rounded-xl bg-card px-6 py-10 text-center shadow-surface">
        <h2 className={cn(SECTION_HEADING_CLASS, "text-balance")}>
          Takviminize eklemeye hazır mısınız?
        </h2>

        <p className="max-w-xl text-sm text-pretty text-muted-foreground sm:text-base">
          Kategorileri seçin, kullandığınız uygulamaya tek tıkla ekleyin. Ücretsiz, kayıt gerekmez.
        </p>

        <Button asChild size="lg">
          <a href={navTargetHref(SITE_SECTIONS.abonelik)} onClick={handleClick}>
            Kategorileri seç ve abone ol
          </a>
        </Button>
      </div>
    </section>
  );
}
