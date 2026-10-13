# 05 - Start a New Session with Existing Context

## Prerequisites

- The Superior `AGENTS.md` baseline has been merged into the repository root.
- `docs/README.md` and the three core documents are available.
- Codex is opened from the correct repository.

## Automatic behavior

The session bootstrap in `AGENTS.md` directs the agent to read:

1. the root `README.md`;
2. `docs/README.md`;
3. `PROJECT_CONTEXT.md`;
4. `ARCHITECTURE.md`;
5. `DECISIONS.md`;
6. additional documents relevant to the current task.

You no longer need to paste the same long prompt into every maintenance session.

## Optional opening prompt

To check understanding before assigning work:

```text
Read the project context according to the session bootstrap in AGENTS.md.
Summarize the architecture, active decisions, current boundaries, and
additional documents relevant to this task. Do not change files; wait for
the next instruction.
```

## Important boundaries

- The agent does not read the entire `docs/` tree without a reason.
- Referenced documents must remain accurate; session bootstrapping does not guarantee that their contents are correct.
- If documentation conflicts with active code, the agent should verify the implementation and mark stale documentation.
- Old conversations are not a source of truth unless their outcomes were recorded in the repository.
