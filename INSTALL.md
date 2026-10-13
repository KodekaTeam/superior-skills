# Installing Superior

## Repository scope

Copy `AGENTS.md` and the complete `.agents/` directory into the target repository root:

```text
project/
|-- AGENTS.md
`-- .agents/
    `-- skills/
        `-- superior-*/
```

If the project already has `AGENTS.md`, merge the portable baseline into it. Preserve project-specific commands, architecture, domain rules, and nested instruction boundaries.

Codex scans `.agents/skills` from the current working directory upward to the repository root. Keep the skills at a scanned level; placing this entire package in an arbitrary child directory does not make its skills discoverable from the parent.

## User scope

For skills available across repositories, copy each `superior-*` folder to:

```text
$HOME/.agents/skills/
```

Place shared personal instructions at `$HOME/.codex/AGENTS.md`. Keep framework commands and repository-specific policy in the relevant repository instead.

## Verify

Restart Codex only if newly added skills do not appear automatically. Confirm that every skill directory contains an uppercase `SKILL.md`, then invoke one explicitly—for example `$superior-ui`—to verify discovery.
