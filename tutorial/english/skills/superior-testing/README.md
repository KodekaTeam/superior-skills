# Using `superior-testing`

This skill designs, implements, repairs, or reviews automated tests when testing itself requires dedicated decisions about risk, test level, isolation, fixtures, or reliability.

## When to use it

Use it for regression tests, test strategy, missing coverage at an important boundary, flaky failures, contract tests, or a substantial test-suite change. Do not invoke it merely because an ordinary implementation should run existing checks before delivery.

## Workflow

1. Identify the observable contract, regression, and risk being protected.
2. Inspect existing test tools, conventions, fixtures, and CI constraints.
3. Choose the narrowest test level that exercises the real owner of the risk.
4. Make state, time, randomness, concurrency, and external boundaries deterministic where the test owns them.
5. Run the focused test first, then the relevant neighboring suite and repository checks.
6. Report what was proved and which environments or conditions remain untested.

## Prompt examples

```text
$superior-testing Add regression coverage for duplicate webhook delivery. Prove that retries cannot create a second payment without mocking the idempotency store.
```

```text
$superior-testing Diagnose and repair this flaky asynchronous test. Identify the uncontrolled condition instead of adding retries or a larger timeout.
```

## Suitable combinations

- Pair with `superior-logic` when production business behavior or state transitions also change.
- Pair with `superior-api-security` for negative authorization, limiter, token, SSRF, or abuse-control verification.
- Pair with an interface skill when component, accessibility, responsive, or interaction behavior owns the asserted contract.

## Result checks

A useful result explains the protected contract, why the selected level is credible, which command passed or failed, and what risk remains. Coverage percentage alone is not evidence that the important behavior was tested.

## Key characteristics of the skill:
- Active when testing constitutes a core part of the work.
- Encompasses regression testing, test strategy, contract testing, fixtures, mocks/doubles, flaky tests, concurrency, timing, and external systems.
- Goes beyond simply executing existing tests as part of routine implementation.
- Does not impose specific frameworks, a rigid "test pyramid," or generic coverage targets.
- Prioritizes the smallest possible test level that effectively addresses the relevant risks.