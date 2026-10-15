---
name: superior-testing
description: Design, implement, repair, or review automated tests for observable behavior, regressions, contracts, stateful boundaries, and flaky failures. Use when testing is a primary part of the request or when choosing test levels, isolation, fixtures, or reliability requires dedicated judgment. Do not use merely to run existing checks after an ordinary implementation.
---

# Superior Testing

Make tests provide durable evidence about behavior and risk. Fit the suite to the repository's existing tools and architecture; do not impose a generic test pyramid, framework, or coverage target.

## Establish the contract

Before writing a test, identify:

- the observable behavior or invariant being protected;
- the failure or regression the test must distinguish;
- the public boundary where the behavior can be observed;
- dependencies, state, time, concurrency, and external systems involved;
- existing test conventions, helpers, fixtures, and CI constraints.

For a reported bug, reproduce the failure before changing the implementation when practical. Confirm that the test fails for the intended reason rather than because the fixture, environment, or assertion is broken.

## Choose the narrowest credible test

Read [references/test-strategy-and-levels.md](references/test-strategy-and-levels.md) when selecting among unit, component, integration, contract, end-to-end, property-based, or migration tests, or when a change needs coverage at more than one layer.

Prefer the least expensive test that exercises the real owner of the risk:

- pure rules at a stable callable boundary;
- integration tests for persistence, serialization, framework wiring, or service boundaries;
- contract tests for independently changing producers and consumers;
- end-to-end tests for a small number of critical journeys whose wiring is itself the risk.

Do not repeat the same assertion at every layer. Add another layer only when it proves a distinct failure mode.

## Design for signal

- Assert observable outcomes, state transitions, emitted effects, or stable contracts rather than private method calls.
- Use representative boundary cases and invalid inputs derived from the contract, not arbitrary permutations.
- Keep each failure diagnostic enough to identify the broken contract.
- Keep snapshots small and intentional; review semantic changes instead of accepting broad snapshot churn.
- Treat line coverage as a discovery signal, not proof of correctness.
- Preserve established naming and structure unless they prevent the test from expressing its purpose.

Production code may receive a small testability seam when the requested scope permits it and the seam improves the real design. Do not expose private internals, add dependency injection machinery, or alter behavior solely to satisfy a test harness.

## Keep execution reliable

Read [references/reliable-test-design.md](references/reliable-test-design.md) when tests involve shared fixtures, databases, files, networks, time, randomness, asynchronous work, concurrency, retries, or intermittent failures.

- Control time and randomness at an owned boundary.
- Wait for observable conditions instead of sleeping for guessed durations.
- Isolate mutable state and clean it up even after failure.
- Mock external ownership boundaries, not the internal collaboration being tested.
- Never hide a flaky test with retries, larger timeouts, or skipped execution without identifying and recording the unresolved cause.

## Execute proportionately

Run the narrowest affected test first, then the relevant suite, type checks, lint, or build checks according to repository practice and change risk. Do not run destructive integration tests, production traffic experiments, or tests that mutate shared external systems without explicit authorization and an approved environment.

Report:

- the behavior and risk covered;
- test level and why it is credible;
- commands run and observed results;
- failures that predated the change or remain unresolved;
- important environments or conditions not exercised.

## Combine skills narrowly

- Use `superior-code-review` when tests are one risk area within a broader change-set review.
- Use `superior-debugging` when a failing test is evidence of an unknown production or environment cause rather than a test-design problem.
- Use `superior-database` when a migration, real-engine integration, transaction, or data-compatibility contract owns the behavior under test.
- Use `superior-performance` when benchmark methodology, performance budgets, capacity checks, or regression thresholds are primary.
- Use `superior-reliability` when controlled fault, degradation, recovery, failover, or restore testing is primary.
- Use `superior-delivery` when pipeline and release verification owns the test environment or gate.
- Use `superior-logic` when tests accompany changes to business rules, state transitions, persistence, or API behavior.
- Use `superior-api-security` for threat-driven negative cases and security-control verification.
- Use `superior-accessibility`, `superior-responsive`, or `superior-ui` when the asserted behavior is owned by those interface concerns.
- Use `superior-docs` only when the test strategy, verification procedure, or delivered implementation changes durable project knowledge.

Do not broaden a focused test request into unrelated production refactoring or a full-suite rewrite.
