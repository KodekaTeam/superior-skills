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

Use for coherent delivery phases, realized features, current boundaries, maintenance milestones, and next work. Prefer outcome-oriented files over a diary of chat sessions.

### `implementation-guides/`

Use for subsystem workflows that a maintainer must repeat or safely modify, such as authentication, global state, navigation, storage, reverse proxy, backups, or deep links. Create topic files from real project boundaries rather than a universal checklist.

### `build-and-distribution/`

Use for verified environment requirements, commands, local builds, packaging, migrations, signing, deployment, rollback, and troubleshooting. Separate platforms or delivery channels only when their procedures differ materially.

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
