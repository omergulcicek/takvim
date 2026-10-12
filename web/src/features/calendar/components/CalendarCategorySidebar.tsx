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
import type { CategorySelectGroup } from "@/features/calendar/helpers/category-groups";

type GroupableCategory = CategoryRow & { key: string };
type FilterGroup = CategorySelectGroup<GroupableCategory>;

type CalendarCategorySidebarProps = {
  categories: CategoryRow[];
  selectedSlugs: ReadonlySet<string>;
  onSelectedSlugsChange: (next: Set<string>) => void;
  mobileSheetOpen: boolean;
  onMobileSheetOpenChange: (open: boolean) => void;
};

function selectionState(
  slugs: readonly string[],
  selectedSlugs: ReadonlySet<string>,
): boolean | "indeterminate" {
  const selectedCount = slugs.reduce((count, slug) => count + (selectedSlugs.has(slug) ? 1 : 0), 0);
  if (selectedCount === 0) return false;
  if (selectedCount === slugs.length) return true;
  return "indeterminate";
}

function withIndeterminateStyles(checkboxClass: string): string {
  return checkboxClass
    .split(" ")
    .flatMap((token) =>
      token.includes("data-[state=checked]:")
        ? [token, token.replaceAll("data-[state=checked]:", "data-[state=indeterminate]:")]
        : [token],
    )
    .join(" ");
}

function CategoryFilterList({
  groups,
  ungrouped,
  selectedSlugs,
  onToggle,
  onToggleGroup,
  idPrefix,
}: {
  groups: FilterGroup[];
  ungrouped: GroupableCategory[];
  selectedSlugs: ReadonlySet<string>;
  onToggle: (slug: string, checked: boolean) => void;
  onToggleGroup: (slugs: readonly string[], checked: boolean) => void;
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

  function renderGroupToggle(group: FilterGroup) {
    const slugs = group.categories.map((category) => category.slug);
    const checked = selectionState(slugs, selectedSlugs);
    const color = getCategoryColor(group.colorSlug);
    const id = `${idPrefix}-group-${group.label.toLocaleLowerCase("tr").replace(/\s+/g, "-")}`;

    return (
      <Label
        key={id}
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
          onCheckedChange={(value) => onToggleGroup(slugs, value === true)}
          className={withIndeterminateStyles(color.checkbox)}
        />
        <span className="min-w-0 flex-1 truncate text-sm font-medium">{group.label}</span>
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
            {group.nested ? renderGroupToggle(group) : null}
            <div className={cn("flex flex-col gap-0.5", group.nested && "ps-4")}>
              {group.categories.map(renderCategoryCheckbox)}
            </div>
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

  function toggleGroup(slugs: readonly string[], checked: boolean) {
    const next = new Set(selectedSlugs);
    for (const slug of slugs) {
      if (checked) {
        next.add(slug);
      } else {
        next.delete(slug);
      }
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
            onToggleGroup={toggleGroup}
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
          onToggleGroup={toggleGroup}
          idPrefix="calendar-filter"
        />
      </aside>
    </>
  );
}
