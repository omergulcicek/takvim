import { useLayoutEffect, useMemo, useRef, useState } from "react";
import { createPortal } from "react-dom";
import {
  addDays,
  addMonths,
  addYears,
  eachDayOfInterval,
  eachMonthOfInterval,
  endOfMonth,
  endOfWeek,
  endOfYear,
  format,
  isSameMonth,
  isToday,
  isWithinInterval,
  startOfDay,
  startOfMonth,
  startOfWeek,
  startOfYear,
  subMonths,
  subYears,
} from "date-fns";
import { tr } from "date-fns/locale";
import {
  ChevronLeft,
  ChevronRight,
  Grid2x2,
  Grid3x3,
  Rows3,
} from "lucide-react";

import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { groupCategoriesForSelect } from "@/lib/category-groups";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";
import { cn } from "@/lib/utils";
import { SECTION_HEADING_CLASS } from "@/lib/site-nav";
import { getCategoryColor } from "@/lib/categories";
import type { HijriDateFields } from "@/lib/hijri-date";

// Hafta Pazartesi başlar (date-fns: 1 = Pazartesi).
const WEEK_STARTS_ON = 1 as const;

// Sabit hücre yüksekliği (aylar arası geçişte satır boyutu değişmesin).
const DAY_CELL_HEIGHT_CLASS = "h-24 sm:h-28 md:h-32";

// Bir hücrede en fazla kaç event gösterilsin; fazlası "+N" popover'ına gider.
// Taşma varsa bir slot "+N" düğmesi için ayrılır.
const MAX_VISIBLE_PER_DAY = 3;

// Kategorisi olmayan event'ler için filtre anahtarı.
const NO_CATEGORY_KEY = "__none__";

// Tüm kategorileri göster.
const ALL_CATEGORIES_KEY = "__all__";

// Yıllık görünümde bir günde en fazla kaç renkli nokta gösterilsin.
const MAX_DOTS_PER_DAY = 4;

export type CalendarEvent = {
  id: string;
  title: string;
  start: Date;
  end: Date;
  /** Tarih aralığı (savaş vb.); yoksa start/end kullanılır. */
  displayStart?: Date;
  displayEnd?: Date;
  allDay?: boolean;
  categorySlug: string | null;
  categoryName: string | null;
  categoryDesc?: string | null;
  description?: string | null;
  location?: string | null;
  sourceUrl?: string | null;
  hijri?: HijriDateFields | null;
};

type CalendarView = "month" | "year" | "list";

export type CalendarCategory = {
  key: string;
  name: string;
  slug: string | null;
  desc: string | null;
};

// Event listesinden, takvimde geçen benzersiz kategorileri çıkarır.
function deriveCategories(events: CalendarEvent[]): CalendarCategory[] {
  const map = new Map<string, CalendarCategory>();
  for (const event of events) {
    const key = event.categorySlug ?? NO_CATEGORY_KEY;
    if (map.has(key)) continue;
    map.set(key, {
      key,
      name: event.categoryName ?? "Kategorisiz",
      slug: event.categorySlug,
      desc: event.categoryDesc ?? null,
    });
  }
  return Array.from(map.values()).sort((a, b) =>
    a.name.localeCompare(b.name, "tr"),
  );
}

function eventsForDay(events: CalendarEvent[], day: Date): CalendarEvent[] {
  const dayStart = startOfDay(day);
  return events
    .filter((event) =>
      isWithinInterval(dayStart, {
        start: startOfDay(event.start),
        end: startOfDay(event.end),
      }),
    )
    .sort((a, b) => {
      // Tüm gün olanlar önce, sonra başlangıç saatine göre.
      if (!!a.allDay !== !!b.allDay) return a.allDay ? -1 : 1;
      return a.start.getTime() - b.start.getTime();
    });
}

