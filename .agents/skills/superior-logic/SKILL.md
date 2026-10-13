---
name: superior-logic
description: Implement or review application behavior, APIs, state transitions, data flow, and business rules with explicit contracts and failure handling. Use for logic-bearing changes across frontend or backend systems. Do not use for visual-only or copy-only work.
---

# Superior Logic

Keep correctness visible from input to observable outcome. Fit the solution to the repository's existing architecture and update every affected side of a contract together.

## Model the behavior

Before choosing code, identify:

- trusted and untrusted inputs;
- outputs and observable side effects;
- invariants and authorization rules;
- consumers and compatibility constraints;
- expected failure, retry, duplication, ordering, and concurrency conditions.

State a material assumption only when code and documentation cannot establish it. Ask the user when competing answers would change the product contract.

## Place responsibility

- Keep domain decisions separate from rendering, transport, and persistence when the existing architecture supports that boundary.
- Validate at the point data crosses into a trusted system. Client validation improves experience but does not enforce server correctness.
- Maintain one authoritative owner for a state transition; derive dependent state instead of synchronizing copies.
- Use shared schemas and types when they are the repository's source of truth.
- Change producers, consumers, validation, tests, and documentation together when a shared contract changes.

## Protect state and side effects

- Make related writes atomic when partial completion violates an invariant; otherwise define a recoverable partial state or compensation.
- Make repeatable operations idempotent where retries or duplicate delivery could double-create, double-charge, or corrupt data.
- Define ordering and concurrency behavior where work can race. Arbitrary delay is not synchronization.
- Use timeouts, cancellation, and bounded retries for remote work according to established project patterns; retry transient conditions only.
- Preserve user input and useful recovery options after expected failures when safe.

## Enforce security at trusted boundaries

- Authentication identifies a caller; authorization still governs each resource and action.
- Scope reads and writes to the authorized subject where possible.
- Treat route parameters, headers, hidden fields, filenames, client state, webhooks, and external payloads as untrusted.
- Use maintained libraries for credentials and cryptography. Never design custom token, encryption, signature, or secret-storage schemes.
- Keep secrets, sensitive personal data, and payment details out of logs and user-visible errors.

## Keep failure observable

- Handle an error at the layer that can recover, translate, or add useful context.
- Preserve the original cause when wrapping errors.
- Never convert an unknown failure into success or swallow it solely to keep a flow moving.
- Give users safe, actionable messages and send diagnostic detail through the project's established observability path.
- Bound data-dependent loops, queues, result sets, recursion, retries, and in-memory accumulation.

## Verify the contract

Test observable behavior rather than private steps. Cover the normal path and the material boundary, invalid-input, authorization, partial-failure, duplication, retry, or concurrency cases affected by the change. Reproduce a bug with a focused failing test when practical.

Use existing test conventions and run the narrowest relevant lint, type, test, and build checks. Report unverified conditions and compatibility risk explicitly.
