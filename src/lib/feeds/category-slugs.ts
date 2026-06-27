export function normalizeCategorySlugs(raw: string | null): string[] {
  if (!raw) return []

  const unique = new Set<string>()
  for (const part of raw.split(',')) {
    const slug = part.trim()
    if (slug.length > 0) {
      unique.add(slug)
    }
  }

  return [...unique].sort((a, b) => a.localeCompare(b, 'tr'))
}
