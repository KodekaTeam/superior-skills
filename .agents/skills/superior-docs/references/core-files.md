# Core Documentation Contracts

## `docs/README.md`

Act as the retrieval router, not a duplicate summary of every page.

Include:

- what the documentation covers and its evidence boundary;
- a “start here” sequence pointing to the three core documents;
- links grouped by task: understand, implement, operate, release, investigate, or plan;
- status or last-verification notes for documents that can become stale;
- documentation conventions and ownership when known.

## `PROJECT_CONTEXT.md`

Explain why the product exists and what a maintainer needs to orient themselves.

Include only evidenced information:

- product purpose, users, and primary workflows;
- repository or application boundaries;
- implemented capabilities and current limitations;
- important terminology and external systems;
- known constraints, risks, and explicit non-goals;
- where to verify each major claim.

Do not mix aspirations into implemented capability. Label planned or uncertain information.

## `ARCHITECTURE.md`

Describe ownership and runtime flow at a level that survives ordinary refactors.

Include:

- deployable units and major layers;
- entrypoints and request, event, or data flows;
- state and persistence ownership;
- external dependencies and trust boundaries;
- build and runtime topology;
- cross-cutting concerns such as authorization, errors, jobs, caching, or observability;
- diagrams only when they clarify relationships better than prose.

Link to exact owners and representative paths. Avoid exhaustive trees, undocumented intent, and diagrams that cannot be reconciled with code.

## `DECISIONS.md`

Record decisions that constrain future work. Use a compact ledger or link to individual ADRs when the project already uses them.

For each decision, capture:

- stable identifier and date when known;
- status: proposed, accepted, superseded, or rejected;
- context and constraint;
- chosen direction;
- consequences and tradeoffs;
- evidence or implementation links;
- superseding decision when applicable.

Do not reverse-engineer rationale and present it as fact. When only the implemented choice is known, state that the original rationale is unavailable.

## Freshness header

Use a lightweight header where useful:

```markdown
> Scope: <what this document governs>
> Verified against: <commit, tag, or date>
> Status: current | partial | historical | proposed
```

Do not update a verification marker unless the document was actually checked against that revision.
