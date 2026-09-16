import { SITE_DESCRIPTION } from "@/features/calendar/data/site-nav";

export function CalendarHero() {
  return (
    <p className="mx-auto my-10 max-w-3xl text-center text-sm text-balance text-muted-foreground sm:text-base md:my-30">
      {SITE_DESCRIPTION}
    </p>
  );
}
