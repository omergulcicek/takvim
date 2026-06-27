'use client'

import { useEffect } from 'react'

import { hashToNavTarget, scrollToNavTarget } from '@/lib/site-nav'

export function HashScrollSync() {
  useEffect(() => {
    if (window.location.hash) {
      scrollToNavTarget(hashToNavTarget(window.location.hash), {
        updateHistory: false,
      })
    }

    function handlePopState() {
      scrollToNavTarget(hashToNavTarget(window.location.hash), {
        updateHistory: false,
      })
    }

    window.addEventListener('popstate', handlePopState)
    return () => window.removeEventListener('popstate', handlePopState)
  }, [])

  return null
}
