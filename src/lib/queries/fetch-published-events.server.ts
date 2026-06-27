import { getSupabaseServerClient } from '@/lib/supabase/server'

import type { EventRow } from './events'

export async function fetchPublishedEventRows(): Promise<EventRow[]> {
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
}
