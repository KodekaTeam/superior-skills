---
name: superior-reliability
description: Design, implement, review, or improve operational reliability through service objectives, failure isolation, graceful degradation, recovery, observability, and incident readiness. Use when availability, resilience, dependency failure, disaster recovery, or operability is a primary concern. Do not use for ordinary error handling, a single unexplained bug, or speculative distributed-systems machinery.
---

# Superior Reliability

Keep critical user outcomes dependable under expected failures and recoverable after exceptional ones. Base reliability work on explicit service objectives, real failure domains, and operational ownership rather than adding retries, circuit breakers, or redundancy by checklist.

## Define the reliability contract

Before proposing controls, establish:

- critical user journeys and the service or component boundaries that support them;
- acceptable availability, correctness, latency, freshness, and durability;
- traffic and workload shape, peak conditions, and dependency budgets;
- failure domains, shared dependencies, state ownership, and blast radius;
- SLI/SLO, error budget, RTO, RPO, retention, or contractual targets that actually exist;
- detection, response, escalation, recovery, and decision owners;
- evidence from incidents, telemetry, capacity tests, architecture, and runbooks.

Do not invent numerical objectives because a template expects them. When no objective is accepted, state a provisional risk question and gather evidence before designing a complex control.

## Choose work from risk and objective

Read [references/objectives-and-risk-model.md](references/objectives-and-risk-model.md) when defining service indicators, objectives, error budgets, failure modes, critical dependencies, or prioritization.

- Protect the user outcome, not merely process uptime.
- Segment indicators enough to expose critical journeys and severe cohorts without creating unmaintainable telemetry.
- Prioritize failure modes by consequence, likelihood, detectability, and recovery difficulty.
- Reduce blast radius and remove single points of failure only where the objective justifies their cost.
- Treat planned maintenance, dependency failure, data correctness, and delayed work according to the actual product contract.

## Design bounded resilience

Read [references/resilience-and-graceful-degradation.md](references/resilience-and-graceful-degradation.md) for timeouts, retries, backoff, jitter, idempotency, circuit behavior, bulkheads, load shedding, queues, fallbacks, redundancy, and graceful degradation.

- Assign one end-to-end deadline and budget it across calls; stacked defaults can exceed the user's tolerance.
- Retry only transient operations that are safe to repeat, with a bound and enough jitter to avoid synchronized recovery storms.
- Preserve backpressure and fairness under overload.
- Degrade optional capability without presenting stale, partial, or unsafe results as complete success.
- Keep resilience state observable and recovery behavior testable.

Additional redundancy can reproduce the same failure when instances share configuration, credentials, region, datastore, quota, or deployment path. Verify independence rather than counting replicas.

## Make recovery operational

Read [references/recovery-observability-and-operations.md](references/recovery-observability-and-operations.md) for alerting, runbooks, incident response, backups, restore, failover, disaster recovery, drills, and post-incident follow-up.

- Alert on actionable symptoms tied to user impact or exhausted safety margin.
- Preserve diagnostic context without exposing secrets or sensitive payloads.
- Verify backups through restoration and integrity checks, not job success alone.
- Give runbooks prerequisites, stop conditions, ownership, verification, and escalation.
- Convert incident learning into owned corrective work; do not treat a retrospective as remediation.

Never trigger chaos experiments, failover, restore, traffic shedding, production load, or shared-system fault injection without explicit authorization, a bounded blast radius, monitoring, and an abort path.

## Verify failure behavior

Use the narrowest safe environment that preserves the failure mechanism. Verify:

- normal behavior remains correct;
- timeout, retry, cancellation, and fallback budgets compose as intended;
- dependency failure does not cascade beyond the designed boundary;
- overload remains bounded and important work receives the intended priority;
- recovery converges without duplicate or corrupt effects;
- alerts fire on the right symptom and clear when recovery is complete;
- runbooks and restore procedures produce the claimed result at the level exercised.

Report objectives used, failure modes exercised, environment and blast radius, observed degradation and recovery, controls not tested, and residual risk. Do not claim high availability or disaster recovery from configuration review alone.

## Combine skills narrowly

- Use `superior-debugging` to diagnose a concrete incident or unknown failure cause.
- Use `superior-performance` for measurement-heavy latency, throughput, saturation, or capacity optimization.
- Use `superior-delivery` for pipeline, rollout, deployment verification, and rollback execution.
- Use `superior-testing` when fault, recovery, concurrency, or resilience test design is a primary concern.
- Use `superior-database` for datastore consistency, replication, migration, backup mechanics, or data recovery.
- Use `superior-logic` when resilience changes domain state, workflow, or side-effect contracts.
- Use `superior-docs` for durable SLO, runbook, recovery, architecture, or incident-relevant procedures.

Do not broaden ordinary implementation into multi-region architecture, chaos engineering, or an observability-platform migration without explicit scope and evidence.
