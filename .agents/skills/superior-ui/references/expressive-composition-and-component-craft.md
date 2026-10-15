# Expressive Composition and Component Craft

Use this reference when a surface needs a distinctive composition or a small set of bespoke component details. It helps create visual character without turning one aesthetic preference into a universal rule.

## Replace bans with diagnosis

Common fonts, icon sets, borders, shadows, grids, and navigation patterns are not defects by themselves. Reject or revise them when they are unexamined defaults that weaken product identity, hierarchy, affordance, or task flow.

- Preserve an established typeface or icon system when it is part of the product. Introduce another family only when licensing, loading, glyph coverage, and role are understood.
- Match icon weight, optical size, corner character, and metaphor to the surrounding typography and controls. A familiar library is preferable to inconsistent custom icons.
- Use borders for boundaries, shadows for elevation, and both together only when each communicates something distinct.
- Keep conventional layouts when they make the task easier to scan. Break symmetry only when the new composition clarifies priority, pacing, comparison, or brand character.
- Treat sticky navigation as a space and occlusion tradeoff. Keep it persistent only when repeated access is worth the occupied viewport.

The useful question is not “Is this pattern banned?” but “What evidence makes this the right pattern here?”

## Generate candidates deliberately

When no visual system governs the work, generate two or three meaningfully different candidates from the product brief. Do not roll randomly among named aesthetics.

For each candidate, define:

- the hierarchy and reading path;
- the density and whitespace strategy;
- the relationship among type, color, geometry, imagery, and depth;
- one signature compositional or component idea;
- the main usability, accessibility, performance, and maintenance risk.

Select the candidate whose strengths support the task and whose risks can be controlled. A distinctive interface usually needs one strong thesis and a few repeated details, not novelty in every region.

## Composition candidates

### Asymmetric matrix

Use unequal grid tracks or varied spans when content items genuinely differ in priority, format, or interaction depth. Establish an anchor edge and a predictable scan path so irregularity remains legible.

- Let content importance determine spans; do not assign sizes only to create visual variety.
- Repeat enough alignment, gap, and geometry rules for the matrix to feel intentional.
- Ensure every item remains useful at its allocated minimum width.
- At constrained widths, recompose by task order rather than mechanically resetting every item to the same card.

### Layered cascade

Use restrained overlap, depth, or rotation when physical layering supports a narrative, collection, comparison, or object-like metaphor.

- Keep text and controls on stable planes.
- Preserve clear hit areas, focus rings, and stacking ownership.
- Remove or reduce overlap when it creates clipping, accidental occlusion, or touch conflict.
- Avoid arbitrary z-index values; use the product's layer scale or define a small semantic one.

### Editorial split

Use a strong text region beside media, examples, previews, or horizontally browsable content when proposition and evidence benefit from simultaneous reading.

- Allocate width by content need rather than defaulting to equal halves.
- Keep the primary action with the proposition it advances.
- At narrow widths, choose the sequence intentionally and preserve the media's useful interaction model.
- Do not make horizontal scrolling the only way to reach essential information.

For substantial narrow/wide recomposition, load `superior-responsive` and use content failure—not a fixed device label—as the breakpoint trigger.

## Tactile component depth

Depth should communicate containment, elevation, pressability, or hierarchy. Use it on a limited component family rather than wrapping every region in nested surfaces.

### Nested enclosure

A nested enclosure can make a control, media object, or premium focal component feel machined or physically assembled:

1. The outer shell establishes silhouette, spacing, and the relationship to the page.
2. The inner surface owns the content and interactive state.
3. A restrained inset, highlight, rim, or tonal step explains the depth transition.

Keep radii concentric, contrast measurable, and padding sufficient for focus indicators. If removing the outer shell changes nothing about grouping or affordance, the shell is probably decoration without a job.

### Trailing action island

A trailing icon may sit in its own circular or shaped region when it communicates a secondary motion, destination, or control boundary.

- Keep the full button target unified unless the icon is a genuinely separate action.
- Align the icon optically and preserve label space under localization-like expansion.
- Use a small state change in position, scale, tone, or depth to reinforce interaction; do not rely on motion alone.
- Avoid adding an island to every button. Reserve it for a clear component tier or signature action.

## Spatial rhythm and accents

- Increase whitespace where it separates decisions, changes narrative phase, or gives a focal object room. Large spacing without structural purpose only lengthens the page.
- Use compact eyebrow labels for category, sequence, or status—not as automatic decoration above every heading.
- Let dense and open regions alternate when the content changes pace. Keep spacing tokens coherent even when the rhythm varies.
- Prefer one repeated signature detail over many unrelated effects.

## Craft review

Before delivery, ask:

- Does the expressive pattern improve reading, priority, or interaction?
- Is the composition still coherent with real content, long labels, and missing data?
- Can keyboard, touch, zoom, and reduced-motion users operate the same task?
- Does the narrow composition preserve capability and source order?
- Are depth and effects bounded to elements that benefit from them?
- Would the page retain its identity if one decorative effect were removed?

Revise anything whose only rationale is that it looks premium, modern, or different.
