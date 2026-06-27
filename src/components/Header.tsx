import type { MouseEvent, ReactNode } from 'react'

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
}: {
  target: NavTarget
  children: ReactNode
  className?: string
}) {
  function handleClick(event: MouseEvent<HTMLAnchorElement>) {
    event.preventDefault()
    scrollToNavTarget(target)
  }

  return (
    <a href={navTargetHref(target)} onClick={handleClick} className={className}>
      {children}
    </a>
  )
}

export default function Header() {
  return (
    <header className="sticky top-0 z-50 border-b bg-background">
      <nav className="relative mx-auto flex w-full max-w-7xl items-center justify-end px-4 py-3">
        <div
          className="absolute left-1/2 flex flex-wrap -translate-x-1/2 items-center justify-center gap-3 sm:gap-4"
        >
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
        <ThemeToggle />
      </nav>
    </header>
  )
}
