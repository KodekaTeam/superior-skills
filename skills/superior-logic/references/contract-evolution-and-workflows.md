# Contract evolution and workflows

Use this reference when behavior crosses independently deployed consumers, versions, asynchronous steps, or durable state transitions.

## Identify the authoritative contract

Determine whether the source of truth is code, schema, protocol definition, event catalog, stored representation, tests, or maintained documentation. Trace every producer and consumer that can coexist during the change.

For each changed field or behavior, define:

- presence, nullability, default, and validation;
- ownership and who may set or observe it;
- ordering, duplication, and retry semantics;
- error and unknown-value behavior;
- compatibility window and removal condition.

Do not treat a shared type in one process as proof that deployed consumers update together.

## Evolve contracts compatibly

Prefer additive changes while old and new participants coexist. Readers should tolerate the intended transition state, and writers should not emit a representation an active consumer cannot handle.

Use explicit versioning only when compatibility cannot be preserved or the product contract needs independently maintained behavior. Version the contract boundary, not every internal refactor. Define routing, support duration, migration, and retirement rather than leaving versions permanent by accident.

For enums and tagged variants, decide how older consumers handle unknown values. For renamed or split fields, establish one source of truth and a finite transition rather than indefinite dual ownership.

## Model state transitions

Express allowed states, transition owners, prerequisites, side effects, and terminal conditions. Reject invalid transitions at the authoritative boundary and make repeated commands return the prior result or a stable conflict according to the contract.

Do not infer workflow state solely from which side effect happened last. Persist enough durable state to distinguish pending, completed, failed, cancelled, compensated, and unknown outcomes when those distinctions affect recovery.

## Coordinate multi-step work

Choose the guarantee the systems can actually provide:

- one local transaction for state owned by one transactional store;
- an outbox or equivalent handoff when state and event publication must agree;
- idempotent consumers for duplicate delivery;
- compensation for already-committed effects that cannot be rolled back;
- reconciliation when participants can diverge temporarily.

Avoid “exactly once” claims across independent systems. Usually the useful contract is at-least-once delivery plus atomic deduplication or idempotent state transition.

## Design failure and recovery

For each step, define timeout, cancellation, retry eligibility, retry budget, ownership after caller disconnect, and what an operator or user can safely repeat. Preserve original error causes internally while exposing stable, actionable outcomes to consumers.

Feature flags and staged rollout may limit exposure, but they do not repair an incompatible data or protocol transition. Define behavior for both flag states and remove temporary paths when the rollout is complete.

## Verify coexistence

Test supported old/new producer and consumer combinations, repeated messages or commands, out-of-order delivery where possible, partial dependency failure, and recovery after interruption. Verify observable state and effects rather than private orchestration calls.
