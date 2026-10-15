# Viewport, input, and safe areas

Use this reference when responsive behavior depends on the runtime viewport or input environment rather than width alone.

## Identify the actual containing space

Distinguish:

- the page layout viewport used by media queries;
- the visual viewport remaining after browser UI or a virtual keyboard changes visible space;
- a component's container size;
- safe-area insets and display cutouts;
- split or folded display segments when the supported platform exposes them;
- an embedded webview, iframe, panel, or host surface whose size differs from the device screen.

Choose media queries for page composition and container queries for reusable components whose allocated space varies independently. Avoid reading viewport dimensions in JavaScript merely to duplicate a CSS decision unless runtime behavior genuinely requires it.

## Handle dynamic viewport height

Use the viewport unit supported by the project's browser contract that represents the intended state: small, large, or dynamic viewport. Provide a compatible fallback when required.

Do not force ordinary content sections to fill the viewport when content growth should determine height. For full-screen layers, verify address-bar changes, orientation changes, and virtual-keyboard appearance do not hide controls or create unreachable scroll regions.

## Protect safe areas and persistent controls

Apply safe-area inset spacing to controls or content that can collide with cutouts, rounded corners, home indicators, or edge gestures. Combine the inset with the design's normal spacing rather than replacing spacing entirely.

Sticky headers, bottom actions, and floating controls must not cover anchors, validation errors, focused inputs, scroll targets, or local scrollers. Reserve or calculate their occupied space where necessary.

## Respond to input capability

Use pointer and hover capabilities to enhance interaction, not to infer device identity. Hybrid devices can expose touch and precise pointers together or change capability during a session.

- Keep essential actions available without hover.
- Preserve visible keyboard focus even on touch-oriented layouts.
- Avoid shrinking targets because a wide viewport suggests a desktop pointer.
- Do not duplicate controls into separate touch and pointer versions with divergent state.

## Virtual keyboards and focus

When an input receives focus, verify it and its validation or completion action remain visible. Avoid fixed-height assumptions and automatic viewport scrolling that fights the platform.

Test multi-step forms, dialogs, bottom sheets, autocomplete lists, and sticky actions with the keyboard open. Preserve entered state when orientation or composition changes.

## Verify beyond width

Exercise relevant portrait and landscape states, zoom or increased text size, keyboard-open behavior, safe-area simulation or hardware, touch and keyboard input, and the actual embedded host when available. Record which conditions were simulated and which were observed on a real target.
