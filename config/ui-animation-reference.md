# Animation & Component Pattern Reference

> Comprehensive reference for Claude Code agents to produce premium-quality animated UI.
> Covers component libraries, CSS animation techniques, and production-ready code patterns.

---

## Table of Contents

1. [Component Library Catalog](#1-component-library-catalog)
2. [Common Animation Patterns (CSS + Framer Motion)](#2-common-animation-patterns)
3. [Glassmorphism / Neumorphism / Aurora Gradient CSS](#3-design-style-patterns)
4. [Popular Hover Effects](#4-popular-hover-effects)
5. [Card Animation Patterns](#5-card-animation-patterns)
6. [Text Animation Patterns](#6-text-animation-patterns)
7. [Background Animation Patterns](#7-background-animation-patterns)
8. [Scroll-Reveal Patterns](#8-scroll-reveal-patterns)
9. [Button & CTA Animation Patterns](#9-button--cta-animation-patterns)
10. [Loading & Skeleton Animation Patterns](#10-loading--skeleton-animation-patterns)
11. [Modal & Dialog Transition Patterns](#11-modal--dialog-transition-patterns)
12. [Easing Function Reference](#12-easing-function-reference)
13. [Color & Shadow Systems](#13-color--shadow-systems)
14. [Spacing & Typography Systems](#14-spacing--typography-systems)

---

## 1. Component Library Catalog

### Aceternity UI (ui.aceternity.com)
- **Stack**: React, Next.js, Tailwind CSS, Framer Motion
- **Count**: 200+ free components, blocks, templates
- **Philosophy**: Copy-paste source code, `"use client"` directive, shadcn registry compatible
- **Key Components**:
  - 3D Card Effect (perspective tilt on hover)
  - 3D Pin (map-pin style hover elevation)
  - Aurora Background (animated gradient background)
  - Background Beams (animated beam lines)
  - Background Gradient Animation
  - Bento Grid (asymmetric grid layout)
  - Card Hover Effect (direction-aware hover)
  - Card Spotlight (radial gradient follows cursor)
  - Container Scroll Animation (3D scroll perspective)
  - Evervault Card (encrypted-style text effect)
  - Floating Dock (macOS-style dock)
  - Floating Navbar
  - Globe (3D interactive globe)
  - Hero Parallax (product showcase with parallax)
  - Infinite Moving Cards (auto-scrolling testimonials)
  - Lamp Effect (cone light reveal)
  - Macbook Scroll (3D laptop scroll animation)
  - Mask Reveal (hover to reveal content beneath)
  - Meteor Effect (animated meteor streaks)
  - Moving Border (animated border beam)
  - Parallax Scroll (dual-column opposing scroll)
  - Sparkles (configurable particle sparkles)
  - Spotlight (configurable light cone)
  - Text Generate Effect (word-by-word reveal)
  - Text Reveal Card (text emerge on scroll)
  - Timeline (sticky header with scroll beam)
  - Tracing Beam (scroll-following vertical beam)
  - Typewriter Effect (character-by-character typing)
  - Wavy Background (animated SVG waves)
  - Wobble Card (spring-physics wobble on hover)

### Magic UI (magicui.design)
- **Stack**: React, TypeScript, Tailwind CSS, Framer Motion
- **Count**: 150+ free animated components
- **Philosophy**: shadcn/ui companion, copy-paste ownership
- **Key Components**:
  - Animated Beam (SVG beam connecting elements)
  - Animated Circular Progress Bar
  - Animated Gradient Text (shifting gradient on text)
  - Animated Grid Pattern
  - Animated List (staggered entry list)
  - Animated Shiny Text (shimmer sweep on text)
  - Aurora Text (aurora color effect on text)
  - Avatar Circles (overlapping avatar group)
  - Bento Grid
  - Blur Fade (blur-to-clear fade-in)
  - Border Beam (light traveling along border)
  - Code Comparison (diff-style code viewer)
  - Confetti (celebration particle burst)
  - Dock (macOS-style magnifying dock)
  - Dot Pattern / Grid Pattern / Striped Pattern
  - Dotted Map (animated world map)
  - File Tree (animated file explorer)
  - Flickering Grid (randomly flickering cells)
  - Globe (3D globe visualization)
  - Hero Video Dialog (video modal with animation)
  - Icon Cloud (floating 3D icon cloud)
  - Interactive Grid Pattern
  - Interactive Hover Button
  - Marquee (infinite horizontal/vertical scroll)
  - Meteors (animated meteor streaks)
  - Morphing Text (text morphing between words)
  - Neon Gradient Card (glowing neon border card)
  - Number Ticker (animated counting numbers)
  - Orbiting Circles (elements orbiting a center)
  - Particles (interactive particle field)
  - Pixel Image (pixelated image reveal)
  - Pointer (custom animated cursor)
  - Progressive Blur (gradient blur overlay)
  - Pulsating Button (breathing pulse effect)
  - Rainbow Button (rainbow gradient border animation)
  - Ripple Button (click ripple effect)
  - Scroll Based Velocity (speed-dependent animation)
  - Scroll Progress (progress bar tied to scroll)
  - Shimmer Button (sweeping shimmer highlight)
  - Shine Border (rotating shine on border)
  - Shiny Button (glossy highlight sweep)
  - Smooth Cursor (interpolated cursor follower)
  - Sparkles Text (sparkle particles on text)
  - Spinning Text (rotating text around circle)
  - Terminal (animated terminal output)
  - Text Animate (multi-mode text animation)
  - Text Reveal (scroll-triggered text reveal)
  - Tweet Card (embedded tweet with animation)
  - Typing Animation (typewriter effect)
  - Video Text (video masked inside text)
  - Warp Background (warped mesh gradient)
  - Word Rotate (rotating word carousel)

### SyntaxUI (syntaxui.com)
- **Stack**: React, Tailwind CSS, Framer Motion
- **Count**: 100+ components
- **Philosophy**: Free, MIT-licensed, copy-paste
- **Key Categories**: Buttons, inputs, tabs, accordions, loaders, steppers, pricing tables, testimonials, confetti effects

### Hover.dev (hover.dev)
- **Stack**: React, Tailwind CSS, Framer Motion + vanilla JS + keyframes
- **Philosophy**: Copy with 2 clicks, production templates
- **Key Categories**:
  - Sections: 3D, FAQ, features, forms, hero, Kanban, pricing, stats, sign-in, testimonials
  - Components: Accordions, buttons, calendars, cards, carousels, countdown timers, dropdown menus, grids, inputs, links, loaders, modals, navbars, notifications, progress bars, tabs, tables, text effects, toggles

### Cult UI (cult-ui.com)
- **Stack**: React, TypeScript, Tailwind CSS, Framer Motion, shadcn-compatible
- **Philosophy**: Animated extras for shadcn projects
- **Key Components**:
  - Dynamic Island (iOS-style animated notification)
  - Shift Card (position-shifting card)
  - Family Button (expanding action group)
  - Direction Aware Tabs (directional tab transitions)
  - Side Panel (animated slide panel)
  - Texture Card (textured surface card)
  - Bg Animate Button (background-animated button)

### shadcn/ui (ui.shadcn.com)
- **Stack**: React, Radix UI, Tailwind CSS
- **Philosophy**: Foundation design system, copy-paste with full ownership
- **Complete Component List** (2025-2026):
  Accordion, Alert, Alert Dialog, Aspect Ratio, Avatar, Badge, Breadcrumb, Button, Button Group, Calendar, Card, Carousel, Chart, Checkbox, Collapsible, Combobox, Command, Context Menu, Data Table, Date Picker, Dialog, Direction, Drawer, Dropdown Menu, Empty, Field, Hover Card, Input, Input Group, Input OTP, Item, Kbd, Label, Menubar, Native Select, Navigation Menu, Pagination, Popover, Progress, Radio Group, Resizable, Scroll Area, Select, Separator, Sheet, Sidebar, Skeleton, Slider, Sonner, Spinner, Switch, Table, Tabs, Textarea, Toast, Toggle, Toggle Group, Tooltip, Typography
- **2025 Additions**: Field, Input Group, Button Group, Spinner, Kbd, Item, Empty

### Tremor (tremor.so)
- **Stack**: React, Tailwind CSS, Radix UI, Recharts
- **Count**: 35+ components, 250+ blocks/templates
- **Focus**: Dashboard and data visualization
- **Key Components**: Line/Bar/Area/Donut charts, Sparklines, KPI cards, Data tables, Trackers, Bar Lists, Modular input components
- **Features**: Light/dark mode, keyboard navigation, accessible

### HeroUI / NextUI (heroui.com)
- **Stack**: React, Tailwind CSS, React Aria
- **Philosophy**: Beautiful defaults with Tailwind flexibility, RSC-compatible
- **Complete Component List**:
  Accordion, Alert, Autocomplete, Avatar, Badge, Breadcrumbs, Button, Calendar, Card, Checkbox, Checkbox Group, Chip, Circular Progress, Code, Date Input, Date Picker, Date Range Picker, Divider, Drawer, Dropdown, Form, Image, Input, Input OTP, Kbd, Link, Listbox, Modal, Navbar, Number Input, Pagination, Popover, Progress, Radio Group, Range Calendar, Scroll Shadow, Select, Skeleton, Slider, Snippet, Spacer, Spinner, Switch, Table, Tabs, Textarea, Time Input, Toast, Tooltip, User

### daisyUI (daisyui.com)
- **Stack**: Pure CSS, Tailwind CSS plugin
- **Count**: 40+ components, 12 new in 2025
- **Philosophy**: CSS-only class names (btn, card, toggle), framework-agnostic, lightweight
- **Key Features**: Built-in theme system with generator, responsive modifiers by default (daisyUI 5), semantic class names
- **Components include**: Accordion, Alert, Avatar, Badge, Breadcrumb, Button, Calendar, Card, Carousel, Chat Bubble, Checkbox, Collapse, and many more

---

## 2. Common Animation Patterns

### Framer Motion (Motion) Core Patterns

```tsx
// --- Fade In ---
<motion.div
  initial={{ opacity: 0 }}
  animate={{ opacity: 1 }}
  transition={{ duration: 0.5 }}
/>

// --- Fade Up ---
<motion.div
  initial={{ opacity: 0, y: 20 }}
  animate={{ opacity: 1, y: 0 }}
  transition={{ duration: 0.5, ease: "easeOut" }}
/>

// --- Scale In ---
<motion.div
  initial={{ opacity: 0, scale: 0.95 }}
  animate={{ opacity: 1, scale: 1 }}
  transition={{ duration: 0.3, ease: [0.16, 1, 0.3, 1] }}
/>

// --- Staggered Children ---
const container = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: { staggerChildren: 0.1 }
  }
};
const item = {
  hidden: { opacity: 0, y: 20 },
  show: { opacity: 1, y: 0 }
};

<motion.ul variants={container} initial="hidden" animate="show">
  {items.map((i) => (
    <motion.li key={i} variants={item} />
  ))}
</motion.ul>

// --- Spring Physics ---
<motion.div
  animate={{ x: 100 }}
  transition={{
    type: "spring",
    stiffness: 260,
    damping: 20,
    mass: 1
  }}
/>

// --- Hover + Tap ---
<motion.button
  whileHover={{ scale: 1.05 }}
  whileTap={{ scale: 0.95 }}
  transition={{ type: "spring", stiffness: 400, damping: 17 }}
/>

// --- Layout Animation ---
<motion.div layout transition={{ type: "spring", stiffness: 300, damping: 30 }} />

// --- AnimatePresence (mount/unmount) ---
<AnimatePresence mode="wait">
  {isVisible && (
    <motion.div
      key="modal"
      initial={{ opacity: 0, scale: 0.95 }}
      animate={{ opacity: 1, scale: 1 }}
      exit={{ opacity: 0, scale: 0.95 }}
      transition={{ duration: 0.2 }}
    />
  )}
</AnimatePresence>

// --- Keyframes ---
<motion.div
  animate={{
    scale: [1, 1.2, 1.2, 1, 1],
    rotate: [0, 0, 180, 180, 0],
    borderRadius: ["0%", "0%", "50%", "50%", "0%"]
  }}
  transition={{ duration: 2, ease: "easeInOut", repeat: Infinity }}
/>
```

### CSS Keyframe Patterns

```css
/* --- Fade In Up --- */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.fade-in-up {
  animation: fadeInUp 0.5s ease-out forwards;
}

/* --- Slide In from Left --- */
@keyframes slideInLeft {
  from { transform: translateX(-100%); opacity: 0; }
  to   { transform: translateX(0);     opacity: 1; }
}

/* --- Slide In from Right --- */
@keyframes slideInRight {
  from { transform: translateX(100%); opacity: 0; }
  to   { transform: translateX(0);    opacity: 1; }
}

/* --- Scale Bounce In --- */
@keyframes scaleBounceIn {
  0%   { transform: scale(0);    opacity: 0; }
  60%  { transform: scale(1.1);  opacity: 1; }
  100% { transform: scale(1);    opacity: 1; }
}

/* --- Pulse --- */
@keyframes pulse {
  0%, 100% { transform: scale(1); }
  50%      { transform: scale(1.05); }
}

/* --- Float --- */
@keyframes float {
  0%, 100% { transform: translateY(0); }
  50%      { transform: translateY(-10px); }
}
.floating {
  animation: float 3s ease-in-out infinite;
}

/* --- Spin --- */
@keyframes spin {
  from { transform: rotate(0deg); }
  to   { transform: rotate(360deg); }
}

/* --- Wiggle --- */
@keyframes wiggle {
  0%, 100% { transform: rotate(0deg); }
  25%      { transform: rotate(-5deg); }
  75%      { transform: rotate(5deg); }
}
```

### Tailwind CSS Animation Utilities

```html
<!-- Built-in -->
<div class="animate-spin" />
<div class="animate-ping" />
<div class="animate-pulse" />
<div class="animate-bounce" />

<!-- Custom via tailwind.config.js -->
<!-- extend: { animation: { ... }, keyframes: { ... } } -->
<div class="animate-fade-in" />
<div class="animate-slide-up" />
<div class="animate-scale-in" />
```

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      animation: {
        "fade-in": "fadeIn 0.5s ease-out forwards",
        "fade-in-up": "fadeInUp 0.5s ease-out forwards",
        "slide-up": "slideUp 0.4s ease-out forwards",
        "slide-down": "slideDown 0.4s ease-out forwards",
        "scale-in": "scaleIn 0.3s ease-out forwards",
        "spin-slow": "spin 3s linear infinite",
        "float": "float 3s ease-in-out infinite",
        "shimmer": "shimmer 2s linear infinite",
        "aurora": "aurora 60s linear infinite",
        "marquee": "marquee 25s linear infinite",
        "border-beam": "border-beam 4s linear infinite",
      },
      keyframes: {
        fadeIn: {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        fadeInUp: {
          "0%": { opacity: "0", transform: "translateY(20px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        slideUp: {
          "0%": { transform: "translateY(100%)", opacity: "0" },
          "100%": { transform: "translateY(0)", opacity: "1" },
        },
        slideDown: {
          "0%": { transform: "translateY(-100%)", opacity: "0" },
          "100%": { transform: "translateY(0)", opacity: "1" },
        },
        scaleIn: {
          "0%": { transform: "scale(0.95)", opacity: "0" },
          "100%": { transform: "scale(1)", opacity: "1" },
        },
        shimmer: {
          "0%": { backgroundPosition: "-200% 0" },
          "100%": { backgroundPosition: "200% 0" },
        },
        aurora: {
          "0%": { backgroundPosition: "50% 50%, 50% 50%" },
          "100%": { backgroundPosition: "350% 50%, 350% 50%" },
        },
        marquee: {
          "0%": { transform: "translateX(0%)" },
          "100%": { transform: "translateX(-100%)" },
        },
        "border-beam": {
          "0%": { offsetDistance: "0%" },
          "100%": { offsetDistance: "100%" },
        },
        float: {
          "0%, 100%": { transform: "translateY(0)" },
          "50%": { transform: "translateY(-10px)" },
        },
      },
    },
  },
};
```

---

## 3. Design Style Patterns

### Glassmorphism

```css
/* --- Basic Glassmorphism --- */
.glass {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px) saturate(180%);
  -webkit-backdrop-filter: blur(10px) saturate(180%);
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

/* --- Dark Glass --- */
.glass-dark {
  background: rgba(17, 25, 40, 0.75);
  backdrop-filter: blur(16px) saturate(180%);
  -webkit-backdrop-filter: blur(16px) saturate(180%);
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.125);
}

/* --- Colored Glass --- */
.glass-colored {
  background: linear-gradient(
    135deg,
    rgba(255, 255, 255, 0.1),
    rgba(255, 255, 255, 0.05)
  );
  backdrop-filter: blur(12px) saturate(150%);
  -webkit-backdrop-filter: blur(12px) saturate(150%);
  border: 1px solid rgba(255, 255, 255, 0.18);
  box-shadow:
    0 8px 32px rgba(0, 0, 0, 0.1),
    inset 0 1px 0 rgba(255, 255, 255, 0.2);
  border-radius: 16px;
}

/* --- Tailwind Glass --- */
/* bg-white/10 backdrop-blur-lg border border-white/20 rounded-xl */
```

```tsx
// Tailwind + React component
function GlassCard({ children }: { children: React.ReactNode }) {
  return (
    <div className="rounded-2xl border border-white/20 bg-white/10 p-6
                    backdrop-blur-lg shadow-xl">
      {children}
    </div>
  );
}
```

### Neumorphism

```css
/* --- Raised Neumorphic Element --- */
.neumorphic {
  background: #e0e0e0;
  border-radius: 16px;
  box-shadow:
    8px 8px 16px #bebebe,
    -8px -8px 16px #ffffff;
}

/* --- Pressed / Inset Neumorphic Element --- */
.neumorphic-inset {
  background: #e0e0e0;
  border-radius: 16px;
  box-shadow:
    inset 8px 8px 16px #bebebe,
    inset -8px -8px 16px #ffffff;
}

/* --- Neumorphic Button --- */
.neumorphic-btn {
  background: #e0e0e0;
  border: none;
  border-radius: 12px;
  padding: 12px 24px;
  box-shadow:
    6px 6px 12px #bebebe,
    -6px -6px 12px #ffffff;
  transition: box-shadow 0.2s ease;
  cursor: pointer;
}
.neumorphic-btn:active {
  box-shadow:
    inset 4px 4px 8px #bebebe,
    inset -4px -4px 8px #ffffff;
}

/* --- Dark Neumorphism --- */
.neumorphic-dark {
  background: #2d2d2d;
  border-radius: 16px;
  box-shadow:
    8px 8px 16px #1a1a1a,
    -8px -8px 16px #404040;
}
```

### Aurora Gradient

```css
/* --- CSS-Only Aurora Background --- */
.aurora-bg {
  background:
    linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%),
    linear-gradient(45deg, #00c3ff 0%, #ffff1c 50%, #ff0099 100%);
  background-size: 400% 400%;
  animation: aurora 15s ease infinite;
}
@keyframes aurora {
  0%   { background-position: 0% 50%; }
  50%  { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* --- Multi-layer Aurora --- */
.aurora-multi {
  position: relative;
  overflow: hidden;
  background: #000;
}
.aurora-multi::before,
.aurora-multi::after {
  content: "";
  position: absolute;
  inset: -50%;
  border-radius: 50%;
  filter: blur(80px);
  opacity: 0.6;
  animation: auroraMove 20s ease-in-out infinite alternate;
}
.aurora-multi::before {
  background: radial-gradient(circle, #7928ca, transparent 70%);
}
.aurora-multi::after {
  background: radial-gradient(circle, #0070f3, transparent 70%);
  animation-delay: -5s;
  animation-direction: alternate-reverse;
}
@keyframes auroraMove {
  0%   { transform: translate(-20%, -20%) rotate(0deg); }
  100% { transform: translate(20%, 20%) rotate(180deg); }
}
```

```tsx
// Framer Motion Aurora (Aceternity-style)
function AuroraBackground({ children }: { children: React.ReactNode }) {
  return (
    <div className="relative min-h-screen overflow-hidden bg-zinc-950">
      <div className="absolute inset-0">
        {[
          "bg-gradient-to-r from-violet-600/30 via-transparent to-cyan-400/30",
          "bg-gradient-to-r from-fuchsia-500/20 via-transparent to-emerald-400/20",
          "bg-gradient-to-r from-blue-600/20 via-transparent to-rose-400/20",
        ].map((gradient, i) => (
          <motion.div
            key={i}
            className={`absolute inset-0 ${gradient} blur-3xl`}
            animate={{
              backgroundPosition: ["0% 50%", "100% 50%", "0% 50%"],
              scale: [1, 1.1, 1],
            }}
            transition={{
              duration: 20 + i * 5,
              repeat: Infinity,
              ease: "linear",
            }}
          />
        ))}
      </div>
      <div className="relative z-10">{children}</div>
    </div>
  );
}
```

### Mesh Gradient

```css
/* --- CSS Mesh Gradient --- */
.mesh-gradient {
  background-color: #ff99ee;
  background-image:
    radial-gradient(at 40% 20%, #4158d0 0px, transparent 50%),
    radial-gradient(at 80% 0%, #c850c0 0px, transparent 50%),
    radial-gradient(at 0% 50%, #ffcc70 0px, transparent 50%),
    radial-gradient(at 80% 50%, #ff6f61 0px, transparent 50%),
    radial-gradient(at 0% 100%, #4facfe 0px, transparent 50%),
    radial-gradient(at 80% 100%, #00f2fe 0px, transparent 50%);
}

/* --- Animated Mesh Gradient --- */
.mesh-gradient-animated {
  background-color: #4158d0;
  background-image:
    radial-gradient(at 40% 20%, hsla(258, 70%, 60%, 1) 0px, transparent 50%),
    radial-gradient(at 80% 0%, hsla(189, 100%, 56%, 1) 0px, transparent 50%),
    radial-gradient(at 0% 50%, hsla(355, 100%, 93%, 1) 0px, transparent 50%),
    radial-gradient(at 80% 50%, hsla(340, 100%, 76%, 1) 0px, transparent 50%),
    radial-gradient(at 0% 100%, hsla(22, 100%, 77%, 1) 0px, transparent 50%);
  background-size: 200% 200%;
  animation: meshMove 20s ease infinite;
}
@keyframes meshMove {
  0%   { background-position: 0% 0%; }
  25%  { background-position: 100% 0%; }
  50%  { background-position: 100% 100%; }
  75%  { background-position: 0% 100%; }
  100% { background-position: 0% 0%; }
}
```

### OKLCH Modern Gradients

```css
/* --- HD Gradient (OKLCH color space) --- */
.hd-gradient {
  background: linear-gradient(
    to right in oklch,
    oklch(70% 0.35 340),
    oklch(70% 0.35 200)
  );
}

/* --- Vibrant OKLCH Gradient --- */
.vibrant-gradient {
  background: linear-gradient(
    135deg in oklch,
    oklch(65% 0.3 30),   /* warm orange */
    oklch(60% 0.35 330), /* magenta */
    oklch(55% 0.3 270)   /* purple */
  );
}

/* --- OKLCH vs sRGB: OKLCH avoids the muddy middle --- */
/* sRGB (muddy):    linear-gradient(to right, #ff0000, #00ff00) */
/* OKLCH (vibrant): linear-gradient(to right in oklch, red, green) */
```

---

## 4. Popular Hover Effects

### Direction-Aware Hover

```tsx
// Detects which edge the mouse entered from
function DirectionAwareHover({ children, imageUrl }: Props) {
  const ref = useRef<HTMLDivElement>(null);
  const [direction, setDirection] = useState("");

  const handleMouseEnter = (e: React.MouseEvent) => {
    const rect = ref.current!.getBoundingClientRect();
    const x = e.clientX - rect.left - rect.width / 2;
    const y = e.clientY - rect.top - rect.height / 2;
    const d = Math.round(Math.atan2(y, x) / 1.57079633 + 5) % 4;
    setDirection(["top", "right", "bottom", "left"][d]);
  };

  return (
    <motion.div
      ref={ref}
      onMouseEnter={handleMouseEnter}
      className="relative overflow-hidden"
    >
      <motion.div
        initial="hidden"
        whileHover="visible"
        className="absolute inset-0 bg-black/60 z-10 flex items-center justify-center"
        variants={{
          hidden: {
            opacity: 0,
            x: direction === "left" ? -30 : direction === "right" ? 30 : 0,
            y: direction === "top" ? -30 : direction === "bottom" ? 30 : 0,
          },
          visible: { opacity: 1, x: 0, y: 0 },
        }}
      >
        {children}
      </motion.div>
      <img src={imageUrl} className="w-full h-full object-cover" />
    </motion.div>
  );
}
```

### Magnetic Hover (element follows cursor)

```tsx
function MagneticButton({ children }: { children: React.ReactNode }) {
  const ref = useRef<HTMLButtonElement>(null);
  const x = useMotionValue(0);
  const y = useMotionValue(0);

  const handleMouseMove = (e: React.MouseEvent) => {
    const rect = ref.current!.getBoundingClientRect();
    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;
    x.set((e.clientX - centerX) * 0.3);
    y.set((e.clientY - centerY) * 0.3);
  };

  const handleMouseLeave = () => {
    animate(x, 0, { type: "spring", stiffness: 300, damping: 20 });
    animate(y, 0, { type: "spring", stiffness: 300, damping: 20 });
  };

  return (
    <motion.button
      ref={ref}
      style={{ x, y }}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      className="relative px-8 py-4 rounded-full bg-white text-black font-medium"
    >
      {children}
    </motion.button>
  );
}
```

### Glow on Hover (cursor-following radial glow)

```css
/* Pure CSS approach */
.glow-card {
  position: relative;
  overflow: hidden;
  border-radius: 12px;
  background: #1a1a2e;
  border: 1px solid rgba(255, 255, 255, 0.1);
}
.glow-card::before {
  content: "";
  position: absolute;
  width: 300px;
  height: 300px;
  background: radial-gradient(circle, rgba(99, 102, 241, 0.4), transparent 70%);
  transform: translate(
    calc(var(--mouse-x, 50%) - 150px),
    calc(var(--mouse-y, 50%) - 150px)
  );
  pointer-events: none;
  transition: opacity 0.3s;
  opacity: 0;
}
.glow-card:hover::before {
  opacity: 1;
}
```

```tsx
// React + Tailwind approach
function GlowCard({ children }: { children: React.ReactNode }) {
  const [position, setPosition] = useState({ x: 0, y: 0 });
  const [isHovered, setIsHovered] = useState(false);

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect();
    setPosition({ x: e.clientX - rect.left, y: e.clientY - rect.top });
  };

  return (
    <div
      className="relative overflow-hidden rounded-xl border border-white/10 bg-zinc-900 p-6"
      onMouseMove={handleMouseMove}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      {isHovered && (
        <div
          className="pointer-events-none absolute -inset-px opacity-50 transition-opacity duration-300"
          style={{
            background: `radial-gradient(600px circle at ${position.x}px ${position.y}px, rgba(99,102,241,0.15), transparent 40%)`,
          }}
        />
      )}
      <div className="relative z-10">{children}</div>
    </div>
  );
}
```

### Border Gradient on Hover

```css
.border-gradient-hover {
  position: relative;
  padding: 2px;
  border-radius: 12px;
  background: linear-gradient(135deg, transparent, transparent);
  transition: background 0.3s ease;
}
.border-gradient-hover:hover {
  background: linear-gradient(135deg, #6366f1, #ec4899, #f59e0b);
}
.border-gradient-hover > .inner {
  background: #0f0f0f;
  border-radius: 10px;
  padding: 24px;
}
```

### Underline Expand on Hover

```css
.underline-hover {
  position: relative;
  display: inline-block;
}
.underline-hover::after {
  content: "";
  position: absolute;
  bottom: -2px;
  left: 50%;
  width: 0;
  height: 2px;
  background: currentColor;
  transition: width 0.3s ease, left 0.3s ease;
}
.underline-hover:hover::after {
  width: 100%;
  left: 0;
}
```

---

## 5. Card Animation Patterns

### 3D Tilt Card

```tsx
function TiltCard({ children }: { children: React.ReactNode }) {
  const ref = useRef<HTMLDivElement>(null);
  const rotateX = useMotionValue(0);
  const rotateY = useMotionValue(0);

  const handleMouseMove = (e: React.MouseEvent) => {
    const rect = ref.current!.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    const centerX = rect.width / 2;
    const centerY = rect.height / 2;
    rotateX.set(((y - centerY) / centerY) * -15);
    rotateY.set(((x - centerX) / centerX) * 15);
  };

  const handleMouseLeave = () => {
    animate(rotateX, 0, { type: "spring", stiffness: 300, damping: 30 });
    animate(rotateY, 0, { type: "spring", stiffness: 300, damping: 30 });
  };

  return (
    <motion.div
      ref={ref}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      style={{
        rotateX,
        rotateY,
        transformStyle: "preserve-3d",
        perspective: 1000,
      }}
      className="rounded-xl border border-white/10 bg-zinc-900 p-6 shadow-xl"
    >
      <div style={{ transform: "translateZ(50px)" }}>{children}</div>
    </motion.div>
  );
}
```

### Card with Shine Effect

```css
.shine-card {
  position: relative;
  overflow: hidden;
  border-radius: 16px;
  background: #1a1a2e;
}
.shine-card::before {
  content: "";
  position: absolute;
  inset: 0;
  background: linear-gradient(
    105deg,
    transparent 40%,
    rgba(255, 255, 255, 0.08) 45%,
    rgba(255, 255, 255, 0.12) 50%,
    rgba(255, 255, 255, 0.08) 55%,
    transparent 60%
  );
  transform: translateX(-100%);
  transition: transform 0.6s ease;
}
.shine-card:hover::before {
  transform: translateX(100%);
}
```

### Neon Gradient Card (Magic UI style)

```css
.neon-card {
  position: relative;
  border-radius: 16px;
  padding: 1px;
}
.neon-card::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 16px;
  background: conic-gradient(
    from 0deg,
    #ff6b6b, #feca57, #48dbfb, #ff9ff3, #ff6b6b
  );
  animation: neonSpin 4s linear infinite;
  filter: blur(8px);
  opacity: 0.7;
}
.neon-card > .inner {
  position: relative;
  background: #0a0a0a;
  border-radius: 15px;
  padding: 24px;
}
@keyframes neonSpin {
  from { transform: rotate(0deg); }
  to   { transform: rotate(360deg); }
}
```

### Flip Card

```css
.flip-card {
  perspective: 1000px;
  width: 300px;
  height: 400px;
}
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  transition: transform 0.6s;
  transform-style: preserve-3d;
}
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}
.flip-card-front,
.flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  border-radius: 16px;
}
.flip-card-back {
  transform: rotateY(180deg);
}
```

### Bento Grid Card

```tsx
function BentoGrid({ children }: { children: React.ReactNode }) {
  return (
    <div className="grid grid-cols-1 gap-4 md:grid-cols-3 md:grid-rows-3 max-w-5xl mx-auto">
      {children}
    </div>
  );
}

function BentoCard({
  className,
  children,
}: {
  className?: string;
  children: React.ReactNode;
}) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ duration: 0.5 }}
      className={cn(
        "group relative overflow-hidden rounded-2xl border border-white/10",
        "bg-zinc-900/50 p-6 backdrop-blur-sm",
        "hover:border-white/20 transition-colors duration-300",
        className
      )}
    >
      {children}
    </motion.div>
  );
}

// Usage:
// <BentoCard className="md:col-span-2 md:row-span-2">Hero</BentoCard>
// <BentoCard className="md:col-span-1">Small</BentoCard>
```

---

## 6. Text Animation Patterns

### Gradient Text

```css
/* --- Animated Gradient Text --- */
.gradient-text {
  background: linear-gradient(
    135deg,
    #6366f1,
    #ec4899,
    #f59e0b,
    #6366f1
  );
  background-size: 300% 300%;
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradientShift 4s ease infinite;
}
@keyframes gradientShift {
  0%   { background-position: 0% 50%; }
  50%  { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* --- Static Gradient Text --- */
.static-gradient-text {
  background: linear-gradient(to right, #6366f1, #ec4899);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
}
```

```tsx
// Tailwind
<span className="bg-gradient-to-r from-indigo-500 via-pink-500 to-amber-500
                 bg-clip-text text-transparent">
  Gradient Text
</span>
```

### Typewriter Effect

```css
/* Pure CSS Typewriter */
.typewriter {
  font-family: monospace;
  overflow: hidden;
  border-right: 2px solid;
  white-space: nowrap;
  width: 0;
  animation:
    typing 3s steps(30, end) forwards,
    blink 0.75s step-end infinite;
}
@keyframes typing {
  from { width: 0; }
  to   { width: 100%; }
}
@keyframes blink {
  50% { border-color: transparent; }
}
```

```tsx
// React + Framer Motion typewriter
function Typewriter({ text, speed = 50 }: { text: string; speed?: number }) {
  const [displayText, setDisplayText] = useState("");

  useEffect(() => {
    let i = 0;
    const interval = setInterval(() => {
      if (i < text.length) {
        setDisplayText(text.slice(0, i + 1));
        i++;
      } else {
        clearInterval(interval);
      }
    }, speed);
    return () => clearInterval(interval);
  }, [text, speed]);

  return (
    <span>
      {displayText}
      <motion.span
        animate={{ opacity: [1, 0] }}
        transition={{ duration: 0.5, repeat: Infinity, repeatType: "reverse" }}
      >
        |
      </motion.span>
    </span>
  );
}
```

### Word-by-Word Reveal (Text Generate Effect)

```tsx
function TextGenerateEffect({ words }: { words: string }) {
  const wordsArray = words.split(" ");

  return (
    <motion.p>
      {wordsArray.map((word, i) => (
        <motion.span
          key={i}
          initial={{ opacity: 0, filter: "blur(10px)" }}
          animate={{ opacity: 1, filter: "blur(0px)" }}
          transition={{
            duration: 0.5,
            delay: i * 0.1,
            ease: "easeOut",
          }}
          className="inline-block mr-1"
        >
          {word}
        </motion.span>
      ))}
    </motion.p>
  );
}
```

### Blur Reveal (Magic UI style)

```tsx
function BlurFade({
  children,
  delay = 0,
  duration = 0.4,
  yOffset = 6,
  blur = "6px",
}: {
  children: React.ReactNode;
  delay?: number;
  duration?: number;
  yOffset?: number;
  blur?: string;
}) {
  return (
    <motion.div
      initial={{ opacity: 0, y: yOffset, filter: `blur(${blur})` }}
      animate={{ opacity: 1, y: 0, filter: "blur(0px)" }}
      transition={{
        delay,
        duration,
        ease: [0.21, 0.47, 0.32, 0.98],
      }}
    >
      {children}
    </motion.div>
  );
}
```

### Word Rotate / Morphing Text

```tsx
function WordRotate({
  words,
  duration = 2500,
}: {
  words: string[];
  duration?: number;
}) {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((prev) => (prev + 1) % words.length);
    }, duration);
    return () => clearInterval(interval);
  }, [words.length, duration]);

  return (
    <AnimatePresence mode="wait">
      <motion.span
        key={words[index]}
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        exit={{ opacity: 0, y: -10 }}
        transition={{ duration: 0.3 }}
      >
        {words[index]}
      </motion.span>
    </AnimatePresence>
  );
}
```

### Shiny Text (shimmer sweep)

```css
.shiny-text {
  background: linear-gradient(
    110deg,
    #e2e8f0 35%,
    #ffffff 50%,
    #e2e8f0 65%
  );
  background-size: 200% 100%;
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: shinyText 3s linear infinite;
}
@keyframes shinyText {
  0%   { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```

### Number Ticker

```tsx
function NumberTicker({
  value,
  duration = 2,
}: {
  value: number;
  duration?: number;
}) {
  const count = useMotionValue(0);
  const rounded = useTransform(count, (v) => Math.round(v));
  const display = useMotionTemplate`${rounded}`;

  useEffect(() => {
    const controls = animate(count, value, {
      duration,
      ease: "easeOut",
    });
    return controls.stop;
  }, [value, duration]);

  return <motion.span>{display}</motion.span>;
}
```

---

## 7. Background Animation Patterns

### Particle Background

```tsx
// Lightweight canvas particles
function ParticleBackground({ count = 50 }: { count?: number }) {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current!;
    const ctx = canvas.getContext("2d")!;
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const particles = Array.from({ length: count }, () => ({
      x: Math.random() * canvas.width,
      y: Math.random() * canvas.height,
      vx: (Math.random() - 0.5) * 0.5,
      vy: (Math.random() - 0.5) * 0.5,
      size: Math.random() * 2 + 0.5,
    }));

    function draw() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      particles.forEach((p) => {
        p.x += p.vx;
        p.y += p.vy;
        if (p.x < 0 || p.x > canvas.width) p.vx *= -1;
        if (p.y < 0 || p.y > canvas.height) p.vy *= -1;

        ctx.beginPath();
        ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
        ctx.fillStyle = "rgba(255, 255, 255, 0.3)";
        ctx.fill();
      });

      // Draw connecting lines
      particles.forEach((a, i) => {
        particles.slice(i + 1).forEach((b) => {
          const dist = Math.hypot(a.x - b.x, a.y - b.y);
          if (dist < 120) {
            ctx.beginPath();
            ctx.moveTo(a.x, a.y);
            ctx.lineTo(b.x, b.y);
            ctx.strokeStyle = `rgba(255, 255, 255, ${0.15 * (1 - dist / 120)})`;
            ctx.stroke();
          }
        });
      });

      requestAnimationFrame(draw);
    }
    draw();
  }, [count]);

  return (
    <canvas
      ref={canvasRef}
      className="pointer-events-none fixed inset-0 z-0"
    />
  );
}
```

### Spotlight / Cursor Glow

```tsx
function SpotlightBackground() {
  const [mousePos, setMousePos] = useState({ x: 0, y: 0 });

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      setMousePos({ x: e.clientX, y: e.clientY });
    };
    window.addEventListener("mousemove", handler);
    return () => window.removeEventListener("mousemove", handler);
  }, []);

  return (
    <div
      className="pointer-events-none fixed inset-0 z-30 transition-opacity duration-300"
      style={{
        background: `radial-gradient(600px circle at ${mousePos.x}px ${mousePos.y}px, rgba(99, 102, 241, 0.08), transparent 40%)`,
      }}
    />
  );
}
```

### Meteor Shower

```tsx
function Meteors({ count = 20 }: { count?: number }) {
  const meteors = useMemo(() =>
    Array.from({ length: count }, (_, i) => ({
      id: i,
      left: `${Math.random() * 100}%`,
      delay: `${Math.random() * 5}s`,
      duration: `${Math.random() * 3 + 2}s`,
    })),
    [count]
  );

  return (
    <div className="pointer-events-none absolute inset-0 overflow-hidden">
      {meteors.map((m) => (
        <span
          key={m.id}
          className="absolute h-0.5 w-0.5 rotate-[215deg] animate-meteor rounded-full
                     bg-slate-500 shadow-[0_0_0_1px_#ffffff10]"
          style={{
            top: "-5%",
            left: m.left,
            animationDelay: m.delay,
            animationDuration: m.duration,
          }}
        >
          <span className="absolute top-1/2 -z-10 h-px w-[50px]
                          bg-gradient-to-r from-slate-500 to-transparent" />
        </span>
      ))}
    </div>
  );
}

// Add to tailwind.config.js:
// keyframes: { meteor: { "0%": { transform: "rotate(215deg) translateX(0)", opacity: "1" },
//   "70%": { opacity: "1" }, "100%": { transform: "rotate(215deg) translateX(-500px)", opacity: "0" } } }
// animation: { meteor: "meteor 5s linear infinite" }
```

### Grid / Dot Pattern Background

```css
/* --- Dot Grid Pattern --- */
.dot-pattern {
  background-image: radial-gradient(
    circle,
    rgba(255, 255, 255, 0.1) 1px,
    transparent 1px
  );
  background-size: 24px 24px;
}

/* --- Line Grid Pattern --- */
.grid-pattern {
  background-image:
    linear-gradient(rgba(255, 255, 255, 0.05) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.05) 1px, transparent 1px);
  background-size: 40px 40px;
}

/* --- Fading Grid (center spotlight) --- */
.grid-fade {
  background-image:
    linear-gradient(rgba(255, 255, 255, 0.05) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.05) 1px, transparent 1px);
  background-size: 40px 40px;
  mask-image: radial-gradient(ellipse 50% 50% at 50% 50%, black 40%, transparent 100%);
  -webkit-mask-image: radial-gradient(ellipse 50% 50% at 50% 50%, black 40%, transparent 100%);
}
```

### Wavy Background

```css
/* CSS waves at bottom of section */
.wave-bg {
  position: relative;
  overflow: hidden;
}
.wave-bg::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 200%;
  height: 120px;
  background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1440 120'%3E%3Cpath fill='%23ffffff' d='M0,64L60,69.3C120,75,240,85,360,80C480,75,600,53,720,48C840,43,960,53,1080,58.7C1200,64,1320,64,1380,64L1440,64L1440,120L1380,120C1320,120,1200,120,1080,120C960,120,840,120,720,120C600,120,480,120,360,120C240,120,120,120,60,120L0,120Z'%3E%3C/path%3E%3C/svg%3E")
    repeat-x;
  animation: wave 8s linear infinite;
}
@keyframes wave {
  0%   { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}
```

### Flickering Grid (Magic UI style)

```tsx
function FlickeringGrid({
  rows = 20,
  cols = 30,
  color = "rgba(99, 102, 241, 0.3)",
}: {
  rows?: number;
  cols?: number;
  color?: string;
}) {
  return (
    <div
      className="grid gap-1 pointer-events-none"
      style={{ gridTemplateColumns: `repeat(${cols}, 1fr)` }}
    >
      {Array.from({ length: rows * cols }).map((_, i) => (
        <motion.div
          key={i}
          className="aspect-square rounded-sm"
          style={{ backgroundColor: color }}
          animate={{ opacity: [0, 0.5, 0] }}
          transition={{
            duration: Math.random() * 3 + 2,
            repeat: Infinity,
            delay: Math.random() * 5,
            ease: "easeInOut",
          }}
        />
      ))}
    </div>
  );
}
```

---

## 8. Scroll-Reveal Patterns

### Basic Scroll Reveal (whileInView)

```tsx
// Simple fade-up on scroll
<motion.div
  initial={{ opacity: 0, y: 40 }}
  whileInView={{ opacity: 1, y: 0 }}
  viewport={{ once: true, margin: "-100px" }}
  transition={{ duration: 0.6, ease: [0.21, 0.47, 0.32, 0.98] }}
>
  Content here
</motion.div>
```

### Staggered Grid Reveal

```tsx
function StaggeredGrid({ items }: { items: React.ReactNode[] }) {
  return (
    <motion.div
      className="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3"
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, margin: "-50px" }}
      variants={{
        visible: { transition: { staggerChildren: 0.1 } },
      }}
    >
      {items.map((item, i) => (
        <motion.div
          key={i}
          variants={{
            hidden: { opacity: 0, y: 30, scale: 0.95 },
            visible: {
              opacity: 1,
              y: 0,
              scale: 1,
              transition: {
                duration: 0.5,
                ease: [0.21, 0.47, 0.32, 0.98],
              },
            },
          }}
        >
          {item}
        </motion.div>
      ))}
    </motion.div>
  );
}
```

### Scroll-Linked Progress Bar

```tsx
function ScrollProgress() {
  const { scrollYProgress } = useScroll();

  return (
    <motion.div
      className="fixed top-0 left-0 right-0 h-1 bg-indigo-500 origin-left z-50"
      style={{ scaleX: scrollYProgress }}
    />
  );
}
```

### Parallax Scroll

```tsx
function ParallaxSection({
  children,
  speed = 0.5,
}: {
  children: React.ReactNode;
  speed?: number;
}) {
  const ref = useRef(null);
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ["start end", "end start"],
  });
  const y = useTransform(scrollYProgress, [0, 1], [0, speed * -200]);

  return (
    <div ref={ref} className="relative overflow-hidden">
      <motion.div style={{ y }}>{children}</motion.div>
    </div>
  );
}
```

### Horizontal Scroll Gallery

```tsx
function HorizontalScrollGallery({ images }: { images: string[] }) {
  const targetRef = useRef<HTMLDivElement>(null);
  const { scrollYProgress } = useScroll({ target: targetRef });
  const x = useTransform(scrollYProgress, [0, 1], ["0%", "-75%"]);

  return (
    <section ref={targetRef} className="relative h-[300vh]">
      <div className="sticky top-0 flex h-screen items-center overflow-hidden">
        <motion.div style={{ x }} className="flex gap-6">
          {images.map((src, i) => (
            <div key={i} className="h-[400px] w-[600px] flex-shrink-0">
              <img
                src={src}
                className="h-full w-full rounded-2xl object-cover"
              />
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}
```

### Text Reveal on Scroll (clip-path)

```tsx
function TextRevealOnScroll({ text }: { text: string }) {
  const ref = useRef(null);
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ["start 0.9", "start 0.3"],
  });
  const clipPath = useTransform(
    scrollYProgress,
    [0, 1],
    ["inset(0 100% 0 0)", "inset(0 0% 0 0)"]
  );

  return (
    <div ref={ref} className="relative">
      <p className="text-4xl font-bold text-white/20">{text}</p>
      <motion.p
        className="absolute inset-0 text-4xl font-bold text-white"
        style={{ clipPath }}
      >
        {text}
      </motion.p>
    </div>
  );
}
```

---

## 9. Button & CTA Animation Patterns

### Shimmer Button

```tsx
function ShimmerButton({ children }: { children: React.ReactNode }) {
  return (
    <button className="group relative inline-flex items-center justify-center
                       overflow-hidden rounded-lg bg-zinc-900 px-8 py-3
                       text-sm font-medium text-white transition-all
                       hover:bg-zinc-800">
      <span className="absolute inset-0 -translate-x-full bg-gradient-to-r
                       from-transparent via-white/10 to-transparent
                       group-hover:translate-x-full transition-transform
                       duration-1000 ease-in-out" />
      <span className="relative">{children}</span>
    </button>
  );
}
```

### Pulsating Button

```tsx
function PulsatingButton({ children }: { children: React.ReactNode }) {
  return (
    <motion.button
      className="relative rounded-lg bg-indigo-600 px-8 py-3 text-white font-medium"
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.98 }}
    >
      <motion.span
        className="absolute inset-0 rounded-lg bg-indigo-600"
        animate={{ scale: [1, 1.05, 1], opacity: [0.5, 0, 0.5] }}
        transition={{ duration: 2, repeat: Infinity, ease: "easeInOut" }}
      />
      <span className="relative">{children}</span>
    </motion.button>
  );
}
```

### Rainbow Border Button

```css
.rainbow-btn {
  position: relative;
  padding: 2px;
  border-radius: 8px;
  background: conic-gradient(
    from var(--angle, 0deg),
    #ff0000, #ff8800, #ffff00, #00ff00, #0088ff, #8800ff, #ff0000
  );
  animation: rainbowSpin 3s linear infinite;
}
.rainbow-btn > span {
  display: block;
  padding: 12px 32px;
  border-radius: 6px;
  background: #0a0a0a;
  color: white;
  font-weight: 500;
}
@property --angle {
  syntax: "<angle>";
  initial-value: 0deg;
  inherits: false;
}
@keyframes rainbowSpin {
  to { --angle: 360deg; }
}
```

### Ripple Effect Button

```tsx
function RippleButton({ children }: { children: React.ReactNode }) {
  const [ripples, setRipples] = useState<{ x: number; y: number; id: number }[]>([]);

  const handleClick = (e: React.MouseEvent<HTMLButtonElement>) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    const id = Date.now();
    setRipples((prev) => [...prev, { x, y, id }]);
    setTimeout(() => {
      setRipples((prev) => prev.filter((r) => r.id !== id));
    }, 600);
  };

  return (
    <button
      onClick={handleClick}
      className="relative overflow-hidden rounded-lg bg-indigo-600 px-8 py-3
                 text-white font-medium transition-colors hover:bg-indigo-700"
    >
      {ripples.map((r) => (
        <motion.span
          key={r.id}
          className="absolute rounded-full bg-white/30"
          initial={{ width: 0, height: 0, x: r.x, y: r.y, opacity: 1 }}
          animate={{ width: 300, height: 300, x: r.x - 150, y: r.y - 150, opacity: 0 }}
          transition={{ duration: 0.6, ease: "easeOut" }}
        />
      ))}
      <span className="relative z-10">{children}</span>
    </button>
  );
}
```

### Magnetic CTA with Glow

```tsx
function GlowCTA({ children }: { children: React.ReactNode }) {
  return (
    <motion.button
      whileHover={{ scale: 1.05, boxShadow: "0 0 30px rgba(99, 102, 241, 0.5)" }}
      whileTap={{ scale: 0.95 }}
      transition={{ type: "spring", stiffness: 400, damping: 17 }}
      className="rounded-full bg-indigo-600 px-8 py-4 text-white font-semibold
                 shadow-lg shadow-indigo-500/25 transition-shadow"
    >
      {children}
    </motion.button>
  );
}
```

### Animated Border Button (Border Beam)

```tsx
function BorderBeamButton({ children }: { children: React.ReactNode }) {
  return (
    <button className="relative overflow-hidden rounded-lg bg-zinc-900 px-8 py-3 text-white">
      <span className="absolute inset-0 rounded-lg">
        <span
          className="absolute h-[2px] w-[60px] bg-gradient-to-r from-transparent
                     via-indigo-500 to-transparent"
          style={{
            offsetPath: `rect(0 100% 100% 0 round 8px)`,
            animation: "border-beam 4s linear infinite",
          }}
        />
      </span>
      <span className="relative">{children}</span>
    </button>
  );
}
```

---

## 10. Loading & Skeleton Animation Patterns

### Shimmer Skeleton

```css
/* --- Classic Shimmer Skeleton --- */
.skeleton {
  background: linear-gradient(
    90deg,
    #1a1a2e 25%,
    #2a2a4e 50%,
    #1a1a2e 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s linear infinite;
  border-radius: 8px;
}
@keyframes shimmer {
  0%   { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}

/* --- Light Mode Shimmer --- */
.skeleton-light {
  background: linear-gradient(
    90deg,
    #f0f0f0 25%,
    #e0e0e0 50%,
    #f0f0f0 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s linear infinite;
  border-radius: 8px;
}
```

### Pulse Skeleton

```css
.skeleton-pulse {
  background: #1a1a2e;
  border-radius: 8px;
  animation: pulse 2s ease-in-out infinite;
}
@keyframes pulse {
  0%, 100% { opacity: 1; }
  50%      { opacity: 0.5; }
}
```

```tsx
// Tailwind skeleton
function Skeleton({ className }: { className?: string }) {
  return (
    <div className={cn("animate-pulse rounded-md bg-zinc-800", className)} />
  );
}

// Usage
function CardSkeleton() {
  return (
    <div className="rounded-xl border border-white/10 bg-zinc-900 p-6 space-y-4">
      <Skeleton className="h-40 w-full rounded-lg" />
      <Skeleton className="h-4 w-3/4" />
      <Skeleton className="h-4 w-1/2" />
      <div className="flex gap-2">
        <Skeleton className="h-8 w-20 rounded-full" />
        <Skeleton className="h-8 w-20 rounded-full" />
      </div>
    </div>
  );
}
```

### Spinner Variants

```css
/* --- Ring Spinner --- */
.spinner {
  width: 24px;
  height: 24px;
  border: 3px solid rgba(255, 255, 255, 0.1);
  border-top-color: #6366f1;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

/* --- Dots Spinner --- */
.dots-spinner {
  display: flex;
  gap: 4px;
}
.dots-spinner > span {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #6366f1;
  animation: dotBounce 1.4s ease-in-out infinite both;
}
.dots-spinner > span:nth-child(2) { animation-delay: 0.16s; }
.dots-spinner > span:nth-child(3) { animation-delay: 0.32s; }
@keyframes dotBounce {
  0%, 80%, 100% { transform: scale(0); }
  40%           { transform: scale(1); }
}

/* --- Bar Spinner --- */
.bar-spinner {
  display: flex;
  gap: 3px;
  align-items: center;
  height: 20px;
}
.bar-spinner > span {
  width: 3px;
  height: 100%;
  background: #6366f1;
  animation: barPulse 1.2s ease-in-out infinite;
}
.bar-spinner > span:nth-child(2) { animation-delay: 0.1s; }
.bar-spinner > span:nth-child(3) { animation-delay: 0.2s; }
.bar-spinner > span:nth-child(4) { animation-delay: 0.3s; }
@keyframes barPulse {
  0%, 100% { transform: scaleY(0.4); }
  50%      { transform: scaleY(1); }
}
```

### Progress Bar with Animation

```tsx
function AnimatedProgress({ value }: { value: number }) {
  return (
    <div className="h-2 w-full overflow-hidden rounded-full bg-zinc-800">
      <motion.div
        className="h-full rounded-full bg-gradient-to-r from-indigo-500 to-pink-500"
        initial={{ width: "0%" }}
        animate={{ width: `${value}%` }}
        transition={{ duration: 1, ease: "easeOut" }}
      />
    </div>
  );
}
```

---

## 11. Modal & Dialog Transition Patterns

### Scale + Fade Modal

```tsx
function Modal({
  isOpen,
  onClose,
  children,
}: {
  isOpen: boolean;
  onClose: () => void;
  children: React.ReactNode;
}) {
  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* Backdrop */}
          <motion.div
            className="fixed inset-0 z-50 bg-black/60 backdrop-blur-sm"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
          />
          {/* Dialog */}
          <motion.div
            className="fixed inset-0 z-50 flex items-center justify-center p-4"
            initial={{ opacity: 0, scale: 0.95, y: 10 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95, y: 10 }}
            transition={{
              type: "spring",
              stiffness: 300,
              damping: 30,
            }}
          >
            <div className="relative w-full max-w-lg rounded-2xl border
                          border-white/10 bg-zinc-900 p-6 shadow-2xl">
              {children}
            </div>
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
```

### Slide-Up Sheet / Drawer

```tsx
function Sheet({
  isOpen,
  onClose,
  children,
}: {
  isOpen: boolean;
  onClose: () => void;
  children: React.ReactNode;
}) {
  return (
    <AnimatePresence>
      {isOpen && (
        <>
          <motion.div
            className="fixed inset-0 z-50 bg-black/50"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
          />
          <motion.div
            className="fixed bottom-0 left-0 right-0 z-50 rounded-t-2xl
                      border-t border-white/10 bg-zinc-900 p-6"
            initial={{ y: "100%" }}
            animate={{ y: 0 }}
            exit={{ y: "100%" }}
            transition={{
              type: "spring",
              stiffness: 300,
              damping: 30,
            }}
            drag="y"
            dragConstraints={{ top: 0 }}
            dragElastic={0.2}
            onDragEnd={(_, info) => {
              if (info.offset.y > 100) onClose();
            }}
          >
            {/* Drag handle */}
            <div className="mx-auto mb-4 h-1.5 w-12 rounded-full bg-zinc-700" />
            {children}
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
```

### Slide-In Side Panel

```tsx
function SidePanel({
  isOpen,
  onClose,
  side = "right",
  children,
}: {
  isOpen: boolean;
  onClose: () => void;
  side?: "left" | "right";
  children: React.ReactNode;
}) {
  const xInitial = side === "right" ? "100%" : "-100%";

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          <motion.div
            className="fixed inset-0 z-50 bg-black/50"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
          />
          <motion.div
            className={`fixed top-0 bottom-0 z-50 w-full max-w-md
                       border-white/10 bg-zinc-900 p-6 shadow-2xl
                       ${side === "right" ? "right-0 border-l" : "left-0 border-r"}`}
            initial={{ x: xInitial }}
            animate={{ x: 0 }}
            exit={{ x: xInitial }}
            transition={{
              type: "spring",
              stiffness: 300,
              damping: 30,
            }}
          >
            {children}
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
```

### Expand from Origin (shared layout)

```tsx
function ExpandableCard({
  id,
  children,
  expandedContent,
}: {
  id: string;
  children: React.ReactNode;
  expandedContent: React.ReactNode;
}) {
  const [isExpanded, setIsExpanded] = useState(false);

  return (
    <>
      <motion.div
        layoutId={`card-${id}`}
        onClick={() => setIsExpanded(true)}
        className="cursor-pointer rounded-xl border border-white/10
                  bg-zinc-900 p-4"
      >
        <motion.div layoutId={`content-${id}`}>{children}</motion.div>
      </motion.div>

      <AnimatePresence>
        {isExpanded && (
          <>
            <motion.div
              className="fixed inset-0 z-50 bg-black/60"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={() => setIsExpanded(false)}
            />
            <motion.div
              layoutId={`card-${id}`}
              className="fixed inset-4 z-50 rounded-2xl border
                        border-white/10 bg-zinc-900 p-8 md:inset-20"
            >
              <motion.div layoutId={`content-${id}`}>{children}</motion.div>
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: 20 }}
                transition={{ delay: 0.2 }}
              >
                {expandedContent}
              </motion.div>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </>
  );
}
```

---

## 12. Easing Function Reference

### Standard CSS Easings

| Name | cubic-bezier | Use Case |
|------|-------------|----------|
| `ease` | `(0.25, 0.1, 0.25, 1)` | General-purpose default |
| `ease-in` | `(0.42, 0, 1, 1)` | Elements exiting view |
| `ease-out` | `(0, 0, 0.58, 1)` | Elements entering view |
| `ease-in-out` | `(0.42, 0, 0.58, 1)` | Symmetric transitions |
| `linear` | `(0, 0, 1, 1)` | Continuous animations (spin, marquee) |

### Premium Easings (from easings.net)

| Name | cubic-bezier | Character |
|------|-------------|-----------|
| easeInSine | `(0.12, 0, 0.39, 0)` | Subtle acceleration |
| easeOutSine | `(0.61, 1, 0.88, 1)` | Subtle deceleration |
| easeInOutSine | `(0.37, 0, 0.63, 1)` | Smooth symmetric |
| easeInQuad | `(0.11, 0, 0.5, 0)` | Moderate acceleration |
| easeOutQuad | `(0.5, 1, 0.89, 1)` | Moderate deceleration |
| easeInOutQuad | `(0.45, 0, 0.55, 1)` | Moderate symmetric |
| easeInCubic | `(0.32, 0, 0.67, 0)` | Strong acceleration |
| easeOutCubic | `(0.33, 1, 0.68, 1)` | Strong deceleration |
| easeInOutCubic | `(0.65, 0, 0.35, 1)` | Strong symmetric |
| easeInQuart | `(0.5, 0, 0.75, 0)` | Very strong acceleration |
| easeOutQuart | `(0.25, 1, 0.5, 1)` | Very strong deceleration |
| easeInOutQuart | `(0.76, 0, 0.24, 1)` | Dramatic symmetric |
| easeInQuint | `(0.64, 0, 0.78, 0)` | Extreme acceleration |
| easeOutQuint | `(0.22, 1, 0.36, 1)` | Extreme deceleration |
| easeInOutQuint | `(0.83, 0, 0.17, 1)` | Extreme symmetric |
| easeInExpo | `(0.7, 0, 0.84, 0)` | Exponential in |
| easeOutExpo | `(0.16, 1, 0.3, 1)` | Exponential out (great for reveals) |
| easeInOutExpo | `(0.87, 0, 0.13, 1)` | Exponential symmetric |
| easeInCirc | `(0.55, 0, 1, 0.45)` | Circular in |
| easeOutCirc | `(0, 0.55, 0.45, 1)` | Circular out |
| easeInOutCirc | `(0.85, 0, 0.15, 1)` | Circular symmetric |
| easeInBack | `(0.36, 0, 0.66, -0.56)` | Overshoots then enters |
| easeOutBack | `(0.34, 1.56, 0.64, 1)` | Overshoots target then settles |
| easeInOutBack | `(0.68, -0.6, 0.32, 1.6)` | Overshoots both ways |

### Commonly Used Framer Motion Easings

```tsx
// Apple-like smooth deceleration
transition={{ ease: [0.16, 1, 0.3, 1] }}

// Vercel/Next.js style
transition={{ ease: [0.21, 0.47, 0.32, 0.98] }}

// Material Design standard
transition={{ ease: [0.4, 0, 0.2, 1] }}

// Material Design decelerate
transition={{ ease: [0, 0, 0.2, 1] }}

// Material Design accelerate
transition={{ ease: [0.4, 0, 1, 1] }}

// Snappy enter
transition={{ ease: [0.22, 1, 0.36, 1] }}

// Bouncy spring
transition={{ type: "spring", stiffness: 400, damping: 17 }}

// Gentle spring
transition={{ type: "spring", stiffness: 260, damping: 20 }}

// Heavy spring (for layout animations)
transition={{ type: "spring", stiffness: 300, damping: 30 }}
```

### CSS linear() Function (Modern Bounce/Elastic)

```css
/* Spring easing (native CSS, no JS needed) */
.spring-animation {
  transition: transform 0.6s linear(
    0, 0.009, 0.035 2.1%, 0.141, 0.281 6.7%, 0.723 12.9%,
    0.938 16.7%, 1.017, 1.077, 1.121, 1.149 24.3%,
    1.159, 1.163, 1.161, 1.154 29.9%, 1.129 32.8%,
    1.051 39.6%, 1.017 43.1%, 0.991, 0.977 51%,
    0.974 53.8%, 0.975 57.1%, 0.997 69.8%, 1.003 76.9%, 1
  );
}

/* Bounce easing */
.bounce-animation {
  transition: transform 0.8s linear(
    0, 0.004, 0.016, 0.035, 0.063, 0.098, 0.141, 0.191,
    0.25, 0.316, 0.391 36.8%, 0.563, 0.766 45.3%,
    0.879 48.1%, 1.013 53.2%, 1.049 55%, 1.1 58.3%,
    1.111 60.4%, 1.112, 1.1, 1.079 67%, 1, 0.938 72.7%,
    0.882 75.4%, 0.85, 0.836, 0.849, 0.89 81.6%,
    1, 1.042 88%, 1.045, 1.036 90.4%, 1, 0.981,
    0.974, 0.98, 1
  );
}
```

---

## 13. Color & Shadow Systems

### Layered Shadow System (depth levels)

```css
/* Based on shadows.brumm.af smooth shadow technique */
:root {
  /* Shadow Elevation 1 (subtle) */
  --shadow-sm:
    0 1px 2px rgba(0, 0, 0, 0.04),
    0 1px 3px rgba(0, 0, 0, 0.06);

  /* Shadow Elevation 2 (card) */
  --shadow-md:
    0 2px 4px rgba(0, 0, 0, 0.03),
    0 4px 8px rgba(0, 0, 0, 0.04),
    0 8px 16px rgba(0, 0, 0, 0.05);

  /* Shadow Elevation 3 (dropdown) */
  --shadow-lg:
    0 2px 4px rgba(0, 0, 0, 0.02),
    0 4px 8px rgba(0, 0, 0, 0.03),
    0 8px 16px rgba(0, 0, 0, 0.04),
    0 16px 32px rgba(0, 0, 0, 0.06);

  /* Shadow Elevation 4 (modal) */
  --shadow-xl:
    0 2px 4px rgba(0, 0, 0, 0.02),
    0 4px 8px rgba(0, 0, 0, 0.03),
    0 8px 16px rgba(0, 0, 0, 0.04),
    0 16px 32px rgba(0, 0, 0, 0.06),
    0 32px 64px rgba(0, 0, 0, 0.08);

  /* Colored Glow Shadow */
  --shadow-glow-indigo:
    0 0 15px rgba(99, 102, 241, 0.3),
    0 0 30px rgba(99, 102, 241, 0.15),
    0 0 60px rgba(99, 102, 241, 0.08);

  --shadow-glow-pink:
    0 0 15px rgba(236, 72, 153, 0.3),
    0 0 30px rgba(236, 72, 153, 0.15),
    0 0 60px rgba(236, 72, 153, 0.08);
}
```

### Dark Theme Color Palette (common across libraries)

```css
:root {
  /* Zinc-based (shadcn/ui default) */
  --background: #09090b;    /* zinc-950 */
  --foreground: #fafafa;    /* zinc-50 */
  --card: #18181b;          /* zinc-900 */
  --card-foreground: #fafafa;
  --border: #27272a;        /* zinc-800 */
  --muted: #27272a;
  --muted-foreground: #a1a1aa; /* zinc-400 */
  --accent: #27272a;
  --accent-foreground: #fafafa;
  --primary: #6366f1;       /* indigo-500 */
  --primary-foreground: #ffffff;
  --destructive: #ef4444;   /* red-500 */

  /* Common accent gradients */
  --gradient-primary: linear-gradient(135deg, #6366f1, #ec4899);
  --gradient-warm: linear-gradient(135deg, #f59e0b, #ef4444);
  --gradient-cool: linear-gradient(135deg, #06b6d4, #6366f1);
  --gradient-nature: linear-gradient(135deg, #10b981, #06b6d4);
}
```

### Tailwind Color Usage Convention

```
Background:     bg-zinc-950, bg-zinc-900, bg-zinc-800
Surface/Card:   bg-zinc-900, bg-zinc-800/50
Borders:        border-white/10, border-white/20, border-zinc-800
Text primary:   text-white, text-zinc-50
Text secondary: text-zinc-400, text-zinc-500
Text muted:     text-zinc-600
Accent:         text-indigo-500, bg-indigo-600
Interactive:    hover:bg-zinc-800, hover:border-white/20
```

---

## 14. Spacing & Typography Systems

### Spacing Scale (Tailwind default, used by shadcn/ui, Magic UI, Aceternity)

| Class | Size | Use Case |
|-------|------|----------|
| `p-1` / `gap-1` | 4px | Inline icon spacing |
| `p-2` / `gap-2` | 8px | Tight element groups |
| `p-3` / `gap-3` | 12px | Compact cards |
| `p-4` / `gap-4` | 16px | Standard card padding, grid gaps |
| `p-6` / `gap-6` | 24px | Card content areas |
| `p-8` / `gap-8` | 32px | Section padding, generous spacing |
| `p-12` / `gap-12` | 48px | Major section separation |
| `p-16` / `gap-16` | 64px | Page section vertical spacing |
| `p-20` / `gap-20` | 80px | Hero section padding |
| `p-24` / `gap-24` | 96px | Large hero/CTA vertical padding |

### Typography Scale

```css
/* Common heading sizes across premium libraries */
.text-hero    { font-size: clamp(2.5rem, 5vw, 4.5rem); line-height: 1.1; letter-spacing: -0.02em; }
.text-display { font-size: clamp(2rem, 4vw, 3.5rem);   line-height: 1.15; letter-spacing: -0.02em; }
.text-h1      { font-size: clamp(1.75rem, 3vw, 2.5rem); line-height: 1.2; letter-spacing: -0.02em; }
.text-h2      { font-size: 1.875rem; line-height: 1.3; letter-spacing: -0.01em; }
.text-h3      { font-size: 1.5rem;   line-height: 1.4; }
.text-h4      { font-size: 1.25rem;  line-height: 1.4; }
.text-body    { font-size: 1rem;     line-height: 1.6; }
.text-small   { font-size: 0.875rem; line-height: 1.5; }
.text-caption  { font-size: 0.75rem;  line-height: 1.5; }
```

### Font Families (popular in premium UI)

```css
/* Geist Sans (Vercel, shadcn default) */
font-family: 'Geist', 'Inter', system-ui, -apple-system, sans-serif;

/* Inter (most common) */
font-family: 'Inter', system-ui, -apple-system, sans-serif;

/* Cal Sans (display headings) */
font-family: 'Cal Sans', 'Inter', sans-serif;

/* Monospace (code, terminals) */
font-family: 'Geist Mono', 'JetBrains Mono', 'Fira Code', monospace;

/* System stack (performance) */
font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
             Roboto, 'Helvetica Neue', Arial, sans-serif;
```

### Border Radius Convention

```
Buttons:       rounded-lg (8px) or rounded-full (pill)
Cards:         rounded-xl (12px) or rounded-2xl (16px)
Modals:        rounded-2xl (16px)
Badges/Chips:  rounded-full
Inputs:        rounded-md (6px) or rounded-lg (8px)
Avatars:       rounded-full
Containers:    rounded-xl (12px)
```

---

## Quick Reference: When to Use What

| Effect | Library/Technique | Difficulty |
|--------|-------------------|------------|
| Fade/slide enter | Framer Motion `initial` + `animate` | Low |
| Staggered list | Framer Motion `staggerChildren` | Low |
| Scroll reveal | Framer Motion `whileInView` | Low |
| Hover scale | Framer Motion `whileHover` / CSS `transition` | Low |
| Skeleton loader | CSS `@keyframes` shimmer | Low |
| Gradient text | CSS `background-clip: text` | Low |
| Glassmorphism | CSS `backdrop-filter: blur()` | Low |
| Parallax scroll | Framer Motion `useScroll` + `useTransform` | Medium |
| 3D tilt card | CSS `perspective` + JS mouse tracking | Medium |
| Spotlight glow | CSS custom properties + JS mousemove | Medium |
| Magnetic button | Framer Motion `useMotionValue` + `animate` | Medium |
| Border beam | CSS `offset-path` animation | Medium |
| Aurora background | CSS layered gradients + keyframes | Medium |
| Particle field | Canvas 2D + `requestAnimationFrame` | Medium |
| Shared layout | Framer Motion `layoutId` | Medium |
| Morphing text | Framer Motion `AnimatePresence` + `key` | Medium |
| Direction-aware hover | JS `atan2` + Framer Motion variants | High |
| Mesh gradient anim | Multiple `radial-gradient` + keyframes | High |
| 3D globe | Three.js / react-three-fiber | High |

---

## Source Libraries & Tools Reference

| Resource | URL | Purpose |
|----------|-----|---------|
| Aceternity UI | ui.aceternity.com | 200+ animated React components |
| Magic UI | magicui.design | 150+ animated components, shadcn companion |
| SyntaxUI | syntaxui.com | 100+ copy-paste React components |
| Hover.dev | hover.dev | Animated sections and components |
| Cult UI | cult-ui.com | Animated shadcn extras |
| shadcn/ui | ui.shadcn.com | Foundation design system (60+ components) |
| Tremor | tremor.so | Dashboard & chart components |
| HeroUI | heroui.com | Beautiful defaults, React Aria based |
| daisyUI | daisyui.com | CSS-only Tailwind components |
| Animista | animista.net | CSS animation generator |
| Easings.net | easings.net | Easing function cheat sheet |
| cubic-bezier.com | cubic-bezier.com | Bezier curve editor |
| Smooth Shadows | smoothshadows.com | Layered shadow generator |
| gradient.style | gradient.style | OKLCH HD gradient generator |
| Neumorphism.io | neumorphism.io | Soft UI shadow generator |
| Glass UI | ui.glass/generator | Glassmorphism generator |
| Mesher | csshero.org/mesher | Mesh gradient generator |
| tsParticles | particles.js.org | Particle animation library |
| Motion | motion.dev | Framer Motion (animation library) |
