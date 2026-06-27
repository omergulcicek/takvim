const DEFAULT_SITE_URL = 'https://takvim-abonelik.vercel.app'

export function getSiteUrl(): string {
  const configured = import.meta.env.VITE_SITE_URL
  if (typeof configured === 'string' && configured.length > 0) {
    return configured.replace(/\/$/, '')
  }

  if (typeof window !== 'undefined') {
    return window.location.origin
  }

  return DEFAULT_SITE_URL
}

export function getSiteHostname(): string {
  return new URL(getSiteUrl()).hostname
}

export function toAbsoluteUrl(path: string): string {
  return `${getSiteUrl()}${path.startsWith('/') ? path : `/${path}`}`
}

export function toWebcalUrl(httpsUrl: string): string {
  return httpsUrl.replace(/^https:\/\//i, 'webcal://')
}
