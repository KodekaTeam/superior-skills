# 01 - Install Superior in a Project

## Objective

Make `AGENTS.md` and all Superior skills available in a target repository without using plugin installation.

## Target structure

```text
project/
|-- AGENTS.md
`-- .agents/
    `-- skills/
        |-- superior-ui/
        |-- superior-ux/
        |-- superior-code-review/
        |-- superior-database/
        |-- superior-debugging/
        |-- superior-delivery/
        |-- superior-performance/
        |-- superior-reliability/
        |-- superior-testing/
        |-- superior-docs/
        `-- ...
```

## Steps

1. Create `.agents/skills/` in the target repository and copy every folder from the Superior package's root `skills/` directory into it.
2. If the project does not have an `AGENTS.md`, copy the package version.
3. If the project already has an `AGENTS.md`, merge the Superior baseline without removing existing commands, domain rules, or project structure guidance.
4. Open Codex from the repository root or one of its descendants.
5. Inspect the available skills or try an explicit invocation:

```text
$superior-docs Explain the available modes without changing any files.
```

## Avoid

- Do not place `.agents/skills` in a child directory that is outside the path from the working directory to the repository root.
- Do not blindly replace the project's existing `AGENTS.md`.
- Do not rename `SKILL.md` to `skill.md`; the entrypoint is case-sensitive.

## Expected result

Codex can discover skills named `superior-*`, and the project baseline is read before the agent begins work.

For user-level installation, see [`../../INSTALL.md`](../../INSTALL.md).
