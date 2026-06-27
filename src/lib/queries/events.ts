import { queryOptions } from '@tanstack/react-query'
import { createServerFn } from '@tanstack/react-start'

import { getSupabaseServerClient } from '@/lib/supabase/server'

import { queryKeys } from './keys'

export type CategoryRef = {
  slug: string | null
  name: string | null
  desc: string | null
}

export type SubjectRef = {
  name: string | null
  description: string | null
  source_url: string | null
}

export type CalendarSystem = 'gregorian' | 'hijri'

export type Recurrence = 'yearly' | 'none' | 'hijri_yearly'

export type HijriRule = 'first_friday_of_month'

export type EventGregorianDateRow = {
  gregorian_year: number
  start_date: string
  end_date: string | null
  occurrence_date: string | null
}

export type EventRow = {
  id: string
  title: string
  description: string | null
  location: string | null
  source_url: string | null
  start_date: string | null
  end_date: string | null
  occurrence_date: string | null
  is_all_day: boolean | null
  recurrence: Recurrence | null
  calendar_system: CalendarSystem | null
  hijri_month: number | null
  hijri_day: number | null
  hijri_end_month: number | null
  hijri_end_day: number | null
  hijri_rule: HijriRule | null
  gregorian_dates: EventGregorianDateRow | EventGregorianDateRow[] | null
  category: CategoryRef | CategoryRef[] | null
  subject: SubjectRef | SubjectRef[] | null
}

const fetchEvents = createServerFn({ method: 'GET' }).handler(async () => {
  const supabase = getSupabaseServerClient()
  const { data, error } = await supabase
    .from('events')
    .select(
      'id, title, description, location, source_url, start_date, end_date, occurrence_date, is_all_day, recurrence, calendar_system, hijri_month, hijri_day, hijri_end_month, hijri_end_day, hijri_rule, gregorian_dates:event_gregorian_dates(gregorian_year, start_date, end_date, occurrence_date), category:categories(slug, name, desc), subject:subjects(name, description, source_url)',
    )
    .eq('status', 'published')
    .order('start_date', { ascending: true })

  if (error) {
    throw new Error(error.message)
  }

  return (data ?? []) as EventRow[]
})

export const eventsQueryOptions = queryOptions({
  queryKey: queryKeys.events(),
  queryFn: () => fetchEvents(),
})
