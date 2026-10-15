# REST API Security Controls

Use this reference to select controls for the API's actual threat model. It is organized around decisions that must be made, not a requirement to install every control on every endpoint.

## Authentication and token handling

- Centralize authentication through the project's established identity provider or security boundary.
- Validate token integrity and the claims required by the token profile, including issuer, audience, expiry, and not-before time where applicable.
- Pin permitted algorithms and key sources in trusted configuration. Never accept an algorithm or key merely because an untrusted token header requests it.
- Keep access tokens short-lived enough for the risk and define revocation or session invalidation behavior where immediate termination matters.
- Distinguish human sessions, public clients, confidential clients, service identities, API keys, and signed webhooks; they have different storage and replay risks.
- Store credentials only in approved secret stores or protected server-side storage. Never place long-lived secrets in URLs, client bundles, logs, or error bodies.

Authentication proves who or what is calling. It does not prove that the caller may access this object, property, action, or workflow state.

## Authorization at three levels

### Object level

Scope every object lookup and mutation to the authorized subject, tenant, organization, or relationship. Prefer a query that can return only authorized rows over loading an object globally and checking afterward.

Test identifiers owned by another account, another tenant, a deleted subject, and a subject with changed membership. Random or opaque identifiers reduce guessing but do not enforce authorization.

### Function level

Authorize each operation according to role, scope, capability, and current resource state. Hiding an admin route in the UI or using an uncommon HTTP method is not enforcement.

Apply the same decision to alternate routes, bulk operations, imports, exports, background jobs, and legacy API versions.

### Property level

Use explicit request and response schemas. Bind only properties the caller may set, and serialize only properties the caller may receive. Avoid generic object binding or unrestricted model serialization for sensitive resources.

Treat ownership, role, price, status, balance, approval, internal flags, and audit fields as server-owned unless the contract explicitly delegates them.

## Input and protocol boundaries

- Accept only documented methods, media types, encodings, and schema shapes.
- Reject unknown or forbidden fields when silent acceptance would hide client mistakes or enable mass assignment.
- Bound strings, arrays, nesting, numeric ranges, dates, pagination, sorting, filtering, query complexity, batch count, and file dimensions before expensive processing.
- Parse identifiers, URLs, timestamps, and structured data with maintained libraries and canonicalize before policy comparison.
- Validate again after decoding, decompression, transformation, or deserialization when the representation changes.
- Parameterize database access and keep untrusted input out of command, template, path, and interpreter contexts.

Validation proves shape and acceptable values. Authorization still decides whether this caller may perform the requested change.

## Resource and cost controls

Protect more than request frequency:

- body and upload size;
- decompressed size and archive expansion;
- records per page and export size;
- batch operations and query depth or complexity;
- execution and upstream timeouts;
- concurrent work, queue depth, memory, CPU, connections, and file descriptors;
- storage growth and retention;
- email, SMS, identity verification, AI inference, payment, and other metered provider costs.

Reject excessive work before allocation where possible. Configure provider spending limits or alerts when application controls cannot fully bound financial exposure.

## Sensitive business flows

Identify operations whose automation can cause harm even when each request is valid: account creation, login, password recovery, OTP verification, reservations, inventory purchase, referrals, promotion redemption, posting, messaging, search, export, and invitation flows.

Combine controls according to the abuse case:

- rate, concurrency, and cost limits;
- per-subject quotas or cooldowns;
- idempotency and replay detection;
- workflow ordering and one-time state;
- inventory holds and transactional enforcement;
- risk signals and step-up verification;
- operational review, alerting, and reversible suspension.

Avoid permanent account lockout as a default response because an attacker may weaponize it against victims. Controls should raise attack cost without silently denying legitimate recovery.

## Outbound requests and SSRF

Any client-influenced URL, webhook, import source, callback, redirect, proxy, or preview can create an outbound trust boundary.

- Prefer server-selected destinations or explicit allowlists of schemes, hosts, ports, and media types.
- Parse and normalize with one maintained URL implementation before comparison and use the normalized result for the request.
- Resolve destinations safely and block loopback, link-local, private, metadata, and other prohibited ranges according to deployment needs.
- Revalidate redirect targets or disable redirects when they are unnecessary.
- Isolate outbound fetchers and restrict egress where infrastructure supports it.
- Bound response size, connection time, total time, redirects, and content handling.
- Never return raw upstream responses or internal connection details to the caller.

DNS rebinding, redirects, alternate address forms, and parser disagreement can defeat a superficial string check. Prefer architectural destination control over increasingly complex deny lists.

## Browser-facing API controls

- Treat CORS as a browser read policy, not authentication or authorization. Configure exact trusted origins, methods, and headers; avoid credentialed wildcard behavior.
- If browser credentials are sent automatically, assess CSRF and use the framework's established same-site, origin, token, or re-authentication defenses.
- For bearer tokens manually attached by the client, protect token storage and still validate origin-sensitive workflows where relevant.
- Set cache policy so shared caches cannot expose personalized or sensitive responses.

## Errors, metadata, and inventory

- Keep one maintained inventory of active hosts, routes, versions, owners, authentication requirements, and data sensitivity.
- Remove or isolate deprecated, debug, test, shadow, and undocumented endpoints rather than assuming obscurity protects them.
- Return the minimum useful error detail and keep authorization denials consistent enough to avoid object enumeration where existence is sensitive.
- Use a stable machine-readable error format when the project needs one; do not expose implementation exceptions as API contracts.
- Keep documentation, schemas, gateway policy, application routes, and deployed versions synchronized.

## Third-party API consumption

Treat upstream data as untrusted even when it comes from a partner.

- Validate upstream responses before persistence or execution.
- Bound redirects, response size, latency, retries, and concurrency.
- Authenticate the intended service and verify webhook signatures with replay protection where provided.
- Give integrations least-privilege credentials and isolate failures with timeouts, circuit behavior, or queues according to the existing architecture.
- Do not pass upstream error bodies, headers, or sensitive fields directly to clients.

## Baseline review

For each endpoint, record:

1. caller and authentication mechanism;
2. object, function, and property authorization;
3. input, output, payload, and operation-cost limits;
4. sensitive business-flow and replay considerations;
5. outbound calls and third-party trust;
6. client error and security telemetry behavior;
7. deployment-layer controls and their verified owner;
8. negative tests that prove enforcement.

Use the OWASP API Security Top 10 and REST Security Cheat Sheet as maintained external baselines, then adapt them to the system rather than treating them as a complete risk analysis.
