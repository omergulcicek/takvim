import { queryOptions } from '@tanstack/react-query'
import { createServerFn } from '@tanstack/react-start'

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
  const { fetchPublishedEventRows } = await import(
    '@/lib/queries/fetch-published-events.server'
  )
  return fetchPublishedEventRows()
})

export const eventsQueryOptions = queryOptions({
  queryKey: queryKeys.events(),
  queryFn: () => fetchEvents(),
})
