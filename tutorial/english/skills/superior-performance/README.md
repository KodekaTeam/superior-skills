# Using `superior-performance`

This skill investigates and improves performance when latency, throughput, resource use, loading, rendering, bundle cost, or capacity is a primary concern.

## When to use it

Use it for a measured slowdown, accepted performance budget, capacity limit, expensive workload, client loading or interaction problem, or a performance-focused review. Do not use it for speculative micro-optimization without a symptom, target, or demonstrated bottleneck.

## Workflow

1. Define the affected journey, workload, metric, target, and non-negotiable correctness constraints.
2. Capture a repeatable baseline with the environment, data shape, concurrency, and cache state.
3. Profile the representative workload and identify the owning bottleneck.
4. Remove unnecessary work or optimize the constrained resource without shifting hidden cost elsewhere.
5. Repeat the same measurement protocol and run correctness checks.
6. Report before/after evidence, variance, tradeoffs, and untested conditions.

## Prompt examples

```text
$superior-performance Reduce the p95 latency of this export path. First reproduce it with representative row counts, profile database, serialization, and transfer time, then optimize only the dominant contributor.
```

```text
$superior-performance Investigate slow interaction on the mobile catalog route. Use the existing browser tooling, preserve accessibility, and compare loading and input responsiveness before and after.
```

## Suitable combinations

- Pair with `superior-debugging` when the cause of the slowdown is uncertain.
- Pair with `superior-database` when query plans, indexes, locks, or datastore capacity owns the cost.
- Pair with `superior-testing` for reliable benchmark or performance-regression automation.
- Pair with interface skills when the optimization changes rendering, interaction, responsive behavior, or accessibility.

## Result checks

A useful result includes comparable before/after evidence, workload and environment details, correctness checks, and resource or cost tradeoffs. An isolated faster run within normal variance is inconclusive.

## Key principles:
- There must be a measurable symptom, target, budget, or bottleneck.
- Compare conditions before and after, using the same workload.
- Use evidence such as profiles, traces, query plans, allocations, or browser timelines.
- Reject speculative micro-optimization.
- Do not consider a single faster execution as proof.
- Maintain correctness, security, accessibility, backpressure, and boundedness.
- Treat caching, concurrency, lazy loading, and preloading as tradeoffs, not as automatic solutions.
- Production activities—such as profiling, load generation, and cache flushing—always require explicit authorization.