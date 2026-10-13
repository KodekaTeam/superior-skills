# Style and Palette Direction

Use this reference only when a task needs a new visual direction, a comparison of style options, or a new color system. Named styles and palette recipes are starting vocabularies, not goals by themselves. Product evidence, content, interaction density, accessibility, and implementation constraints decide what survives.

## Select before styling

If an established design system governs the surface, preserve it unless the user authorizes a change. Otherwise:

1. Write the product task, audience, content density, and trust requirements.
2. Shortlist two or three directions that make meaningfully different decisions.
3. For each candidate, state its fit, defining traits, and main failure risk.
4. Choose one primary direction. Add at most one supporting influence for a narrow purpose.
5. Express the result as a visual thesis that constrains hierarchy, type, color, geometry, imagery, and motion.

Do not produce a sampler containing every trend. If the user requests multiple concepts, keep each concept internally coherent and compare them against the same product criteria.

## Style menu

### Minimalism

Use for focused tools, high-trust flows, and content that benefits from calm. Create distinction through typography, spacing, proportion, and precise interaction states. Minimalism is not empty space plus faint gray text; it still needs visible hierarchy and adequate information density.

### Maximalism

Use for expressive brands, culture, entertainment, or editorial storytelling where abundance is intentional. Control it with a stable grid, limited type roles, recurring motifs, and one clear reading path. Do not make every element compete at the same intensity.

### Flat design

Use when speed, clarity, scalability, and direct manipulation matter. Rely on shape, color, alignment, and state changes rather than simulated depth. Interactive elements still need strong affordances; "flat" does not mean indistinguishable controls.

### Neumorphism

Use sparingly for low-density, noncritical surfaces where a soft tactile impression supports the product. Do not depend on shadows alone for boundaries or pressed states. Provide visible edges, focus, labels, and sufficient contrast; avoid it for dense forms or high-stakes controls.

### Claymorphism

Use for playful onboarding, youth-oriented products, illustrations, or a limited hero moment. Keep inflated geometry and soft depth to a small component family. Avoid turning dense operational interfaces into oversized toy-like controls.

### Aurora UI

Use atmospheric color fields or blended gradients for branded backgrounds, transitions, or focal moments. Place content on controlled, readable surfaces and keep color motion subordinate to the task. Do not use glow to compensate for weak composition.

### Brutalism

Use for assertive editorial, cultural, experimental, or anti-polish positioning. Build it from deliberate type scale, exposed structure, hard contrast, and direct interaction. Roughness must remain systematic; broken alignment, inaccessible contrast, and hostile controls are defects, not authenticity.

### Collage art

Use for campaigns, portfolios, magazines, or narrative experiences that benefit from juxtaposition. Establish an anchor grid and reading order beneath the overlap. Keep forms, navigation, and dense data outside chaotic collage regions.

### Skeuomorphism

Use when a familiar physical metaphor improves learning or affordance, especially in instruments, creative tools, or simulations. Preserve digital efficiency and accessibility. Do not reproduce physical limitations or decorate every control with unrelated realism.

### Retro

Choose a specific period and its design grammar: type, spacing, color, imagery, and interaction references should agree. Use it for brand character, games, media, or campaigns. Random nostalgia effects without a coherent era produce costume rather than identity.

### Glassmorphism

Use translucent layers to communicate depth over meaningful imagery or color fields. Limit glass to a small elevation system, provide a solid-color fallback, and verify contrast against every background state. Avoid nested glass panels, excessive blur, and translucent body text surfaces.

## Match style to product conditions

| Product condition | Strong candidates | Treat cautiously |
| --- | --- | --- |
| Dense operations or data | Minimalism, flat design | Claymorphism, collage, heavy glass |
| High-trust transaction | Minimalism, flat design, restrained skeuomorphism | Neumorphism, chaotic maximalism |
| Expressive marketing | Maximalism, aurora, collage, retro | Generic minimalism without brand evidence |
| Playful onboarding | Claymorphism, flat design, selective skeuomorphism | Brutalism without audience fit |
| Creative instrument | Skeuomorphism, flat design, restrained glass | Decoration that obscures controls |
| Experimental editorial | Brutalism, collage, maximalism, retro | Convention-heavy dashboard patterns |

This table narrows exploration; it does not override project evidence.

## Build a semantic color system

Keep raw swatches separate from role tokens. A five-color image palette is not yet a usable UI theme.

### Body roles

- `--canvas`: page background;
- `--canvas-subtle`: alternate section or quiet region;
- `--text-primary`: default body copy and headings;
- `--text-secondary`: supporting copy that still passes contrast;
- `--link`: inline navigation with a non-color cue where needed.

### Component roles

