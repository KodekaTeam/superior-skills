# Responsive Composition Patterns

Use this reference when a task needs new or substantially different compositions across mobile, tablet-like intermediate widths, and desktop. It is a decision guide, not a catalog of device presets.

## Preserve the task contract

Start by separating invariants from variables.

Preserve across viewports:

- the user's primary task and decision sequence;
- content meaning, data fidelity, and available capabilities;
- current, selected, expanded, validation, loading, and error states;
- access to important actions and recovery paths;
- truthful labels, destinations, and ownership.

Allow to change when space or input demands it:

- grouping, alignment, density, and visual prominence;
- navigation and disclosure model;
- region placement and reading sequence;
- table, chart, list, or detail representation;
- persistent versus on-demand controls;
- image crop, illustration placement, and decorative detail.

A responsive variant may look substantially different without becoming a different product.

## Choose the starting direction

Use mobile-first when narrow space exposes the essential task, the interface is primarily touch-oriented, or progressive enhancement maps naturally to the content. Use desktop-first when an existing dense application, wide data relationship, canvas, or multi-pane workflow is the governing implementation. Use neither as ideology: inspect the strongest constraint first, then verify both ends and the intermediate range.

Do not design only two screenshots. Define behavior between them.

## Create a region contract

For each major region, record the following before implementation:

| Field | Question |
| --- | --- |
| Purpose | What user decision or action does this region support? |
| Priority | Must it remain immediately visible, become available on demand, or follow another region? |
| Width owner | Which content or control establishes its minimum useful width? |
| Wide composition | How is it grouped and positioned when space is abundant? |
| Narrow composition | How is it regrouped, relocated, disclosed, or represented? |
| Trigger | What observable failure requires the change? |
| Interaction | Does keyboard, touch, pointer, or virtual-keyboard behavior change? |
| State | What selection, scroll, input, or expansion state must survive? |

This contract prevents unrelated breakpoint rules from accumulating without a compositional reason.

## Transformation vocabulary

Choose the smallest transformation that restores usefulness.

| Transformation | Use when | Guardrail |
| --- | --- | --- |
| Preserve | The region already remains readable and operable | Do not change it merely to make every breakpoint look different |
| Wrap or reflow | Items retain meaning when lines or tracks change | Keep grouping and reading order clear |
| Stack | Parallel regions need full width or sequential reading | Stack by task priority, not automatically left-to-right |
| Condense | Labels, metadata, or spacing can become denser | Do not reduce text or targets below usable limits |
| Collapse or disclose | Secondary controls consume scarce space | Keep the trigger, state, and item count understandable |
| Relocate | A control belongs nearer its mobile context | Preserve ownership and avoid duplicates with divergent state |
| Local scroll | A relationship requires width, such as a table or timeline | Show the scroll boundary and keep essential context visible |
| Change representation | The wide representation no longer supports the task | Preserve data, actions, terminology, and comparison meaning |
| Remove | Content is truly decorative or redundant | Never remove essential information or actions solely to fit |

Avoid using CSS visual order to create a sequence that conflicts with DOM reading and focus order. Change source structure when the semantic order genuinely differs, or choose a composition that preserves one meaningful order.

## Pattern catalog

### Split layout to editorial stack

Use for hero, feature, detail, or explanatory sections with text and media side by side.

- On wide screens, allocate width according to content importance rather than defaulting to equal halves.
- On narrow screens, choose whether media precedes, interrupts, or follows the text based on comprehension and action order.
- Adjust crop and aspect ratio deliberately; do not squeeze a desktop image into a shallow mobile slot.
- Keep the primary action near the proposition it advances.

### Sidebar to contextual control

Use for filters, settings navigation, documentation trees, and secondary tools.

- Preserve a sidebar when the remaining content width stays useful.
- At constrained widths, convert it to an inline summary, top toolbar, drawer, sheet, or route-level navigation according to frequency and depth.
- Keep applied filters or current location visible after the controls close.
- Preserve scroll and selection state when reopening.
- Do not hide primary navigation behind a generic icon without a clear label or familiar product convention.

### Card grid to fewer columns, list, or rail

- Reduce column count while cards retain useful width.
- Switch to a list when scanning labels, metadata, or actions matters more than visual browsing.
- Use a horizontal rail only when items form a browseable sequence and partial overflow clearly signals more content.
- Do not use a carousel to conceal ordinary content that should remain directly discoverable.
- Preserve consistent card semantics even when visual treatment changes.

### Data table to bounded scroller or alternate view

- Keep a locally scrollable table when cross-column relationships and exact values are essential.
- Freeze identifiers or headers only when they materially preserve context and do not consume most of the viewport.
- Hide a column only when its value is available through an accessible detail path and is not essential to the immediate decision.
- Change rows into summaries or cards only when relationships remain clear; generic cards can destroy comparison speed.
- Keep sorting, filtering, selection, bulk action, and pagination state consistent across representations.

### Comparison table to focused comparison

