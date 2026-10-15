# Recovery, observability, and operations

Use this reference when reliability depends on detecting, operating, restoring, or learning from failure.

## Make symptoms observable

Instrument critical journeys and control states with metrics, logs, traces, events, or audits appropriate to the system. Preserve correlation and ownership while excluding credentials, raw sensitive payloads, and unbounded labels.

Telemetry should answer: what user outcome is failing, where time or errors accumulate, which version and dependency are involved, how broad the impact is, and whether recovery is progressing.

## Alert for action

An alert should have an owner, urgency, affected objective, first diagnostic path, and action or escalation. Prefer multi-window or burn-rate reasoning for objectives where supported, and symptom alerts for user impact. Use cause alerts when they enable a distinct action.

Avoid paging on every replica restart, transient retry, or low-value threshold. Avoid dashboards that require constant watching instead of producing an actionable signal.

## Write executable runbooks

Include:

- scope and triggering symptom;
- access and safety prerequisites;
- diagnostic steps that preserve evidence;
- decision points, commands, expected output, and stop conditions;
- mitigation, recovery, rollback, and verification;
- escalation and ownership;
- known data-loss or compatibility implications;
- last verified environment or date.

Never place secret values or private incident data in a general runbook.

## Back up for restoration

Define protected data, frequency, retention, encryption, isolation, ownership, and expected RPO/RTO. Monitor backup completion, but verify restorability through authorized drills and integrity or application-level checks.

A replica is not necessarily a backup: corruption, deletion, or compromised credentials may propagate. A backup that cannot be located, decrypted, restored, or reconciled does not satisfy recovery.

## Prepare failover and disaster recovery

Document trigger authority, dependency order, traffic and identity changes, data consistency state, capacity, verification, communication, and failback. Account for DNS, certificates, secrets, queues, scheduled work, and external integrations—not only compute instances.

Exercises must have a bounded blast radius, monitoring, abort path, and explicit authorization. Record the level actually tested; a tabletop review, isolated restore, component failover, and full regional exercise prove different claims.

## Learn without confusing analysis with repair

After an incident, preserve a factual timeline, contributing conditions, control successes and failures, user impact, and recovery evidence. Assign corrective actions to owners with verification criteria. Do not equate writing a retrospective with reducing recurrence risk.
