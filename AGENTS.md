# Superior Project Guidance

Use this file as a portable baseline. Instructions supplied by the user and rules closer to the edited file take precedence.

## Working contract

- Read the relevant project documentation and trace the affected implementation before choosing a solution.
- Preserve established architecture, naming, visual language, and product behavior unless the task explicitly changes them.
- Make the smallest coherent change that resolves the requested outcome. Do not bundle speculative cleanup.
- Treat claims, sample data, controls, routes, and success states as product behavior: they must be real, clearly marked as examples, or honestly unavailable.
- Preserve each text file's established encoding and line endings. When no encoding is declared, read and write text explicitly as UTF-8; never reinterpret UTF-8 bytes as Windows-1252 or Latin-1. Do not turn punctuation, symbols, or box-drawing characters into mojibake such as `â€”`, `â€™`, or `â”`. If suspicious text already exists, determine whether it is source content or encoding damage before changing it, repair only confirmed damage, and re-read the affected text after writing.
- Verify the changed behavior with the narrowest meaningful checks. State what was not verified.

## Session context bootstrap

Before implementation, debugging, refactoring, release, or maintenance work, establish durable project context when the files exist:

1. Read the repository-root `README.md` and `docs/README.md`.
2. Read `docs/structure-of-app/PROJECT_CONTEXT.md`, `ARCHITECTURE.md`, and `DECISIONS.md`.
3. Follow links from `docs/README.md` only to the timeline, guide, build, history, audit, roadmap, or research documents relevant to the current task.

Missing documentation must not block ordinary work. Do not load the entire documentation tree by default. Resolve conflicts in favor of current code, configuration, tests, and newer accepted decisions, then flag stale documentation.

After verified material changes to code, configuration, schema, API behavior, security controls, build behavior, or user-visible functionality, use `superior-docs` to create or update an outcome-oriented record under `docs/implementation-timeline/<feature-domain>/` by default. Use a stable lowercase domain folder and a specific dated filename such as `2026-10-15-add-refresh-token-rotation.md`, not a generic change summary. Do this without waiting for a separate documentation request. If `docs/` or the timeline collection does not exist, create the minimal indexed structure defined by the skill. Skip automatic documentation when the user explicitly declines it for the task, when a higher-priority project instruction prohibits it, or when the work is read-only, unsuccessful, documentation-only, or materially insignificant. Update architecture, decisions, guides, build, or release documents only when their own claims or procedures changed.

## Skill routing

The portable plugin discovers its skills under the canonical root `skills/` directory. Load only the entries that materially affect the task:

- Build, redesign, or visually refine an interface: `superior-ui`
- Audit an existing interface and prepare evidence-backed recommendations: `superior-ui-audit`
- Repair responsive behavior or mobile layout: `superior-responsive`
- Check accessibility, keyboard use, focus, contrast, or inclusive states: `superior-accessibility`
- Write or revise product-facing prose: `superior-copy`
- Clean up code comments without changing behavior: `superior-comments`
- Implement or review application, API, state, and business rules: `superior-logic`
- Diagnose a concrete software failure whose cause is uncertain: `superior-debugging`
- Design, implement, repair, or review automated tests and test reliability: `superior-testing`
- Design or change database schemas, queries, transactions, migrations, or backfills: `superior-database`
- Measure, profile, optimize, or review software performance and capacity: `superior-performance`
- Harden or review REST API security, rate limiting, authorization boundaries, abuse controls, or SSRF defenses: `superior-api-security`
- Reduce over-engineering in a coding change: `superior-lean`
- Create, reconstruct, or synchronize durable project documentation: `superior-docs`

Common combinations:

- UI implementation: `superior-ui`, plus `superior-responsive` or `superior-accessibility` only when those concerns are substantial.
- UI audit: `superior-ui-audit`; add accessibility only when the user requests an accessibility review.
- Full-stack feature: `superior-ui` for presentation and `superior-logic` for behavior. Do not make the UI skill govern domain logic.
- Uncertain bug or incident: `superior-debugging`; add `superior-logic` only when the confirmed repair changes application behavior.
- Test strategy or regression work: `superior-testing`; add the domain skill only when production behavior is also being changed or reviewed.
- Database evolution: `superior-database`; add `superior-logic` for application behavior and `superior-testing` only when test design is substantial.
- Performance optimization: `superior-performance`; add the owning database, UI, or logic skill only when that contract also changes.
- Security-sensitive API change: `superior-api-security` for threat-driven controls, plus `superior-logic` when business invariants, persistence, or idempotency also change.
- Comment-only cleanup: `superior-comments` alone.

## Delivery baseline

- Connect every reported problem to an observed file, runtime path, rendered state, or explicit product contract.
- Do not invent product direction to make a result look polished.
- Keep expected loading, empty, error, validation, permission, and success states coherent with the task.
- Preserve semantic structure, keyboard access, visible focus, readable contrast, and reflow where UI is affected.
- Report changed files, checks run, and remaining risk without ceremonial checklists for untouched areas.
