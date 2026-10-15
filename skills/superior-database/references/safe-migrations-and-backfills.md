# Safe migrations and backfills

Use this reference for schema evolution or data transformation that may reach a shared or production-like environment.

## Build the rollout sequence

When old and new application versions may coexist, prefer:

1. **Expand:** add a compatible representation, nullable field, table, index, or accepting reader.
2. **Deploy compatibility:** make writers and readers tolerate both states.
3. **Migrate:** backfill or transition data in bounded units.
4. **Verify:** confirm completeness, correctness, performance, and replication health.
5. **Contract:** stop old writes and remove obsolete structures only after the compatibility window closes.

Do not mechanically use dual writes. They introduce partial-failure and ordering problems; use them only with a defined source of truth, reconciliation path, and cutover condition.

## Assess execution risk

For the actual engine and version, determine whether each statement:

- takes metadata or stronger locks and for how long;
- scans or rewrites the table or collection;
- builds an index online or blocks writes;
- validates existing rows immediately or can defer validation;
- expands logs, temporary storage, replication lag, or backup volume;
- changes defaults or generated values for existing and new records;
- can be cancelled and what state cancellation leaves behind.

Use production volume and traffic estimates from authorized evidence. Test on representative scale when the operation's cost is material.

## Design backfills for recovery

- Process deterministic, bounded batches with a stable checkpoint.
- Make reruns safe or record exactly which units committed.
- Rate-limit from observed database and replica health, not a guessed sleep alone.
- Separate malformed legacy data from transient execution failures.
- Preserve an audit trail appropriate to the project's sensitivity without copying secrets or personal data.
- Verify counts and domain invariants, not merely that the command exited successfully.

Avoid one long transaction for a large backfill unless atomic all-or-nothing behavior is truly required and operationally safe.

## Handle destructive changes

Before dropping, narrowing, renaming, or rewriting data, identify every application, worker, report, integration, backup, and rollback path that may still depend on the old representation. Prefer delayed removal after observed non-use.

A down migration is not automatically safe: data discarded by a forward migration may be impossible to restore. State whether rollback is executable, restore-based, or replaced by forward recovery.

## Prepare execution and recovery

For an authorized deployment, define:

- preconditions and schema/version check;
- exact migration and backfill order;
- monitoring for locks, errors, latency, saturation, and replication;
- pause or abort thresholds;
- verification queries or invariant checks;
- rollback or forward-recovery steps;
- ownership for execution and incident response.

Never execute against an inferred environment. Confirm the target and authorization immediately before a destructive or externally mutating step.
