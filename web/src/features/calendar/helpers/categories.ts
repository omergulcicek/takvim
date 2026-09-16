// Kategori renkleri proje localinde sabitlenir. DB'ye yeni bir kategori
// eklendiğinde, slug'ını buraya bir renk anahtarıyla eşleyin. Eşleşme yoksa
// `default` (nötr) renk kullanılır.

export type CategoryColorKey =
  | "yellow500"
  | "teal600"
  | "red600"
  | "indigo600"
  | "stone700"
  | "blue600"
  | "green400"
  | "purple600"
  | "black"
  | "amber500"
  | "rose800"
  | "orange500"
  | "violet800";

export type CategoryColorStyle = {
  chip: string;
  dot: string;
  checkbox: string;
};

export const COLOR_STYLES: Record<CategoryColorKey | "default", CategoryColorStyle> = {
  yellow500: {
    chip: "bg-yellow-100 text-yellow-900 dark:bg-yellow-500/15 dark:text-yellow-300",
    dot: "bg-yellow-500",
    checkbox:
      "border-yellow-500 data-[state=checked]:border-yellow-500 data-[state=checked]:bg-yellow-500 data-[state=checked]:text-white",
  },
  teal600: {
    chip: "bg-teal-100 text-teal-900 dark:bg-teal-600/15 dark:text-teal-300",
    dot: "bg-teal-600",
    checkbox:
      "border-teal-600 data-[state=checked]:border-teal-600 data-[state=checked]:bg-teal-600 data-[state=checked]:text-white",
  },
  red600: {
    chip: "bg-red-100 text-red-900 dark:bg-red-600/15 dark:text-red-300",
    dot: "bg-red-600",
    checkbox:
      "border-red-600 data-[state=checked]:border-red-600 data-[state=checked]:bg-red-600 data-[state=checked]:text-white",
  },
  indigo600: {
    chip: "bg-indigo-100 text-indigo-900 dark:bg-indigo-600/15 dark:text-indigo-300",
    dot: "bg-indigo-600",
    checkbox:
      "border-indigo-600 data-[state=checked]:border-indigo-600 data-[state=checked]:bg-indigo-600 data-[state=checked]:text-white",
  },
  stone700: {
    chip: "bg-stone-200 text-stone-900 dark:bg-stone-500/20 dark:text-stone-300",
    dot: "bg-stone-700 dark:bg-stone-400",
    checkbox:
      "border-stone-700 data-[state=checked]:border-stone-700 data-[state=checked]:bg-stone-700 data-[state=checked]:text-white dark:border-stone-400 dark:data-[state=checked]:border-stone-400 dark:data-[state=checked]:bg-stone-400 dark:data-[state=checked]:text-stone-950",
  },
  blue600: {
    chip: "bg-blue-100 text-blue-900 dark:bg-blue-600/20 dark:text-blue-200",
    dot: "bg-blue-600",
    checkbox:
      "border-blue-600 data-[state=checked]:border-blue-600 data-[state=checked]:bg-blue-600 data-[state=checked]:text-white",
  },
  green400: {
    chip: "bg-green-100 text-green-800 dark:bg-green-400/20 dark:text-green-300",
    dot: "bg-green-400",
    checkbox:
      "border-green-400 data-[state=checked]:border-green-400 data-[state=checked]:bg-green-400 data-[state=checked]:text-green-950",
  },
  purple600: {
    chip: "bg-purple-100 text-purple-900 dark:bg-purple-600/15 dark:text-purple-300",
    dot: "bg-purple-600",
    checkbox:
      "border-purple-600 data-[state=checked]:border-purple-600 data-[state=checked]:bg-purple-600 data-[state=checked]:text-white",
  },
  black: {
    chip: "bg-neutral-200 text-neutral-950 dark:bg-neutral-500/25 dark:text-neutral-100",
    dot: "bg-neutral-950 dark:bg-neutral-100",
    checkbox:
      "border-neutral-950 data-[state=checked]:border-neutral-950 data-[state=checked]:bg-neutral-950 data-[state=checked]:text-white dark:border-neutral-100 dark:data-[state=checked]:border-neutral-100 dark:data-[state=checked]:bg-neutral-100 dark:data-[state=checked]:text-neutral-950",
  },
  amber500: {
    chip: "bg-amber-100 text-amber-950 dark:bg-amber-500/15 dark:text-amber-300",
    dot: "bg-amber-500",
    checkbox:
      "border-amber-500 data-[state=checked]:border-amber-500 data-[state=checked]:bg-amber-500 data-[state=checked]:text-amber-950",
  },
  rose800: {
    chip: "bg-rose-100 text-rose-950 dark:bg-rose-800/20 dark:text-rose-300",
    dot: "bg-rose-800",
    checkbox:
      "border-rose-800 data-[state=checked]:border-rose-800 data-[state=checked]:bg-rose-800 data-[state=checked]:text-white",
  },
  orange500: {
    chip: "bg-orange-100 text-orange-900 dark:bg-orange-500/15 dark:text-orange-300",
    dot: "bg-orange-500",
    checkbox:
      "border-orange-500 data-[state=checked]:border-orange-500 data-[state=checked]:bg-orange-500 data-[state=checked]:text-white",
  },
  violet800: {
    chip: "bg-violet-100 text-violet-950 dark:bg-violet-800/20 dark:text-violet-300",
    dot: "bg-violet-800",
    checkbox:
      "border-violet-800 data-[state=checked]:border-violet-800 data-[state=checked]:bg-violet-800 data-[state=checked]:text-white",
  },
  default: {
    chip: "bg-muted text-foreground/80",
    dot: "bg-muted-foreground",
    checkbox:
      "border-muted-foreground data-[state=checked]:border-muted-foreground data-[state=checked]:bg-muted-foreground data-[state=checked]:text-background",
  },
};

// DB'deki kategori slug'ı -> renk anahtarı. Yeni kategoriler buraya eklenir.
export const CATEGORY_COLOR_MAP: Record<string, CategoryColorKey> = {
  "dini-gunler": "yellow500",
  "islam-tarihi": "teal600",
  "milli-ve-kulturel-gunler": "red600",
  "onemli-sahsiyetler": "indigo600",
  "tarihi-olaylar": "stone700",
  "turk-edebiyati": "blue600",
  "dunya-kupasi": "green400",
  "sampiyonlar-ligi": "green400",
  "premier-lig": "green400",
  "la-liga": "green400",
  besiktas: "green400",
  fenerbahce: "green400",
  galatasaray: "green400",
  trabzonspor: "green400",
};

export function getCategoryColor(slug: string | null | undefined): CategoryColorStyle {
  if (slug && CATEGORY_COLOR_MAP[slug]) {
    return COLOR_STYLES[CATEGORY_COLOR_MAP[slug]];
  }
  return COLOR_STYLES.default;
}
