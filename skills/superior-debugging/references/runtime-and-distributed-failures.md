# Runtime and distributed failures

Use this reference when the failure depends on environment, timing, concurrency, external systems, or operational state.

## Telemetry as evidence

Correlate signals by request, operation, job, trace, tenant-safe identifier, and time window. Use the project's established telemetry before introducing a new mechanism.

- Logs explain discrete events and local context.
- Traces explain causal paths and latency across boundaries.
- Metrics explain rates, saturation, and changes over time.
- Error reports group failures and retain stack or release context.

Absence of a log is not proof an event did not occur unless emission and delivery are themselves verified. Account for sampling, buffering, clock skew, retention, redaction, and dropped telemetry.

## Configuration and environment

Compare effective runtime configuration, not only checked-in defaults. Verify release version, dependency resolution, feature flags, environment variables by presence rather than secret value, schema level, runtime capabilities, locale, timezone, filesystem behavior, and network policy.

Do not print credentials or entire environments. Record only non-sensitive differences that can affect the failure.

## Asynchrony and concurrency

Look for ordering assumptions, non-atomic read-modify-write sequences, duplicate delivery, missing idempotency, cancellation, stale reads, lock scope, lifecycle races, and work that outlives its owner.

Use controlled barriers, deterministic schedulers, fake clocks, or repeated stress runs when supported. A sleep can change scheduling and hide a race; it does not prove synchronization.

## Stateful infrastructure

For databases, queues, and caches, verify:

- transaction and isolation boundaries;
- committed state versus cached or replicated state;
- key ownership, expiry, invalidation, and namespace;
- retry and duplicate-delivery semantics;
- schema and migration compatibility;
- cleanup, dead-letter, and recovery behavior.

Do not repair consistency failures by routinely clearing shared state. A clean-state reproduction may help distinguish corruption or migration issues, but preserve evidence before destructive cleanup.

## External services

Distinguish caller defects, contract drift, dependency failure, and network behavior. Capture status, stable error code, latency, attempt count, and sanitized request characteristics. Respect provider limits and never replay destructive requests without authorization and idempotency protection.

## Resource and latency symptoms

For CPU, memory, connection, thread, file-descriptor, queue-depth, or latency symptoms, identify the constrained resource and workload shape before optimizing. Compare rates and percentiles over a representative window; averages can hide saturation and tail failures.

A restart or scale-up may be a valid mitigation, but keep mitigation separate from root-cause repair and record recurrence risk.
