import { createCalendarFeedResponse } from '@/lib/feeds/ics'
import { loadFeedEvents } from '@/lib/feeds/load-feed-events.server'

export async function buildCategoryFeedResponse(
  categorySlugs: string[] | 'all',
): Promise<Response> {
  const { events, calName } = await loadFeedEvents(categorySlugs)
  return createCalendarFeedResponse(events, calName)
}
