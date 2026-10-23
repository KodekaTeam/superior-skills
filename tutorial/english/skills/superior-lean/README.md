# Using `superior-lean`

This skill seeks the smallest solution that remains complete, correct, safe, and contract-compliant. Its routing and runtime instructions are owned entirely by Superior.

## When to use it

Use it when an implementation is accumulating abstractions, dependencies, wrappers, configuration, or layers that may not be justified. Do not use it to remove user requirements, security, accessibility, compatibility, or concurrency protections.

## Workflow

1. State the contract that must be fulfilled and the risks that cannot be ignored.
2. Look for existing capabilities in local code, the standard library, the native platform, or installed dependencies.
3. Compare solutions by the number of new concepts, not merely lines of code.
4. Distinguish accidental machinery from boundaries justified by current consumers, external systems, policy, compatibility, or real variation.
5. Trace indirect consumers and compare total ownership before removing shared code or dependencies.
6. Test important behavior and explain the remaining trade-offs.

Code with no direct callers may still be activated through registries, configuration, routes, events, reflection, build tooling, or public APIs. Likewise, a dependency is simpler to remove only when the project can safely own its complete behavior and maintenance burden—not merely reproduce its happy path in fewer lines.

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
