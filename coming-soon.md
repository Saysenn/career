This is already strong — I’ll upgrade it into a **v2 “production-grade + always-unique + workflow-safe” prompt** while keeping your intent intact.

I’ll also **force a pre-generation step** so it *asks you for footer info first* before generating anything.

---

# 🚀 **Improved Prompt (v2 – Structured, Unique, and Controlled)**

## Coming Soon / Maintenance / Live Page Generator

Create a single self-contained `index.html` that can function as a **Coming Soon**, **Maintenance**, or **Live Redirect** page.

---

## ⚠️ Pre-Generation Requirement (MUST DO FIRST)

Before generating the page, you MUST:

1. **Ask the user to provide footer and company details first**
2. Do NOT generate the HTML yet
3. Wait for the user’s response

Prompt the user clearly with:

> “Please provide the available company/footer details. You can leave any field blank for now — we will structure the layout to handle missing information gracefully.”

Then request:

* Company name
* Tagline (optional)
* Phone (optional)
* Email
* Address (optional)
* Company number (optional)
* VAT (optional)
* Dropdown options (for form)
* Countdown duration (optional)
* Maintenance duration (optional)
* Live URL
* Colour palette (optional)

👉 Missing fields must NOT break the layout — handle them conditionally.

---

## 🧠 Core Requirement (Important)

The page MUST include a **clear, simple, and easily editable configuration system at the very top of the file**.

This configuration must:

* Be human-readable and beginner-friendly
* Use simple variables only
* Require no structural edits to switch modes

---

## ⚙️ Configuration System

Define:

```js
const CONFIG = {
  COMING_SOON: true,
  MAINTENANCE: false,
  LIVE: false,

  LIVE_URL: "",
  COUNTDOWN_DURATION: 90, // days
  MAINTENANCE_DURATION: 2 // hours
};
```

### Rules:

* Only ONE mode can be `true`
* Mode fully controls rendering
* If `LIVE === true`, auto-redirect to `LIVE_URL`
* Fail-safe: if multiple are true, default to `COMING_SOON`

---

## 🎨 Variation & Uniqueness System (CRITICAL)

Each generated page MUST feel like a **completely different design**, not a reused template.

### Before generating:

Internally decide a **Design Theme + Layout Direction**, such as:

* Luxury dark (black/gold, glassmorphism)
* Minimal light (clean, whitespace-heavy)
* Futuristic (neon, blur, glow)
* Corporate (structured, blue tones)
* Creative startup (playful, gradients)

---

### Enforce Variation Across:

#### 1. Layout

Randomize structure:

* Centered hero
* Split layout
* Grid/asymmetrical
* Fullscreen overlay
* Card-based sections

#### 2. Typography

Use a **different Google Font pairing every time**:

* Serif + Sans
* Modern geometric
* Editorial style
* Tech/mono accent

#### 3. Copywriting

Avoid repeating phrases like:

* “Coming Soon”

Instead vary tone:

* Premium
* Friendly
* Technical
* Bold marketing

---

#### 4. Components

Randomize:

* Countdown style (boxed, inline, circular, segmented)
* Form layout (inline, modal, multi-step, split)
* Buttons (pill, sharp, gradient, ghost)

---

#### 5. Motion & Interaction

Include subtle but varied:

* Entry animations
* Hover states
* Background motion (gradients, blur, parallax feel)

---

#### 6. Strict Rule

> The output must look like it was designed from scratch each time.

---

## 🎯 Mode Requirements

### Coming Soon Mode

Include:

* Strong visual hero section
* Unique headline (NOT generic)
* Countdown timer (based on config)
* Integrated contact/interest form

#### Form Behavior:

* Simulated submission
* Smooth success state (animation or UI feedback)
* Flexible structure (can be multi-step or creative layout)

---

### Maintenance Mode

Include:

* Clear downtime message
* Estimated return time
* Visually consistent with chosen theme
* Optional subtle animation (spinner, pulse, etc.)

---

### Live Mode

* Automatically redirect using JavaScript
* Show fallback message if redirect fails

---

## 🧾 Footer System (Important)

The footer must:

* Dynamically adapt to missing fields
* Only display provided information
* Maintain clean spacing even with partial data

Include:

* Brand identity
* Contact info
* Legal/company info
* Copyright

---

## 🧱 Technical Requirements

* Single `index.html`
* No external assets (images must be base64 if used)
* Google Fonts allowed
* Fully responsive
* Use CSS variables for theming
* Clean, well-structured code
* No unnecessary complexity

---

## 🎨 Design Quality Standard

The output must feel like:

> A premium, agency-level landing page — not a template.

Avoid:

* Generic layouts
* Repetitive structures
* Default styling

---

## 📦 Output Expectation

* Fully working `index.html`
* Config system clearly visible at the top
* Easy to switch modes
* Visually distinct and polished
* Handles missing data gracefully

---
