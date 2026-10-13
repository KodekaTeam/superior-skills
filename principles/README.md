# Superior Principles Workspace

This directory stores design inputs used by maintainers of the Superior package. Codex does not discover it as a skill and projects do not need it when only `.agents/` and `AGENTS.md` are installed.

## Documentation continuity

- `documentation-continuity.md` records the distilled design decisions.
- The portable runtime implementation lives in `../.agents/skills/superior-docs/`.

Do not place mandatory runtime instructions only in this directory. Promote an accepted principle into `AGENTS.md` when it must apply at session start, or into the relevant skill and its `references/` when it belongs to an invoked workflow.
