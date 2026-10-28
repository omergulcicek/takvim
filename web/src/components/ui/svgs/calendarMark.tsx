import type { SVGProps } from "react";

import { cn } from "@/lib/utils";

/**
 * Projenin kendi işareti: takvim ızgarası ve vurgulanmış "bugün". Noktalar
 * zemin rengiyle oyulur, böylece açık ve koyu temada da marka renginden ayrışır.
 */
const CalendarMark = ({ className, ...props }: SVGProps<SVGSVGElement>) => (
  <svg {...props} className={cn("size-6", className)} viewBox="0 0 24 24" fill="none">
    <path d="M8 2.5v3M16 2.5v3" className="stroke-brand" strokeWidth="2.5" strokeLinecap="round" />
    <rect x="2.5" y="4.5" width="19" height="17" rx="5.5" className="fill-brand" />
    <circle cx="9" cy="11.5" r="1.4" className="fill-background opacity-45" />
    <circle cx="15" cy="11.5" r="1.4" className="fill-background opacity-45" />
    <circle cx="9" cy="16.5" r="1.4" className="fill-background opacity-45" />
    <circle cx="15" cy="16.5" r="1.4" className="fill-background" />
  </svg>
);

export { CalendarMark };
