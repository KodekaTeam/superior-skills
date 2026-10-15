# Using `superior-debugging`

This skill investigates a concrete software failure when the cause is uncertain, then repairs the boundary that owns the violated contract.

## When to use it

Use it for reproducible bugs, intermittent failures, environment-specific behavior, production incidents with available evidence, or proposed fixes whose causal basis is unclear. Do not invoke it for feature work, general code review, or speculative cleanup without an observed failure.

## Workflow

1. Define expected and observed behavior from authoritative evidence.
2. Establish the smallest reproduction, affected scope, and last-known-good state when available.
3. Separate symptom, trigger, root cause, and amplifiers.
4. Test falsifiable hypotheses with the cheapest safe discriminating checks.
5. Repair the boundary that owns the broken contract.
6. Re-run the original reproduction and verify relevant neighboring behavior.
7. Report confidence and unresolved environmental or operational uncertainty.

## Prompt examples

```text
$superior-debugging Diagnose why duplicate invoices are created only when the payment webhook is retried. Trace the persisted state and queue delivery before proposing a repair.
```

```text
$superior-debugging Investigate this production-only timeout using the available sanitized traces and configuration. Do not change production settings or increase the timeout without proving the causal mechanism.
```

## Suitable combinations

- Pair with `superior-logic` when the confirmed repair changes application behavior or persistence.
- Pair with `superior-testing` when regression coverage or nondeterministic test behavior needs dedicated design.
- Pair with `superior-api-security` when the failure exposes a security control weakness.

## Result checks

A useful result distinguishes observations from hypotheses, explains the causal chain, verifies the original symptom, and labels remaining uncertainty. A restart, retry, timeout increase, or disappearing error alone is not proof of resolution.
