# Using `superior-logic`

This skill handles program behavior: APIs, state, data, validation, authorization, transactions, idempotency, concurrency, error handling, and business rules.

## When to use it

Use it for backend features, data integrations, contract changes, stateful workflows, or behavioral bugs. Do not make it the primary skill for visual-only or copy-only changes.

## Workflow

1. Define input, output, side-effect, and failure-mode contracts.
2. Trace boundaries to databases, external services, queues, caches, or clients.
3. Determine relevant invariants, validation, authorization, atomicity, retry, and concurrency behavior.
4. Implement the smallest change that preserves the contract.
5. Test happy paths, edge cases, dependency failures, and repeated operations.

## Prompt examples

```text
$superior-logic Add an idempotent refund endpoint. Preserve the old API contract and include tests for retries and concurrent requests.
```

```text
$superior-logic Diagnose this order-status transition bug, then repair the invariant and add a regression test.
```

## Suitable combinations

- Pair with `superior-lean` to select the smallest design that still handles system risks.
- Pair with `superior-ui` when work spans client and server.
- Pair with `superior-docs` when contracts, architecture, or decisions change.
- Run `superior-comments` separately when comments require an audit.

## Result checks

Contracts should remain explicit, callers should be able to handle errors, sensitive operations should enforce authorization, and data changes should tolerate partial failure safely. Tests should prove important invariants rather than merely increasing coverage.
