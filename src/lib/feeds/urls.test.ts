import { describe, expect, it } from 'vitest'

import {
  buildAllFeedPath,
  buildSubscribeFeedPath,
  resolveSubscribeFeedUrl,
} from '@/lib/feeds/urls'

describe('feed urls', () => {
  it('builds subscribe path with sorted slugs', () => {
    expect(buildSubscribeFeedPath(['islam-tarihi', 'dini-gunler'])).toBe(
      '/feeds/subscribe.ics?k=dini-gunler%2Cislam-tarihi',
    )
  })

  it('uses all feed when every category is selected', () => {
    const all = ['a', 'b', 'c']
    expect(resolveSubscribeFeedUrl(['b', 'a', 'c'], all)).toContain(
      buildAllFeedPath(),
    )
  })
})
