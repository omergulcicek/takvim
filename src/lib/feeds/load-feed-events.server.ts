import type { CalendarEvent } from '@/components/month-calendar'
import { expandEvent } from '@/lib/expand-events'
import type { CategoryRow } from '@/lib/queries/categories'
import { fetchPublishedEventRows } from '@/lib/queries/fetch-published-events.server'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export async function fetchCategoryRows(): Promise<CategoryRow[]> {
  const supabase = getSupabaseServerClient()
  const { data, error } = await supabase
    .from('categories')
    .select('id, slug, name, desc')
    .order('name', { ascending: true })

  if (error) {
    throw new Error(error.message)
  }

  return (data ?? []) as CategoryRow[]
}

export async function resolveFeedSlugs(
  slugs: string[],
): Promise<{ slugs: string[]; invalid: string[] }> {
  const categories = await fetchCategoryRows()
  const known = new Set(categories.map((category) => category.slug))
  const invalid = slugs.filter((slug) => !known.has(slug))
  const valid = slugs.filter((slug) => known.has(slug))

  return { slugs: valid, invalid }
}

export async function loadFeedEvents(
  categorySlugs: string[] | 'all',
): Promise<{ events: CalendarEvent[]; calName: string }> {
  const categories = await fetchCategoryRows()
  const slugSet =
    categorySlugs === 'all'
      ? null
      : new Set(
          categorySlugs.length > 0
            ? categorySlugs
            : categories.map((category) => category.slug),
        )

  const rows = await fetchPublishedEventRows()
  const filteredRows =
    slugSet == null
      ? rows
      : rows.filter((row) => {
          const category = Array.isArray(row.category)
            ? row.category[0]
            : row.category
          return category?.slug != null && slugSet.has(category.slug)
        })

  const events = filteredRows
    .flatMap(expandEvent)
    .sort((a, b) => a.start.getTime() - b.start.getTime())

  const calName = (() => {
    if (categorySlugs === 'all' || slugSet == null) {
      return 'Takvim'
    }
    if (categorySlugs.length === 1) {
      return (
        categories.find((category) => category.slug === categorySlugs[0])
          ?.name ?? 'Takvim'
      )
    }
    return 'Takvim'
  })()

  return { events, calName }
}
