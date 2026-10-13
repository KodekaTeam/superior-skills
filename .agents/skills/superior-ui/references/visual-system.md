# Building a Product-Specific Visual System

Use this reference for new directions, broad redesigns, and multi-component visual work. It is a decision guide, not a catalog of forbidden styles.

## Evidence order

Prefer inputs in this order:

1. explicit user requirements;
2. current product and brand documentation;
3. shipped components, tokens, and representative surfaces;
4. content structure and user task;
5. a disclosed, reversible design assumption.

Do not treat a draft, abandoned experiment, screenshot from another product, or unused token as governing evidence without proving the connection.

## Direction controls

Choose a coherent position for the controls that matter:

- **Density:** sparse editorial, balanced product, or compact operational;
- **Hierarchy:** type-led, spatial, contrast-led, or data-led;
- **Geometry:** crisp, gently softened, or strongly shaped;
- **Color:** neutral-led, brand-led, semantic, or expressive;
- **Rhythm:** steady, alternating, or deliberately compressed;
- **Motion:** absent, functional, explanatory, or expressive.

Not every control needs a dramatic choice. A restrained system becomes distinctive through consistency and content fit, not novelty everywhere.

## Typography

- Preserve the established type family unless the task authorizes a system change.
- Use a small, legible scale with clear role differences rather than many near-identical sizes.
- Let measure, weight, line height, and spacing carry hierarchy; oversized headings are not a substitute for structure.
- Avoid defaulting to a fashionable font merely to signal polish.
- Test long labels, localization-like expansion, numerals, and dense data where relevant.

## Color and effects

- Give accent color a job: primary action, selection, status, or a limited brand moment.
- Use semantic colors consistently and never as the only carrier of meaning.
- Separate primitive swatches from semantic roles. Define canvas, surface, elevated surface, border, primary text, secondary text, link, action, focus, and state tokens before styling individual components.
- Assign body, component, and typography colors by rendered contrast and hierarchy rather than by swatch order. A palette is raw material, not a finished theme.
- Keep success, warning, danger, and information colors distinct from brand accents unless both meanings remain unambiguous.
- Establish readable surfaces before adding gradients, translucency, glow, grids, or texture.
- A gradient is valid when it belongs to the brand or clarifies depth; it is weak when it fills an undecided background.
- Shadows should explain elevation or separation. Borders should explain grouping. Do not stack both by habit.
- Dark mode is a product requirement or supported theme, not an automatic shortcut to visual drama.

For style-selection criteria, palette starting points, semantic token mapping, and combination constraints, read [style-and-palette-direction.md](style-and-palette-direction.md).

## Composition

- Compose around the user's reading and action order, not a sequence of interchangeable landing-page sections.
- Vary section density only when the content changes pace or purpose.
- Use alignment and whitespace to connect related information before placing every item in a card.
- Avoid “card soup”: reserve containers for ownership, interaction, comparison, or meaningful grouping.
- Do not force feature counts, pricing emphasis, logo bars, step counts, or footer columns to match a template.
- Treat the page ending as part of the composition. A footer may be restrained, but it should not collapse into a generic strip merely because its design was deferred.
- On dashboards, lead with decisions and exceptions. A grid of generic metrics is not an information architecture.

For landing-page endings, footer modes, content constraints, and responsive closure, read [page-closure-and-footer.md](page-closure-and-footer.md).

## Components

- Reuse the design system's primitive and extend it through an existing variant mechanism.
- Keep radius, border, elevation, padding, and icon treatment tied to component roles.
- Prefer one strong component hierarchy over many weak decorative distinctions.
- Do not add badges, arrows, capsules, or icons unless they add status, direction, recognition, or action affordance.
- Choose illustrations and imagery that explain the product, subject, or atmosphere; generic technology imagery adds no identity.

## Motion

- Use motion to communicate state change, causality, spatial relationship, or focus.
- Avoid simultaneous entrance effects on every region and decorative loops that compete with the task.
- Respect reduced-motion preferences and keep essential meaning available without animation.
- Verify that motion does not delay interaction or conceal final layout problems.

## Coherence test

For each prominent choice, finish this sentence: “This is here because …” A valid answer names product evidence, content, hierarchy, feedback, or comprehension. “It looks modern” is not enough.
