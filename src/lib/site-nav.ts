export const SECTION_SCROLL_CLASS = 'scroll-mt-24'
export const SECTION_SCROLL_OFFSET = 96
export const SECTION_HEADING_CLASS = 'text-lg font-semibold'
export const SECTION_DESC_CLASS = 'text-sm text-muted-foreground'
export const SECTION_NARROW_CLASS = 'mx-auto w-full max-w-4xl'

export const SITE_DESCRIPTION =
  'Aşağıdaki takvim, abone olacağınız günlerin önizlemesidir.'

export const SITE_SUBDESCRIPTION =
  'Beğendiğiniz kategorilere abone olduğunuzda seçtiğiniz günler kendi takvim uygulamanızda görünür. Etkinliklere tıklayarak ayrıntıları okuyabilirsiniz.'

export const SITE_SECTIONS = {
  takvim: 'takvim',
  abonelik: 'abonelik',
  nasilEkle: 'nasil-eklerim',
  kategoriler: 'kategoriler',
  sss: 'sss',
} as const

export type SiteSectionId = (typeof SITE_SECTIONS)[keyof typeof SITE_SECTIONS]

export type NavTarget = 'top' | SiteSectionId

export const HEADER_NAV = [
  { label: 'Takvim', target: 'top' as const },
  { label: 'Abonelik', target: SITE_SECTIONS.abonelik },
  { label: 'Nasıl eklerim?', target: SITE_SECTIONS.nasilEkle },
  { label: 'SSS', target: SITE_SECTIONS.sss },
] as const

export function navTargetHref(target: NavTarget): string {
  return target === 'top' ? '#' : `#${target}`
}

function isSiteSectionId(value: string): value is SiteSectionId {
  return (Object.values(SITE_SECTIONS) as string[]).includes(value)
}

export function hashToNavTarget(hash: string): NavTarget {
  const id = hash.replace(/^#/, '')
  if (!id) return 'top'
  return isSiteSectionId(id) ? id : 'top'
}

function pathWithoutHash() {
  return `${window.location.pathname}${window.location.search}`
}

export function scrollToNavTarget(
  target: NavTarget,
  options?: { updateHistory?: boolean },
) {
  const updateHistory = options?.updateHistory ?? true

  if (target === 'top') {
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
    if (updateHistory) {
      history.pushState(null, '', pathWithoutHash())
    }
    return
  }

  const element = document.getElementById(target)
  if (!element) return

  const offset = SECTION_SCROLL_OFFSET
  const top =
    element.getBoundingClientRect().top + window.scrollY - offset

  window.scrollTo({ top, behavior: 'smooth' })

  if (updateHistory) {
    history.pushState(null, '', `#${target}`)
  }
}
