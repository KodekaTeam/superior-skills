# Per-Skill Tutorials

This index covers every canonical skill available in `skills/`. Select the skill that most directly owns the work, and add another only when the task genuinely crosses responsibility boundaries.

| Skill | Use it for | Guide |
| --- | --- | --- |
| `superior-accessibility` | Semantics, keyboard use, focus, contrast, status, and zoom | [Open](superior-accessibility/README.md) |
| `superior-api-security` | REST API hardening, authorization boundaries, rate limiting, abuse controls, and security verification | [Open](superior-api-security/README.md) |
| `superior-code-review` | Evidence-backed review of diffs, commits, branches, pull requests, and working trees | [Open](superior-code-review/README.md) |
| `superior-comments` | Auditing or refining comments without changing code behavior | [Open](superior-comments/README.md) |
| `superior-copy` | User-facing product and marketing copy | [Open](superior-copy/README.md) |
| `superior-database` | Schemas, queries, indexes, transactions, migrations, and backfills | [Open](superior-database/README.md) |
| `superior-debugging` | Evidence-driven diagnosis of reproducible, intermittent, and runtime failures | [Open](superior-debugging/README.md) |
| `superior-delivery` | CI/CD, artifacts, releases, environment promotion, rollout, and rollback | [Open](superior-delivery/README.md) |
| `superior-docs` | Documentation recording, curated implementation memory, synchronization, reconstruction, and handoff | [Open](superior-docs/README.md) |
| `superior-lean` | The smallest solution that remains complete and correct | [Open](superior-lean/README.md) |
| `superior-logic` | APIs, state, data, validation, and business rules | [Open](superior-logic/README.md) |
| `superior-performance` | Measurement, profiling, latency, throughput, resources, loading, and capacity | [Open](superior-performance/README.md) |
| `superior-responsive` | Reflow, overflow, adaptive navigation, and touch targets | [Open](superior-responsive/README.md) |
| `superior-reliability` | Service objectives, resilience, degradation, recovery, and incident readiness | [Open](superior-reliability/README.md) |
| `superior-testing` | Test strategy, regressions, test levels, fixtures, and flaky failures | [Open](superior-testing/README.md) |
| `superior-ui` | Building or refining product interfaces | [Open](superior-ui/README.md) |
| `superior-ui-audit` | Read-only visual audits with prioritized findings | [Open](superior-ui-audit/README.md) |
| `superior-ux` | User journeys, information architecture, task flows, feedback, and recovery | [Open](superior-ux/README.md) |

## Invocation

Use explicit invocation when a particular skill must be selected:

```text
$superior-responsive Fix the catalog page layout on narrow viewports.
```

For implicit routing, describe the objective and task boundaries concretely. Codex selects skills from their descriptions. Do not invoke every skill at once; see the [combination guide](../07-combine-skills.md).

Tutorials are user-facing guidance. Runtime behavior remains governed by `AGENTS.md` and each skill's `SKILL.md`.
