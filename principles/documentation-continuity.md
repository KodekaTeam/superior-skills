# Documentation Continuity Principle

## Intent

A future AI agent or human maintainer should be able to recover the product's current context, architecture, accepted decisions, implementation state, and operating procedures from repository-owned documentation rather than from a previous chat transcript.

## Separation of responsibilities

- `AGENTS.md` provides the small session-start instruction because Codex reads it before work begins.
- `docs/README.md` routes a maintainer to the minimum relevant context.
- `PROJECT_CONTEXT.md`, `ARCHITECTURE.md`, and `DECISIONS.md` provide the stable core.
- `superior-docs` creates and synchronizes the documentation workflow when substantial documentation work is requested.
- Topic guides, timelines, and history carry conditional detail without bloating every new session.

## Design decisions

1. Read the root README, docs index, and three core documents before implementation or maintenance when they exist.
2. Do not read the entire documentation tree automatically; follow the index according to the current task.
3. Build documentation from current code, configuration, tests, accepted decisions, and corroborated history.
4. Keep present state, historical fact, planned work, and unknowns visibly separate.
5. Create specialized folders only when the project has evidence and repeatable maintenance value for them.
6. Update durable documents after material changes, not after every edit or chat message.
7. Keep secrets and sensitive infrastructure details outside repository documentation.

## Why the runtime files live elsewhere

The original prompt and screenshot are valuable design evidence for this package, but an installed skill must remain portable. Therefore the executable instruction set and detailed references live under `.agents/skills/superior-docs/`; this principles directory remains maintainer-facing provenance.
