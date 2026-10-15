# Schema, query, and index design

Use this reference when the task changes stored shape or access paths.

## Model ownership and invariants

Identify which boundary creates, updates, reads, and retires each record. Distinguish stable identity from display values and external identifiers. Decide how absence, unknown values, deletion, and historical state are represented.

Use database constraints for invariants that must survive every writer, such as uniqueness, valid references, required values, and supported value ranges, when the engine can enforce them without violating the rollout plan. Keep cross-aggregate business policy in its authoritative domain owner rather than encoding an opaque web of triggers by default.

For multi-tenant data, make tenant ownership explicit in keys, uniqueness rules, joins, and access paths. A globally unique identifier does not itself prove tenant authorization.

## Design from access patterns

For each material operation, establish:

- predicates and expected selectivity;
- join or lookup keys;
- ordering and deterministic tie-breakers;
- projected fields and expected row or document count;
- write frequency and update pattern;
- latency and consistency requirements.

Prefer keyset pagination for large, changing ordered sets when the product contract permits it. If offset pagination is required, state its drift and cost characteristics. Always use a deterministic ordering when pages or batches must not duplicate or omit rows.

## Choose indexes deliberately

An index should support a proven access path or invariant. Consider column order, sort direction, uniqueness, partial predicates, included data, collation, and null behavior according to the actual engine.

Balance read benefit against write amplification, storage, memory, maintenance, and migration cost. Remove an existing index only after proving no maintained query, constraint, or operational process depends on it.

Use the engine's plan inspection tools with representative parameter values and statistics. A plan from an empty development database does not establish production behavior. Avoid forcing plan hints unless engine-specific evidence and maintenance ownership justify them.

## Preserve query correctness

- Parameterize untrusted values; never interpolate them into query text.
- Select explicit fields when schema drift or sensitive columns could affect consumers.
- Handle nulls, three-valued logic, collation, case sensitivity, and timezone conversion intentionally.
- Avoid read-modify-write sequences when one conditional statement or atomic operation can enforce the invariant.
- Detect N+1 access and unbounded relationship loading at the call site that creates it.
- Keep aggregates and counts consistent with filters, authorization, and soft-deletion rules.

## Evaluate structural changes

Normalization is the default when it clarifies ownership and integrity, not a ritual. Denormalize only for a measured access need with an explicit update and repair strategy. Partitioning and sharding add routing, balancing, uniqueness, and operational constraints; require demonstrated scale or isolation needs before introducing them.
