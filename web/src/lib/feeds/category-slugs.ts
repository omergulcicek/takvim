// Eski abonelik URL'leri kırılmasın diye eski slug'lar yeni karşılıklarına eşlenir.
const LEGACY_CATEGORY_SLUGS: Record<string, string> = {
  "islam-alimleri": "onemli-sahsiyetler",
  "savas-ve-fetihler": "tarihi-olaylar",
  "dunya-kupasi": "milli-takimlar",
};

export function resolveCategorySlug(slug: string): string {
  return LEGACY_CATEGORY_SLUGS[slug] ?? slug;
}

export function normalizeCategorySlugs(raw: string | null): string[] {
  if (!raw) return [];

  const unique = new Set<string>();
  for (const part of raw.split(",")) {
    const slug = resolveCategorySlug(part.trim());
    if (slug.length > 0) {
      unique.add(slug);
    }
  }

  return [...unique].sort((a, b) => a.localeCompare(b, "tr"));
}
