# Using `superior-responsive`

This skill improves how interfaces adapt to available space: reflow, overflow, navigation, content order, content-driven breakpoints, zoom, and touch targets.

## When to use it

Use it when layouts break, content is clipped, tables become unusable, navigation grows crowded, or components are merely scaled down instead of recomposed. Do not use it for a broad visual redesign when responsiveness is not the primary problem.

## Workflow

1. Reproduce the failure with realistic viewports and content.
2. Find the owner of the width, overflow, min-content, or constraint causing the problem.
3. Recompose according to content priority instead of shrinking everything.
4. Introduce local scrolling only where it is intentional.
5. Test wide, near-breakpoint, and narrow viewports, as well as zoom, long text, touch, and keyboard use.

For new or multi-region layouts, the skill can define distinct desktop and mobile compositions while preserving the same task contract. It selects among patterns such as split-to-stack, sidebar-to-drawer, grid-to-list, table-to-scroller or alternate representation, mega-navigation-to-disclosure, and multi-column-footer-to-prioritized groups.

## Prompt examples

```text
$superior-responsive Fix this dashboard between 320px and 768px. Prioritize reflow and do not hide the primary action.
```

```text
$superior-responsive Keep the transaction table usable on mobile with local scrolling and clear headers.
```

```text
$superior-responsive Design coordinated desktop and mobile compositions for this account page. Preserve actions and content, but do not treat mobile as a scaled-down desktop.
```

## Suitable combinations

- Pair with `superior-ui` when building or redesigning a page.
- Pair with `superior-accessibility` for zoom, keyboard, reading order, and target size.
- Pair with `superior-copy` when realistic text length is part of layout testing.

## Result checks

The page should not scroll horizontally unless explicitly intended. Important content must remain available, touch targets must remain usable, and reading and focus order must make sense. Breakpoints should respond to content needs rather than customary device numbers.
