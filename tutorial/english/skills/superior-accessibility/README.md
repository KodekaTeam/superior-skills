# Using `superior-accessibility`

This skill handles interface accessibility: semantics, keyboard order, focus, accessible names, contrast, status announcements, and zoom behavior.

## When to use it

Use it when building or reviewing interactive components, forms, dialogs, navigation, dynamic status updates, or keyboard and screen-reader behavior. Do not use it as a substitute for a general visual audit or business-logic changes.

## Workflow

1. Identify the affected page, component, and users.
2. Check native semantics before adding ARIA.
3. Review keyboard behavior, focus, labels, status communication, contrast, zoom, and target sizes.
4. Run available automated checks, then manually validate critical flows.
5. Confirm that the correction did not unintentionally alter product behavior.

## Prompt examples

```text
$superior-accessibility Audit and fix this checkout modal. Ensure focus enters it, is contained correctly, and returns to the trigger afterward.
```

```text
$superior-accessibility Check the registration form for labels, error messages, tab order, contrast, and 200% zoom.
```

## Suitable combinations

- Pair with `superior-ui` when accessibility is part of UI implementation.
- Pair with `superior-responsive` for zoom, reflow, and touch-target issues.
- Pair with `superior-ui-audit` only when the user also requests an accessibility audit; a visual audit does not include it automatically.

## Result checks

Every control should be keyboard-operable, focus should remain visible, control names should be meaningful, and important status changes should be announced. Information must not depend on color alone. Avoid excessive ARIA and unrelated visual changes.