- `--surface`: cards, forms, menus, and content panels;
- `--surface-raised`: overlays or genuinely elevated regions;
- `--border`: component separation and input boundaries;
- `--action`: primary interactive emphasis;
- `--action-hover` and `--action-pressed`: observable interaction states;
- `--focus-ring`: a visible keyboard-focus boundary against adjacent surfaces.

### Typography roles

- Use the darkest suitable neutral or chromatic tone for primary text on light surfaces.
- Reserve mid-tone swatches for secondary text only after measuring contrast.
- Define inverse text from the actual action or dark-surface color, not by assuming white always passes.
- Do not use accent, placeholder, or disabled colors as ordinary body copy.

### State roles

Define success, warning, danger, and information separately. Pair each with text, icon, or shape; color alone must not carry status. A brand palette may supply a state color only when the meaning remains conventional and distinguishable.

## Palette starting points

These palettes are transcribed from the supplied references. Treat them as exploration inputs and verify the rendered combinations before adoption.

| Name | Character | Swatches |
| --- | --- | --- |
| Dusk | calm, warm, sophisticated | `#1A1B2E`, `#42426F`, `#6D5BA6`, `#F08A8A`, `#FFD6C9` |
| Sage | fresh, natural, balanced | `#2E4D3D`, `#527F5B`, `#A3C9A8`, `#DCEAD9`, `#F7F7F2` |
| Ocean | cool, clean, refreshing | `#0D1B2A`, `#1B4965`, `#29ADB2`, `#A8DADC`, `#E6F4F1` |
| Sunset | vibrant, energetic, friendly | `#E94F37`, `#F9844A`, `#F9C74F`, `#FDD9B5`, `#FFF2E7` |
| Lavender | soft, dreamy, elegant | `#5E4B8B`, `#7D6CC4`, `#B9A7E0`, `#E7D6F7`, `#F6F2FB` |
| Mustard | bold, modern, playful | `#2B2B2B`, `#D4A017`, `#F0C94C`, `#F7E7B5`, `#FFFDF5` |
| Teal/Gray | minimal, calm, professional | `#263238`, `#455A64`, `#80CBC4`, `#CFD8DC`, `#ECEFF1` |
| Berry | rich, bold, luxurious | `#6B0F3C`, `#9D174D`, `#E3356A`, `#F7A1B3`, `#FFE6EC` |
| Arctic | crisp, cool, modern | `#102A43`, `#1E88E5`, `#64B5F6`, `#BBDEFB`, `#E3F2FD` |
| Neutral | timeless, clean, versatile | `#333333`, `#757575`, `#BDBDBD`, `#EEEEEE`, `#FAFAFA` |

Additional supplied combinations:

| Family | Swatches |
| --- | --- |
| Electric blue | `#0D1B2A`, `#1B6BFF`, `#A8D8FF`, `#E6ECF3`, `#FFFFFF` |
| Violet rose | `#2D1B69`, `#6D28D9`, `#FF70A6`, `#FFD6E0`, `#FFF9F5` |
| Emerald mint | `#064E3B`, `#10B981`, `#A7F3D0`, `#D1FAE5`, `#FFFFFF` |
| Orange yellow | `#1F2937`, `#F97316`, `#FACC15`, `#FEF3C7`, `#FFFBF5` |
| Red orange | `#7F1D1D`, `#EF4444`, `#FB923C`, `#FED7AA`, `#FFFFFF` |
| Cyan | `#083344`, `#06B6D4`, `#67E8F9`, `#CFFAFE`, `#FFFFFF` |
| Olive lime | `#3A3F2B`, `#6B8E23`, `#A3C957`, `#DDECC8`, `#F9FAF6` |
| Indigo violet | `#1E1B4B`, `#4338CA`, `#8B5CF6`, `#DDD6FE`, `#F5F3FF` |
| Brown amber | `#3E2723`, `#A16207`, `#FBBF24`, `#FEF3C7`, `#FFFCF5` |
| Slate | `#334155`, `#64748B`, `#CBD5E1`, `#E2E8F0`, `#FFFFFF` |

## Compact website palette recipes

The following combinations normalize the supplied website-color reference into four initial roles. They intentionally overlap some broader palettes above: use them when a compact web direction is more useful than a five-swatch exploration set.

| Recipe | Accent | Support | Tint | Ink |
| --- | --- | --- | --- | --- |
| Royal Purple | `#6C5CE7` | `#A29BFE` | `#F8F9FA` | `#0F172A` |
| Ocean Blue | `#2563EB` | `#60A5FA` | `#E0F2FE` | `#0F172A` |
| Forest Green | `#16A34A` | `#86EFAC` | `#F0FDF4` | `#1F2937` |
| Sunset Orange | `#F97316` | `#FDBA74` | `#FFF7ED` | `#1F2937` |
| Rose Pink | `#EC4899` | `#F9A8D4` | `#FCE7F3` | `#1F2937` |
| Teal and White | `#14B8A6` | `#5EEAD4` | `#F0FDFA` | `#0F172A` |
| Golden Yellow | `#FACC15` | `#FDE68A` | `#FFFBEB` | `#1F2937` |
| Deep Navy | `#1E293B` | `#334155` | `#CBD5E1` | `#F8FAFC` |
| Violet Dream | `#7C3AED` | `#C4B5FD` | `#EDE9FE` | `#080F19` |
| Classic Red | `#EF4444` | `#F87171` | `#FEE2E2` | `#111827` |