- Preserve simultaneous columns while each option remains legible.
- At narrow widths, consider a pinned attribute column with local scroll, a user-selected subset, a two-item comparator, or stacked attribute groups.
- Keep attribute labels visible; do not show isolated values without their meaning.
- Do not silently remove options or distinguishing attributes.

### Mega-navigation to disclosure or drill-down

- Group destinations by the same information architecture used on desktop.
- Choose accordions for shallow parallel groups and drill-down navigation for deeper trees.
- Keep the current location, expanded path, close action, and return path visible.
- Make the menu keyboard and touch operable, manage focus, and prevent background interaction when modal.
- Do not copy hover-dependent desktop interactions into touch layouts.

### Dashboard to prioritized decision flow

- On wide screens, use parallel regions only when simultaneous comparison helps a decision.
- On narrow screens, lead with exceptions, urgent actions, and the most decision-relevant summary.
- Move secondary charts or controls behind disclosure only when their status remains discoverable.
- Avoid stacking every desktop metric in original grid order; spatial position may not reflect task priority.

### Multi-column form to guided single column

- Keep fields together when they describe one concept; do not preserve columns that separate a label from its dependent input.
- On narrow screens, use a single primary reading path and retain section headings or progress context.
- Relocate actions near the completion point. Sticky actions must not cover fields, errors, or the virtual keyboard.
- Preserve entered values and validation when groups collapse or steps change.
- Do not turn a short form into a wizard merely because the viewport is narrow.

### Master-detail to pane, route, or sheet

- Use adjacent panes when both list context and detail must remain visible.
- On narrow screens, move detail to a route, full-screen layer, or sheet based on depth and task duration.
- Preserve selection, filters, list scroll, and a predictable return path.
- Avoid cramming a permanently narrow detail pane beside an unusable list.

### Hero to compact opening composition

- Preserve proposition, primary action, and essential proof before decorative media.
- Reduce display type within readable bounds instead of scaling the entire hero proportionally.
- Reposition or crop media to maintain subject focus.
- Do not spend the first mobile viewport on decoration while hiding the page purpose or action below the fold.

### Multi-column footer to prioritized groups

- Preserve legal, support, and high-value destinations even when columns disappear.
- Stack groups by user need and business obligation, not desktop position alone.
- Use disclosure only when link volume justifies it; keep headings and expanded state accessible.
- Separate brand context from utility links when this improves closure.
- A minimal footer is valid when the site has little verified content, but it should be intentional rather than a default collapse.

### Timeline, canvas, or spatial tool

- Prefer bounded pan, zoom, or local scroll when spatial relationships are the task.
- Provide an alternate summary or list when users also need linear access to the information.
- Keep controls reachable and explain the current scale or position where it affects interpretation.
- Do not shrink the entire canvas until labels and targets become unusable.

## Choose breakpoint ownership

- Use page-level media queries when the shell or relationship among regions changes.
- Use container queries when a reusable component should respond to its allocated space rather than the viewport.
- Keep transformation rules with the component or layout owner that understands the constraint.
- Prefer a small number of meaningful transitions. Add another breakpoint only when an intermediate composition actually fails.
- Avoid framework-default breakpoints when no content failure occurs there.

For each breakpoint, be able to complete: "At this width, this content or interaction fails, so this composition changes in this specific way."

## Maintain visual continuity

Keep the visual thesis recognizable across variants while allowing density and emphasis to change.

- Preserve type roles even when sizes and line lengths adjust.
- Keep semantic color and component-state meaning stable.
- Let spacing compress nonlinearly; do not multiply every desktop value by one scale factor.
- Retain geometry where it signals component family, but simplify decorative treatment when it consumes scarce space.
- Change motion for touch, performance, or reduced-motion needs without hiding state transitions.

Mobile does not need to imitate desktop, and desktop should not look like a stretched mobile stack.

## Verify the system, not screenshots

Test:

- the widest supported composition;
- every transformation just above and below its trigger;
- at least one intermediate width where neither endpoint design dominates;
- a narrow phone-sized viewport in portrait and, when relevant, landscape;
- long labels, localization-like expansion, missing data, dense data, and validation errors;
- browser or text zoom and increased default font size;
- keyboard order, visible focus, touch targets, hover absence, and an open virtual keyboard;
- retained state when navigation, disclosure, representation, or orientation changes.

Inspect for accidental page scrolling, clipped popovers, covered actions, layout shift, unreadable line lengths, misleading order, duplicate controls, and state divergence.

## Anti-slop review

Reject or revise the layout when:

- mobile is only a uniformly shrunken desktop;
- every desktop grid becomes the same one-column stack regardless of task;
- content disappears merely because it is difficult to place;
- a carousel, drawer, or accordion is added without a disclosure need;
- desktop space is filled with arbitrary columns or oversized empty margins;
- visual reordering contradicts reading or focus order;
- mobile and desktop variants expose different capabilities unintentionally;
- breakpoints follow device labels instead of observed content failure;
- the implementation matches two mockups but breaks between them.

The result should feel designed for each space while remaining one coherent product and one reliable task flow.
