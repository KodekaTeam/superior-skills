# Design Recreation

Use this guide when the user asks to recreate, match, or closely follow a supplied screenshot, mockup, design, or existing interface. A request to use a reference as inspiration permits more adaptation; follow the user's stated degree of fidelity and requested scope.

## Establish the visual target

- Inspect the reference directly when possible. Identify the viewport, visible regions and their order, grid, proportions, spacing, alignment, colors, typography, imagery, borders, radius, and component states.
- Treat those observable choices as the target for the requested scope. Do not propose alternate directions, remove sections, add decoration, or replace the composition merely to make it more distinctive.
- If the reference's role is unclear, preserve its observable characteristics, state any material assumption, and ask only when the choice would materially change the result and cannot be inferred.
- Apply existing project components and tokens when they can match the target; adjust or extend them within the authorized scope when they cannot. Do not assume existing tokens override an explicit recreation request.

## Translate faithfully and responsibly

- Match relative geometry, density, line breaks, type hierarchy, color, surfaces, and spacing as closely as practical. Infer CSS values from the viewport and rendered output rather than blindly treating screenshot pixels as CSS pixels.
- Inspect existing typography first. Use available authorized fonts or the closest suitable fallback; preserve readability, supported zoom, and accessibility. Starting font-size guidance is a baseline, not a mandate to redesign the reference.
- Keep source branding, copy, and assets separate from the visual composition. Use the user's authorized material or truthful, clearly identified sample content with a similar visual footprint; do not invent customers, metrics, testimonials, or product capabilities. Respect applicable licenses and required notices.
- Preserve the requested structure when safe and truthful substitutes are available. If a reference section cannot be represented honestly or safely, disclose the limitation and any omission or material change.
- If only one viewport or state is shown, match it first. Adapt other viewport sizes and interaction states using the same visual language, preserving responsive and accessible behavior; label unseen variants as interpretations rather than reference-verified results.

## Compare and iterate

When rendering and visual inspection are available:

1. Render the requested surface at a viewport comparable to the reference; account for screenshot cropping, scaling, and browser zoom.
2. Compare major layout, section order, widths, heights, spacing, alignment, typography, color, imagery, and component details against the reference.
3. Correct the largest visible differences, then compare again within the task's scope and practical constraints.
4. Check responsive behavior, keyboard access, content overflow, and relevant interactions without silently replacing the visual direction.

If the reference or rendered output cannot be inspected, say which comparison was unavailable and do not claim visual fidelity was verified. Report material deviations, their reasons, and any unverified viewport or state.