Treat the recipe names as navigation labels, not evidence that a color creates trust, luxury, conversion, or a particular emotion. Validate those associations against the actual brand and audience.

### Expand the four roles

- **Body:** begin with `Tint` or a derived neutral for the canvas and `Ink` for primary typography. Long-form reading surfaces may use white when the tint is too chromatic.
- **Components:** use white, a derived surface, or `Tint` according to elevation and grouping. `Support` can indicate selection or quiet emphasis but does not automatically qualify as an input border or text color.
- **Typography:** begin with `Ink` on light recipes. For Deep Navy or another dark theme, use its light `Ink` only on verified dark surfaces. Derive secondary text by contrast testing rather than opacity alone.
- **Actions:** use `Accent` only after choosing and measuring its label color. Derive hover and pressed states that remain visibly distinct.
- **States:** do not reuse the recipe accent for every status. Add conventional success, warning, danger, and information tokens when the product needs them.

For solid pairs, white text passes a `4.5:1` normal-text target on Royal Purple `#6C5CE7` (`4.86:1`), Ocean Blue `#2563EB` (`5.17:1`), and Violet Dream `#7C3AED` (`5.70:1`). It does not pass on Forest Green `#16A34A`, Sunset Orange `#F97316`, Rose Pink `#EC4899`, Teal `#14B8A6`, or Classic Red `#EF4444`. Golden Yellow works strongly with dark text, while Deep Navy works strongly with its light ink. These measurements are initial checks, not proof of accessibility for a complete rendered theme.

The `60-30-10` proportion may help an early composition, and limiting dominant hues may improve coherence, but neither is a universal rule. Content hierarchy, component states, semantic colors, and the existing product system take precedence.

## Map a palette instead of copying it

1. Start with canvas and primary text; verify the longest reading surface first.
2. Choose surface and border values that remain distinguishable from the canvas in normal and high-contrast conditions.
3. Select one action color and derive hover or pressed states by measured contrast and perceptual change, not arbitrary opacity.
4. Test primary, secondary, inverse, placeholder, and disabled text independently.
5. Add semantic state colors only after the core hierarchy works.
6. Check real rendered colors when opacity, gradients, blending, images, or filters are involved.

Use the project's accessibility tooling. For known solid sRGB pairs, the `superior-accessibility` helper can calculate WCAG contrast. Do not claim compliance from palette appearance alone.

### Worked mapping: Ocean

This example demonstrates role assignment; it is not a mandatory theme.

```css
:root {
  /* Body */
  --canvas: #e6f4f1;
  --canvas-subtle: #a8dadc;
  --text-primary: #0d1b2a;
  --text-secondary: #1b4965;
  --link: #1b4965;

  /* Components */
  --surface: #ffffff;
  --border-subtle: #a8dadc;
  --border-control: #1b4965;
  --action: #1b4965;
  --action-hover: #0d1b2a;
  --action-text: #ffffff;
  --accent: #29adb2;
  --accent-text: #0d1b2a;
  --focus-ring: #1b4965;
}
```

For solid colors, the pairs used here measure approximately `15.39:1` for primary text on canvas, `8.49:1` for secondary text on canvas, `9.60:1` for white action text on the action color, and `6.39:1` for dark text on the accent. The pale border may serve as nonessential grouping, while inputs and focus use the darker boundary. Recheck the actual rendered result after introducing opacity, gradients, shadows, or different states.

The same discipline applies to other palettes. For example, white on Arctic blue `#1E88E5` measures about `3.68:1`: suitable for some large text and non-text boundaries, but not normal-sized text under a `4.5:1` target. Choose a darker action tone, use dark text when it passes, or adjust the palette rather than forcing the original swatch.

## Anti-slop checks

Reject or revise the direction when:

- the style name explains more than the product rationale;
- several effects compete without a hierarchy;
- every region becomes a rounded card;
- accent colors are used interchangeably for brand, action, and status;
- muted typography fails contrast or dominates the page;
- gradients, blur, texture, or shadow conceal weak grouping;
- the same palette and component recipe could be pasted onto an unrelated product unchanged.

For every prominent choice, be able to name the product task, content relationship, interaction state, or brand evidence it supports.
