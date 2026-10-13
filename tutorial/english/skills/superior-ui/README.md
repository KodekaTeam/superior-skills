# Using `superior-ui`

This skill builds, redesigns, or refines product interfaces using project evidence, realistic content, functional states, and deliberate visual composition.

## When to use it

Use it to implement pages, components, dashboards, product flows, or redesigns that require UI code changes. Use `superior-ui-audit` for read-only reports and `superior-logic` for nonvisual behavior changes.

## Workflow

1. Study the users, primary tasks, design owners, components, tokens, and existing patterns.
2. Establish a visual thesis and hierarchy before adding decorative details.
3. Build with semantic structure, realistic content, and loading, empty, error, and success states.
4. Ensure controls actually work and connect to the intended behavior.
5. Critique the result at page, component, and detail levels, then test primary interactions and viewports.

When the project has no governing visual direction, the skill can shortlist two or three suitable styles, explain their fit and risks, and select one primary direction before implementation. Color references are mapped to semantic body, component, typography, interaction, and state tokens; palette order alone does not determine usage.

For landing pages and homepages, the skill also treats the footer as deliberate page closure. It selects a minimal utility, sitemap, conversion, editorial, or product-service mode from real routes and content instead of defaulting every design to a thin generic strip or inventing links to fill columns.

## Prompt examples

```text
$superior-ui Build a team settings page that follows the existing design system. Include loading, empty, error, and success states.
```

```text
$superior-ui Redesign this dashboard to clarify its decision hierarchy without changing the API contract.
```

## Suitable combinations

- Add `superior-responsive` for adaptation across sizes.
- Add `superior-accessibility` for deeper accessibility checks.
- Add `superior-copy` when product text is also being designed.
- Add `superior-logic` when APIs or application behavior also change.
- Use `superior-docs` after a durable change that alters project context.

## Result checks

The interface should fit the product rather than resemble a generic template. Its hierarchy, content, states, and interactions should be complete. Preserve the existing design system where applicable, and do not invent data, features, or social proof.
