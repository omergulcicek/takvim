import { createFileRoute } from '@tanstack/react-router'

import { buildCategoryFeedResponse } from '@/lib/feeds/build-feed-response.server'
import { normalizeCategorySlugs } from '@/lib/feeds/category-slugs'
import {
  fetchCategoryRows,
  resolveFeedSlugs,
} from '@/lib/feeds/load-feed-events.server'

export const Route = createFileRoute('/feeds/$')({
  server: {
    handlers: {
      GET: async ({ params, request }) => {
        const feedName = params._splat?.trim() ?? ''

        if (feedName === 'all.ics') {
          return buildCategoryFeedResponse('all')
        }

        if (feedName === 'subscribe.ics') {
          const url = new URL(request.url)
          const requested = normalizeCategorySlugs(url.searchParams.get('k'))

          if (requested.length === 0) {
            return new Response('En az bir kategori seçin (?k=slug1,slug2).', {
              status: 400,
            })
          }

          const { slugs, invalid } = await resolveFeedSlugs(requested)
          if (invalid.length > 0 || slugs.length === 0) {
            return new Response('Geçersiz kategori slug değeri.', {
              status: 400,
            })
          }

          const categories = await fetchCategoryRows()
          const knownSlugs = categories.map((category) => category.slug)
          const isAllSelected =
            slugs.length === knownSlugs.length &&
            knownSlugs.every((slug) => slugs.includes(slug))

          if (isAllSelected) {
            return buildCategoryFeedResponse('all')
          }

          return buildCategoryFeedResponse(slugs)
        }

        if (feedName.endsWith('.ics')) {
          const slug = feedName.slice(0, -'.ics'.length)
          const { slugs, invalid } = await resolveFeedSlugs([slug])
          if (invalid.length > 0 || slugs.length === 0) {
            return new Response('Kategori bulunamadı.', { status: 404 })
          }

          return buildCategoryFeedResponse(slugs)
        }

        return new Response('Feed bulunamadı.', { status: 404 })
      },
    },
  },
})
