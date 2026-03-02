# Design Intelligence: 2025-2026 Visual Design Standards

> Comprehensive design knowledge compiled from Dribbble, Awwwards, and leading design resources.
> Embed this into agent prompts so Claude generates UI matching current professional standards.
> Last updated: March 2026

---

## 1. Color System

### 1.1 Primary Palettes (2025-2026)

**Cool Blues & Blue-Greens** (dominant trend):
```
Primary:       #3B82F6 (blue-500)    — clean, trustworthy, tech-forward
               #0EA5E9 (sky-500)     — fresh, modern SaaS
               #06B6D4 (cyan-500)    — blue-green, THE color of 2026
               #2563EB (blue-600)    — deeper authority blue
```

**Warm Neutrals** (returning trend):
```
Background:    #FAFAF9 (stone-50)    — warm white
               #F5F5F4 (stone-100)   — off-white cards
               #F0EEE9              — Pantone Cloud Dancer 2026 COTY
               #E7E5E4 (stone-200)   — borders, dividers
Surface:       #FAFAFA              — card backgrounds
               #F8F7F5              — warm surface
```

**Neo-Mint & Pastels**:
```
Accent:        #A7F3D0 (emerald-200) — neo-mint
               #C4B5FD (violet-300)  — soft purple
               #FBCFE8 (pink-200)    — pastel pink
               #FDE68A (amber-200)   — warm pastel gold
```

**Neon Micro-Accents** (for SaaS/tech):
```
Accent:        #F43F5E (rose-500)    — electric fuchsia
               #06B6D4 (cyan-500)    — clear cyan
               #8B5CF6 (violet-500)  — vivid purple
               #F59E0B (amber-500)   — amber haze
               #10B981 (emerald-500) — minty green
```

### 1.2 Semantic Colors

```
Success:       #22C55E (green-500)   | Background: #F0FDF4 | Border: #BBF7D0
Warning:       #F59E0B (amber-500)   | Background: #FFFBEB | Border: #FDE68A
Error:         #EF4444 (red-500)     | Background: #FEF2F2 | Border: #FECACA
Info:          #3B82F6 (blue-500)    | Background: #EFF6FF | Border: #BFDBFE
```

### 1.3 Dark Mode Colors

