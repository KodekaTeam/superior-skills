# Using `superior-reliability`

This skill improves operational reliability through explicit objectives, failure isolation, graceful degradation, recovery, observability, and incident readiness.

## When to use it

Use it when availability, resilience, dependency failure, overload, failover, disaster recovery, backups, SLOs, or operability is a primary concern. Do not invoke it for ordinary error handling, a single unexplained bug, or speculative distributed-systems machinery.

## Workflow

1. Identify critical user journeys, objectives, state, dependencies, failure domains, and operational owners.
2. Select indicators and targets from accepted requirements rather than invented numbers.
3. Prioritize failure modes by impact, reach, detection delay, and recovery difficulty.
4. Add bounded timeout, retry, isolation, degradation, backpressure, or redundancy only where evidence justifies it.
5. Define alerts, runbooks, restore or failover procedures, and stop conditions.
6. Verify failure and recovery in the narrowest authorized environment that preserves the mechanism.

## Prompt examples

```text
$superior-reliability Define reliability objectives for checkout from existing product and telemetry evidence. Identify failure domains and propose only controls tied to accepted outcomes.
```

```text
$superior-reliability Improve resilience when the inventory provider is slow or unavailable. Bound retries, preserve backpressure, define honest degradation, and test recovery without touching production.
```

## Suitable combinations

- Pair with `superior-debugging` to diagnose an observed incident.
- Pair with `superior-performance` for capacity and saturation measurement.
- Pair with `superior-delivery` for rollout, rollback, and environment mutation.
- Pair with `superior-database` for consistency, replication, backup, and restore mechanics.
- Pair with `superior-testing` for controlled fault and recovery test design.

## Result checks

A useful result names the objective, failure mode, blast radius, control owner, degradation behavior, detection, recovery, and residual risk. Configuration review alone does not prove high availability, backup restoration, failover, or disaster recovery.
