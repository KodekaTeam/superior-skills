# Superior Tutorials

This directory contains user-facing guides for the Superior package. Tutorials are not loaded automatically by Codex and do not replace rules in `AGENTS.md` or instructions in `SKILL.md`.

## Quick start

1. [Install Superior in a project](01-install-superior.md)
2. [Invoke skills explicitly or implicitly](02-use-skills.md)
3. [Understand instruction precedence](03-instruction-priority.md)
4. [Create project documentation for the first time](04-bootstrap-project-docs.md)
5. [Start a new session with existing context](05-start-a-new-session.md)
6. [Synchronize docs after changes](06-maintain-project-docs.md)
7. [Combine skills without loading everything](07-combine-skills.md)
8. [Troubleshoot discovery and routing](08-troubleshooting.md)

## Per-skill tutorials

Use the [per-skill tutorial index](skills/README.md) to choose a guide based on the work at hand. Each skill has its own directory describing scope, workflow, prompt examples, safe combinations, and result checks.

## Learning paths

### New users

Read tutorials 01-03, then try `$superior-ui` or `$superior-logic` on a small change.

### Documentation and cross-session maintenance

Read tutorials 04-06. They explain how `superior-docs`, `docs/README.md`, and the session bootstrap in `AGENTS.md` work together.

### Superior package maintainers

Read all tutorials, then consult [`../../principles/`](../../principles/) for package rationale and [`../../skills/`](../../skills/) for canonical runtime instructions.

## Practical rules

- Use explicit invocation when a particular workflow must be selected deterministically.
- Let implicit routing handle ordinary tasks with a clear objective.
- Do not invoke every skill at once.
- Tutorials explain usage; `AGENTS.md` and `SKILL.md` govern agent behavior.

## Official references

- [Build skills](https://learn.chatgpt.com/docs/build-skills) - skill structure, discovery, and explicit or implicit invocation.
- [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md) - project instruction order and scope.

Also available in [Bahasa Indonesia](../indonesian/README.md).
