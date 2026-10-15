# Using `superior-code-review`

This skill reviews a diff, commit, branch, pull request, or working tree for actionable defects and regressions. It is read-only unless the user explicitly asks for fixes.

## When to use it

Use it when code review is the primary deliverable: review a proposed change, assess merge risk, find regressions, or verify that implementation and tests satisfy an intended contract. Use specialized skills for a dedicated visual, security, database, or performance audit.

## Workflow

1. Confirm the review target, comparison base, intended behavior, and whether fixes are authorized.
2. Read the diff, then trace changed contracts through callers, state, data, configuration, and consumers.
3. Test candidate findings against reachable scenarios and existing protections.
4. Run safe targeted checks that improve confidence.
5. Keep only actionable findings caused or exposed by the target change.
6. Report findings first, ordered by severity, followed by verification and unreviewed risk.

## Prompt examples

```text
$superior-code-review Review the current branch against main. Focus on correctness, compatibility, and missing regression coverage. Do not modify files.
```

```text
$superior-code-review Review the staged checkout changes. Report only actionable defects with precise file locations, triggers, and consequences.
```

## Suitable combinations

- Pair with `superior-api-security` for an explicitly security-focused review.
- Pair with `superior-database` when migrations, transactions, or stored-data compatibility dominate the risk.
- Pair with `superior-performance` when measured performance analysis is the requested outcome.
- Pair with `superior-testing` when test architecture or reliability needs dedicated review.

## Result checks

A useful review contains a small set of evidenced findings rather than style preferences. It is also valid to report no actionable findings while naming checks performed and material areas that could not be verified.

## Key behaviors:
- Code reviews are read-only by default.
- Do not edit files, submit comments, or approve PRs without an explicit request.
- Findings must include a trigger, a reachable path, concrete consequences, and the precise file location.
- Style preferences and speculative redesigns are not considered defects.
- Findings are prioritized based on impact and scope.
- A result of "no actionable findings" is considered valid.
- A general review does not automatically evolve into a security audit, visual audit, or implementation task.