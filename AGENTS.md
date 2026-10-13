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

After a material change, update durable documentation only when project context, architecture, an accepted decision, operational commands, release behavior, or maintenance history actually changed. Use `superior-docs` for substantial documentation creation, reconstruction, or synchronization.

## Skill routing

Codex discovers the skills under `.agents/skills`. Load only the entries that materially affect the task:

- Build, redesign, or visually refine an interface: `.agents/skills/superior-ui/SKILL.md`
- Audit an existing interface and prepare evidence-backed recommendations: `.agents/skills/superior-ui-audit/SKILL.md`
- Repair responsive behavior or mobile layout: `.agents/skills/superior-responsive/SKILL.md`
- Check accessibility, keyboard use, focus, contrast, or inclusive states: `.agents/skills/superior-accessibility/SKILL.md`
- Write or revise product-facing prose: `.agents/skills/superior-copy/SKILL.md`
- Clean up code comments without changing behavior: `.agents/skills/superior-comments/SKILL.md`
- Implement or review application, API, state, and business rules: `.agents/skills/superior-logic/SKILL.md`
- Reduce over-engineering in a coding change: `.agents/skills/superior-lean/SKILL.md`
- Create, reconstruct, or synchronize durable project documentation: `.agents/skills/superior-docs/SKILL.md`

Common combinations:

- UI implementation: `superior-ui`, plus `superior-responsive` or `superior-accessibility` only when those concerns are substantial.
- UI audit: `superior-ui-audit`; add accessibility only when the user requests an accessibility review.
- Full-stack feature: `superior-ui` for presentation and `superior-logic` for behavior. Do not make the UI skill govern domain logic.
- Comment-only cleanup: `superior-comments` alone.

## Delivery baseline

- Connect every reported problem to an observed file, runtime path, rendered state, or explicit product contract.
- Do not invent product direction to make a result look polished.
- Keep expected loading, empty, error, validation, permission, and success states coherent with the task.
- Preserve semantic structure, keyboard access, visible focus, readable contrast, and reflow where UI is affected.
- Report changed files, checks run, and remaining risk without ceremonial checklists for untouched areas.
