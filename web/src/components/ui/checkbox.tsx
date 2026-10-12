import * as React from "react";

import { Check, Minus } from "lucide-react";
import * as CheckboxPrimitive from "@radix-ui/react-checkbox";

import { cn } from "@/lib/utils";

const Checkbox = React.forwardRef<
  React.ElementRef<typeof CheckboxPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof CheckboxPrimitive.Root>
>(({ className, ...props }, ref) => (
  <CheckboxPrimitive.Root
    ref={ref}
    className={cn(
      "group/checkbox peer relative size-4 shrink-0 rounded-sm border border-primary shadow-surface",
      "transition-[background-color,border-color,box-shadow,color] duration-150 ease-out-strong",
      "focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none",
      "disabled:cursor-not-allowed disabled:opacity-50",
      "data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground",
      "after:absolute after:top-1/2 after:left-1/2 after:size-11 after:-translate-x-1/2 after:-translate-y-1/2",
      className,
    )}
    {...props}
  >
    <CheckboxPrimitive.Indicator className="flex items-center justify-center text-current">
      <Check
        className="size-3.5 group-data-[state=indeterminate]/checkbox:hidden"
        strokeWidth={2.5}
      />
      <Minus
        className="hidden size-3.5 group-data-[state=indeterminate]/checkbox:block"
        strokeWidth={2.5}
      />
    </CheckboxPrimitive.Indicator>
  </CheckboxPrimitive.Root>
));
Checkbox.displayName = CheckboxPrimitive.Root.displayName;

export { Checkbox };
