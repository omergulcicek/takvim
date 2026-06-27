const GITHUB_URL = 'https://github.com/omergulcicek/takvim'
const SITE_URL = 'https://omergulcicek.com/'

export default function Footer() {
  return (
    <footer className="mt-24 border-t pb-12 pt-8">
      <div className="mx-auto max-w-7xl px-4 text-center text-sm text-muted-foreground">
        <p>
          Bu site{' '}
          <a
            href={SITE_URL}
            target="_blank"
            rel="noreferrer"
            className="font-medium text-foreground underline-offset-4 hover:underline"
          >
            Ömer Gülçiçek
          </a>
          {' '}
          tarafından geliştirildi.
        </p>
        <p className="mt-2 flex flex-wrap items-center justify-center gap-x-3 gap-y-1">
          <a
            href={GITHUB_URL}
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 hover:underline"
          >
            GitHub
          </a>
          <span aria-hidden="true">·</span>
          <a
            href={SITE_URL}
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 hover:underline"
          >
            omergulcicek.com
          </a>
        </p>
      </div>
    </footer>
  )
}
