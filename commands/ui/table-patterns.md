---
name: table-patterns
description: Generate data table and data grid patterns — sortable columns, pagination, filtering, virtual scrolling, responsive behavior, and accessible table markup using TanStack Table.
---

# Data Table Pattern Generator

You are a data table and data grid specialist. Generate production-ready data table patterns using React, TypeScript, TanStack Table (React Table v8), and shadcn/ui Table components.

## Core Patterns to Cover

Based on the requested data type, generate one or more of these patterns:

### 1. Sortable Columns
- Click column header to sort ascending → descending → unsorted
- `aria-sort="ascending|descending|none"` on `<th>` elements
- Visual sort indicator (arrow icons) in header
- Multi-column sort support with Shift+click
- Stable sort that preserves order of equal elements

### 2. Pagination
- **Client-side**: Full dataset loaded, paginated in memory with `getPaginationRowModel()`
- **Server-side**: API-driven with page/pageSize params, total count, loading states
- Page size selector (10, 25, 50, 100)
- Page navigation: first, previous, next, last, plus page number input
- "Showing X–Y of Z results" summary text

### 3. Column Filtering
- Per-column text filter inputs below headers
- Global search across all columns with debounce
- Faceted filters (dropdown/multi-select for enum columns)
- Date range filters for date columns
- Active filter chips with clear buttons

### 4. Column Resizing
- Drag column borders to resize with `getResizingRowModel()`
- Minimum column width constraints
- Double-click border to auto-fit content width
- Persist column widths to localStorage

### 5. Row Selection
- Checkbox column with select-all in header
- Indeterminate state when partially selected
- Bulk action toolbar that appears when rows are selected
- `aria-selected` on selected rows
- Shift+click for range selection

### 6. Expandable Rows
- Expand/collapse button to reveal detail panel
- `aria-expanded` on toggle button
- Nested table or custom detail component in expanded area
- Expand-all / collapse-all control

### 7. Virtual Scrolling (Large Datasets)
- TanStack Virtual (`@tanstack/react-virtual`) for 10k+ row performance
- Fixed header during scroll
- Smooth scrolling with overscan rows
- Row height estimation for variable-height rows
- Scroll-to-row API for programmatic navigation

### 8. Responsive Strategies
- **Desktop**: Full table with horizontal scroll if needed
- **Tablet**: Priority columns visible, secondary columns in expandable row
- **Mobile**: Card layout transformation — each row becomes a labeled card
- Breakpoint detection with container queries or media queries

### 9. Editable Cells
- Double-click or Enter to edit inline
- Cell-level validation with error styling
- Tab navigation between editable cells
- Escape to cancel edit, Enter to confirm
- Optimistic updates with rollback on API failure

## Technology Stack

- **TanStack Table** (`@tanstack/react-table` v8) for headless table logic
- **TanStack Virtual** (`@tanstack/react-virtual`) for virtualization
- **shadcn/ui** Table, Input, Button, Checkbox, Select, DropdownMenu components
- **TypeScript** with strict column type definitions

## Accessibility Requirements

- Semantic `<table>`, `<thead>`, `<tbody>`, `<th>`, `<td>` markup
- `role="grid"` for interactive tables with editable cells
- `aria-sort` on sortable column headers
- `aria-selected` on selectable rows
- `aria-expanded` on expandable row toggles
- Keyboard navigation: Arrow keys between cells (grid pattern), Enter to activate
- Screen reader announcements for sort changes, filter results count, selection count

## Output Format

Generate complete, copy-pasteable React component code with:
- TypeScript type definitions for the data shape
- TanStack Table column definitions with full feature configuration
- Full JSX with shadcn/ui Table components
- Utility hooks for pagination, filtering, and sorting state
- Inline comments explaining accessibility markup

## Input

Use $ARGUMENTS as the data type or description (e.g., "user management table", "product inventory grid", "order history"). If no arguments provided, generate a full-featured user management table demonstrating all patterns.

Generate the data table pattern now.
