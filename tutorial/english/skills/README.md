# Per-Skill Tutorials

This index covers every skill available in `.agents/skills/`. Select the skill that most directly owns the work, and add another only when the task genuinely crosses responsibility boundaries.

| Skill | Use it for | Guide |
| --- | --- | --- |
| `superior-accessibility` | Semantics, keyboard use, focus, contrast, status, and zoom | [Open](superior-accessibility/README.md) |
| `superior-comments` | Auditing or refining comments without changing code behavior | [Open](superior-comments/README.md) |
| `superior-copy` | User-facing product and marketing copy | [Open](superior-copy/README.md) |
| `superior-docs` | Documentation bootstrapping, synchronization, reconstruction, and handoff | [Open](superior-docs/README.md) |
| `superior-lean` | The smallest solution that remains complete and correct | [Open](superior-lean/README.md) |
| `superior-logic` | APIs, state, data, validation, and business rules | [Open](superior-logic/README.md) |
| `superior-responsive` | Reflow, overflow, adaptive navigation, and touch targets | [Open](superior-responsive/README.md) |
| `superior-ui` | Building or refining product interfaces | [Open](superior-ui/README.md) |
| `superior-ui-audit` | Read-only visual audits with prioritized findings | [Open](superior-ui-audit/README.md) |

## Invocation

Use explicit invocation when a particular skill must be selected:

```text
$superior-responsive Fix the catalog page layout on narrow viewports.
```

For implicit routing, describe the objective and task boundaries concretely. Codex selects skills from their descriptions. Do not invoke every skill at once; see the [combination guide](../07-combine-skills.md).

Tutorials are user-facing guidance. Runtime behavior remains governed by `AGENTS.md` and each skill's `SKILL.md`.
