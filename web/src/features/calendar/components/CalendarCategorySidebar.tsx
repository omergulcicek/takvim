import { useMemo } from "react";
import type { JSX } from "react";

import { ListFilter } from "lucide-react";

import { cn } from "@/lib/utils";

import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Label } from "@/components/ui/label";
import { Sheet, SheetContent, SheetHeader, SheetTitle } from "@/components/ui/sheet";
import type { CategoryRow } from "@/features/calendar/api/categories";
import { getCategoryColor } from "@/features/calendar/helpers/categories";
import { groupCategoriesForSelect } from "@/features/calendar/helpers/category-groups";

type GroupableCategory = CategoryRow & { key: string };

type CalendarCategorySidebarProps = {
  categories: CategoryRow[];
  selectedSlugs: ReadonlySet<string>;
  onSelectedSlugsChange: (next: Set<string>) => void;
  mobileSheetOpen: boolean;
  onMobileSheetOpenChange: (open: boolean) => void;
};

function CategoryFilterList({
  groups,
  ungrouped,
  selectedSlugs,
  onToggle,
  idPrefix,
}: {
  groups: { label: string; categories: GroupableCategory[] }[];
  ungrouped: GroupableCategory[];
  selectedSlugs: ReadonlySet<string>;
  onToggle: (slug: string, checked: boolean) => void;
  idPrefix: string;
}): JSX.Element {
  function renderCategoryCheckbox(category: GroupableCategory) {
    const color = getCategoryColor(category.slug);
    const checked = selectedSlugs.has(category.slug);
    const id = `${idPrefix}-${category.slug}`;

    return (
      <Label
        key={category.slug}
        htmlFor={id}
        className={cn(
          "flex min-h-9 cursor-pointer items-center gap-2.5 rounded-lg px-0 py-1.5",
          "transition-colors duration-150 ease-out-strong",
          "hover:bg-accent/50",
        )}
      >
        <Checkbox
          id={id}
          checked={checked}
          onCheckedChange={(value) => onToggle(category.slug, value === true)}
          className={color.checkbox}
        />
        <span className="min-w-0 flex-1 truncate text-sm font-medium">{category.name}</span>
      </Label>
    );
  }

  return (
    <div className="flex flex-col gap-4">
      {groups.map((group) => (
        <div key={group.label} className="flex flex-col gap-1">
          <h3 className="text-xs font-medium tracking-wide text-muted-foreground uppercase">
            {group.label}
          </h3>
          <div className="flex flex-col gap-0.5">
            {group.categories.map(renderCategoryCheckbox)}
          </div>
        </div>
      ))}
      {ungrouped.length > 0 ? (
        <div className="flex flex-col gap-1">
          <h3 className="text-xs font-medium tracking-wide text-muted-foreground uppercase">
            Diğer
          </h3>
          <div className="flex flex-col gap-0.5">{ungrouped.map(renderCategoryCheckbox)}</div>
        </div>
      ) : null}
    </div>
  );
}

export function CalendarCategoryFilterButton({
  selectedCount,
  onClick,
}: {
  selectedCount: number;
  onClick: () => void;
}): JSX.Element {
  return (
    <Button
      type="button"
      variant="outline"
      size="sm"
      className="gap-1.5 lg:hidden"
      aria-label="Takvim filtrelerini aç"
      onClick={onClick}
    >
      <ListFilter className="size-4" strokeWidth={2} />
      <span>Filtreler</span>
      <span className="text-muted-foreground tabular-nums">({selectedCount})</span>
    </Button>
  );
}

export function CalendarCategorySidebar({
  categories,
  selectedSlugs,
  onSelectedSlugsChange,
  mobileSheetOpen,
  onMobileSheetOpenChange,
}: CalendarCategorySidebarProps): JSX.Element {
  const { groups, ungrouped } = useMemo(
    () =>
      groupCategoriesForSelect(
        categories.map((category): GroupableCategory => ({
          ...category,
          key: category.slug,
        })),
      ),
    [categories],
  );

  function toggleSlug(slug: string, checked: boolean) {
    const next = new Set(selectedSlugs);
    if (checked) {
      next.add(slug);
    } else {
      next.delete(slug);
    }
    onSelectedSlugsChange(next);
  }

  return (
    <>
      <Sheet open={mobileSheetOpen} onOpenChange={onMobileSheetOpenChange}>
        <SheetContent
          side="left"
          className="flex w-[min(100%,20rem)] flex-col gap-4 overflow-y-auto lg:hidden"
        >
          <SheetHeader className="text-left">
            <SheetTitle>Takvimler</SheetTitle>
          </SheetHeader>
          <CategoryFilterList
            groups={groups}
            ungrouped={ungrouped}
            selectedSlugs={selectedSlugs}
            onToggle={toggleSlug}
            idPrefix="calendar-filter-sheet"
          />
        </SheetContent>
      </Sheet>

      <aside
        className="hidden w-56 shrink-0 lg:sticky lg:top-24 lg:block lg:self-start"
        aria-label="Takvim kategorileri"
      >
        <h2 className="mb-3 flex h-8 items-center text-sm font-semibold tracking-tight">
          Takvimler
        </h2>
        <CategoryFilterList
          groups={groups}
          ungrouped={ungrouped}
          selectedSlugs={selectedSlugs}
          onToggle={toggleSlug}
          idPrefix="calendar-filter"
        />
      </aside>
    </>
  );
}