function eventsInRange(
  events: CalendarEvent[],
  rangeStart: Date,
  rangeEnd: Date,
): CalendarEvent[] {
  const start = startOfDay(rangeStart);
  const end = startOfDay(rangeEnd);
  return events
    .filter((event) => {
      const eventStart = startOfDay(event.start);
      const eventEnd = startOfDay(event.end);
      return eventStart <= end && eventEnd >= start;
    })
    .sort((a, b) => {
      if (!!a.allDay !== !!b.allDay) return a.allDay ? -1 : 1;
      return a.start.getTime() - b.start.getTime();
    });
}

// Bir ayın 7x6 ızgarasında gösterilecek günleri (önceki/sonraki ay taşmaları
// dahil) döndürür.
function getMonthGridDays(month: Date): Date[] {
  const gridStart = startOfWeek(startOfMonth(month), {
    weekStartsOn: WEEK_STARTS_ON,
  });
  const gridEnd = endOfWeek(endOfMonth(month), {
    weekStartsOn: WEEK_STARTS_ON,
  });
  return eachDayOfInterval({ start: gridStart, end: gridEnd });
}

function EventChip({
  event,
  onClick,
}: {
  event: CalendarEvent;
  onClick?: (event: CalendarEvent) => void;
}) {
  const color = getCategoryColor(event.categorySlug);
  return (
    <button
      type="button"
      onClick={() => onClick?.(event)}
      title={event.title}
      className={cn(
        "flex w-full shrink-0 cursor-pointer items-center gap-1.5 rounded-md px-1.5 py-1 text-left text-xs font-medium transition-opacity hover:opacity-80",
        color.chip,
      )}
    >
      <span className={cn("size-1.5 shrink-0 rounded-full", color.dot)} />
      {!event.allDay && (
        <span className="shrink-0 tabular-nums opacity-70">
          {format(event.start, "HH:mm")}
        </span>
      )}
      <span className="truncate">{event.title}</span>
    </button>
  );
}

function ListEventRow({
  event,
  onClick,
}: {
  event: CalendarEvent;
  onClick?: (event: CalendarEvent) => void;
}) {
  const color = getCategoryColor(event.categorySlug);
  const dateStart = event.displayStart ?? event.start;
  const dateEnd = event.displayEnd ?? event.end;
  const isMultiDay =
    startOfDay(dateStart).getTime() !== startOfDay(dateEnd).getTime();

  return (
    <button
      type="button"
      onClick={() => onClick?.(event)}
      className="flex w-full cursor-pointer flex-col gap-1.5 px-4 py-3 text-left transition-colors hover:bg-accent sm:flex-row sm:items-start sm:gap-4"
    >
      <div className="w-full text-sm tabular-nums text-muted-foreground sm:w-28 sm:shrink-0 sm:pt-0.5">
        {isMultiDay ? (
          <>
            {format(dateStart, "d MMM", { locale: tr })}
            {" – "}
            {format(dateEnd, "d MMM", { locale: tr })}
          </>
        ) : (
          <>
            {format(event.start, "d MMM", { locale: tr })}
            {!event.allDay && (
              <span className="ml-1.5">{format(event.start, "HH:mm")}</span>
            )}
          </>
        )}
      </div>
      <div className="flex w-full min-w-0 items-start gap-3 sm:flex-1 sm:gap-4">
        <span
          className={cn("mt-1.5 size-2 shrink-0 rounded-full", color.dot)}
          aria-hidden
        />
        <div className="min-w-0 flex-1">
          <div className="text-sm font-medium">{event.title}</div>
          {event.description && (
            <p className="mt-0.5 text-sm text-muted-foreground">
              {event.description}
            </p>
          )}
        </div>
        {event.categoryName && (
          <span className="hidden shrink-0 pt-0.5 text-xs text-muted-foreground sm:block">
            {event.categoryName}
          </span>
        )}
      </div>
    </button>
  );
}

