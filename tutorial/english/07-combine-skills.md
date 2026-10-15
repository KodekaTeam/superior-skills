# 07 - Combine Skills

Combine skills according to the concerns actually present, not according to the number of files touched.

## Common combinations

| Task | Primary skill | Add when relevant |
| --- | --- | --- |
| Build a new page | `superior-ui` | `superior-responsive`, `superior-accessibility`, `superior-copy` |
| Read-only visual audit | `superior-ui-audit` | `superior-accessibility` when requested |
| Full-stack feature | `superior-logic` + `superior-ui` | `superior-docs` when durable knowledge changes |
| Uncertain bug or runtime incident | `superior-debugging` | `superior-logic` for a confirmed behavioral repair; `superior-testing` for dedicated regression design |
| Schema, transaction, or migration change | `superior-database` | `superior-logic` for application behavior; `superior-testing` for substantial compatibility or concurrency test design |
| Security-sensitive REST API | `superior-api-security` | `superior-logic` for domain invariants, transactions, or idempotency |
| Mobile layout repair | `superior-responsive` | `superior-accessibility` for keyboard, touch, or focus |
| Implementation simplification | `superior-lean` | `superior-logic` when behavior is also analyzed |
| Regression or test-suite work | `superior-testing` | The domain skill when production behavior is also in scope |
| Comment cleanup | `superior-comments` | UI or logic skills are unnecessary |
| Maintenance documentation | `superior-docs` | A domain skill only when needed to understand the related change |

## Combined prompt examples

```text
$superior-ui $superior-responsive

Reimplement the checkout header with a clearer hierarchy while keeping
navigation usable on narrow screens. Preserve existing routes, design
tokens, and checkout behavior.
```

```text
$superior-logic $superior-docs

Add idempotency to the payment webhook with relevant tests. After it is
verified, update only the architecture and decision documentation changed
by this mechanism.
```

## Avoid mode conflicts

Do not combine the read-only `superior-ui-audit` workflow with a prompt that requests direct implementation. Audit first, or use `superior-ui` when the change has already been decided.
