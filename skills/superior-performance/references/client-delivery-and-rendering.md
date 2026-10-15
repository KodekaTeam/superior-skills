# Client delivery and rendering

Use this reference when the measured constraint is browser or client startup, loading, rendering, interaction, or memory.

## Trace the critical journey

Inspect the request waterfall, dependency chain, main-thread timeline, rendering work, and user interaction that owns the target metric. Separate server response, transfer, parsing, execution, style, layout, paint, composition, hydration, and application data work.

Test representative routes, content, account state, device capability, viewport, and network. A fast empty route on a desktop does not establish mobile or data-heavy performance.

## Delivery and bundles

- Remove unused dependencies and duplicate code before adding compression tricks.
- Split code at stable product boundaries; excessive fragments can increase round trips and scheduling overhead.
- Load route- or interaction-specific code when needed, while preserving clear loading and failure states.
- Preload or preconnect only resources proven critical; overuse competes with more important work.
- Set cache policy and asset identity according to update and privacy requirements.

Compare transferred, parsed, and executed cost. A compressed bundle can remain expensive to parse or execute.

## Images, fonts, and media

Choose dimensions, formats, quality, and responsive sources from the rendered use. Reserve layout space to prevent shifts. Lazy-load offscreen media, not the primary content required for the target render milestone.

Subset or reduce font variants when licensing and language coverage permit. Preserve readable fallback behavior and avoid hiding text while optional font resources load.

## Rendering and interaction

- Reduce unnecessary component work using ownership and state boundaries before memoizing broadly.
- Virtualize large collections only when list size and interaction behavior justify its accessibility and complexity costs.
- Break or move proven long tasks without violating ordering, cancellation, or data ownership.
- Avoid layout thrashing by grouping reads and writes when profiles show repeated forced layout.
- Animate only purposeful properties and respect reduced-motion preferences.

Do not sacrifice semantic structure, focus order, screen-reader updates, or input feedback to gain a synthetic score.

## Hydration and client memory

Ship only the state needed to make the route interactive. Avoid duplicate server and client fetching unless freshness requires it. Diagnose hydration mismatch and repeated work rather than suppressing it.

For memory growth, distinguish bounded caches, detached UI, retained listeners, subscriptions, timers, media, and application state. Compare snapshots across a repeatable interaction cycle and confirm objects become collectible after cleanup.

## Verify user-visible improvement

Combine lab evidence with authorized field telemetry when available. Segment field results by route, device, network, and release. Lab tools explain causes; field data establishes prevalence. Neither alone proves every user experience.
