import { useState } from "react";
import type { MouseEvent, ReactNode } from "react";

import { Menu } from "lucide-react";

import { siteConfig } from "@/config/site.config";

import { ThemeToggle } from "@/components/layout/ThemeToggle";
import { Button } from "@/components/ui/button";
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetTrigger } from "@/components/ui/sheet";
import { CalendarMark } from "@/components/ui/svgs/calendarMark";
import { GithubDark } from "@/components/ui/svgs/githubDark";
import { GithubLight } from "@/components/ui/svgs/githubLight";
import { HEADER_NAV, navTargetHref, scrollToNavTarget } from "@/features/calendar/data/site-nav";
import type { NavTarget } from "@/features/calendar/data/site-nav";

function NavLink({
  target,
  children,
  className,
  onNavigate,
}: {
  target: NavTarget;
  children: ReactNode;
  className?: string;
  onNavigate?: () => void;
}) {
  function handleClick(event: MouseEvent<HTMLAnchorElement>) {
    event.preventDefault();
    scrollToNavTarget(target);
    onNavigate?.();
  }

  return (
    <a href={navTargetHref(target)} onClick={handleClick} className={className}>
      {children}
    </a>
  );
}

function GitHubLink({ className }: { className?: string }) {
  return (
    <Button variant="ghost" size="icon" static asChild className={className ?? "size-9"}>
      <a
        href={siteConfig.links.github}
        target="_blank"
        rel="noreferrer"
        aria-label="GitHub"
        title="GitHub"
      >
        <GithubLight className="size-4 dark:hidden" aria-hidden />
        <GithubDark className="hidden size-4 dark:block" aria-hidden />
      </a>
    </Button>
  );
}

export function Header() {
  const [mobileOpen, setMobileOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 border-b border-border/70 bg-background/85 backdrop-blur-md supports-[backdrop-filter]:bg-background/75">
      <nav className="mx-auto flex h-14 w-full max-w-7xl items-center gap-3 px-4">
        <div className="flex items-center gap-1 md:gap-3">
          <Sheet open={mobileOpen} onOpenChange={setMobileOpen}>
            <SheetTrigger asChild>
              <Button
                variant="ghost"
                size="icon"
                static
                className="size-9 md:hidden"
                aria-label="Menüyü aç"
              >
                <Menu className="size-5" strokeWidth={1.75} />
              </Button>
            </SheetTrigger>
            <SheetContent side="left" className="w-[min(100%,20rem)]">
              <SheetHeader className="text-left">
                <SheetTitle>Menü</SheetTitle>
              </SheetHeader>
              <nav className="mt-6 flex flex-col gap-1">
                {HEADER_NAV.map((item) => (
                  <NavLink
                    key={item.label}
                    target={item.target}
                    onNavigate={() => setMobileOpen(false)}
                    className="rounded-lg px-3 py-2.5 text-base text-foreground transition-colors duration-150 ease-out-strong hover:bg-accent"
                  >
                    {item.label}
                  </NavLink>
                ))}
              </nav>
            </SheetContent>
          </Sheet>

          <NavLink
            target="top"
            className="flex items-center gap-2 text-sm font-semibold tracking-tight text-foreground transition-opacity duration-150 hover:opacity-80"
          >
            <CalendarMark className="size-6 shrink-0" aria-hidden />
            Takvim
          </NavLink>
        </div>

        <div className="hidden flex-1 items-center gap-0.5 md:flex">
          {HEADER_NAV.filter((item) => item.target !== "top").map((item) => (
            <NavLink
              key={item.label}
              target={item.target}
              className="rounded-md px-2.5 py-1.5 text-sm text-muted-foreground transition-colors duration-150 ease-out-strong hover:bg-accent/60 hover:text-foreground"
            >
              {item.label}
            </NavLink>
          ))}
        </div>

        <div className="ml-auto flex items-center gap-1.5">
          <GitHubLink />
          <ThemeToggle />
        </div>
      </nav>
    </header>
  );
}
