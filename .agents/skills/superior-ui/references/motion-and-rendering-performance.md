# Motion and Rendering Performance

Use this reference when motion materially shapes navigation, state change, spatial understanding, or brand expression. Motion should explain the interface first and decorate it second.

## Define the motion job

Before choosing durations or easing, identify what the transition communicates:

- **State:** something activated, expanded, selected, saved, or failed.
- **Causality:** the user's action produced this result.
- **Spatial continuity:** an object moved, transformed, or opened from a known origin.
- **Attention:** a changed region needs brief emphasis.
- **Pacing:** a narrative surface reveals content in a controlled sequence.

If a transition does none of these, remove it or keep it nearly imperceptible. Do not make every component animate merely because the page has a motion direction.

## Build a small motion system

Define a compact vocabulary rather than tuning every animation independently:

- two or three duration bands for immediate feedback, component transitions, and larger spatial changes;
- easing families for entering, exiting, moving, and spring-like feedback;
- shared distance and scale ranges;
- rules for interruption, reversal, and repeated input;
- a reduced-motion treatment that preserves state and meaning.

Use custom curves or spring behavior only when their feel is observable and consistent. “Premium” is not a sufficient motion specification.

## Navigation and overlay choreography

For an expanding menu, command surface, or full-screen overlay:

1. Keep the trigger's transformation connected to the opened state when that relationship aids recognition.
2. Establish the overlay boundary before revealing secondary content.
3. Stagger a small number of related groups only when sequence improves scanning.
4. Move focus into modal content, contain it correctly, support Escape, and restore focus to the trigger on close.
5. Prevent background interaction and unwanted page scroll without losing the user's previous position.

A dramatic reveal must not delay access to navigation. The final state, close action, and current location should become understandable immediately.

## Microinteraction feedback

- Use pressed states, small transforms, tone changes, or depth changes to confirm input.
- Keep magnetic or pointer-following effects optional, subtle, and limited to fine-pointer environments.
- Do not move a target away from the pointer or make its hit area unstable.
- Keep focus, active, disabled, loading, and success states distinct without requiring animation to understand them.
- Make nested icon movement reinforce the parent action rather than compete with the label.

## Scroll-linked and entry motion

Use entry motion when it reveals hierarchy or preserves narrative pacing, not as a blanket effect on every section.

- Prefer CSS capabilities for simple transitions and use `IntersectionObserver` for visibility-triggered behavior when it fits the support matrix.
- Use framework motion primitives when they already own lifecycle, interruption, and cleanup.
- Avoid continuous unthrottled scroll handlers. If precise scroll-linked behavior is essential, use a suitable platform API or measured update loop and verify its cost.
- Keep travel distance and blur restrained enough that content remains readable and does not appear broken before activation.
- Do not hide essential content when JavaScript fails or observers never run.

## Rendering guardrails

These are strong defaults, not absolute bans. Measure when the experience genuinely requires an exception.

- Prefer `transform` and `opacity` for frequent animation because they commonly avoid layout work. Animate layout properties only when the layout change itself is meaningful and performance is verified.
- Apply `will-change` shortly before a costly transition and remove it afterward when practical. Permanent promotion of many elements wastes memory.
- Bound blur and backdrop effects to small, stable regions. Large scrolling blur layers can create expensive repaints, especially on mobile GPUs.
- Keep grain or noise subtle, noninteractive, and cheap to composite. A fixed full-screen texture is one option, not a requirement; test memory and paint behavior.
- Use semantic layer tokens such as base, sticky, dropdown, overlay, modal, and toast. Avoid escalating arbitrary z-index values to solve ownership mistakes.
- Pause offscreen, hidden, or background decorative animation where practical.
- Respect battery, data, and device constraints when motion or media is unusually heavy.

## Reduced motion and accessibility

- Honor `prefers-reduced-motion` and the platform's equivalent preference.
- Replace large travel, parallax, zoom, spin, and repeated pulsing with a direct state change or short opacity transition.
- Never make animation the only carrier of status, direction, or completion.
- Avoid flashes, rapid oscillation, and motion that can trigger vestibular discomfort.
- Keep interactive timing generous enough for keyboard, switch, and screen-magnification users.

## Verification

Test the changed experience with:

- reduced motion enabled;
- keyboard-only interaction and repeated rapid input;
- a narrow touch viewport and a representative desktop viewport;
- throttled CPU or a lower-end device profile when effects are substantial;
- performance tooling during scroll, overlay transitions, and long-running animation;
- content already visible, JavaScript delayed, and animation interrupted midway.

Report observed behavior rather than claiming smoothness from implementation technique alone.
