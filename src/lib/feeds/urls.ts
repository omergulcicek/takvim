import { toAbsoluteUrl } from '@/lib/site-url'

export function buildAllFeedPath(): string {
  return '/feeds/all.ics'
}

export function buildCategoryFeedPath(slug: string): string {
  return `/feeds/${encodeURIComponent(slug)}.ics`
}

export function buildSubscribeFeedPath(slugs: string[]): string {
  const sorted = [...slugs].sort((a, b) => a.localeCompare(b, 'tr'))
  const params = new URLSearchParams({ k: sorted.join(',') })
  return `/feeds/subscribe.ics?${params.toString()}`
}

export function buildAllFeedUrl(): string {
  return toAbsoluteUrl(buildAllFeedPath())
}

export function buildCategoryFeedUrl(slug: string): string {
  return toAbsoluteUrl(buildCategoryFeedPath(slug))
}

export function buildSubscribeFeedUrl(slugs: string[]): string {
  if (slugs.length === 0) return ''
  return toAbsoluteUrl(buildSubscribeFeedPath(slugs))
}

export function resolveSubscribeFeedUrl(
  selectedSlugs: string[],
  allSlugs: string[],
): string {
  if (selectedSlugs.length === 0) return ''
  if (selectedSlugs.length === allSlugs.length) {
    return buildAllFeedUrl()
  }
  return buildSubscribeFeedUrl(selectedSlugs)
}
