# 01 - Install Superior in a Project

## Objective

Make `AGENTS.md` and all Superior skills available in the target repository.

## Target structure

```text
project/
|-- AGENTS.md
`-- .agents/
    `-- skills/
        |-- superior-ui/
        |-- superior-docs/
        `-- ...
```

## Steps

1. Copy the `.agents/` directory from the Superior package into the target repository root.
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
