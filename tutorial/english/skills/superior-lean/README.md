# Using `superior-lean`

This skill seeks the smallest solution that remains complete, correct, safe, and contract-compliant. Its principles draw from the Ponytail approach, while routing and runtime instructions remain specific to Superior.

## When to use it

Use it when an implementation is accumulating abstractions, dependencies, wrappers, configuration, or layers that may not be justified. Do not use it to remove user requirements, security, accessibility, compatibility, or concurrency protections.

## Workflow

1. State the contract that must be fulfilled and the risks that cannot be ignored.
2. Look for existing capabilities in local code, the standard library, the native platform, or installed dependencies.
3. Compare solutions by the number of new concepts, not merely lines of code.
4. Remove single-use abstractions or speculative generalization when they provide no concrete value.
5. Test important behavior and explain the remaining trade-offs.

## Prompt examples

```text
$superior-lean Implement this simple cache using existing capabilities. Avoid a new dependency unless it is genuinely necessary.
```

```text
$superior-lean Review and simplify this design without weakening validation, security, or retry behavior.
```

## Suitable combinations

- Pair with `superior-logic` to keep backend changes small but robust.
- Pair with `superior-ui` to avoid speculative components and variants.
- Pair with `superior-docs` when simplification changes a documented architectural decision.

## Result checks

The final solution should satisfy every acceptance criterion while introducing as few new concepts as practical. Ensure that simplicity did not come from removing required error handling, validation, observability, or in-scope edge cases.
