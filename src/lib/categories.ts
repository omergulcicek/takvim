// Kategori renkleri proje localinde sabitlenir. DB'ye yeni bir kategori
// eklendiğinde, slug'ını buraya bir renk anahtarıyla eşleyin. Eşleşme yoksa
// `default` (nötr) renk kullanılır.

export type CategoryColorKey =
  | 'yellow500'
  | 'teal600'
  | 'red600'
  | 'indigo600'
  | 'stone700'
  | 'blue600'
  | 'lime500'
  | 'purple600'

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
  yellow500: {
    chip: 'bg-yellow-100 text-yellow-900 dark:bg-yellow-500/15 dark:text-yellow-300',
    dot: 'bg-yellow-500',
  },
  teal600: {
    chip: 'bg-teal-100 text-teal-900 dark:bg-teal-600/15 dark:text-teal-300',
    dot: 'bg-teal-600',
  },
  red600: {
    chip: 'bg-red-100 text-red-900 dark:bg-red-600/15 dark:text-red-300',
    dot: 'bg-red-600',
  },
  indigo600: {
    chip: 'bg-indigo-100 text-indigo-900 dark:bg-indigo-600/15 dark:text-indigo-300',
    dot: 'bg-indigo-600',
  },
  stone700: {
    chip: 'bg-stone-200 text-stone-900 dark:bg-stone-500/20 dark:text-stone-300',
    dot: 'bg-stone-700 dark:bg-stone-400',
  },
  blue600: {
    chip: 'bg-blue-100 text-blue-900 dark:bg-blue-600/20 dark:text-blue-200',
    dot: 'bg-blue-600',
  },
  lime500: {
    chip: 'bg-lime-100 text-lime-900 dark:bg-lime-500/15 dark:text-lime-300',
    dot: 'bg-lime-500',
  },
  purple600: {
    chip: 'bg-purple-100 text-purple-900 dark:bg-purple-600/15 dark:text-purple-300',
    dot: 'bg-purple-600',
  },
  default: {
    chip: 'bg-muted text-foreground/80',
    dot: 'bg-muted-foreground',
  },
}

// DB'deki kategori slug'ı -> renk anahtarı. Yeni kategoriler buraya eklenir.
export const CATEGORY_COLOR_MAP: Record<string, CategoryColorKey> = {
  'dini-gunler': 'yellow500',
  'islam-tarihi': 'teal600',
  'milli-ve-kulturel-gunler': 'red600',
  'islam-alimleri': 'indigo600',
  'savas-ve-fetihler': 'stone700',
  'turk-edebiyati': 'blue600',
  'dunya-kupasi': 'lime500',
  'sampiyonlar-ligi': 'purple600',
}

export function getCategoryColor(
  slug: string | null | undefined,
): CategoryColorStyle {
  if (slug && CATEGORY_COLOR_MAP[slug]) {
    return COLOR_STYLES[CATEGORY_COLOR_MAP[slug]]
  }
  return COLOR_STYLES.default
}
