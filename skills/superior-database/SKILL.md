---
name: superior-database
description: Design, implement, review, or repair database schemas, queries, indexes, transactions, migrations, and backfills with explicit integrity and rollout constraints. Use when the datastore behavior or data lifecycle is a primary part of the task. Do not use for routine persistence calls whose schema and consistency contracts are unchanged.
---

# Superior Database

Make data changes correct for the actual datastore, workload, and rollout environment. Preserve established migration tools and ownership boundaries; do not import generic database conventions without verifying engine behavior and repository practice.

## Establish the data contract

Before changing a schema, query, or migration, determine:

- datastore engine, version, topology, and relevant extensions;
- authoritative schema and migration history;
- entity ownership, identifiers, relationships, and tenant boundaries;
- invariants that must hold at write time and read time;
- expected cardinality, access patterns, ordering, and retention;
- compatibility window across application versions, workers, and replicas;
- data volume, traffic shape, lock sensitivity, and recovery expectations.

Inspect effective production constraints only through authorized, non-sensitive evidence. Do not assume local fixtures represent production volume, skew, nullability, or legacy states.

## Design schema and queries together

Read [references/schema-query-and-index-design.md](references/schema-query-and-index-design.md) when adding or changing tables, collections, fields, relationships, indexes, query shapes, pagination, or retention behavior.

- Encode durable invariants in the datastore when the engine and rollout permit it.
- Keep application validation for user feedback, but do not rely on it as the sole protection against concurrent or alternate writers.
- Select indexes from real predicates, joins, ordering, uniqueness, and cardinality rather than indexing every filtered field.
- Verify query semantics for nulls, collation, timezones, ordering ties, and empty sets.
- Bound result sets and write batches; avoid hidden full scans, unbounded fan-out, and per-row queries.

Do not denormalize, partition, shard, or introduce a cache without demonstrated workload pressure and a clear consistency owner.

## Preserve transactional truth

Read [references/transactions-and-consistency.md](references/transactions-and-consistency.md) when work spans related writes, concurrent actors, replicas, queues, caches, idempotency, or cross-service workflows.

- Define the invariant and the exact boundary that must be atomic.
- Use datastore guarantees deliberately; do not infer serialization from application request order.
- Keep transactions short and avoid remote calls while holding locks unless the established architecture proves it safe.
- Make retryable operations idempotent and distinguish transaction retry from business-operation replay.
- Treat cache invalidation, replica lag, and event publication as explicit consistency contracts.

## Plan migrations as deployments

Read [references/safe-migrations-and-backfills.md](references/safe-migrations-and-backfills.md) for production-facing schema changes, constraint introduction, type changes, table rewrites, backfills, data repair, or removal of old representations.

- Prefer compatibility-first expand, migrate, verify, and contract phases when multiple application versions may coexist.
- Identify locks, rewrites, validation cost, replication impact, and failure recovery before execution.
- Make backfills bounded, observable, resumable, and idempotent where practical.
- Define verification and rollback or forward-recovery behavior before destructive or irreversible steps.
- Never run a production migration, destructive query, broad data correction, or shared-environment load test without explicit authorization and the intended environment.

A migration file compiling locally is not evidence that its production execution is safe.

## Verify the result

Use the repository's existing database and test tooling. Verify proportionately:

- migration applies from the supported previous state and reaches the intended schema;
- rollback works when it is promised and semantically possible;
- old and new application versions behave according to the compatibility plan;
- constraints reject invalid states and preserve valid legacy data;
- representative queries return correct results with stable ordering;
- query plans and runtime behavior are checked against representative shape and scale when performance is in scope;
- backfill counts, checkpoints, error handling, and reruns preserve invariants.

Report commands actually run, datastore/version used, data scale represented, and conditions not exercised. Never claim zero downtime without evidence for the relevant engine, topology, workload, and deployment sequence.

## Combine skills narrowly

- Use `superior-logic` for domain behavior, API contracts, and application orchestration around persistence.
- Use `superior-testing` when migration, integration, compatibility, or concurrency test design is a primary concern.
- Use `superior-debugging` when a data symptom exists but its causal mechanism is uncertain.
- Use `superior-performance` when representative query, capacity, resource, or latency measurement is a primary concern.
- Use `superior-reliability` when replication, availability, failover, backup objectives, or recovery readiness is primary.
- Use `superior-delivery` when migrations must be coordinated with artifact promotion, rollout, or rollback.
- Use `superior-api-security` for tenant isolation, unsafe query construction, sensitive-data exposure, or abuse-driven resource controls.
- Use `superior-docs` after verified schema, migration, recovery, or operational procedure changes.

Do not broaden a focused database change into a datastore replacement, ORM rewrite, or infrastructure migration without explicit scope.
