---
name: superior-ui
description: Build, redesign, or visually refine product interfaces using project evidence, real content, functional states, and deliberate composition. Use for implementation work on websites, apps, dashboards, landing pages, or component systems. Do not use for read-only audits or logic-only changes.
---

# Superior UI

Produce an interface that belongs to this product. Derive choices from the user's request, existing design evidence, content, and task flow; do not impose a house style or mechanically ban familiar techniques.

## Establish the brief

Before editing, identify:

- the primary user and job this surface supports;
- the content and actions that deserve first attention;
- existing design owners: tokens, typography, components, layouts, brand assets, and documented decisions;
- implementation constraints, affected routes, and states;
- what must remain unchanged.

Inspect the rendered surface when practical. If direction is missing, make the smallest reversible assumption that fits the product and disclose any choice that materially shapes the result.

## Choose a visual thesis

State the direction in one useful sentence, such as “dense operational console with quiet chrome and high-signal status color.” The sentence must constrain actual decisions about hierarchy, density, type, color, shape, or motion. Avoid mood labels that could describe any product.

When no governing visual direction exists, shortlist two or three materially different candidates that fit the product and explain each candidate's task fit, defining traits, and principal risk. Select one primary direction before implementation unless the user explicitly requests parallel concepts. A supporting influence may shape a limited detail, but do not blend several named styles into an incoherent trend collage.

Read [references/visual-system.md](references/visual-system.md) when the task creates a new visual direction, changes several components, or needs substantial visual polish. Also read [references/style-and-palette-direction.md](references/style-and-palette-direction.md) when selecting among named UI styles, establishing a new palette, or assigning colors to body, component, and typography roles. For focused edits, preserve the local system without loading either reference.

Read [references/page-closure-and-footer.md](references/page-closure-and-footer.md) when building or substantially redesigning a landing page, homepage, multi-section marketing page, or footer. Treat the ending as a deliberate part of the page composition without assuming that every site needs a large multi-column footer.

## Build around the task

- Start with semantic structure and information order; decoration follows.
- Give each region a job. Remove sections that exist only to complete a familiar template.
- Reuse existing primitives when they express the needed hierarchy. Add a variant only when the existing contract cannot.
- Use spacing, type, contrast, alignment, and grouping to create hierarchy before adding containers or effects.
- Let repeated components reflect repeated content. Do not force unlike information into identical cards.
- Keep responsive and accessibility behavior intact. Load the dedicated skills when either concern is a substantial part of the request.

## Protect product integrity

Read [references/product-integrity.md](references/product-integrity.md) when the surface includes dashboards, marketing claims, forms, navigation, asynchronous data, or multiple UI states.

At minimum:

- never fabricate metrics, customers, testimonials, activity, compliance, or destinations;
- make controls work, remove them, or label them honestly as unavailable;
- distinguish loading, first-use, filtered-empty, permission-denied, validation, error, and success states when relevant;
- write specific labels and actions using the product's vocabulary;
- preserve user data and existing behavior outside the requested change.

## Critique before delivery

Review the result from three distances:

1. **Page:** Is the primary task obvious, does the composition have intentional rhythm, and does the page end with deliberate visual and informational closure?
2. **Component:** Does each component earn its boundary, emphasis, and interaction?
3. **Detail:** Are labels, icons, states, focus, alignment, and content honest and coherent?

Challenge anything that looks borrowed from a generic template. Keep it when evidence or function supports it; revise it when it is merely decorative habit.

## Verify

Exercise changed interactions and relevant states. Check representative narrow and wide viewports, content extremes, keyboard flow, and the project's normal lint/type/build checks in proportion to the change. Report concrete results and any unverified risk.
