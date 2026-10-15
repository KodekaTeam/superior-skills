# Test Strategy and Levels

Choose tests from the failure risk and ownership boundary, not from a fixed ratio of unit, integration, and end-to-end tests.

## Build a risk map

For the changed behavior, record:

- the contract users or consumers rely on;
- the component that owns the decision;
- boundaries where representation or responsibility changes;
- failures with material user, financial, security, or operational impact;
- whether the risk depends on framework wiring, persistence, infrastructure, or another deployed service.

A useful test fails when that contract is broken and remains stable when unrelated implementation details change.

## Unit tests

Use a unit test when the risk is owned by a small deterministic unit and collaborators can remain real or be represented without recreating the implementation in mocks.

Good candidates include:

- calculations and transformations;
- validation and policy decisions;
- state-machine transitions;
- parsers with explicit input and output contracts;
- retry, backoff, or selection policy separated from I/O.

Avoid unit tests that assert private call order, duplicate the implementation in setup, or mock every object merely to keep execution in one process.

## Component tests

Use component tests when a UI or service component has a meaningful public contract but does not require the complete application. Exercise real rendering, event handling, state, and accessibility semantics where those are part of the contract.

Mock only boundaries that the component does not own. Prefer user-observable queries and actions over selectors tied to styling or internal structure.

## Integration tests

Use integration tests when correctness depends on collaboration with a real boundary, such as:

- database constraints, transactions, queries, or migrations;
- framework routing, middleware, serialization, or dependency wiring;
- filesystem behavior;
- message queues or background-job persistence;
- service adapters and protocol handling.

Use the lightest realistic environment that preserves the behavior at risk. An in-memory substitute is unsuitable when the production engine's constraints, isolation, query semantics, or transaction behavior are the subject of the test.

## Contract tests

Use contract tests when producers and consumers evolve independently. Verify maintained request, response, event, schema, error, and compatibility contracts without requiring every participant to run in one end-to-end environment.

Identify the contract owner and versioning policy. Do not turn captured traffic into an unquestioned contract when it contains accidental fields or unstable values.

## End-to-end tests

Use end-to-end tests when the deployed wiring or full user journey is itself the risk. Keep the set small and centered on critical paths, boundary handoffs, or failures that lower layers cannot prove.

An end-to-end test should not be the first place every branch is asserted. Diagnose failures with lower-level evidence so a broken journey does not produce only an opaque timeout.

## Property-based and generative tests

Use property-based tests when behavior is defined by invariants across a broad input space, especially for parsers, serializers, transformations, ordering, numerical rules, or state transitions.

Define meaningful generators and shrinkable failure cases. A generated test that only restates type constraints adds little confidence.

## Migration and compatibility tests

For data, API, or file-format migrations, cover:

- old input read by the new implementation;
- transformed state and preserved invariants;
- restart, retry, or partial-progress behavior;
- backward compatibility during staged rollout when required;
- rollback or forward-fix assumptions that can be tested safely.

## Combine levels deliberately

Use multiple levels only when each proves something distinct. For example:

- a unit test proves an authorization policy decision;
- an integration test proves the route applies that policy with real persistence scoping;
- an end-to-end test proves one critical journey reaches the protected route with deployed identity wiring.

Document the residual risk instead of adding redundant tests solely to make the suite look complete.
