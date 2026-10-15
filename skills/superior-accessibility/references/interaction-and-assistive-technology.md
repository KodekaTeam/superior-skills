# Interaction and assistive technology

Use this reference when accessibility depends on interaction state, composite behavior, dynamic updates, or assistive-technology interpretation rather than static markup alone.

## Prefer established interaction semantics

Start with native controls and platform behavior. Use a custom widget pattern only when the product interaction cannot be expressed with native elements and the repository can maintain its keyboard, focus, naming, state, and touch behavior.

For composite widgets such as tabs, listboxes, trees, grids, menus, and toolbars, distinguish Tab navigation into and out of the component from arrow-key navigation within it. Follow the established component library or the applicable ARIA Authoring Practices pattern; do not combine keyboard models from unrelated widgets.

## Manage context changes

- Move focus when a new modal or task context requires immediate interaction, not merely because content rerendered.
- Give dialogs a name, initial focus that supports the task, contained keyboard interaction, a predictable close path, and focus restoration.
- After route changes, place focus where the new context becomes understandable according to the application's established navigation model.
- Keep focus stable during sorting, filtering, optimistic updates, and validation unless the user's next action requires movement.
- When content disappears, move focus to the nearest logical surviving owner rather than the document start by default.

Visual focus and programmatic focus must identify the same active control. Do not use positive `tabindex` values to repair source-order problems.

## Announce dynamic information deliberately

Use persistent text and semantic relationships for information users need to revisit. Use live regions for concise status changes that occur away from focus.

- Do not announce every loading tick, keystroke, or intermediate render.
- Distinguish status, warning, and blocking alert urgency.
- Ensure a live region exists before its content changes when the platform requires that lifecycle.
- Keep error messages associated with their fields and move focus to an error summary only when it helps recovery.
- For optimistic updates, announce both confirmed success and rollback when either changes the user's understanding.

## Preserve alternatives for complex input

Pointer gestures, drag and drop, drawing, hover, and spatial manipulation need an operable alternative that provides the same outcome. Support cancellation and reversal where the original interaction does.

For virtualized or infinite content, preserve meaningful position, item identity, focus, and loading status. Do not expose misleading set sizes or silently remove the focused item from the accessibility tree.

## Verify a journey, not isolated attributes

Exercise the complete task with keyboard only and inspect the accessibility tree for roles, names, states, relationships, and order. When a screen reader is available, test the critical journey using one named browser/platform combination appropriate to the project.

Record what was actually tested. Passing automated rules cannot prove understandable announcements, appropriate focus movement, or usable composite keyboard behavior.
