// Kategori renkleri proje localinde sabitlenir. DB'ye yeni bir kategori
// eklendiğinde, slug'ını buraya bir renk anahtarıyla eşleyin. Eşleşme yoksa
// `default` (nötr) renk kullanılır.

export type CategoryColorKey =
  | 'amber400'
  | 'emerald600'
  | 'orange400'
  | 'violet500'
  | 'rose600'
  | 'blue600'
  | 'green600'

export type CategoryColorStyle = {
  // Aylık görünümdeki event "chip"i (yumuşak renkli arka plan)
  chip: string
  // Renkli nokta / işaret
  dot: string
}

// Tailwind sınıfları statik string olarak yazılır ki purge sırasında atılmasın.
export const COLOR_STYLES: Record<
  CategoryColorKey | 'default',
  CategoryColorStyle
> = {
  amber400: {
    chip: 'bg-amber-100 text-amber-900 dark:bg-amber-400/15 dark:text-amber-300',
    dot: 'bg-amber-400',
  },
  emerald600: {
    chip: 'bg-emerald-100 text-emerald-900 dark:bg-emerald-600/15 dark:text-emerald-300',
    dot: 'bg-emerald-600',
  },
  orange400: {
    chip: 'bg-orange-100 text-orange-800 dark:bg-orange-400/15 dark:text-orange-300',
    dot: 'bg-orange-400',
  },
  violet500: {
    chip: 'bg-violet-100 text-violet-800 dark:bg-violet-500/15 dark:text-violet-300',
    dot: 'bg-violet-500',
  },
  rose600: {
    chip: 'bg-rose-100 text-rose-800 dark:bg-rose-600/15 dark:text-rose-300',
    dot: 'bg-rose-600',
  },
  blue600: {
    chip: 'bg-blue-100 text-blue-900 dark:bg-blue-600/20 dark:text-blue-200',
    dot: 'bg-blue-600',
  },
  green600: {
    chip: 'bg-green-100 text-green-900 dark:bg-green-600/15 dark:text-green-300',
    dot: 'bg-green-600',
  },
  default: {
    chip: 'bg-muted text-foreground/80',
    dot: 'bg-muted-foreground',
  },
}

// DB'deki kategori slug'ı -> renk anahtarı. Yeni kategoriler buraya eklenir.
export const CATEGORY_COLOR_MAP: Record<string, CategoryColorKey> = {
  'dini-gunler': 'amber400',
  'islam-tarihi': 'emerald600',
  'milli-ve-kulturel-gunler': 'orange400',
  'islam-alimleri': 'violet500',
  'savas-ve-fetihler': 'rose600',
  'turk-edebiyati': 'blue600',
  futbol: 'green600',
}

export function getCategoryColor(
  slug: string | null | undefined,
): CategoryColorStyle {
  if (slug && CATEGORY_COLOR_MAP[slug]) {
    return COLOR_STYLES[CATEGORY_COLOR_MAP[slug]]
  }
  return COLOR_STYLES.default
}
