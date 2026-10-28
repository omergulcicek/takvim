import { format, isSameDay } from "date-fns";
import { tr } from "date-fns/locale";

import { formatEventDateWithHijri } from "@/lib/hijri/hijri-date";
import { cn } from "@/lib/utils";

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import type { CalendarEvent } from "@/features/calendar/components/MonthCalendar";
import { getCategoryColor } from "@/features/calendar/helpers/categories";
import { decodeUrlForDisplay } from "@/features/calendar/helpers/decode-url";

type EventDetailDialogProps = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  event: CalendarEvent | null;
};

export function EventDetailDialog({ open, onOpenChange, event }: EventDetailDialogProps) {
  const dateStart = event?.displayStart ?? event?.start;
  const dateEnd = event?.displayEnd ?? event?.end;
  const hasEnd = dateStart != null && dateEnd != null && dateEnd.getTime() !== dateStart.getTime();
  const isAllDay = event?.allDay ?? false;
  const isMultiDay = dateStart != null && dateEnd != null && !isSameDay(dateStart, dateEnd);
  const firstCategory = event?.categories[0];
  const color = getCategoryColor(firstCategory?.slug);

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent>
        {event && (
          <>
            <DialogHeader>
              <DialogTitle>{event.title}</DialogTitle>
              {event.categories.length > 0 && (
                <DialogDescription className="flex items-center gap-2">
                  <span className={cn("size-2 rounded-full", color.dot)} aria-hidden />
                  {event.categories.map((c) => c.name).join(", ")}
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
                      event.hijri ?? null,
                    )}
                  </dd>
                </div>
              ) : (
                <>
                  <div>
                    <dt className="font-medium text-muted-foreground">Başlangıç</dt>
                    <dd className="mt-0.5 tabular-nums">
                      {format(event.start, "dd MMMM yyyy, HH:mm", { locale: tr })}
                    </dd>
                  </div>

                  {hasEnd && (
                    <div>
                      <dt className="font-medium text-muted-foreground">Bitiş</dt>
                      <dd className="mt-0.5 tabular-nums">
                        {format(event.end, "dd MMMM yyyy, HH:mm", { locale: tr })}
                      </dd>
                    </div>
                  )}
                </>
              )}

              {event.location && (
                <div>
                  <dt className="font-medium text-muted-foreground">Yer</dt>
                  <dd className="mt-0.5">{event.location}</dd>
                </div>
              )}

              {event.description && (
                <div>
                  <dt className="font-medium text-muted-foreground">Açıklama</dt>
                  <dd className="mt-0.5 whitespace-pre-wrap">{event.description}</dd>
                </div>
              )}

              {event.sourceUrl && (
                <div>
                  <dt className="font-medium text-muted-foreground">Kaynak</dt>
                  <dd className="mt-0.5">
                    <a
                      href={event.sourceUrl}
                      target="_blank"
                      rel="noreferrer"
                      className="font-medium text-brand underline-offset-4 hover:underline"
                    >
                      {decodeUrlForDisplay(event.sourceUrl)}
                    </a>
                  </dd>
                </div>
              )}
            </dl>
          </>
        )}
      </DialogContent>
    </Dialog>
  );
}
