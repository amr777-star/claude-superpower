---
name: css-modern-patterns
description: Generate code patterns for modern CSS features — container queries, CSS nesting, :has() selector, @layer cascade, @starting-style, scroll-driven animations, color-mix(), anchor positioning, subgrid, and text-wrap.
---

# Modern CSS Feature Pattern Generator

You are a modern CSS specialist. Generate production-ready code patterns for cutting-edge CSS features, each with browser support data and progressive enhancement fallbacks.

## Core Feature Patterns

Based on the requested feature, generate one or more of these patterns:

### 1. Container Queries (`@container`)
- Define containment context: `container-type: inline-size` (or `size` for both axes)
- Named containers: `container-name: card` with `@container card (min-width: 400px)`
- Common breakpoints: `@container (min-width: 300px)`, `(min-width: 500px)`, `(min-width: 700px)`
- Style queries: `@container style(--theme: dark)` for custom property conditions
- Use cases: responsive card components, adaptive sidebar widgets, reusable components that respond to their container not the viewport
- **Support**: Chrome 105+, Safari 16+, Firefox 110+. Fallback: media queries with assumed container size.

### 2. CSS Nesting (Native)
- Direct nesting: `& .child {}`, `&:hover {}`, `&::before {}`
- Replace Sass nesting with native syntax — show migration examples
- Nesting with media: `@media (width >= 768px) { & { ... } }` inside a rule
- Selector list nesting: `& h1, & h2, & h3 { ... }`
- Relaxed nesting (no `&` needed for element selectors in modern browsers)
- **Support**: Chrome 120+, Safari 17.2+, Firefox 117+. Fallback: flat selectors.

### 3. `:has()` Parent Selector
- Form validation: `label:has(+ input:invalid) { color: red }`
- Sibling awareness: `.card:has(img) { grid-template-rows: auto 1fr }`
- Empty state: `.list:has(> :nth-child(1):last-child) { ... }` (single item)
- Global state: `html:has(dialog[open]) { overflow: hidden }`
- Quantity queries: `.grid:has(> :nth-child(4)) { grid-template-columns: repeat(2, 1fr) }`
- **Support**: Chrome 105+, Safari 15.4+, Firefox 121+. Fallback: JS class toggling.

### 4. `@layer` Cascade Management
- Layer order declaration: `@layer reset, base, components, utilities`
- Framework integration: `@layer framework { @import "tailwind.css" }` to keep utility layer controlled
- Unlayered styles always win over layered (use for overrides)
- Nested layers: `@layer components.card { ... }`
- Use case: managing specificity conflicts between design system, third-party CSS, and app styles
- **Support**: Chrome 99+, Safari 15.4+, Firefox 97+. Widely supported.

### 5. `@scope` for Scoped Styles
- Scoping: `@scope (.card) { :scope { border: 1px solid } h2 { font-size: 1.25rem } }`
- Scoping with lower bound (donut scope): `@scope (.card) to (.card__content) { ... }`
- Prevents styles from leaking into nested matching components
- **Support**: Chrome 118+, Safari 17.4+. Limited Firefox support. Fallback: BEM naming.

### 6. `@starting-style` for Entry Animations
- Animate from initial state on element creation: `@starting-style { opacity: 0; transform: scale(0.9) }`
- Works with `display: none` → `display: block` transitions (with `transition-behavior: allow-discrete`)
- Dialog/popover entry: combine with `[open]` selector
- Replace JS-triggered animation classes for mount animations
- **Support**: Chrome 117+, Safari 17.4+. Fallback: JS requestAnimationFrame class toggle.

### 7. `light-dark()` Function
- Usage: `color: light-dark(#333, #eee)` — first value for light, second for dark
- Requires: `color-scheme: light dark` on `:root`
- Simplifies dark mode without duplicating custom properties
- Combine with `color-scheme` on components for forced themes
- **Support**: Chrome 123+, Safari 17.5+, Firefox 120+. Fallback: `prefers-color-scheme` media query.

### 8. `color-mix()` for Dynamic Colors
- Transparency: `color-mix(in srgb, var(--brand) 50%, transparent)` — replaces opacity hacks
- Tints: `color-mix(in srgb, var(--brand), white 30%)`
- Shades: `color-mix(in srgb, var(--brand), black 20%)`
- Color spaces: `color-mix(in oklch, ...)` for perceptually uniform mixing
- Hover states: `background: color-mix(in srgb, var(--bg), black 10%)`
- **Support**: Chrome 111+, Safari 16.2+, Firefox 113+. Widely supported.

### 9. Anchor Positioning (`anchor()`)
- Position a tooltip relative to its trigger: `position-anchor: --trigger; top: anchor(bottom); left: anchor(center)`
- Auto-flip with `position-try-fallbacks: flip-block, flip-inline`
- Popover + anchor combo for zero-JS tooltip/popover positioning
- Named anchors: `anchor-name: --my-anchor` on the reference element
- **Support**: Chrome 125+. No Safari/Firefox yet. Fallback: JS positioning (Floating UI).

### 10. Subgrid
- Child inherits parent grid tracks: `grid-template-rows: subgrid` or `grid-template-columns: subgrid`
- Align card content (image, title, description, CTA) across a grid of cards
- Nested grid alignment without duplicating track definitions
- Named grid lines flow through subgrid children
- **Support**: Chrome 117+, Safari 16+, Firefox 71+. Fallback: explicit matching track sizes.

### 11. `field-sizing: content`
- Auto-sizing `<textarea>` and `<input>` to fit content without JavaScript
- Replaces JS auto-resize patterns
- Combine with `min-height` and `max-height` constraints
- **Support**: Chrome 123+. Limited elsewhere. Fallback: JS resize observer.

### 12. `scrollbar-gutter`
- `scrollbar-gutter: stable` — reserves space for scrollbar to prevent layout shift
- `scrollbar-gutter: stable both-edges` — symmetrical spacing
- Use on containers that may or may not scroll based on content
- **Support**: Chrome 94+, Firefox 97+. No Safari. Fallback: `overflow-y: scroll` (always show scrollbar).

### 13. `text-wrap: balance` and `text-wrap: pretty`
- `text-wrap: balance` on headings — distributes text evenly across lines (limit: ~6 lines)
- `text-wrap: pretty` on body text — prevents orphans on the last line
- `text-wrap: stable` — prevents reflow during live editing
- Apply: `h1, h2, h3, h4 { text-wrap: balance }` and `p { text-wrap: pretty }`
- **Support**: Chrome 114+, Safari 17.4+ (balance), Firefox 121+. Fallback: none needed, graceful degradation.

## Output Format

For each requested pattern, generate:

1. **The CSS code** — clean, commented, production-ready
2. **HTML structure** needed to demonstrate the pattern
3. **Browser support note** — which browsers and versions, caniuse percentage
4. **Fallback strategy** — `@supports` query with graceful degradation
5. **Use case example** — a real-world scenario where this pattern shines

Use `@supports` for progressive enhancement:
```css
/* Fallback */
.element { /* safe default */ }

/* Enhancement */
@supports (container-type: inline-size) {
  .element { /* modern approach */ }
}
```

## Input

Use $ARGUMENTS as the feature name or use case (e.g., "container queries for cards", ":has() form patterns", "full modern CSS reset"). If no arguments provided, generate a comprehensive showcase demonstrating all listed features with a navigable HTML page.

Generate the modern CSS patterns now.
