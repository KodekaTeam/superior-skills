# Session, token, and webhook security

Use this reference when the security contract depends on credential lifecycle, signature validation, key rotation, revocation, or replay resistance.

## Map the credential lifecycle

For each credential, establish:

- issuer and authoritative verifier;
- intended holder, audience, scope, and transport;
- creation, activation, expiry, refresh, rotation, revocation, and recovery behavior;
- storage locations on server and client;
- exposure through URLs, logs, telemetry, referrers, caches, backups, or support tooling;
- behavior when clocks, identity providers, or key services fail.

Use maintained identity and cryptographic libraries with an explicit supported profile. Do not create a custom token format or signature scheme.

## Sessions and browser credentials

- Regenerate or replace session identity after authentication and privilege changes to prevent fixation.
- Set cookie scope, `Secure`, `HttpOnly`, and `SameSite` according to the deployment and cross-site flow; do not apply a flag without verifying required redirects and embedded contexts.
- Protect state-changing requests from CSRF when the browser attaches credentials automatically.
- Define idle, absolute, and privileged-action reauthentication behavior from product risk.
- Invalidate or constrain sessions after password reset, account recovery, role removal, or suspected compromise according to the accepted contract.

Avoid storing long-lived bearer credentials in script-readable browser storage when a safer established architecture exists. Client storage choice does not replace output encoding, dependency trust, or content-security controls.

## Token validation and rotation

Validate the algorithm and key profile selected by trusted configuration, then verify signature, issuer, audience, expiry, not-before, and required subject or scope claims. Do not let untrusted token headers choose arbitrary algorithms, key sources, or network locations.

Bound clock skew deliberately. Cache verification keys with expiry and refresh behavior that tolerates legitimate rotation without accepting unknown or stale keys indefinitely. Define failure behavior when the key provider is unavailable.

For refresh-token rotation, make use and replacement atomic where possible. Detect reuse according to the provider or application model and define which token family or sessions are revoked. Hash opaque high-value tokens at rest when equality verification is sufficient.

## Reset, invitation, and one-time credentials

Use high-entropy, purpose-bound, expiring credentials. Bind them to the intended workflow and consume them atomically with the protected transition. Prevent account enumeration in issuance responses while retaining useful internal telemetry.

Do not place sensitive credentials in analytics, client-visible error details, or URLs that can leak through referrers and history unless the maintained flow requires a URL token and applies appropriate protections.

## Signed webhooks

- Verify signatures over the exact raw representation required by the provider before parsing or transforming it.
- Select secrets or keys from trusted endpoint configuration, not attacker-controlled identifiers without an allowlisted mapping.
- Enforce an accepted timestamp window when the protocol provides one and retain enough delivery identity to reject replay.
- Rotate secrets with a finite overlap window and explicit retirement.
- Return acknowledgement according to the provider contract only after the event is durably accepted or intentionally rejected.
- Process duplicate deliveries idempotently and keep signature validity separate from authorization to mutate a particular resource.

Do not log raw signed payloads when they contain sensitive data. Preserve a provider event identifier, sanitized outcome, and correlation information sufficient for investigation.

## Verify negative and lifecycle cases

Test missing, malformed, expired, premature, wrong-audience, wrong-issuer, wrong-scope, unknown-key, rotated-key, revoked, and replayed credentials as applicable. For webhooks, also test body mutation, stale timestamps, duplicate delivery, secret rotation overlap, and durable-acceptance failure.

Verify the effective gateway, framework, identity-provider, and application path. A unit test of a token helper does not prove the deployed endpoint uses it correctly.
