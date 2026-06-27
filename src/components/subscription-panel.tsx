import { useMemo, useState } from 'react'
import { Check, Copy, ExternalLink } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { getCategoryColor } from '@/lib/categories'
import { resolveSubscribeFeedUrl } from '@/lib/feeds/urls'
import type { CategoryRow } from '@/lib/queries/categories'
import { toWebcalUrl } from '@/lib/site-url'
import {
  SECTION_DESC_CLASS,
  SECTION_HEADING_CLASS,
  SECTION_NARROW_CLASS,
  SECTION_SCROLL_CLASS,
  SITE_SECTIONS,
} from '@/lib/site-nav'
import { cn } from '@/lib/utils'

type SubscriptionPanelProps = {
  categories: CategoryRow[]
}

export function SubscriptionPanel({ categories }: SubscriptionPanelProps) {
  const allSlugs = useMemo(
    () => categories.map((category) => category.slug),
    [categories],
  )
  const [selectedSlugs, setSelectedSlugs] = useState<Set<string>>(
    () => new Set(allSlugs),
  )
  const [copied, setCopied] = useState(false)

  const selectedList = useMemo(
    () => allSlugs.filter((slug) => selectedSlugs.has(slug)),
    [allSlugs, selectedSlugs],
  )

  const feedUrl = useMemo(
    () => resolveSubscribeFeedUrl(selectedList, allSlugs),
    [selectedList, allSlugs],
  )

  const selectedNames = useMemo(
    () =>
      categories
        .filter((category) => selectedSlugs.has(category.slug))
        .map((category) => category.name),
    [categories, selectedSlugs],
  )

  function toggleSlug(slug: string, checked: boolean) {
    setSelectedSlugs((prev) => {
      const next = new Set(prev)
      if (checked) {
        next.add(slug)
      } else {
        next.delete(slug)
      }
      return next
    })
    setCopied(false)
  }

  function selectAll() {
    setSelectedSlugs(new Set(allSlugs))
    setCopied(false)
  }

  function clearAll() {
    setSelectedSlugs(new Set())
    setCopied(false)
  }

  async function copyFeedUrl() {
    if (!feedUrl) return
    await navigator.clipboard.writeText(feedUrl)
    setCopied(true)
  }

  function subscribeWithWebcal() {
    if (!feedUrl) return
    window.location.href = toWebcalUrl(feedUrl)
    void copyFeedUrl()
  }

  return (
    <section
      id={SITE_SECTIONS.abonelik}
      className={cn(SECTION_SCROLL_CLASS, SECTION_NARROW_CLASS)}
    >
      <div className="flex flex-col gap-1">
        <h2 className={SECTION_HEADING_CLASS}>Takvim Aboneliği</h2>
        <p className={SECTION_DESC_CLASS}>
          Kategorileri seçin, abonelik URL’sini kopyalayın ve takvim uygulamanıza
          ekleyin. Abonelik, dosya indirmekten farklıdır — etkinlikler otomatik
          güncellenir.
        </p>
      </div>

      <div className="mt-4 flex flex-wrap gap-2">
        <Button type="button" variant="outline" size="sm" onClick={selectAll}>
          Hepsi
        </Button>
        <Button type="button" variant="outline" size="sm" onClick={clearAll}>
          Temizle
        </Button>
      </div>

      <div
        id={SITE_SECTIONS.kategoriler}
        className={cn('mt-4 grid gap-2 sm:grid-cols-2', SECTION_SCROLL_CLASS)}
      >
        {categories.map((category) => {
          const color = getCategoryColor(category.slug)
          const checked = selectedSlugs.has(category.slug)
          const id = `subscribe-${category.slug}`

          return (
            <Label
              key={category.slug}
              htmlFor={id}
              className="flex cursor-pointer items-start gap-3 rounded-md border border-transparent px-2 py-2 transition-colors hover:bg-accent"
            >
              <Checkbox
                id={id}
                checked={checked}
                onCheckedChange={(value) =>
                  toggleSlug(category.slug, value === true)
                }
                className="mt-0.5"
              />
              <span
                className={cn('mt-1 size-2.5 shrink-0 rounded-full', color.dot)}
                aria-hidden
              />
              <span className="min-w-0 flex-1">
                <span className="block text-sm font-medium">{category.name}</span>
                {category.desc && (
                  <span className="mt-0.5 block text-xs font-normal text-muted-foreground">
                    {category.desc}
                  </span>
                )}
              </span>
            </Label>
          )
        })}
      </div>

      <div className="mt-5 rounded-lg bg-muted/30 p-4">
        <p className="text-sm font-medium">Abonelik URL’si</p>
        {selectedList.length === 0 ? (
          <p className="mt-2 text-sm text-muted-foreground">
            En az bir kategori seçin.
          </p>
        ) : (
          <>
            <p className="mt-2 break-all font-mono text-xs sm:text-sm">
              {feedUrl}
            </p>
            <p className="mt-2 text-xs text-muted-foreground">
              Seçili: {selectedNames.join(', ')}
            </p>
            <div className="mt-3 flex flex-wrap gap-2">
              <Button type="button" size="sm" onClick={() => void copyFeedUrl()}>
                {copied ? (
                  <>
                    <Check className="size-4" />
                    Kopyalandı
                  </>
                ) : (
                  <>
                    <Copy className="size-4" />
                    URL’yi kopyala
                  </>
                )}
              </Button>
              <Button
                type="button"
                size="sm"
                variant="secondary"
                onClick={subscribeWithWebcal}
              >
                <ExternalLink className="size-4" />
                Abone ol
              </Button>
            </div>
          </>
        )}
      </div>
    </section>
  )
}
