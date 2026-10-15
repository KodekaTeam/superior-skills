# Documentation Map

Use this map as a menu. Create a directory only when its subject exists and will help future work.

## Continuity core

```text
docs/
|-- README.md
`-- structure-of-app/
    |-- README.md
    |-- PROJECT_CONTEXT.md
    |-- ARCHITECTURE.md
    `-- DECISIONS.md
```

The root index and three core files form the stable session entrypoint. `structure-of-app/README.md` may be omitted when `docs/README.md` already explains the group clearly.

## Add-on collections

Add only the collections supported by the project:

```text
docs/
|-- implementation-timeline/
|-- implementation-guides/
|-- build-and-distribution/
|-- history/
|   `-- releases/
|-- audit/
|-- roadmap/
|-- research/
|-- assets/
`-- references/
```

### `implementation-timeline/`

Use for outcome-oriented records of verified features, fixes, refactors, configuration changes, security work, delivery phases, current boundaries, and maintenance milestones. This is the default destination for automatic AI-agent implementation records. Group records under stable, lowercase feature-domain folders such as `authentication/`, `users/`, `checkout/`, or `api-security/`; each domain has its own `README.md` index. Prefer one coherent record per material task over one record per file, commit, prompt, or chat session.

When this collection is created automatically, include a root `README.md`, the current feature-domain directory and its index, then link the timeline from `docs/README.md`. Name each record with the local date and a specific outcome, such as `authentication/2026-10-15-add-refresh-token-rotation.md`. Read [automatic-change-recording.md](automatic-change-recording.md) for domain ownership, naming, content, exclusions, and opt-out behavior.

### `implementation-guides/`

Use for living subsystem workflows that a maintainer must repeat or safely modify, such as authentication, global state, navigation, storage, reverse proxy, backups, or deep links. It explains how to operate or extend something; it is not the chronological record of each implementation task. Create topic files from real project boundaries rather than a universal checklist.

### `build-and-distribution/`

Use for verified environment requirements, commands, local builds, packaging, migrations, signing, deployment, rollback, and troubleshooting. Update it when those procedures change; keep the dated outcome itself in the implementation timeline. Separate platforms or delivery channels only when their procedures differ materially.

### `history/`

Use for curated architectural evolution, migration history, and release narratives. A commit ledger should index meaningful changes, not mirror `git log` line by line.

### `audit/`, `roadmap/`, and `research/`

These hold dated artifacts with status and provenance. Keep findings separate from accepted remediation, planned work separate from shipped behavior, and research conclusions separate from product decisions.

### `assets/` and `references/`

Use `assets/` for diagrams or media owned by the docs. Use `references/` for external or imported material whose provenance is clear. Do not copy secrets, private exports, or replace canonical source documentation.

## Naming

- Use stable descriptive names for living documents.
- Use numeric prefixes only when reading order is meaningful.
- Use dates or versions for immutable historical artifacts.
- Keep a `README.md` index in any collection large enough that filenames alone no longer explain scope and order.
