# Transactions and consistency

Use this reference when correctness depends on concurrency, multiple writes, replicas, caches, queues, or services.

## Start from the invariant

State the invalid outcome that must never become observable. Then identify every actor that can read or write the involved state. Choose the smallest atomic boundary that prevents that outcome without holding unrelated work.

Do not assume an ORM method, request handler, or background job is transactional. Verify where the transaction begins, which connection or session participates, when it commits, and what happens on cancellation or exception.

## Isolation and locking

Choose isolation from the anomaly the invariant cannot tolerate, using the actual engine's semantics. Account for lost updates, write skew, phantoms, stale snapshots, and deadlocks where relevant.

- Use conditional updates, version columns, uniqueness, or explicit locking when they express ownership clearly.
- Acquire locks in a stable order when several resources must be locked.
- Keep transactions short and avoid user interaction, long computation, or network calls inside them.
- Treat deadlock and serialization failures as retryable only when the entire attempted operation is safe to repeat.

Do not weaken isolation globally to repair one slow path. Fix the query, transaction scope, or workload contract that owns the contention.

## Idempotency and retries

A database transaction rollback does not prevent an external effect that already occurred. Separate database retry from whole-operation retry and track external effects through a stable idempotency key or established workflow.

For duplicate delivery, enforce the deduplication decision atomically with the state transition it protects. A check followed by an insert in separate atomic boundaries can still race.

## Events and cross-service work

When database state and event publication must agree, use the project's established outbox, change-data-capture, or equivalent pattern. Do not claim atomicity across independent systems unless a maintained protocol provides it.

Define consumer behavior for duplicates, reordering, late delivery, poison messages, and replay. Record whether an event represents an intent, a committed fact, or a reconstructable projection.

## Caches and replicas

Specify whether reads require read-your-writes, monotonicity, bounded staleness, or eventual consistency. Route or delay accordingly rather than assuming a replica has caught up.

For caches, define key ownership, namespace, expiry, invalidation trigger, and behavior when cache and source disagree. A cache clear may mitigate stale state but does not repair an invalidation contract.

## Verify concurrency behavior

Use deterministic barriers or coordinated workers when available. Assert the final invariant and permitted outcomes rather than thread timing. Run against the real database engine when isolation, constraints, locks, or query semantics are what the test must prove.
