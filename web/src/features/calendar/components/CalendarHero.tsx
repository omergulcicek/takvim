import type { MouseEvent } from "react";

import { Check } from "lucide-react";

import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  navTargetHref,
  scrollToNavTarget,
  SITE_DESCRIPTION,
  SITE_HIGHLIGHTS,
  SITE_SECTIONS,
  SITE_TAGLINE,
} from "@/features/calendar/data/site-nav";
import type { NavTarget } from "@/features/calendar/data/site-nav";

function HeroAction({
  target,
  variant,
  children,
}: {
  target: NavTarget;
  variant?: "default" | "ghost";
  children: string;
}) {
  function handleClick(event: MouseEvent<HTMLAnchorElement>) {
    event.preventDefault();
    scrollToNavTarget(target);
  }

  return (
    <Button asChild size="sm" variant={variant}>
      <a href={navTargetHref(target)} onClick={handleClick}>
        {children}
      </a>
    </Button>
  );
}

export function CalendarHero() {
  return (
    <div className="mx-auto my-10 flex max-w-3xl flex-col items-center gap-5 text-center md:my-24">
      <h1 className="text-3xl font-semibold tracking-tight text-balance sm:text-4xl">
        {SITE_TAGLINE}
      </h1>

      <p className="max-w-2xl text-sm text-pretty text-muted-foreground sm:text-base">
        {SITE_DESCRIPTION}
      </p>

      <ul className="flex flex-wrap items-center justify-center gap-2">
        {SITE_HIGHLIGHTS.map((highlight) => (
          <li key={highlight}>
            <Badge>
              <Check className="text-brand" strokeWidth={2.5} aria-hidden />
              {highlight}
            </Badge>
          </li>
        ))}
      </ul>

      <div className="mt-1 flex flex-wrap items-center justify-center gap-1.5">
        <HeroAction target={SITE_SECTIONS.abonelik}>Kategorileri seç ve abone ol</HeroAction>
        <HeroAction target={SITE_SECTIONS.nasilEkle} variant="ghost">
          Nasıl eklerim?
        </HeroAction>
      </div>
    </div>
  );
}
