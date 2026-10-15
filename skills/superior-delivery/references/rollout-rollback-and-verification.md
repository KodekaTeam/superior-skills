# Rollout, rollback, and verification

Use this reference when a release changes an environment or requires a staged deployment plan.

## Define preconditions

Before rollout, confirm:

- authorized target and current deployed version;
- artifact digest or immutable version;
- configuration and secret references;
- dependency, quota, and capacity readiness;
- migration and compatibility state;
- dashboards, logs, traces, alerts, and business checks needed for verification;
- rollback or forward-recovery owner and procedure.

Do not rely on a runbook that has not been checked against the current pipeline and platform.

## Choose a rollout strategy from risk

- **Rolling:** efficient when versions can coexist and capacity remains sufficient during replacement.
- **Canary:** limits initial exposure when traffic segmentation and representative verification exist.
- **Blue-green:** supports fast traffic switching when duplicate environments and state compatibility are practical.
- **Feature flag:** separates code deployment from exposure when both flag states are maintained and cleanup is planned.
- **Recreate or maintenance window:** may be honest when coexistence is impossible and downtime is accepted.

Do not select a strategy by fashion. Account for session affinity, background workers, queues, scheduled jobs, caches, data writers, and schema compatibility.

## Verify health at several layers

Differentiate:

- process liveness;
- readiness to receive work;
- dependency connectivity;
- critical user or business journey success;
- error, latency, saturation, and queue behavior;
- data correctness and side effects.

A green health endpoint does not prove the release works for users. Use a small, safe, non-destructive verification journey appropriate to the environment.

## Set pause and abort conditions

Define thresholds and observation windows before rollout. Pause on missing telemetry, unexpected version mix, migration uncertainty, rising errors, degraded latency, saturation, or failed business checks. Avoid moving thresholds after failure merely to finish the rollout.

## Roll back or recover forward

Rollback is safe only when the prior application remains compatible with current schema, data, configuration, events, and external effects. When it is not, use a prepared forward fix, feature disablement, traffic isolation, or restore procedure.

Treat database restore, destructive migration reversal, queue replay, and failover as separate authorized operations with data-loss and consistency implications.

## Close the rollout

Confirm the intended version and configuration are stable across the target, temporary paths and elevated permissions are removed, migration or flag cleanup is tracked, and the release result is recorded. Do not mark success while a canary, fallback, or compatibility mode remains unintentionally permanent.
