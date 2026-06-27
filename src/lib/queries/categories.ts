import { queryOptions } from '@tanstack/react-query'
import { createServerFn } from '@tanstack/react-start'

import { getSupabaseServerClient } from '@/lib/supabase/server'

import { queryKeys } from './keys'

export type CategoryRow = {
  id: string
  slug: string
  name: string
  desc: string | null
}

const fetchCategories = createServerFn({ method: 'GET' }).handler(async () => {
  const supabase = getSupabaseServerClient()
  const { data, error } = await supabase
    .from('categories')
    .select('id, slug, name, desc')
    .order('name', { ascending: true })

  if (error) {
    throw new Error(error.message)
  }

  return (data ?? []) as CategoryRow[]
})

export const categoriesQueryOptions = queryOptions({
  queryKey: queryKeys.categories(),
  queryFn: () => fetchCategories(),
})
