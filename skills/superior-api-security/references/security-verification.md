# API Security Verification

Use this reference to turn the threat model into observable checks. Prefer automated negative tests against an isolated test environment. Do not probe production or third-party systems without explicit authorization.

## Build an endpoint matrix

For each changed or reviewed operation, capture:

| Dimension | Representative cases |
| --- | --- |
| Identity | none, valid, expired, malformed, wrong issuer or audience |
| Permission | correct scope, missing scope, lower role, cross-tenant role |
| Object | owned, another subject's, nonexistent, deleted, guessed identifier |
| Property | allowed field, forbidden field, sensitive response field, unknown field |
| Method and media | expected method/type, unsupported method/type, malformed body |
| Size and cost | boundary values, oversized body, large page, batch, expensive query |
| State | valid transition, skipped step, replay, duplicate, concurrent request |
| Dependency | timeout, invalid upstream data, redirect, partial failure |
| Response | status, schema, cache behavior, disclosure, correlation identifier |

Test the effective operation-level security requirement, not merely the presence of a declared security scheme.

## Authentication tests

- Reject missing, malformed, unsigned, tampered, expired, not-yet-valid, wrong-issuer, and wrong-audience tokens according to the configured token profile.
- Reject credentials presented through an unsupported location or scheme.
- Verify key rotation and unknown-key behavior without accepting attacker-selected keys or algorithms.
- Verify session termination or revocation behavior where immediate invalidation is part of the contract.
- Confirm credentials and token contents do not appear in logs, traces, metrics labels, or error bodies.

## Authorization tests

- Exercise every read and write with another subject's and another tenant's identifiers.
- Test list, search, export, bulk, nested-resource, and alternate-version routes; authorization gaps often appear outside single-object endpoints.
- Send server-owned or privileged properties and verify they are rejected or ignored according to the documented schema.
- Verify sensitive properties are absent from responses for callers that lack access.
- Test privileged operations using a valid lower-privilege token, not only an unauthenticated request.
- Repeat checks after role, membership, ownership, or resource state changes.

## Input and resource tests

- Mutate one schema constraint at a time from a known-valid request.
- Test maximum and just-over-maximum lengths, counts, nesting, numeric values, dates, pagination, batches, and uploads.
- Verify decompression, parsing, thumbnailing, export, and other expensive work is bounded before large allocation.
- Exercise timeout, cancellation, queue, and downstream failure behavior.
- Confirm unknown fields and duplicate parameters follow an explicit policy.
- Verify unsupported media types and methods receive stable client errors rather than internal failures.

## Rate and abuse tests

Use the dedicated rate-limiting reference to verify threshold, burst, concurrency, key selection, distributed state, failure mode, recovery, and `429` behavior. Also test the complete business flow: spreading requests across related endpoints must not bypass a flow-level control.

## SSRF and outbound-request tests

Use controlled fixtures, not real internal targets.

- Verify unapproved schemes, hosts, ports, address ranges, and redirect destinations are rejected.
- Test canonicalization and resolution variants supported by the URL parser.
- Confirm response size, redirect count, connection time, and total time are bounded.
- Verify upstream bodies, headers, credentials, and connection details are not reflected to the client.
- Confirm infrastructure egress rules support the application policy when they are part of the design.

## Error and disclosure tests

- Trigger validation, authentication, authorization, not-found, conflict, rate, dependency, and unexpected failures.
- Check status semantics and the stable machine-readable error contract.
- Confirm no stack trace, SQL, filesystem path, internal hostname, secret, token, or sensitive object data is exposed.
- Compare sensitive object existence paths for avoidable enumeration differences.
- Verify logs retain useful sanitized context and correlation without storing prohibited data.

## Evidence and handoff

Report:

- tested controls and enforcement locations;
- relevant test cases and observed outcomes;
- controls delegated to gateway, identity provider, cloud policy, or another service;
- assumptions that could not be verified locally;
- rollout, compatibility, and false-positive risks;
- metrics and alerts needed to tune limits or detect regressions.

Passing unit tests does not prove the deployed proxy, gateway, identity, cache, or network path enforces the same policy. Verify configuration at the layer that owns each control.
