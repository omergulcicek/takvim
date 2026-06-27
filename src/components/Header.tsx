import ThemeToggle from './ThemeToggle'

export default function Header() {
  return (
    <header className="sticky top-0 z-50 border-b bg-background">
      <nav className="flex w-full items-center justify-end px-4 py-3">
        <ThemeToggle />
      </nav>
    </header>
  )
}
