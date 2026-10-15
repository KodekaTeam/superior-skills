# Rate Limiting and Abuse Controls

Use this reference when request frequency, concurrency, automation, credential attacks, scraping, spam, scarce inventory, or metered downstream work can cause harm.

## Start with the harm model

State what the control protects:

- availability and latency;
- credential or OTP guessing;
- account, email, phone, or identifier enumeration;
- scraping or bulk extraction;
- spam, invitations, comments, or message creation;
- reservation, purchase, redemption, referral, or other scarce business flows;
- expensive searches, exports, uploads, transformations, or third-party calls;
- tenant fairness and contractual quota enforcement.

One API may need several independent controls because these harms have different identities, costs, and recovery behavior.

## Choose accounting dimensions

Key limits using the strongest stable dimensions available:

- authenticated subject or service identity;
- tenant, organization, subscription, or API key;
- target account, phone, email, resource, or business object;
- route or operation class;
- network source as a supporting signal;
- device or risk signal where privacy policy and reliability permit it;
- global or regional capacity.

Use combinations when one dimension is easy to rotate. For example, a login flow may need limits by source, target account, and global service capacity. Normalize target identifiers exactly as the owning identity or domain system does, then use a keyed digest or another approved pseudonymous representation when raw email addresses, phone numbers, account names, or tenant identifiers should not appear in counter keys.

Do not trust `X-Forwarded-For`, `Forwarded`, or similar headers unless each trusted proxy removes or predictably rewrites untrusted incoming values and the application accepts them only from the configured proxy chain. Avoid trusting a fixed hop count when alternate network paths can reach the application with fewer hops.

Avoid using IP address as a durable identity. Shared networks can create collateral denial, while distributed clients can rotate addresses.

## Select the limiting model

- **Token bucket:** allows a controlled burst while enforcing a refill rate; useful for general API traffic.
- **Sliding window:** gives smoother enforcement around time boundaries; useful when fixed-window spikes are unacceptable.
- **Fixed window:** simple and sometimes sufficient for coarse quotas, but boundary bursts must be understood.
- **Concurrency limit:** bounds simultaneous expensive work even when request frequency is low.
- **Cost-weighted budget:** charges operations by estimated work, batch size, query complexity, output size, or downstream cost.
- **Quota:** enforces a longer-period contractual or product allowance and needs a clear reset and upgrade path.
- **Cooldown or one-time state:** fits OTP sends, recovery messages, redemption, or workflow steps better than a generic route limit.

Choose the simplest model that controls the identified harm. A request-per-minute limit is incomplete when one request can consume unbounded work.

## Define policy explicitly

For each limit, record:

| Field | Decision |
| --- | --- |
| Protected operation | Route, action, workflow, or resource class |
| Harm | Availability, guessing, cost, extraction, spam, or business abuse |
| Keys | Subject, tenant, target, source, operation, global capacity |
| Allowance | Sustained rate or period quota |
| Burst | Temporary excess that legitimate clients need |
| Concurrency | Maximum simultaneous work where relevant |
| Cost | Weight assigned to different requests |
| Counter store | Local, shared, gateway, database, or managed service |
| Failure mode | Fail open, fail closed, degraded allowance, or queue; include distributed amplification |
| Response | Status, error code, retry guidance, and headers |
| Exemptions | Health checks, trusted jobs, support overrides, or none |
| Telemetry | Allowed, rejected, near-limit, store failure, and key cardinality |

Use configuration with reviewable defaults. Keep policy changes observable and reversible.

## Place controls at the right layers

- Edge or gateway limits cheaply absorb broad anonymous floods and coarse client quotas.
- Application limits understand user, tenant, object, workflow state, and operation cost.
- Worker and queue controls bound background concurrency and downstream pressure.
- Provider-side limits and spending controls cap damage beyond the application boundary.

Layered controls should complement rather than silently contradict each other. Document which layer owns the client-facing rejection and which layer is authoritative for business quotas.

## Rejection and recovery contract

- Return `429 Too Many Requests` when the application rejects a request because its rate policy was exceeded.
- Include `Retry-After` when the server can provide a meaningful wait time. When several independent limits currently reject the request, use a conservative wait that does not invite immediate rejection by another active limit; do not reveal which dimensions fired.
- Keep the response body consistent with the API's normal machine-readable error format.
- Do not reveal sensitive counter keys, account existence, fraud rules, or enough policy detail to optimize evasion.
- Ensure retries cannot multiply side effects; pair retry guidance with idempotency where relevant.
- For overload where producing a response is itself too expensive, infrastructure may shed or drop work according to its operational policy.

Do not promise an exact reset time when distributed counters, adaptive controls, or risk scoring cannot honor it.

## Credential and recovery endpoints

- Limit by both source and target identity while minimizing account-enumeration differences.
- Apply controls to login, token issuance, MFA, OTP verification, password reset initiation, invitation acceptance, and recovery completion as relevant.
- Apply target-keyed counters and externally visible behavior consistently whether or not a login or recovery identifier exists; otherwise limiter behavior can become an enumeration oracle.
- Use increasing friction or delay carefully; avoid blocking a victim permanently because someone else attacked their account.
- Keep successful authentication from erasing evidence or bypassing separate business-flow limits.
- Monitor distributed low-and-slow attempts that remain below a single-key threshold.

## Distributed correctness and failure

Determine whether approximate counters are acceptable. Security-sensitive one-time operations, paid quotas, and scarce inventory may require stronger atomicity than general traffic shaping.

- Set expiration deliberately and avoid unbounded high-cardinality keys.
- Define clock, partition, retry, and duplicate-request behavior.
- Prevent a retry storm when the counter store or gateway recovers.
- Decide whether dependency failure should reject, allow a conservative amount, queue, or degrade the feature. A local in-process fallback multiplies its effective allowance by the number of instances; use it only when edge or provider caps contain that amplification, or document and accept the bounded exposure explicitly.
- Keep emergency overrides narrow, authenticated, logged, expiring, and reversible.

## Test the policy

Verify:

- requests below the threshold succeed;
- legitimate bursts behave as designed;
- the first rejected request occurs at the expected boundary;
- concurrent requests cannot exceed a strict limit through races;
- alternate credentials, accounts, tenants, targets, and source addresses exercise the intended keys;
- proxy headers cannot spoof the source identity;
- existing and nonexistent account or recovery targets have equivalent externally visible limiter behavior;
- distributed instances share or intentionally separate state;
- counter-store failure follows the documented mode;
- `429`, retry guidance, and error bodies match the public contract;
- recovery occurs after the expected period without stale lockout;
- metrics and alerts distinguish attack, legitimate growth, and dependency failure.

Load tests require explicit authorization and an isolated or approved environment. Prefer deterministic unit and integration tests for boundary behavior before any traffic experiment.
