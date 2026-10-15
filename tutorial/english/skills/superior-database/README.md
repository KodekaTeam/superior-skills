# Using `superior-database`

This skill handles database work where schema, query, transaction, migration, or data-lifecycle decisions materially affect correctness or rollout safety.

## When to use it

Use it for schema and index design, query correctness, transaction boundaries, concurrency controls, production-facing migrations, backfills, data repair, or datastore review. Routine repository calls with unchanged data contracts remain under `superior-logic`.

## Workflow

1. Identify the datastore engine, version, schema authority, data ownership, and compatibility window.
2. Establish invariants, access patterns, cardinality, volume, and concurrency behavior.
3. Design schema, queries, indexes, and transaction boundaries as one contract.
4. Plan compatibility-first rollout, verification, and recovery before migration execution.
5. Test with the real engine and representative state when engine semantics or scale owns the risk.
6. Report the environment, data scale, commands, results, and unverified rollout conditions.

## Prompt examples

```text
$superior-database Add tenant-scoped uniqueness for user email without blocking existing reads. Inspect legacy duplicates, plan a compatible migration, and define verification before enforcing the constraint.
```

```text
$superior-database Review this order-creation transaction for duplicate delivery and concurrent inventory updates. Preserve the existing database and migration tooling.
```

## Suitable combinations

- Pair with `superior-logic` for the application behavior that consumes the data contract.
- Pair with `superior-testing` for migration, compatibility, integration, or concurrency test design.
- Pair with `superior-api-security` for tenant isolation, query injection, or sensitive-data boundaries.
- Pair with `superior-debugging` when the data symptom's cause is not established.

## Result checks

A useful result proves data integrity and compatibility, names lock and recovery risks, and distinguishes locally verified behavior from production rollout safety. A generated migration file alone is not sufficient evidence.

## Key capabilities include:
- defining schemas, constraints, queries, and indexes based on actual access patterns;
- managing transaction isolation, locking, concurrency, idempotency, replication, caching, and event consistency;
- executing rollout migrations through expand, migrate, verify, and contract phases;
- performing backfills that are bounded, resumable, observable, and safe to re-run;
- evaluating the impact of locks, table rewrites, replication lag, recovery processes, and compatibility windows;
- prohibiting the execution of production migrations or destructive queries without explicit targeting and authorization.