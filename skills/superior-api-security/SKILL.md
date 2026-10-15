---
name: superior-api-security
description: Implement, harden, or review defensive security controls for REST APIs, including authentication and authorization boundaries, validation, rate limiting, abuse prevention, resource limits, SSRF defenses, safe errors, logging, and security tests. Use when API security, endpoint hardening, threat review, rate limiting, token handling, or sensitive business-flow protection is an explicit concern. Do not use for ordinary endpoint logic without meaningful security scope or for offensive exploitation.
---

# Superior API Security

Protect the API at the server-side trust boundary while preserving its documented contract. Base controls on the actual actors, resources, business impact, deployment topology, and existing security architecture; do not add security middleware by checklist alone.

## Establish the security contract

Before changing code, identify:

- exposed operations, versions, and consumers;
- public, authenticated, privileged, internal, webhook, and machine-to-machine callers;
- sensitive resources, properties, actions, and business flows;
- where identity is established and where authorization is enforced;
- proxies, gateways, caches, queues, third-party services, and outbound network access;
- expected traffic, burst behavior, payload size, operation cost, and failure tolerance;
- security controls already owned by infrastructure versus the application.

Trace the effective request path. Do not assume a gateway, framework default, or client-side check enforces the requirement until configuration and behavior prove it.

## Select controls from risk

Read [references/api-security-controls.md](references/api-security-controls.md) for authentication, object/function/property authorization, input and output boundaries, resource consumption, sensitive business flows, SSRF, browser-facing controls, errors, secrets, inventory, and third-party API consumption.

Prioritize controls that prevent a caller from:

- acting as another identity or outside its granted scope;
- reading or mutating another subject's object;
- setting or receiving properties it is not allowed to access;
- invoking privileged operations or skipping workflow invariants;
- exhausting compute, storage, bandwidth, paid integrations, or scarce inventory;
- making the server contact an unintended destination;
- learning sensitive internals through responses, logs, timing, or metadata.

Preserve maintained identity, cryptography, schema-validation, and secret-management libraries. Do not invent token formats, signing schemes, password storage, or encryption protocols.

Read [references/session-token-and-webhook-security.md](references/session-token-and-webhook-security.md) when sessions, bearer tokens, refresh or reset credentials, API keys, signed webhooks, key rotation, revocation, or replay resistance are in scope.

## Apply rate and abuse controls deliberately

Read [references/rate-limiting-and-abuse-controls.md](references/rate-limiting-and-abuse-controls.md) whenever rate limiting, throttling, quotas, concurrency limits, credential attacks, scraping, spam, enumeration, costly operations, or sensitive business-flow automation is in scope.

A useful limit defines all of the following:

- the operation and harm being controlled;
- the identity dimensions used for accounting;
- sustained allowance, burst allowance, concurrency, and cost weighting;
- where counters live and how distributed instances coordinate;
- behavior when the limiter or counter store fails;
- the rejection contract, observability, exemptions, and recovery path;
- tests proving both enforcement and legitimate burst tolerance.

An IP-only request count is rarely sufficient for authenticated or distributed abuse. Request rate also does not bound payload size, query complexity, batch size, execution time, downstream cost, or concurrent work.

## Keep responses and telemetry safe

- Use established HTTP semantics and the project's error schema. Return `429 Too Many Requests` for an application-level rate rejection and include `Retry-After` when a meaningful retry time is known.
- Give clients stable, actionable error identifiers without exposing stack traces, secrets, queries, internal hostnames, token contents, or authorization policy details.
- Log security-relevant outcomes with request or trace correlation, actor and tenant identifiers where permitted, control decisions, and sanitized reason codes.
- Do not log credentials, session tokens, API keys, raw authorization headers, password-reset artifacts, or unnecessary sensitive payloads.
- Separate client-visible detail from diagnostic detail and follow the repository's privacy and retention rules.

## Verify before claiming protection

Read [references/security-verification.md](references/security-verification.md) for a threat-driven test matrix, including negative authorization, token validation, schema mutation, resource limits, limiter behavior, concurrency, SSRF, error disclosure, and proxy-boundary checks.

Security completion requires evidence at the effective enforcement point. Run the narrowest meaningful automated tests plus configuration or integration checks that exercise the deployed path. For design-only work, label tests as a proposed verification plan rather than evidence of protection. Report controls enforced elsewhere, assumptions not verified, rollout risk, and monitoring needed after release.

## Combine skills narrowly

- Use `superior-code-review` when security is one risk area in a broader diff, branch, or pull-request review.
- Use `superior-logic` when the work also changes business invariants, persistence, transactions, idempotency, or domain behavior.
- Use `superior-database` when enforcement depends on tenant-scoped schema, constraints, query ownership, indexes, migrations, or sensitive-data storage.
- Use `superior-performance` when security-related resource controls require representative capacity, latency, or saturation measurement.
- Use `superior-delivery` when the security boundary is owned by pipeline identity, artifact provenance, publication, or deployment credentials.
- Use `superior-reliability` when abuse, dependency failure, or recovery must preserve an explicit availability objective.
- Use `superior-testing` when negative-security fixtures, isolation, concurrency, or deployed-boundary test design is a primary concern.
- Use `superior-docs` when the security model, public contract, operational configuration, or incident-relevant procedure changes durably.
- Use `superior-lean` to avoid unnecessary security machinery, but never simplify away a control required by the identified risk.

Do not broaden a security review into unrelated penetration testing, infrastructure changes, or production traffic experiments without explicit authorization.
