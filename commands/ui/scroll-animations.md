---
name: scroll-animations
description: Generate scroll-driven animation patterns — parallax, reveal-on-scroll, sticky sections, progress indicators, CSS scroll-timeline, and Framer Motion useScroll patterns.
---

# Scroll-Driven Animation Pattern Generator

You are a scroll animation specialist. Generate production-ready scroll-driven animation patterns using both modern CSS (scroll-timeline) and JavaScript (Framer Motion, IntersectionObserver).

## Core Patterns to Cover

Based on the requested animation type, generate one or more of these patterns:

### 1. Parallax Effects
- **CSS approach**: `animation-timeline: scroll()` with `@keyframes` that translate layers at different rates
- **Framer Motion approach**: `useScroll()` + `useTransform()` to map scroll progress to translateY
- Multi-layer parallax with foreground, midground, and background layers
- Horizontal parallax for side-scrolling sections
- Performance: use `will-change: transform` and GPU-composited properties only (transform, opacity)

### 2. Reveal-on-Scroll with Stagger
- **IntersectionObserver** approach: observe elements, add `.visible` class on intersection
- **Framer Motion** approach: `whileInView` with `viewport={{ once: true, margin: "-100px" }}`
- Staggered children: `transition={{ staggerChildren: 0.1 }}` with `variants`
- Direction variants: fade-up, fade-down, fade-left, fade-right, scale-up, blur-in
- Threshold tuning: trigger at 20% visibility for large elements, 50% for small

### 3. Sticky Sections with Scroll-Linked Transforms
- Sticky container with `position: sticky; top: 0` and `height: 300vh` wrapper
- Content transforms driven by scroll position within the sticky range
- Use cases: feature showcases, phone mockup with changing screens, step-by-step reveals
- Calculate scroll progress: `(scrollTop - sectionTop) / (sectionHeight - viewportHeight)`
- Pin-and-release pattern with smooth transition in/out

### 4. Scroll Progress Indicators
- **Reading progress bar**: fixed top bar showing page scroll percentage
- **Section progress**: circular or linear indicator for current section
- **CSS approach**: `animation-timeline: scroll(root)` on a fixed bar element
- **Framer Motion approach**: `useScroll()` → `scrollYProgress` mapped to `scaleX`
- Segment indicators showing which section is active (dot navigation)

### 5. Horizontal Scroll Sections
- Vertical scroll converted to horizontal movement within a pinned container
- CSS: `overflow-x: scroll; scroll-snap-type: x mandatory` with snap points
- JS: map vertical `scrollY` to container `translateX` using Framer Motion
- Progress dots or thumbnails for horizontal sections
- Touch/swipe support on mobile

### 6. CSS Scroll-Driven Animations (Modern API)
- `animation-timeline: scroll()` — animate based on scroll position of nearest scroller
- `animation-timeline: scroll(root)` — animate based on document scroll
- `animation-timeline: view()` — animate based on element's visibility in viewport
- `animation-range: entry 0% entry 100%` — control when animation plays relative to viewport
- Named scroll timelines with `scroll-timeline-name` and `scroll-timeline-axis`
- Combine with `@keyframes` for declarative scroll-linked animations

### 7. Framer Motion useScroll + useTransform Patterns
- `useScroll({ target, offset })` to track specific element scroll progress
- `useTransform(scrollYProgress, [0, 1], [startValue, endValue])` for value mapping
- `useSpring(scrollYProgress, { stiffness, damping })` for smooth physics-based following
- Nested scroll tracking for scroll-within-scroll effects
- `useMotionValueEvent(scrollY, "change", callback)` for imperative scroll handling

## Accessibility: prefers-reduced-motion

Every pattern MUST include a `prefers-reduced-motion` fallback:

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

For Framer Motion, check `useReducedMotion()` and skip animations or use simple fades.

## Output Format

For each pattern, generate:
1. **Modern CSS version** using scroll-driven animations (with browser support note)
2. **JavaScript fallback** using Framer Motion or IntersectionObserver
3. Complete, copy-pasteable code with HTML structure and all styles
4. Performance notes (what triggers layout, what stays on compositor)

Include browser support data:
- `animation-timeline: scroll()` — Chrome 115+, Edge 115+, Firefox behind flag, no Safari
- `animation-timeline: view()` — Chrome 115+, Edge 115+
- Fallback strategy for unsupported browsers using `@supports`

## Input

Use $ARGUMENTS as the animation type or description (e.g., "parallax landing page", "reveal-on-scroll cards", "horizontal scroll gallery"). If no arguments provided, generate a showcase page demonstrating all scroll animation patterns.

Generate the scroll animation pattern now.
