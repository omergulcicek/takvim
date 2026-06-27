export const queryKeys = {
  all: ['takvim'] as const,
  events: () => [...queryKeys.all, 'events'] as const,
  categories: () => [...queryKeys.all, 'categories'] as const,
}