export function MonthCalendar({
  events,
  categories: categoriesProp,
  onEventClick,
}: {
  events: CalendarEvent[];
  categories?: CalendarCategory[];
  onEventClick?: (event: CalendarEvent) => void;
}) {
  const [currentMonth, setCurrentMonth] = useState(() =>
    startOfMonth(new Date()),
  );
  const [view, setView] = useState<CalendarView>("month");

  const categories = useMemo(
    () => categoriesProp ?? deriveCategories(events),
    [categoriesProp, events],
  );

  const { groups: categoryGroups, ungrouped: ungroupedCategories } = useMemo(
    () => groupCategoriesForSelect(categories),
    [categories],
  );

  const [selectedCategoryKey, setSelectedCategoryKey] = useState(
    ALL_CATEGORIES_KEY,
  );

  const visibleEvents = useMemo(() => {
    if (selectedCategoryKey === ALL_CATEGORIES_KEY) return events;
    return events.filter(
      (event) =>
        (event.categorySlug ?? NO_CATEGORY_KEY) === selectedCategoryKey,
    );
  }, [events, selectedCategoryKey]);

  const weekdayLabels = useMemo(() => {
    const start = startOfWeek(new Date(), { weekStartsOn: WEEK_STARTS_ON });
    return Array.from({ length: 7 }, (_, i) =>
      format(addDays(start, i), "EEE", { locale: tr }),
    );
  }, []);

  const days = useMemo(() => getMonthGridDays(currentMonth), [currentMonth]);

  const monthsOfYear = useMemo(
    () =>
      eachMonthOfInterval({
        start: startOfYear(currentMonth),
        end: endOfYear(currentMonth),
      }),
    [currentMonth],
  );

  const listEvents = useMemo(
    () =>
      eventsInRange(
        visibleEvents,
        startOfMonth(currentMonth),
        endOfMonth(currentMonth),
      ),
    [visibleEvents, currentMonth],
  );

  function goPrev() {
    setCurrentMonth((m) =>
      view === "year" ? subYears(m, 1) : subMonths(m, 1),
    );
  }

  function goNext() {
    setCurrentMonth((m) =>
      view === "year" ? addYears(m, 1) : addMonths(m, 1),
    );
  }

  const prevLabel = view === "year" ? "Önceki yıl" : "Önceki ay";
  const nextLabel = view === "year" ? "Sonraki yıl" : "Sonraki ay";

  const viewControls = (
    <div className="inline-flex shrink-0 items-center rounded-md border border-input p-0.5">
      <Tooltip>
        <TooltipTrigger asChild>
          <Button
            variant={view === "list" ? "default" : "ghost"}
            size="icon"
            className="size-7 rounded-sm"
            aria-label="Liste görünümü"
            onClick={() => setView("list")}
          >
            <Rows3 size={14} />
          </Button>
        </TooltipTrigger>
        <TooltipContent>Liste görünümü</TooltipContent>
      </Tooltip>
      <Tooltip>
        <TooltipTrigger asChild>
          <Button
            variant={view === "month" ? "default" : "ghost"}
            size="icon"
            className="size-7 rounded-sm"
            aria-label="Aylık görünüm"
            onClick={() => setView("month")}
          >
            <Grid2x2 size={14} />
          </Button>
        </TooltipTrigger>
        <TooltipContent>Aylık görünüm</TooltipContent>
      </Tooltip>
      <Tooltip>
        <TooltipTrigger asChild>
          <Button
            variant={view === "year" ? "default" : "ghost"}
            size="icon"
            className="size-7 rounded-sm"
            aria-label="Yıllık görünüm"
            onClick={() => setView("year")}
          >
            <Grid3x3 size={14} />
          </Button>
        </TooltipTrigger>
        <TooltipContent>Yıllık görünüm</TooltipContent>
      </Tooltip>
    </div>
  );

  const navControls = (
    <div className="inline-flex shrink-0 items-center rounded-md border border-input p-0.5">
      <Tooltip>
        <TooltipTrigger asChild>
          <Button
            variant="ghost"
            size="icon"
            className="size-7 rounded-sm"
            aria-label={prevLabel}
            onClick={goPrev}
          >
            <ChevronLeft size={14} />
          </Button>
        </TooltipTrigger>
        <TooltipContent>{prevLabel}</TooltipContent>
      </Tooltip>

      <Button
        variant="ghost"
        className="h-7 rounded-sm px-2 text-xs sm:px-2.5"
        onClick={() => setCurrentMonth(startOfMonth(new Date()))}
      >
        Bugün
      </Button>

      <Tooltip>
        <TooltipTrigger asChild>
          <Button
            variant="ghost"
            size="icon"
            className="size-7 rounded-sm"
            aria-label={nextLabel}
            onClick={goNext}
          >
            <ChevronRight size={14} />
          </Button>
        </TooltipTrigger>
        <TooltipContent>{nextLabel}</TooltipContent>
      </Tooltip>
    </div>
  );

  function renderCategoryItem(category: CalendarCategory) {
    const color = getCategoryColor(category.slug);
    return (
      <SelectItem key={category.key} value={category.key}>
        <span
          className={cn("size-2 shrink-0 rounded-full", color.dot)}
          aria-hidden
        />
        {category.name}
      </SelectItem>
    );
  }

  const categorySelect = (
    <Select
      value={selectedCategoryKey}
      onValueChange={setSelectedCategoryKey}
    >
      <SelectTrigger
        size="sm"
        className="w-full min-w-0 max-w-56 md:w-56 [&_[data-slot=select-value]]:line-clamp-none"
        aria-label="Kategori seç"
      >
        <SelectValue placeholder="Tüm Takvimler" />
      </SelectTrigger>
      <SelectContent
        align="end"
        position="popper"
        className="w-[var(--radix-select-trigger-width)] md:w-56"
      >
        <SelectItem value={ALL_CATEGORIES_KEY}>Tüm Takvimler</SelectItem>
        {categoryGroups.map((group) => (
          <SelectGroup key={group.label}>
            <SelectLabel>{group.label}</SelectLabel>
            {group.categories.map(renderCategoryItem)}
          </SelectGroup>
        ))}
        {ungroupedCategories.map(renderCategoryItem)}
      </SelectContent>
    </Select>
  );

  return (
    <div className="flex w-full min-w-0 flex-col">
      <TooltipProvider delayDuration={200}>
        <div className="mb-3 flex flex-col gap-3 md:flex-row md:items-center md:justify-between md:gap-4">
          <div className="flex items-center justify-between gap-2 md:contents">
            <h2
              className={cn(
                SECTION_HEADING_CLASS,
                "min-w-0 truncate capitalize",
              )}
            >
              {view === "year"
                ? format(currentMonth, "yyyy", { locale: tr })
                : format(currentMonth, "LLLL yyyy", { locale: tr })}
            </h2>
            <div className="shrink-0 md:hidden">{navControls}</div>
          </div>

          <div className="flex items-center gap-2 md:shrink-0">
            {viewControls}
            <div className="flex min-w-0 flex-1 justify-end md:flex-none">
              {categorySelect}
            </div>
            <div className="hidden md:block">{navControls}</div>
          </div>
        </div>
      </TooltipProvider>

      <p className="mb-3 rounded-md border border-dashed bg-muted/40 px-3 py-2 text-center text-xs text-muted-foreground md:hidden">
        Daha iyi bir deneyim için telefonunuzu yan çevirin.
      </p>

      {view === "year" ? (
        <TooltipProvider delayDuration={200}>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
            {monthsOfYear.map((month) => (
              <MiniMonth
                key={month.toISOString()}
                month={month}
                events={visibleEvents}
                onEventClick={onEventClick}
              />
            ))}
          </div>
        </TooltipProvider>
      ) : view === "list" ? (
        <div className="-mx-4 flex flex-col divide-y border-y sm:mx-0 sm:rounded-md sm:border">
          {listEvents.length === 0 ? (
            <p className="px-4 py-8 text-center text-sm text-muted-foreground">
              Bu ay gösterilecek bir şey yok.
            </p>
          ) : (
            listEvents.map((event) => (
              <ListEventRow
                key={event.id}
                event={event}
                onClick={onEventClick}
              />
            ))
          )}
        </div>
      ) : (
        <>
          <div className="min-w-0 overflow-x-auto">
            <div className="min-w-[280px]">
          <div className="grid grid-cols-7 border-b text-center text-[10px] font-medium uppercase text-muted-foreground sm:text-xs">
            {weekdayLabels.map((label) => (
              <div key={label} className="py-1.5 sm:py-2">
                {label}
              </div>
            ))}
          </div>

          <div className="grid grid-cols-7 overflow-hidden rounded-b-md border-l border-t">
            {days.map((day) => {
              const dayEvents = eventsForDay(visibleEvents, day);
              const hasOverflow = dayEvents.length > MAX_VISIBLE_PER_DAY;
              const visibleCount = hasOverflow
                ? MAX_VISIBLE_PER_DAY - 1
                : dayEvents.length;
              const visible = dayEvents.slice(0, visibleCount);
              const hiddenCount = dayEvents.length - visibleCount;
              const inMonth = isSameMonth(day, currentMonth);

              return (
                <div
                  key={day.toISOString()}
                  className={cn(
                    "flex flex-col overflow-hidden border-b border-r p-0.5 sm:p-1.5",
                    DAY_CELL_HEIGHT_CLASS,
                    !inMonth && "bg-muted/30 text-muted-foreground",
                  )}
                >
                  <div className="mb-0.5 flex shrink-0 justify-end sm:mb-1">
                    <span
                      className={cn(
                        "flex size-5 items-center justify-center rounded-full text-[10px] tabular-nums sm:size-6 sm:text-xs",
                        isToday(day) &&
                          "bg-primary font-semibold text-primary-foreground",
                      )}
                    >
                      {format(day, "d")}
                    </span>
                  </div>

                  <div className="flex min-h-0 flex-1 flex-col gap-1 overflow-hidden">
                    {visible.map((event) => (
                      <EventChip
                        key={event.id}
                        event={event}
                        onClick={onEventClick}
                      />
                    ))}
                    {hiddenCount > 0 && (
                      <DayMoreButton
                        day={day}
                        events={dayEvents.slice(visibleCount)}
                        hiddenCount={hiddenCount}
                        onEventClick={onEventClick}
                      />
                    )}
                  </div>
                </div>
              );
            })}
          </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
}

function MiniMonth({
  month,
  events,
  onEventClick,
}: {
  month: Date;
  events: CalendarEvent[];
  onEventClick?: (event: CalendarEvent) => void;
}) {
  const days = useMemo(() => getMonthGridDays(month), [month]);

  return (
    <div className="rounded-md border p-3">
      <div className="mb-2 text-sm font-semibold capitalize">
        {format(month, "LLLL", { locale: tr })}
      </div>

      <div className="grid grid-cols-7 gap-y-1">
        {days.map((day) => {
          const dayEvents = eventsForDay(events, day);
          const inMonth = isSameMonth(day, month);

          return (
            <div
              key={day.toISOString()}
              className="flex flex-col items-center gap-0.5"
            >
              <span
                className={cn(
                  "flex size-6 items-center justify-center rounded-full text-xs tabular-nums",
                  !inMonth && "text-muted-foreground/40",
                  isToday(day) &&
                    "bg-primary font-semibold text-primary-foreground",
                )}
              >
                {format(day, "d")}
              </span>

              {inMonth && dayEvents.length > 0 && (
                <div className="flex min-h-3 max-w-full items-center justify-center gap-0.5 px-0.5 py-0.5">
                  {dayEvents.slice(0, MAX_DOTS_PER_DAY).map((event) => {
                    const color = getCategoryColor(event.categorySlug);
                    return (
                      <Tooltip key={event.id}>
                        <TooltipTrigger asChild>
                          <button
                            type="button"
                            onClick={() => onEventClick?.(event)}
                            aria-label={event.title}
                            className={cn(
                              "size-1.5 shrink-0 cursor-pointer rounded-full transition-transform hover:scale-150",
                              color.dot,
                            )}
                          />
                        </TooltipTrigger>
                        <TooltipContent>{event.title}</TooltipContent>
                      </Tooltip>
                    );
                  })}
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}

const DAY_MORE_POPOVER_WIDTH = 224;
const MOBILE_POPOVER_HORIZONTAL_INSET = 16;

function DayMoreButton({
  day,
  events,
  hiddenCount,
  onEventClick,
}: {
  day: Date;
  events: CalendarEvent[];
  hiddenCount: number;
  onEventClick?: (event: CalendarEvent) => void;
}) {
  const [open, setOpen] = useState(false);
  const buttonRef = useRef<HTMLButtonElement>(null);
  const popoverRef = useRef<HTMLDivElement>(null);
  const [position, setPosition] = useState<{
    top: number;
    left: number;
  } | null>(null);

  useLayoutEffect(() => {
    if (!open || !buttonRef.current) {
      setPosition(null);
      return;
    }

    function updatePosition() {
      const button = buttonRef.current;
      const popover = popoverRef.current;
      if (!button) return;

      const rect = button.getBoundingClientRect();
      const isMobile = window.innerWidth < 640;
      const popoverWidth =
        popover?.offsetWidth ??
        (isMobile
          ? window.innerWidth - MOBILE_POPOVER_HORIZONTAL_INSET
          : DAY_MORE_POPOVER_WIDTH);
      const popoverHeight = popover?.offsetHeight ?? 0;
      const viewportPadding = 8;
      const gap = 4;

      let left = isMobile ? (window.innerWidth - popoverWidth) / 2 : rect.left;
      if (
        !isMobile &&
        left + popoverWidth > window.innerWidth - viewportPadding
      ) {
        left = window.innerWidth - popoverWidth - viewportPadding;
      }
      if (!isMobile) {
        left = Math.max(viewportPadding, left);
      }

      let top = rect.bottom + gap;
      if (
        popoverHeight > 0 &&
        top + popoverHeight > window.innerHeight - viewportPadding
      ) {
        top = Math.max(viewportPadding, rect.top - popoverHeight - gap);
      }

      setPosition({ top, left });
    }

    updatePosition();
    window.addEventListener("scroll", updatePosition, true);
    window.addEventListener("resize", updatePosition);

    return () => {
      window.removeEventListener("scroll", updatePosition, true);
      window.removeEventListener("resize", updatePosition);
    };
  }, [open, events.length]);

  return (
    <>
      <button
        ref={buttonRef}
        type="button"
        onClick={() => setOpen((v) => !v)}
        className="w-full shrink-0 cursor-pointer rounded-md px-1.5 py-0.5 text-left text-xs font-medium text-muted-foreground hover:bg-accent"
      >
        +{hiddenCount} daha
      </button>

      {open &&
        createPortal(
          <>
            <div
              className="fixed inset-0 z-40"
              onClick={() => setOpen(false)}
              aria-hidden
            />
            <div
              ref={popoverRef}
              style={
                position
                  ? { top: position.top, left: position.left }
                  : { top: 0, left: 0, visibility: "hidden" }
              }
              className="fixed z-50 w-[calc(100%-16px)] max-h-[min(24rem,calc(100vh-1rem))] overflow-y-auto rounded-md border bg-popover p-2 text-popover-foreground shadow-lg sm:w-56"
            >
              <div className="mb-1 px-1 text-xs font-semibold capitalize text-muted-foreground">
                {format(day, "d MMMM yyyy", { locale: tr })}
              </div>
              <div className="flex flex-col gap-1">
                {events.map((event) => (
                  <EventChip
                    key={event.id}
                    event={event}
                    onClick={(e) => {
                      setOpen(false);
                      onEventClick?.(e);
                    }}
                  />
                ))}
              </div>
            </div>
          </>,
          document.body,
        )}
    </>
  );
}
