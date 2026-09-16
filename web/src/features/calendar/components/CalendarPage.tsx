import { useEffect, useMemo, useState } from "react";
import { useSuspenseQuery } from "@tanstack/react-query";

import { categoriesQueryOptions } from "@/features/calendar/api/categories";
import { eventsQueryOptions } from "@/features/calendar/api/events";
import {
  CalendarCategoryFilterButton,
  CalendarCategorySidebar,
} from "@/features/calendar/components/CalendarCategorySidebar";
import { CalendarHero } from "@/features/calendar/components/CalendarHero";
import { EventDetailDialog } from "@/features/calendar/components/EventDetailDialog";
import { FaqSection } from "@/features/calendar/components/FaqSection";
import { HowToSubscribeSection } from "@/features/calendar/components/HowToSubscribeSection";
import { MonthCalendar } from "@/features/calendar/components/MonthCalendar";
import type { CalendarEvent } from "@/features/calendar/components/MonthCalendar";
import { Reveal } from "@/features/calendar/components/Reveal";
import { SubscriptionPanel } from "@/features/calendar/components/SubscriptionPanel";
import { SECTION_SCROLL_CLASS, SITE_SECTIONS } from "@/features/calendar/data/site-nav";
import { expandEvent } from "@/features/calendar/helpers/expand-events";

export function CalendarPage() {
  const { data: rows } = useSuspenseQuery(eventsQueryOptions);
  const { data: categoryRows } = useSuspenseQuery(categoriesQueryOptions);
  const [mounted, setMounted] = useState(false);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [filterSheetOpen, setFilterSheetOpen] = useState(false);
  const [selectedEvent, setSelectedEvent] = useState<CalendarEvent | null>(null);
  const [selectedCategorySlugs, setSelectedCategorySlugs] = useState<Set<string>>(
    () => new Set(categoryRows.map((category) => category.slug)),
  );

  function handleEventClick(event: CalendarEvent) {
    setSelectedEvent(event);
    setDialogOpen(true);
  }

  useEffect(() => {
    setMounted(true);
  }, []);

  const events = useMemo<CalendarEvent[]>(() => rows.flatMap(expandEvent), [rows]);

  return (
    <main className="w-full min-w-0 space-y-20 pt-3 pb-8 sm:space-y-28 sm:pt-4 md:space-y-32">
      <section id={SITE_SECTIONS.takvim} className={SECTION_SCROLL_CLASS}>
        <div className="mx-auto max-w-7xl px-4">
          <CalendarHero />
        </div>

        <div className="mx-auto w-full max-w-screen-2xl px-4">
          {mounted ? (
            <div className="flex flex-row items-start gap-3 sm:gap-4 lg:gap-8">
              <CalendarCategorySidebar
                categories={categoryRows}
                selectedSlugs={selectedCategorySlugs}
                onSelectedSlugsChange={setSelectedCategorySlugs}
                mobileSheetOpen={filterSheetOpen}
                onMobileSheetOpenChange={setFilterSheetOpen}
              />
              <div className="min-w-0 flex-1">
                <MonthCalendar
                  events={events}
                  selectedCategorySlugs={selectedCategorySlugs}
                  onEventClick={handleEventClick}
                  toolbarStart={
                    <CalendarCategoryFilterButton
                      selectedCount={selectedCategorySlugs.size}
                      onClick={() => setFilterSheetOpen(true)}
                    />
                  }
                />
              </div>
            </div>
          ) : (
            <div className="h-[640px] animate-pulse rounded-xl bg-muted" aria-hidden />
          )}
        </div>
      </section>

      <div className="space-y-20 px-4 sm:space-y-28 md:space-y-32">
        <Reveal>
          <SubscriptionPanel
            categories={categoryRows}
            selectedSlugs={selectedCategorySlugs}
            onSelectedSlugsChange={setSelectedCategorySlugs}
          />
        </Reveal>

        <Reveal>
          <HowToSubscribeSection />
        </Reveal>

        <Reveal>
          <FaqSection />
        </Reveal>
      </div>

      <EventDetailDialog open={dialogOpen} onOpenChange={setDialogOpen} event={selectedEvent} />
    </main>
  );
}
