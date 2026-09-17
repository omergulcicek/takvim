export type CategoryGroupDefinition = {
  label: string;
  slugs: readonly string[];
  nested?: boolean;
  colorSlug?: string;
};

// Takvim filtresi ve benzeri UI'larda kategorilerin mantıksal grupları.
export const CATEGORY_GROUPS: readonly CategoryGroupDefinition[] = [
  {
    label: "Futbol",
    nested: true,
    colorSlug: "milli-takimlar",
    // Kulüpler önce, turnuvalar sonra (Türkçe alfabetik değil; okuma sırası).
    slugs: [
      "besiktas",
      "fenerbahce",
      "galatasaray",
      "trabzonspor",
      "milli-takimlar",
      "sampiyonlar-ligi",
      "premier-lig",
      "la-liga",
    ],
  },
  {
    label: "Din ve İnanç",
    slugs: ["dini-gunler", "islam-tarihi", "onemli-sahsiyetler"],
  },
  {
    label: "Kültür ve Edebiyat",
    slugs: ["milli-ve-kulturel-gunler", "turk-edebiyati"],
  },
  {
    label: "Tarih",
    slugs: ["tarihi-olaylar"],
  },
] as const;

export type CategoryForGrouping = {
  key: string;
  slug: string | null;
  name: string;
};

export type CategorySelectGroup<T extends CategoryForGrouping> = {
  label: string;
  categories: T[];
  nested: boolean;
  colorSlug: string | null;
};

export function groupCategoriesForSelect<T extends CategoryForGrouping>(
  categories: T[],
): { groups: CategorySelectGroup<T>[]; ungrouped: T[] } {
  const bySlug = new Map<string, T>();
  for (const category of categories) {
    if (category.slug != null) {
      bySlug.set(category.slug, category);
    }
  }

  const usedKeys = new Set<string>();
  const groups: CategorySelectGroup<T>[] = [];

  for (const group of CATEGORY_GROUPS) {
    const groupCategories: T[] = [];
    for (const slug of group.slugs) {
      const category = bySlug.get(slug);
      if (category == null) continue;
      groupCategories.push(category);
      usedKeys.add(category.key);
    }
    if (groupCategories.length > 0) {
      groups.push({
        label: group.label,
        categories: groupCategories,
        nested: group.nested === true,
        colorSlug: group.colorSlug ?? null,
      });
    }
  }

  const ungrouped = categories.filter((category) => !usedKeys.has(category.key));

  groups.sort((a, b) => a.label.localeCompare(b.label, "tr"));

  return { groups, ungrouped };
}
