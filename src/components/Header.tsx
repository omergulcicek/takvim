import { useState } from 'react'
import type { MouseEvent, ReactNode } from 'react'
import { Menu } from 'lucide-react'

import { Button } from '@/components/ui/button'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from '@/components/ui/sheet'
import {
  HEADER_NAV,
  navTargetHref,
  scrollToNavTarget,
  type NavTarget,
} from '@/lib/site-nav'
import ThemeToggle from './ThemeToggle'

function NavLink({
  target,
  children,
  className,
  onNavigate,
}: {
  target: NavTarget
  children: ReactNode
  className?: string
  onNavigate?: () => void
}) {
  function handleClick(event: MouseEvent<HTMLAnchorElement>) {
    event.preventDefault()
    scrollToNavTarget(target)
    onNavigate?.()
  }

  return (
    <a href={navTargetHref(target)} onClick={handleClick} className={className}>
      {children}
    </a>
  )
}

export default function Header() {
  const [mobileOpen, setMobileOpen] = useState(false)

  return (
    <header className="sticky top-0 z-50 border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/80">
      <nav className="relative mx-auto flex w-full max-w-7xl items-center justify-between gap-2 px-4 py-3">
        <div className="flex w-9 shrink-0 items-center">
          <Sheet open={mobileOpen} onOpenChange={setMobileOpen}>
            <SheetTrigger asChild>
              <Button
                variant="ghost"
                size="icon"
                className="size-9 md:hidden"
                aria-label="Menüyü aç"
              >
                <Menu className="size-5" />
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
                    className="rounded-md px-3 py-2.5 text-base text-foreground hover:bg-accent"
                  >
                    {item.label}
                  </NavLink>
                ))}
              </nav>
            </SheetContent>
          </Sheet>
        </div>

        <div className="absolute left-1/2 hidden -translate-x-1/2 items-center gap-4 md:flex">
          {HEADER_NAV.map((item) => (
            <NavLink
              key={item.label}
              target={item.target}
              className="text-sm text-muted-foreground hover:text-foreground"
            >
              {item.label}
            </NavLink>
          ))}
        </div>

        <p className="min-w-0 flex-1 truncate px-1 text-center text-sm font-medium md:hidden">
          Takvim Aboneliği
        </p>

        <ThemeToggle />
      </nav>
    </header>
  )
}
