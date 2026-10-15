# Reviewing changes and risk

Use this reference to inspect a change beyond its visible diff while keeping the review bounded to the requested target.

## Reconstruct intent and scope

Identify the behavior the change claims to add, remove, or preserve. Compare the changed files with the stated scope and repository status so unrelated edits, omitted generated artifacts, or missing companion changes are visible.

For a branch or commit range, confirm the merge base or comparison base. For a working tree, distinguish staged, unstaged, and untracked changes. Do not assume the visible patch contains every runtime dependency of the change.

## Trace contracts across boundaries

Follow changed values and behavior through the boundaries that own them:

1. caller, route, event, job, or user action;
2. parsing, normalization, validation, and authorization;
3. domain decisions and state transitions;
4. database, cache, queue, filesystem, or external service;
5. serialization, client consumption, rendering, and user feedback;
6. failure handling, retry, cancellation, cleanup, and observability.

Check both producers and consumers when types, schemas, events, configuration, stored data, or public APIs change. A locally consistent edit can still break an unchanged consumer.

## Review high-risk behavior

### Correctness and state

- boundary values, empty states, nullability, ordering, and duplicate input;
- partial failure, retry, cancellation, timeout, and cleanup;
- concurrency, atomicity, idempotency, and stale state;
- ownership of derived or synchronized state;
- error translation that hides failure or reports success incorrectly.

### Security and privacy

- authorization at the trusted resource boundary;
- unsafe parsing, query construction, path handling, or outbound requests;
- secrets or sensitive data entering logs, clients, caches, or errors;
- caller-controlled fields overriding server-owned state;
- resource use that can be amplified without meaningful bounds.

Route a dedicated threat review to `superior-api-security`; a general review should still report an evident exploitable regression.

### Compatibility and delivery

- old and new clients, workers, data, configuration, and deployment order;
- schema or migration changes that make rolling deployment unsafe;
- renamed or removed exports, flags, environment values, and file paths;
- defaults whose behavior changes for existing installations;
- platform, locale, timezone, encoding, and case-sensitivity assumptions.

### Performance and resources

- loops or fan-out added around I/O;
- unbounded collections, queries, payloads, retries, or concurrency;
- repeated parsing, serialization, rendering, allocation, or remote calls;
- cache changes with invalidation, tenant, memory, or stampede risk;
- work moved onto a latency-sensitive path.

Only report a performance finding when the workload and causal cost are credible. Route measurement-heavy analysis to `superior-performance`.

## Evaluate verification

Map changed behavior to existing and new tests. Check whether assertions observe the contract or merely implementation details, and whether mocks remove the boundary that owns the risk.

Missing tests are a finding only when they leave a material regression path unprotected or violate an established project requirement. Do not request tests mechanically for trivial or already-covered behavior.

## Review non-code artifacts

Inspect dependency lockfiles, manifests, migrations, generated clients, API schemas, configuration, feature flags, and documentation when the change depends on them. Do not review generated output line by line when its source is available; verify source change, generation method, and expected artifact inclusion.

## Bound the review

Report defects introduced or exposed by the target change. Pre-existing defects may be noted separately only when they block evaluation or become newly reachable. Do not turn the review into a repository-wide audit.
