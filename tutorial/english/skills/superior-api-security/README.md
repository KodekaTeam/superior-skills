# Using `superior-api-security`

This skill implements or reviews defensive security controls for REST APIs. It covers authentication and authorization boundaries, validation, rate and resource limits, abuse prevention, SSRF, safe errors and logging, and negative security tests.

## When to use it

Use it when security is an explicit part of an endpoint change, for API hardening or review, or when protecting authentication, recovery, payment, reservation, export, webhook, upload, or other sensitive flows. Ordinary API behavior remains owned by `superior-logic`.

## Workflow

1. Map callers, trust boundaries, sensitive resources, operations, and business harm.
2. Trace controls across the gateway, application, identity provider, workers, and downstream services.
3. Select controls for object, function, and property authorization; input and output boundaries; resource cost; automation; outbound requests; and credential lifecycle.
4. For sessions, tokens, reset credentials, API keys, or webhooks, define validation, storage, rotation, revocation, and replay behavior.
5. Implement the smallest coherent control at the authoritative enforcement point.
6. Verify negative cases, lifecycle transitions, limits, failure modes, telemetry, and the deployed-path assumptions.

## Prompt examples

```text
$superior-api-security Add rate limiting to login and password recovery. Choose keys and thresholds from the current traffic contract, prevent account enumeration, return a stable 429 response, and test concurrent requests.
```

```text
$superior-api-security Review this REST API for cross-tenant object access, mass assignment, unbounded exports, unsafe webhook URLs, and sensitive error disclosure. Implement the confirmed fixes.
```

```text
$superior-api-security Harden this signed webhook flow. Verify the raw payload signature, timestamp window, secret rotation, replay protection, durable acknowledgement, and idempotent duplicate handling.
```

## Suitable combinations

- Pair with `superior-logic` when authorization depends on domain state or the change includes transactions, idempotency, or persistence.
- Pair with `superior-code-review` when security is one risk area in a broader change-set review.
- Pair with `superior-testing` when negative-security fixtures, isolation, or concurrency need dedicated test design.
- Pair with `superior-docs` when the public contract, gateway policy, threat model, or operational procedure changes.
- Pair with `superior-lean` to keep the control proportionate without weakening the identified security requirement.

## Result checks

Credential and webhook work should prove lifecycle, rotation, revocation, and replay behavior at the effective deployed boundary.

Every control should identify its threat, enforcement location, failure behavior, and observable test. Rate limiting should define its keys, allowance, burst, concurrency or cost model, response contract, counter-store behavior, and monitoring—not only install middleware with a default number.
