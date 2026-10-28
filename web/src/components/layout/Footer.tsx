import { siteConfig } from "@/config/site.config";

import { CalendarMark } from "@/components/ui/svgs/calendarMark";

const VIRASTACK_START_URL = "https://www.virastack.com/start";

export function Footer() {
  return (
    <footer className="mt-24 border-t border-border/80 pt-8 pb-12">
      <div className="mx-auto flex max-w-7xl flex-col items-center gap-3 px-4 text-center text-pretty text-muted-foreground">
        <p className="flex items-center gap-2 text-sm font-semibold tracking-tight text-foreground">
          <CalendarMark className="size-5 shrink-0" aria-hidden />
          Takvim
        </p>

        <p className="flex flex-wrap items-center justify-center gap-x-3 gap-y-1 text-xs sm:text-sm">
          <a
            href={siteConfig.links.github}
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 transition-opacity duration-150 hover:underline"
          >
            GitHub
          </a>
          <span aria-hidden="true">·</span>
          <a
            href="https://omergulcicek.com/"
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 transition-opacity duration-150 hover:underline"
          >
            omergulcicek.com
          </a>
        </p>

        <p className="mt-3 text-xs opacity-70">
          <a
            href={VIRASTACK_START_URL}
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 transition-opacity duration-150 hover:underline"
          >
            <span className="font-medium">ViraStack</span>{" "}
            <span className="font-medium text-teal-500 italic">Start</span>
          </a>{" "}
          ile geliştirildi.
        </p>
      </div>
    </footer>
  );
}