Never use pure black (#000000). Use elevated dark surfaces:
```
Background:    #09090B (zinc-950)    — deepest layer
               #0A0A0A              — near-black, softer
               #121212              — Google Material dark
               #1C1C1C              — comfortable dark gray
Surface-1:     #18181B (zinc-900)    — cards, primary surface
Surface-2:     #27272A (zinc-800)    — elevated cards, modals
Surface-3:     #3F3F46 (zinc-700)    — hover states, active surfaces
Border:        #27272A (zinc-800)    — subtle borders
               #3F3F46 (zinc-700)    — visible borders
Text:          #FAFAFA (zinc-50)     — primary text
               #A1A1AA (zinc-400)    — secondary text
               #71717A (zinc-500)    — muted text
```

Surface elevation in dark mode: express depth through lighter shades of gray, NOT through shadows.
Each elevation layer should be ~4-8% lighter than the layer beneath it.

### 1.4 Color Application Rules

- **60-30-10 Rule**: 60% neutral/background, 30% secondary, 10% accent/CTA
- **Contrast ratios**: Minimum 4.5:1 for normal text, 3:1 for large text (WCAG AA)
- **Saturated colors on dark backgrounds**: Reduce saturation by 10-20% to avoid eye strain
- **Brand color usage**: Primary color appears in CTAs, links, active states, and key interactive elements only
- **Never use more than 3 saturated colors** in a single view

---

## 2. Typography

### 2.1 Font Stacks

**Primary UI Font (recommended)**:
```css
/* Modern geometric humanist — the gold standard for UI */
font-family: 'Inter', 'Geist Sans', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;

/* System font stack — zero load time */
font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;

/* Monospace — for code and data */
font-family: 'Geist Mono', 'JetBrains Mono', 'Fira Code', 'SF Mono', 'Cascadia Code', 'Menlo', 'Consolas', monospace;
```

**Top fonts for 2025-2026 UI work**:
- **Inter** — The most popular UI font. Variable font. Excellent readability at all sizes. Used by most SaaS products.
- **Geist Sans** — Vercel's font. Slightly rounder than Inter, friendlier apertures. Free, npm-installable. Optimal for Next.js/React.
- **Manrope** — Geometric sans with personality. Good for headings + body.
- **Plus Jakarta Sans** — Warm geometric sans. Popular in fintech/startup branding.
- **DM Sans** — Clean geometric. Google Fonts. Good free alternative.
- **Satoshi** — Modern geometric with character. Popular on Dribbble.
- **Cabinet Grotesk** — Bold, distinctive headings. Pairs with Inter for body.
- **General Sans** — Versatile, clean, modern. Good heading font.

### 2.2 Type Scale

Use a **Major Third (1.25)** or **Perfect Fourth (1.333)** scale:

```
/* Major Third Scale — balanced, professional */
--text-xs:    0.75rem;    /* 12px */
--text-sm:    0.875rem;   /* 14px */
--text-base:  1rem;       /* 16px — body baseline */
--text-lg:    1.125rem;   /* 18px */
--text-xl:    1.25rem;    /* 20px */
--text-2xl:   1.5rem;     /* 24px */
--text-3xl:   1.875rem;   /* 30px */
--text-4xl:   2.25rem;    /* 36px */
--text-5xl:   3rem;       /* 48px */
--text-6xl:   3.75rem;    /* 60px — hero headings */
--text-7xl:   4.5rem;     /* 72px — oversized display */
```

**Desktop heading sizes**:
```
H1:  40px–52px  (2.5rem–3.25rem)   — weight: 700-800
H2:  28px–40px  (1.75rem–2.5rem)   — weight: 600-700
H3:  20px–26px  (1.25rem–1.625rem) — weight: 600
H4:  18px–20px  (1.125rem–1.25rem) — weight: 600
Body: 16px–18px (1rem–1.125rem)    — weight: 400
Small: 14px     (0.875rem)          — weight: 400
Tiny:  12px     (0.75rem)           — weight: 500
```

**Mobile heading sizes** (scale down ~20-25%):
```
H1:  32px–40px
H2:  24px–32px
H3:  18px–22px
Body: 16px (never go below 16px on mobile)
```

### 2.3 Line Height

```
Headings (large):   1.1–1.2   (tight)
Headings (medium):  1.2–1.3
Body text:          1.5–1.6   (WCAG minimum: 1.5)
Small/caption text: 1.4–1.5
Long-form reading:  1.6–1.8
```

### 2.4 Letter Spacing

```
Uppercase labels:   0.05em–0.1em  (ALWAYS add tracking to all-caps)
Large headings:     -0.02em to -0.03em (slight tightening)
Body text:          0 (normal)
Small text:         0.01em (slight loosening)
```

### 2.5 Font Weight Usage

```
Thin:       100  — decorative display only
Light:      300  — elegant large headings
Regular:    400  — body text, descriptions
Medium:     500  — emphasis, labels, navigation
Semibold:   600  — subheadings, card titles, buttons
Bold:       700  — main headings, strong emphasis
Extrabold:  800  — hero display text, oversized headings
```

### 2.6 Typography Trends

- **Oversized hero text**: 48px–96px+ for hero headings — typography IS the hero image
- **Variable fonts**: Use variable fonts for performance and fine-grained control
- **Mixed weight contrast**: Pair light weight headings (300) with bold accents, or bold headings with regular body
- **Character and personality**: Move away from safe/generic — pick fonts with character

---

## 3. Spacing System

### 3.1 Base Grid

Use a **4px base grid** with an **8px soft grid** for primary spacing:

```
--space-0:    0px
--space-0.5:  2px       /* micro adjustments */
--space-1:    4px       /* tight: icon padding, inline gaps */
--space-1.5:  6px
--space-2:    8px       /* compact: button padding-y, small gaps */
--space-3:    12px      /* default: input padding, card gap */
--space-4:    16px      /* standard: section padding, card padding */
--space-5:    20px
--space-6:    24px      /* comfortable: card padding, group gaps */
--space-8:    32px      /* spacious: section gaps */
--space-10:   40px
--space-12:   48px      /* section padding */
--space-16:   64px      /* large section gaps */
--space-20:   80px      /* hero section padding */
--space-24:   96px      /* page section spacing */
--space-32:   128px     /* major section dividers */
```

### 3.2 Component Spacing Patterns

```css
/* Button padding */
.btn-sm   { padding: 6px 12px; }     /* compact */
.btn-md   { padding: 8px 16px; }     /* default */
.btn-lg   { padding: 12px 24px; }    /* prominent */
.btn-xl   { padding: 16px 32px; }    /* hero CTA */

/* Card padding */
.card-sm  { padding: 16px; }
.card-md  { padding: 24px; }
.card-lg  { padding: 32px; }

/* Section padding (vertical) */
.section-sm { padding: 48px 0; }
.section-md { padding: 80px 0; }
.section-lg { padding: 96px 0; }
.section-xl { padding: 128px 0; }

/* Content max-widths */
.container-sm  { max-width: 640px; }    /* blog, narrow content */
.container-md  { max-width: 768px; }    /* forms, medium content */
.container-lg  { max-width: 1024px; }   /* standard page */
.container-xl  { max-width: 1280px; }   /* wide layout */
.container-2xl { max-width: 1536px; }   /* full dashboard */
```

### 3.3 Spacing Rules

- All spacing values must be multiples of 4px
- Use **generous white space** — when in doubt, add more space, not less
- Spacing between related elements: 8px–16px
- Spacing between groups/sections: 32px–64px
- Spacing between page sections: 80px–128px
- Mobile padding: minimum 16px horizontal padding on screen edges
- Desktop padding: 24px–32px horizontal padding within containers

---

## 4. Shadows & Depth

### 4.1 Shadow Scale

```css
/* Elevation system — layered shadows feel more natural */
--shadow-xs:   0 1px 2px 0 rgba(0, 0, 0, 0.05);
--shadow-sm:   0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1);
--shadow-md:   0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1);
--shadow-lg:   0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -4px rgba(0, 0, 0, 0.1);
--shadow-xl:   0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
--shadow-2xl:  0 25px 50px -12px rgba(0, 0, 0, 0.25);

/* Colored shadows for buttons/CTAs */
--shadow-primary: 0 4px 14px 0 rgba(59, 130, 246, 0.4);    /* blue glow */
--shadow-success: 0 4px 14px 0 rgba(34, 197, 94, 0.4);     /* green glow */
--shadow-danger:  0 4px 14px 0 rgba(239, 68, 68, 0.4);     /* red glow */

/* Hover elevation — card lifts on hover */
--shadow-hover: 0 10px 30px rgba(0, 0, 0, 0.12),
                0 4px 8px rgba(0, 0, 0, 0.06);
```

### 4.2 Shadow Rules

- **Light source**: Always from top-left or directly above — consistent across all elements
- **Subtle is better**: Prefer barely-visible shadows that create depth without drawing attention
- **Layered shadows**: Use 2 shadow layers (a soft spread + a tight offset) for realism
- **Dark mode**: Use shadows sparingly in dark mode; express depth through surface lightness instead
- **Colored shadows**: Use them ONLY on primary CTAs and interactive elements, matching the element's color at ~40% opacity
- **Hover states**: Increase shadow on hover for interactive cards (transition: 200ms ease)

---

## 5. Border Radius

### 5.1 Radius Scale

```css
--radius-none:  0px;
--radius-sm:    4px;       /* tags, badges, small elements */
--radius-md:    6px;       /* inputs, small buttons */
--radius-DEFAULT: 8px;     /* buttons, cards (most common) */
--radius-lg:    12px;      /* cards, modals, larger containers */
--radius-xl:    16px;      /* featured cards, hero cards */
--radius-2xl:   24px;      /* pill shapes, special containers */
--radius-full:  9999px;    /* circles, pill buttons */
```

### 5.2 Radius Trends (2025-2026)

- **8px–16px** is the dominant range for cards and containers
- **12px** is the sweet spot for modern card design
- **Full pill radius** for tags, badges, and some CTAs
- **Consistent radius across a design**: Pick 2-3 radius values and use them consistently
- **Larger containers get larger radius**: Nest radius proportionally (outer card 16px, inner elements 8px)
- **Organic shapes trending**: Slightly varied radius (e.g., `border-radius: 12px 16px 12px 16px`) for personality
- The trend is toward **softer, more rounded** corners — sharp corners (0-2px) feel dated

---

## 6. Backgrounds & Visual Effects

### 6.1 Mesh Gradients

The premium background choice for 2025-2026:
```css
/* Mesh gradient with multiple color stops */
background: radial-gradient(at 40% 20%, hsla(228, 67%, 74%, 1) 0px, transparent 50%),
            radial-gradient(at 80% 0%, hsla(189, 100%, 56%, 1) 0px, transparent 50%),
            radial-gradient(at 0% 50%, hsla(355, 85%, 63%, 1) 0px, transparent 50%),
            radial-gradient(at 80% 50%, hsla(340, 100%, 76%, 1) 0px, transparent 50%),
            radial-gradient(at 0% 100%, hsla(269, 100%, 77%, 1) 0px, transparent 50%);

/* Simpler two-tone mesh */
background: radial-gradient(at 27% 37%, hsla(215, 98%, 61%, 0.15) 0px, transparent 50%),
            radial-gradient(at 97% 21%, hsla(270, 94%, 72%, 0.12) 0px, transparent 50%),
            radial-gradient(at 52% 99%, hsla(354, 98%, 61%, 0.08) 0px, transparent 50%);
```

### 6.2 Aurora / Northern Lights Effect

```css
.aurora-bg {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  position: relative;
  overflow: hidden;
}
.aurora-bg::before {
  content: '';
  position: absolute;
  inset: -50%;
  background: conic-gradient(from 0deg at 50% 50%,
    #7c3aed33, #3b82f633, #06b6d433, #10b98133, #7c3aed33);
  animation: aurora 15s linear infinite;
  filter: blur(80px);
}
@keyframes aurora {
  to { transform: rotate(360deg); }
}
```

### 6.3 Glassmorphism

```css
.glass {
  background: rgba(255, 255, 255, 0.1);    /* 10-40% opacity */
  backdrop-filter: blur(12px);              /* 10-20px blur */
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.15);
  border-radius: 12px;
}

/* Dark glassmorphism (2026 trend) */
.glass-dark {
  background: rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(16px) saturate(180%);
  -webkit-backdrop-filter: blur(16px) saturate(180%);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 16px;
}
```

### 6.4 Grain / Noise Texture

```css
.grain-overlay::after {
  content: '';
  position: absolute;
  inset: 0;
  opacity: 0.03;  /* subtle: 0.02-0.05 */
  pointer-events: none;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E");
  background-repeat: repeat;
  mix-blend-mode: overlay;
}
```

### 6.5 Gradient Overlays on Images

```css
/* Dark overlay for text readability */
.hero-image-overlay {
  background: linear-gradient(to bottom,
    rgba(0, 0, 0, 0.1) 0%,
    rgba(0, 0, 0, 0.6) 100%
  ), url('hero.jpg');
  background-size: cover;
}

/* Brand-tinted overlay */
.brand-overlay {
  background: linear-gradient(135deg,
    rgba(59, 130, 246, 0.8),
    rgba(139, 92, 246, 0.8)
  ), url('photo.jpg');
  background-size: cover;
  background-blend-mode: overlay;
}
```

### 6.6 Dot Grid / Subtle Patterns

```css
.dot-grid {
  background-image: radial-gradient(circle, #e5e7eb 1px, transparent 1px);
  background-size: 24px 24px;
}

/* Subtle grid lines */
.grid-lines {
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(0, 0, 0, 0.03) 1px, transparent 1px);
  background-size: 40px 40px;
}
```

---

## 7. Animation & Motion

### 7.1 Duration & Easing

```css
/* Duration tokens */
--duration-instant:  0ms;
--duration-fast:     100ms;     /* micro-feedback: button press */
--duration-normal:   200ms;     /* standard transitions: hover, focus */
--duration-moderate: 300ms;     /* expanding panels, dropdowns */
--duration-slow:     500ms;     /* page transitions, modals */
--duration-slower:   700ms;     /* complex orchestrated animations */

/* Easing tokens */
--ease-default:      cubic-bezier(0.4, 0, 0.2, 1);     /* standard */
--ease-in:           cubic-bezier(0.4, 0, 1, 1);        /* entering viewport */
--ease-out:          cubic-bezier(0, 0, 0.2, 1);        /* leaving viewport */
--ease-in-out:       cubic-bezier(0.4, 0, 0.2, 1);     /* in-page transitions */
--ease-bounce:       cubic-bezier(0.34, 1.56, 0.64, 1); /* playful bounce */
--ease-spring:       cubic-bezier(0.22, 1, 0.36, 1);    /* natural spring */
```

### 7.2 Common Animation Patterns

```css
/* Fade in up — the universal entrance animation */
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(16px); }
  to   { opacity: 1; transform: translateY(0); }
}
.animate-fade-in-up {
  animation: fadeInUp 0.5s cubic-bezier(0.22, 1, 0.36, 1) forwards;
}

/* Scale in — for modals and popovers */
@keyframes scaleIn {
  from { opacity: 0; transform: scale(0.95); }
  to   { opacity: 1; transform: scale(1); }
}

/* Slide in from right — for side panels */
@keyframes slideInRight {
  from { transform: translateX(100%); }
  to   { transform: translateX(0); }
}

/* Staggered children — for lists and grids */
.stagger-children > * {
  animation: fadeInUp 0.4s ease forwards;
  opacity: 0;
}
.stagger-children > *:nth-child(1) { animation-delay: 0ms; }
.stagger-children > *:nth-child(2) { animation-delay: 75ms; }
.stagger-children > *:nth-child(3) { animation-delay: 150ms; }
.stagger-children > *:nth-child(4) { animation-delay: 225ms; }
/* ...increment by 75ms per child */
```

### 7.3 Hover & Interactive States

```css
/* Card hover — lift effect */
.card-interactive {
  transition: transform 200ms ease, box-shadow 200ms ease;
}
.card-interactive:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
}

/* Button hover — subtle scale */
.btn {
  transition: all 150ms ease;
}
.btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}
.btn:active {
  transform: translateY(0) scale(0.98);
}

/* Link hover — underline animation */
.link-animated {
  position: relative;
}
.link-animated::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 0;
  height: 2px;
  background: currentColor;
  transition: width 200ms ease;
}
.link-animated:hover::after {
  width: 100%;
}
```

### 7.4 Motion Rules

- **GPU-accelerated only**: Animate transform and opacity; never animate width, height, top, left, margin, padding
- **200-500ms sweet spot**: Micro-interactions between 200-500ms
- **Respect prefers-reduced-motion**: Always include `@media (prefers-reduced-motion: reduce)` to disable animations
- **Purposeful**: Every animation must serve a purpose — guide, confirm, or provide feedback
- **Stagger, don't blast**: When multiple elements animate, stagger them by 50-100ms
- **Scroll-triggered animations**: Elements animate as they enter viewport (Intersection Observer or GSAP ScrollTrigger)
- **Exit animations**: Elements should exit as gracefully as they enter (reverse the entrance)

---

## 8. Icon System

### 8.1 Recommended Libraries (2025-2026)

1. **Lucide Icons** — 1,560 icons. Clean, consistent, lightweight. The default in AI-assisted development. Baked into shadcn/ui, starter kits, and templates.
2. **Phosphor Icons** — 9,072 icons in 6 styles (thin, light, regular, bold, fill, duotone). Best for versatile duotone icons. Excellent in both dark and light mode.
3. **Heroicons** — By the Tailwind CSS team. 300+ icons. Outline and solid styles. Perfect for Tailwind projects.
4. **Radix Icons** — Minimal, 15x15 grid. Designed for UI. Pairs with Radix/shadcn ecosystem.
5. **Tabler Icons** — 5,000+ icons. Consistent 24x24 grid with 2px stroke. Good breadth.

### 8.2 Icon Style Trends

- **Outline/stroke style** remains dominant for UI navigation and action icons (2px stroke weight at 24px)
- **Filled icons** for active/selected states in navigation (bottom tabs, sidebars)
- **Duotone** trending for feature sections, empty states, and illustrations
- **24x24 default size** with 20x20 for compact UI and 16x16 for inline text
- **Consistent stroke weight**: 1.5px–2px at 24x24 size
- **Rounded line caps and joins** match the rounded corner aesthetic

### 8.3 Icon Usage Rules

- Always use a single icon library per project for consistency
- Toggle between outline (inactive) and filled (active) for navigation states
- Icons should always be accompanied by labels in navigation (except universally recognized: search, close, menu)
- Minimum touch target: 44x44px for interactive icons (even if the icon is 24x24)
- Color: inherit from text color; use semantic colors only for status indicators

---

## 9. Layout Patterns

### 9.1 Hero Sections (Landing Pages)

**Pattern A: Center-Aligned Classic**
```
[Navbar]
[Badge/Announcement]
[Large Heading — 48-72px, bold, max-width: 800px]
[Subheading — 18-20px, muted color, max-width: 600px]
[CTA Button Group — primary + secondary/ghost]
[Social Proof — logos or avatar stack + metric]
[Hero Image/Screenshot — full-width or contained]
```

**Pattern B: Split Hero (Text + Visual)**
```
[Navbar]
[  Left: Heading + Body + CTAs  |  Right: Product screenshot/illustration  ]
```

**Pattern C: Bento Grid Hero**
```
[Navbar]
[Hero headline spanning full width]
[Bento grid: large hero card (50%) | 2-3 smaller feature cards (50%)]
```

**Pattern D: Typography-First Hero (2026 trend)**
```
[Navbar]
[Massive oversized heading — 72-120px, filling viewport]
[Minimal supporting text]
[Single prominent CTA]
```

### 9.2 Feature Sections

**Bento Grid** (dominant 2025-2026 pattern):
```
[Section heading + description, centered]
[Grid of 4-8 feature cards in asymmetric sizes]
— Large card spans 2 columns for primary feature
— Medium cards are 1 column for secondary features
— Small cards for supporting details/stats
```

**Three-Column Icon Grid**:
```
[Section heading + description]
[  Icon + Title + Text  |  Icon + Title + Text  |  Icon + Title + Text  ]
[  Icon + Title + Text  |  Icon + Title + Text  |  Icon + Title + Text  ]
```

**Alternating Left-Right** (feature showcase):
```
[  Image/Screenshot  |  Heading + Text + CTA  ]
[  Heading + Text + CTA  |  Image/Screenshot  ]
```

### 9.3 Social Proof Patterns

```
— Logo bar: 5-8 greyscale logos in a row (or marquee scroll)
— Testimonial cards: 3-column grid with photo, quote, name, title
— Metrics bar: 3-4 large numbers with labels ("10K+ customers", "99.9% uptime")
— Avatar stack: overlapping circular avatars + "Join 2,000+ teams"
```

### 9.4 Pricing Section

```
[Section heading: "Simple, transparent pricing"]
[Toggle: Monthly / Yearly (with "Save 20%" badge)]
[  Basic Card  |  Pro Card (highlighted/elevated)  |  Enterprise Card  ]
— Highlighted plan: colored border or background, "Most Popular" badge
— Feature list with check/x icons
— CTA button at bottom of each card
```

### 9.5 CTA Section / Final Push

```
[Full-width colored or gradient background]
[Centered heading: "Ready to get started?"]
[Centered subtext]
[Primary CTA + Secondary CTA]
```

---

## 10. Dashboard Design Patterns

### 10.1 Layout Structure

```
[Top Navbar: logo, search, notifications, user avatar]
[  Left Sidebar (240-280px, collapsible to 64px icons-only)  |  Main Content  ]
```

**Sidebar structure**:
- Logo/brand at top
- Primary navigation (icon + label)
- Grouped sections with subtle dividers or labels
- Secondary nav / settings at bottom
- Active item: background highlight + left border accent or filled icon
- Collapse to icon-only mode on smaller screens

### 10.2 Metric Cards (KPI Row)

```
[ Total Revenue  |  New Users  |  Active Sessions  |  Conversion Rate ]
Each card:
— Label (text-sm, muted color)
— Large number (text-2xl or 3xl, font-weight: 700)
— Trend indicator (green up arrow / red down arrow + percentage)
— Optional sparkline chart
— Subtle background or left border accent by status
```

### 10.3 Dashboard Content Patterns

- **Card-based layout**: Everything in rounded cards with consistent padding (24px)
- **12-column grid**: Use CSS Grid or Flexbox with 12 columns, 16-24px gaps
- **Charts**: Use clean, minimal chart libraries. Prefer line charts for trends, bar charts for comparisons, donut charts for proportions. Avoid 3D charts.
- **Tables**: Striped or hover-highlighted rows, sticky headers, rounded card wrapper, pagination at bottom, sortable columns indicated by subtle chevron icons
- **Status indicators**: Colored dots (8-10px) — green/yellow/red with labels
- **Empty states**: Illustration + message + CTA button
- **Loading states**: Skeleton screens (pulsing gray rectangles matching content shape)

### 10.4 Dashboard Color Approach

- **Minimal color in the chrome**: Sidebar and navbar should be neutral (white, light gray, or dark)
- **Color for data**: Reserve vivid colors for charts, status indicators, and interactive elements
- **Consistent chart palette**: Define 6-8 chart colors that work in both light and dark mode
- **Real-time data**: Subtle pulse or glow animation on live updating values

### 10.5 Dashboard Best Practices

- Information hierarchy: most critical metrics at top-left (F-pattern reading)
- Progressive disclosure: overview first, click for details
- Consistent card heights within rows
- Responsive: stack cards vertically on mobile, collapse sidebar
- Skeleton loading screens instead of spinners
- Maximum 5-7 primary navigation items in sidebar
- Date range picker prominently placed (top-right of main content)

---

## 11. Mobile App Design Patterns

### 11.1 Navigation

**Bottom Tab Bar** (dominant pattern):
```
[  Home  |  Search  |  + (Create)  |  Activity  |  Profile  ]
— 5 items maximum
— Icon + label for each
— Active: filled icon + brand color
— Inactive: outline icon + muted color
— Safe area padding on iOS (env(safe-area-inset-bottom))
— Height: 56-64px
```

**Gesture Navigation**:
- Swipe right to go back
- Pull to refresh
- Swipe between tabs
- Long press for context menus

### 11.2 Card Patterns

```css
/* Standard mobile card */
.mobile-card {
  background: white;
  border-radius: 16px;       /* larger radius on mobile */
  padding: 16px;
  margin: 8px 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
}
```

### 11.3 Mobile Typography

```
Heading:       24-32px, weight: 700
Subheading:    18-20px, weight: 600
Body:          16px (MINIMUM on mobile), weight: 400
Caption:       14px, weight: 400, muted color
Tiny label:    12px, weight: 500, uppercase + letter-spacing
```

### 11.4 Mobile Spacing

- Screen edge padding: 16-20px
- Card internal padding: 16px
- List item height: minimum 48px (touch target)
- Button height: 48-56px
- Button touch target: minimum 44x44px
- Spacing between sections: 24-32px

### 11.5 Mobile Design Best Practices

- **Thumb zone**: Place primary actions in the bottom 40% of the screen
- **Bottom sheets** instead of modals for contextual actions
- **Large tap targets**: Minimum 44x44px for all interactive elements
- **Haptic feedback**: Pair animations with haptic responses on native
- **Progressive disclosure**: Show summaries, expand on tap
- **Onboarding**: 3-5 screens maximum, skip option always visible, progress dots
- **Glassmorphism**: Frosted glass effects trending (Apple's renewed use of translucent surfaces)
- **Dark mode**: Must support — 80%+ of mobile users prefer dark mode

---

## 12. Landing Page Conversion Patterns

### 12.1 Scroll Progression (Full Page Structure)

```
1. [Hero Section]          — Value proposition + CTA
2. [Social Proof Bar]      — Logo cloud or metrics
3. [Features Section]      — Bento grid or 3-column grid
4. [How It Works]          — 3-step numbered process
5. [Detailed Feature 1]   — Left-right split with screenshot
6. [Detailed Feature 2]   — Right-left split with screenshot
7. [Testimonials]          — 3-column cards or carousel
8. [Pricing]               — 3-tier pricing table
9. [FAQ]                   — Accordion component
10. [Final CTA]            — Full-width banner with CTA
11. [Footer]               — Links, social, legal
```

### 12.2 CTA Best Practices

- **Primary CTA**: Solid background in brand color, high contrast text, large (48-56px height), full-width on mobile
- **Secondary CTA**: Ghost/outline style or text link
- **CTA text**: Action-oriented verbs ("Get started free", "Start your trial", "See it in action")
- **Avoid "Sign up"**: "Trial" or "Get started" converts 100%+ better — lower commitment language
- **Placement**: Hero section, mid-page after building desire, end-of-page after final pitch
- **Sticky mobile CTA**: Fixed bottom bar on mobile with CTA button always visible
- **Repeat the same CTA**: Single consistent CTA repeated 3-5 times through the page

### 12.3 Navbar (Landing Page)

```
[Logo]  [Features  Pricing  Testimonials  FAQ]  [Sign In  |  CTA Button]
— Transparent on hero, solid white on scroll (with subtle shadow)
— Sticky on scroll
— Mobile: hamburger menu or bottom sheet
— CTA button always visible in navbar
— Height: 64-80px
— Slim announcement bar above (optional): colored background + link
```

### 12.4 Conversion Boosters

- **Above the fold**: Headline + CTA + social proof visible without scrolling
- **Specificity**: Replace vague claims with specific numbers ("Save 4 hours/week" not "Save time")
- **Personalization**: Dynamic content based on referral source (LinkedIn visitor vs. Google visitor)
- **Urgency**: Limited time badges, countdown timers (use sparingly and honestly)
- **Trust signals**: Security badges, review stars, "Used by X companies" near CTAs
- **Reduce friction**: Minimize form fields, offer SSO login, no credit card required messaging

---

## 13. Component Library Standards (shadcn/Radix/Tailwind)

### 13.1 Architecture Pattern (2025-2026 Standard)

The dominant three-layer architecture:
1. **Tailwind CSS** — Utility-first styling and layout
2. **Radix UI Primitives** — Headless, accessible component logic (keyboard, ARIA, focus management)
3. **shadcn/ui** — Pre-styled, copy-paste components combining layers 1 & 2

### 13.2 Default Component Values

```css
/* shadcn/ui default design tokens (reference) */
--radius:           0.5rem;     /* 8px — global border radius */
--primary:          oklch(from var(--color) l c h);  /* brand color */
--primary-foreground: white;

/* Button defaults */
height: 40px (default), 32px (sm), 44px (lg)
padding-x: 16px (default), 12px (sm), 32px (lg)
border-radius: var(--radius)
font-weight: 500
font-size: 14px

/* Input defaults */
height: 40px
padding: 8px 12px
border: 1px solid var(--border)
border-radius: var(--radius)
font-size: 14px

/* Card defaults */
border: 1px solid var(--border)
border-radius: var(--radius)
padding: 24px
background: var(--card)
```

### 13.3 Modern Component Patterns

- **Compound components**: Components composed of sub-components (Card.Header, Card.Body, Card.Footer)
- **Variants via CVA**: Use class-variance-authority for component variants (size, color, style)
- **Slot pattern**: Radix's Slot component for flexible composition
- **Server Components first**: Default to React Server Components; add "use client" only when needed
- **Accessible by default**: All interactive components must have proper ARIA attributes, keyboard navigation, and focus management

---

## 14. Accessibility Essentials

### 14.1 Non-Negotiable Standards

```
WCAG 2.1 AA Compliance (minimum):
— Color contrast: 4.5:1 for normal text, 3:1 for large text
— Touch targets: minimum 44x44px
— Focus indicators: visible, high-contrast focus ring (2px+ outline)
— Keyboard navigation: all interactive elements reachable via Tab
— Screen reader support: semantic HTML + ARIA labels
— Reduced motion: @media (prefers-reduced-motion: reduce)
— Color not sole indicator: never use color alone to convey information
— Font size: minimum 16px for body text on mobile
```

### 14.2 Focus Ring Style

```css
/* Modern focus ring — visible but not intrusive */
:focus-visible {
  outline: 2px solid var(--ring);
  outline-offset: 2px;
  border-radius: var(--radius);
}

/* Remove default for mouse users */
:focus:not(:focus-visible) {
  outline: none;
}
```

---

## 15. Quick Reference: Design Tokens Template

```css
:root {
  /* Colors */
  --color-primary: #3B82F6;
  --color-primary-hover: #2563EB;
  --color-primary-foreground: #FFFFFF;
  --color-secondary: #F1F5F9;
  --color-secondary-hover: #E2E8F0;
  --color-secondary-foreground: #0F172A;
  --color-accent: #8B5CF6;
  --color-muted: #64748B;
  --color-muted-foreground: #94A3B8;
  --color-background: #FFFFFF;
  --color-foreground: #0F172A;
  --color-card: #FFFFFF;
  --color-card-foreground: #0F172A;
  --color-border: #E2E8F0;
  --color-input: #E2E8F0;
  --color-ring: #3B82F6;
  --color-destructive: #EF4444;
  --color-success: #22C55E;
  --color-warning: #F59E0B;

  /* Typography */
  --font-sans: 'Inter', system-ui, -apple-system, sans-serif;
  --font-mono: 'Geist Mono', 'JetBrains Mono', monospace;
  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  --font-size-2xl: 1.5rem;
  --font-size-3xl: 1.875rem;
  --font-size-4xl: 2.25rem;
  --font-size-5xl: 3rem;

  /* Spacing */
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-6: 24px;
  --space-8: 32px;
  --space-12: 48px;
  --space-16: 64px;
  --space-24: 96px;

  /* Radius */
  --radius-sm: 4px;
  --radius-md: 6px;
  --radius: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-full: 9999px;

  /* Shadows */
  --shadow-sm: 0 1px 3px 0 rgba(0,0,0,0.1), 0 1px 2px -1px rgba(0,0,0,0.1);
  --shadow-md: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -2px rgba(0,0,0,0.1);
  --shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.1), 0 4px 6px -4px rgba(0,0,0,0.1);
  --shadow-xl: 0 20px 25px -5px rgba(0,0,0,0.1), 0 8px 10px -6px rgba(0,0,0,0.1);

  /* Animation */
  --duration-fast: 100ms;
  --duration-normal: 200ms;
  --duration-slow: 500ms;
  --ease-default: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring: cubic-bezier(0.22, 1, 0.36, 1);
}
```

---

## 16. Anti-Patterns to Avoid

1. **Pure black backgrounds** (#000) in dark mode — use #0A0A0A or #121212 instead
2. **Rainbow gradients** — use soft, 2-3 color gradients with low opacity
3. **Sharp corners everywhere** (0px radius) — use 8-16px for modern feel
4. **Tiny text on mobile** — never below 16px for body text
5. **Heavy shadows** — use subtle, layered shadows
6. **Inconsistent spacing** — always use 4px/8px grid multiples
7. **Too many fonts** — maximum 2 font families per project
8. **Missing focus states** — always have visible :focus-visible styles
9. **Color as only indicator** — always pair color with icons/text for status
10. **Flat hierarchy** — use size, weight, and color contrast to create clear information hierarchy
11. **Stock photo hero sections** — use product screenshots, illustrations, or typography-first
12. **Centered everything** — use asymmetric layouts and left-aligned content for better readability
13. **Generic CTA text** ("Submit", "Click here") — use specific action verbs ("Start free trial", "See pricing")
14. **Missing loading states** — always show skeleton screens, not spinners
15. **Ignoring prefers-reduced-motion** — always provide a reduced-motion fallback
