import { createFileRoute } from '@tanstack/react-router'
import { useSuspenseQuery } from '@tanstack/react-query'
import { useEffect, useMemo, useState } from 'react'
import { format, isSameDay } from 'date-fns'
import { tr } from 'date-fns/locale'

import {
  MonthCalendar,
  type CalendarCategory,
  type CalendarEvent,
} from '@/components/month-calendar'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { FaqSection } from '@/components/faq-section'
import { HowToSubscribeSection } from '@/components/how-to-subscribe-section'
import { SubscriptionPanel } from '@/components/subscription-panel'
import { SECTION_SCROLL_CLASS, SITE_DESCRIPTION, SITE_SUBDESCRIPTION, SITE_SECTIONS } from '@/lib/site-nav'
import { getCategoryColor } from '@/lib/categories'
import { categoriesQueryOptions } from '@/lib/queries/categories'
import { eventsQueryOptions } from '@/lib/queries/events'
import { expandEvent } from '@/lib/expand-events'
import { formatEventDateWithHijri } from '@/lib/hijri-date'
import { cn } from '@/lib/utils'

// URL'yi UI'da okunaklı göstermek için yüzde-kodlu karakterleri çözer.
// Bozuk kodlama durumunda ham URL'ye düşeriz.
function decodeUrlForDisplay(url: string): string {
  try {
    return decodeURI(url)
  } catch {
    return url
  }
}

export const Route = createFileRoute('/')({
  loader: ({ context }) =>
    Promise.all([
      context.queryClient.ensureQueryData(eventsQueryOptions),
      context.queryClient.ensureQueryData(categoriesQueryOptions),
    ]),
  component: App,
})

const NO_CATEGORY_KEY = '__none__'

function App() {
  const { data: rows } = useSuspenseQuery(eventsQueryOptions)
  const { data: categoryRows } = useSuspenseQuery(categoriesQueryOptions)
  const [mounted, setMounted] = useState(false)
  const [dialogOpen, setDialogOpen] = useState(false)
  const [selectedEvent, setSelectedEvent] = useState<CalendarEvent | null>(null)

  function handleEventClick(event: CalendarEvent) {
    setSelectedEvent(event)
    setDialogOpen(true)
  }

  useEffect(() => {
    setMounted(true)
  }, [])

  const events = useMemo<CalendarEvent[]>(
    () => rows.flatMap(expandEvent),
    [rows],
  )

  const categories = useMemo<CalendarCategory[]>(() => {
    const fromDb: CalendarCategory[] = categoryRows.map((category) => ({
      key: category.slug,
      name: category.name,
      slug: category.slug,
      desc: category.desc,
    }))

    const hasUncategorized = events.some(
      (event) => event.categorySlug == null,
    )
    if (!hasUncategorized) {
      return fromDb
    }

    return [
      ...fromDb,
      {
        key: NO_CATEGORY_KEY,
        name: 'Kategorisiz',
        slug: null,
        desc: null,
      },
    ]
  }, [categoryRows, events])

  const dateStart = selectedEvent?.displayStart ?? selectedEvent?.start
  const dateEnd = selectedEvent?.displayEnd ?? selectedEvent?.end
  const hasEnd =
    dateStart != null &&
    dateEnd != null &&
    dateEnd.getTime() !== dateStart.getTime()
  const isAllDay = selectedEvent?.allDay ?? false
  const isMultiDay =
    dateStart != null && dateEnd != null && !isSameDay(dateStart, dateEnd)
  const color = getCategoryColor(selectedEvent?.categorySlug)

  return (
    <main className="mx-auto w-full min-w-0 max-w-7xl space-y-24 px-4 pt-6 pb-8 sm:space-y-32 md:space-y-48 sm:pt-8">
      <section id={SITE_SECTIONS.takvim} className={SECTION_SCROLL_CLASS}>
        <div className="py-8 sm:py-12 md:py-16 lg:py-24">
          <h1
            className="mx-auto max-w-4xl text-center text-2xl font-bold tracking-tight text-pretty sm:text-3xl md:text-4xl lg:text-6xl lg:tracking-tighter"
          >
            Takvim Aboneliği
          </h1>
          <p
            className="mx-auto mt-6 max-w-3xl text-center text-sm text-muted-foreground md:text-base lg:text-xl"
          >
            {SITE_DESCRIPTION}
          </p>
          <p className="mx-auto mt-3 max-w-2xl text-center text-sm text-muted-foreground">
            {SITE_SUBDESCRIPTION}
          </p>
        </div>

        <div>
          {mounted ? (
            <MonthCalendar
              events={events}
              categories={categories}
              onEventClick={handleEventClick}
            />
          ) : (
            <div className="h-[640px] animate-pulse rounded-md bg-muted" />
          )}
        </div>
      </section>

      <SubscriptionPanel categories={categoryRows} />

      <HowToSubscribeSection />

      <FaqSection />

      <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
        <DialogContent>
          {selectedEvent && (
            <>
              <DialogHeader>
                <DialogTitle>{selectedEvent.title}</DialogTitle>
                {selectedEvent.categoryName && (
                  <DialogDescription className="flex items-center gap-2">
                    <span
                      className={cn('size-2 rounded-full', color.dot)}
                      aria-hidden
                    />
                    {selectedEvent.categoryName}
                  </DialogDescription>
                )}
              </DialogHeader>

              <dl className="flex flex-col gap-4 text-sm">
                {isAllDay ? (
                  <div>
                    <dt className="font-medium text-muted-foreground">Tarih</dt>
                    <dd className="mt-0.5">
                      {formatEventDateWithHijri(
                        dateStart!,
                        dateEnd!,
                        isMultiDay,
                        selectedEvent.hijri ?? null,
                      )}
                    </dd>
                  </div>
                ) : (
                  <>
                    <div>
                      <dt className="font-medium text-muted-foreground">
                        Başlangıç
                      </dt>
                      <dd className="mt-0.5 tabular-nums">
                        {format(selectedEvent.start, 'dd MMMM yyyy, HH:mm', {
                          locale: tr,
                        })}
                      </dd>
                    </div>

                    {hasEnd && (
                      <div>
                        <dt className="font-medium text-muted-foreground">
                          Bitiş
                        </dt>
                        <dd className="mt-0.5 tabular-nums">
                          {format(selectedEvent.end, 'dd MMMM yyyy, HH:mm', {
                            locale: tr,
                          })}
                        </dd>
                      </div>
                    )}
                  </>
                )}

                {selectedEvent.location && (
                  <div>
                    <dt className="font-medium text-muted-foreground">Yer</dt>
                    <dd className="mt-0.5">{selectedEvent.location}</dd>
                  </div>
                )}

                {selectedEvent.description && (
                  <div>
                    <dt className="font-medium text-muted-foreground">
                      Açıklama
                    </dt>
                    <dd className="mt-0.5 whitespace-pre-wrap">
                      {selectedEvent.description}
                    </dd>
                  </div>
                )}

                {selectedEvent.sourceUrl && (
                  <div>
                    <dt className="font-medium text-muted-foreground">
                      Kaynak
                    </dt>
                    <dd className="mt-0.5">
                      <a
                        href={selectedEvent.sourceUrl}
                        target="_blank"
                        rel="noreferrer"
                        className="font-medium text-primary underline-offset-4 hover:underline"
                      >
                        {decodeUrlForDisplay(selectedEvent.sourceUrl)}
                      </a>
                    </dd>
                  </div>
                )}
              </dl>
            </>
          )}
        </DialogContent>
      </Dialog>
    </main>
  )
}
