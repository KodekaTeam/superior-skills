# Reliable Test Design

Reliable tests control the causes of variation they own and expose the causes they do not. Treat intermittent failure as missing information, not as permission to retry until green.

## Fixtures and test data

- Give fixtures the smallest state needed to express the contract.
- Prefer builders or factories that expose meaningful domain choices without hiding important defaults.
- Make ownership and cleanup explicit for databases, files, queues, processes, and remote resources.
- Use unique identifiers when tests may run concurrently.
- Avoid mutable global fixtures whose outcome depends on test order.

Shared setup is useful when it represents a stable contract. Split it when understanding one test requires mentally executing unrelated fixture machinery.

## Test doubles

Choose the double according to the boundary:

- a stub supplies controlled data;
- a spy records an externally meaningful interaction;
- a fake provides a lightweight working implementation;
- a mock enforces an interaction contract.

Mock a dependency the system does not own, a failure that is otherwise impractical to produce, or a slow boundary intentionally excluded from the test. Do not mock the behavior under test or mirror its private algorithm in expectations.

Keep adapters covered by integration or contract tests so a passing mock-based test cannot drift away from the real protocol.

## Time and randomness

- Inject or control clocks at the boundary that owns time decisions.
- Freeze time only for the scope of the test and restore it afterward.
- Seed randomness when replay matters, and report the seed for generated failures.
- Assert ranges only when the contract is genuinely a range; do not widen assertions to conceal nondeterminism.

## Asynchronous and concurrent behavior

- Wait for an observable state or event, not a guessed delay.
- Bound waits with a failure message that names the unmet condition.
- Coordinate concurrency with real primitives rather than timing assumptions.
- Test duplicate delivery, ordering, cancellation, timeout, and partial completion when they affect the contract.
- Run race-sensitive tests repeatedly only as additional evidence, not as a substitute for a deterministic trigger.

## External systems

Never point automated tests at production by default. Use an isolated approved environment and ensure operations are reversible or disposable.

For networked dependencies:

- set explicit timeouts;
- separate transport failure from application rejection;
- record requests safely when diagnostics are needed;
- avoid credentials or sensitive payloads in fixtures and failure output;
- distinguish unavailable infrastructure from a product regression.

## Diagnose flaky tests

Classify the observed variation before changing the test:

1. shared state or order dependence;
2. uncontrolled time or randomness;
3. asynchronous completion or race conditions;
4. environment or resource pressure;
5. unstable external dependency;
6. assertion against an implementation detail;
7. a real intermittent product defect.

Reproduce under controlled repetition and capture the smallest useful evidence. Fix the owner of the variation. Quarantine only when continued execution causes disproportionate harm, and record the owner, evidence, impact, and condition for restoration.

Do not treat these as fixes:

- unconditional retry;
- a larger arbitrary sleep;
- broad exception swallowing;
- weakening the assertion until it cannot detect the regression;
- disabling parallelism without proving shared-state interference;
- deleting the test because the failure is inconvenient.

## Failure quality

A failure should reveal the contract, relevant input, expected outcome, and observed outcome without dumping secrets or excessive state. Prefer one precise failure over many derivative assertions that obscure the root mismatch.

After repairing a flaky test, run it enough times to exercise the former failure condition and then run the relevant neighboring suite. Report the repetition count as evidence, not proof that no intermittent condition remains.
