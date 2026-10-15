# Automatic Change Recording

Use this reference after an AI agent completes material implementation work. The goal is to leave a compact, repository-owned account of what became true, why it matters, and how it was verified without requiring the user to request documentation separately.

## Default behavior

Record the change unless the user explicitly declines documentation for the task or a higher-priority repository instruction prohibits it. Do not ask for routine permission and do not treat silence as an opt-out.

An opt-out applies only to the current task unless the user states a persistent preference. When the user opts out, do not create a timeline entry, documentation directory, guide, decision record, or other documentation solely because of this workflow.

## What receives a record

Create or update one coherent record after verified changes to any of the following:

- user-visible features or behavior;
- bug fixes with an observable outcome;
- APIs, schemas, validation, authorization, security controls, or data flow;
- state transitions, persistence, migrations, queues, jobs, or integrations;
- configuration that changes runtime, build, packaging, deployment, or operations;
- refactors that materially change ownership, architecture, performance, reliability, or maintenance boundaries.

One user task should normally produce one outcome-oriented record even when it touches many files. Extend the same record when follow-up corrections occur in the same task.

Before writing the record, inspect repository status and the task's final diff. Attribute only outcomes produced or explicitly adopted in the current task. Pre-existing staged, unstaged, untracked, or concurrent user changes may be relevant context, but do not claim them as this task's implementation. When changes overlap and authorship cannot be separated confidently, narrow the record to verified outcomes and state the attribution limit.

Treat a change as material when at least one of these is true:

- runtime, user-visible, API, data, security, build, deployment, or operational behavior changed;
- an observable defect was corrected and the result is worth preserving for future diagnosis or regression work;
- ownership, dependency direction, trust boundary, performance characteristic, reliability behavior, or safe modification path changed;
- the implementation introduces a compatibility, migration, rollout, rollback, or maintenance consequence;
- omitting the outcome would make the repository timeline misleading or force a future maintainer to rediscover why the current behavior exists.

Do not use line count or number of files as the threshold. Group several small related fixes completed in one task into one record instead of producing a file for each fix.

## What does not receive a record

Skip automatic recording for:

- read-only explanation, review, diagnosis, planning, or research;
- a failed attempt that leaves no material repository change;
- formatting, spelling, generated-file refresh, or mechanical rename with no behavioral or maintenance consequence;
- test reruns or verification that change no artifact or contract;
- documentation-only edits, to avoid recursively documenting documentation;
- temporary experiments that are reverted before delivery.

If partial implementation remains in the repository, record it as `partial` and state the unresolved boundary. Do not describe intended work as completed.

## Default location and bootstrap

Use the repository's established implementation-history convention when one exists and is authoritative. Treat it as authoritative when project instructions or `docs/README.md` identify it as the implementation record and recent work consistently uses it. A lone stale changelog or unlinked historical folder is not enough. Otherwise use:

```text
docs/
|-- README.md
`-- implementation-timeline/
    |-- README.md
    |-- authentication/
    |   |-- README.md
    |   |-- YYYY-MM-DD-add-refresh-token-rotation.md
    |   `-- YYYY-MM-DD-fix-registration-validation.md
    `-- users/
        |-- README.md
        `-- YYYY-MM-DD-fix-user-detail-permissions.md
```

When `docs/` does not exist, create only the minimum paths needed for the current change: `docs/README.md`, the timeline root index, one feature-domain directory with its index, and the change record. The larger tree above illustrates growth over time; do not create unrelated domain folders in advance. `docs/README.md` should explain the limited current scope and link to the timeline index. Do not generate empty architecture, decisions, guide, build, audit, roadmap, or research sections.

When `docs/` exists but `implementation-timeline/` does not, create the timeline directory and its `README.md`, then add it to `docs/README.md`. Create only the feature-domain directory required by the current change. If an equivalent authoritative history directory already exists, use it instead of creating a duplicate and make its role discoverable from the docs index.

## Choose a stable feature domain

Place each record under the feature, bounded context, subsystem, or resource that owns the changed behavior. Prefer names already established by routes, packages, domain modules, database ownership, or project documentation.

Use lowercase kebab-case directory names for portable paths:

```text
authentication/
users/
checkout/
billing/
notifications/
api-security/
build-release/
```

Do not create competing aliases such as `auth/`, `authentication/`, and `identity/`. Reuse the existing domain directory when its scope fits. The domain `README.md` should state what belongs there and list its records newest first.

For a change spanning several domains:

1. place the record under the domain that owns the primary contract or outcome;
2. link it from related domain indexes when that materially improves discovery;
3. use `cross-cutting/` only when no domain clearly owns the change;
4. never duplicate the same record into several folders.

Keep one domain level by default. Add deeper nesting only when the repository already has stable subdomains and the additional level materially improves retrieval.

## Name records by specific outcome

Use the user's local project date followed by a concise, language-consistent, kebab-case outcome:

```text
authentication/2026-10-15-add-refresh-token-rotation.md
authentication/2026-10-15-fix-registration-email-validation.md
users/2026-10-15-fix-user-detail-permissions.md
```

Prefer a concrete verb and affected capability: `add`, `fix`, `enforce`, `migrate`, `remove`, `optimize`, or `refactor`. Avoid filenames that say only `changes`, `updates`, `implementation`, `summary`, or `misc`. A longer specific name is better than a short ambiguous one.

Match the established documentation language. For example:

```text
authentication/2026-10-15-fix-login-validation.md
authentication/2026-10-15-perbaiki-validasi-login.md
```

Use ASCII characters in paths even when the document body uses another language. If the path already belongs to unrelated work, choose a more specific slug rather than overwriting it. When several independent outcomes occur on the same date, create separately named files only when combining them would obscure ownership or verification.

## Record contract

Start with compact metadata:

```markdown
# <Outcome-oriented title>

> Date: YYYY-MM-DD
> Status: verified | partial
> Change type: feature | fix | refactor | security | build | configuration
> Scope: <subsystem, route, package, or component>
```

Then include only sections supported by evidence:

## Outcome

State what is now observably different. Summarize the user's objective without copying the chat transcript.

## Implementation

Describe the important mechanism, ownership, contract, or data-flow change. Link to representative repository paths. Do not dump every edited file or restate the diff line by line.

## Decisions and tradeoffs

Record choices that affect future maintenance. If rationale was not established, omit it or mark it unknown rather than inventing intent.

## Verification

List checks actually run and their observed results. Separate unexecuted recommendations under limitations or next work.

## Limitations and follow-up

Capture unresolved risk, compatibility concerns, deferred work, rollout needs, or `None known` when that statement is supported.

## Related documentation

Link affected architecture, decision, guide, build, release, audit, or API documents when they exist.

Do not include prompts, hidden reasoning, access tokens, secret values, private infrastructure details, raw logs, unnecessary personal data, or claims that a commit or release exists when it does not.

## Maintain the indexes

- Add the record to its feature-domain `README.md`, normally newest first.
- Add or update the feature-domain link and a concise recent-change entry in `docs/implementation-timeline/README.md`.
- Ensure `docs/README.md` links to the timeline index.
- Use a concise link label that describes the delivered outcome.
- Re-open the root docs index, timeline index, and domain index, then follow the new relative links before delivery.

Do not rewrite older records merely to apply a new template. Correct them only when they contain a factual error or broken link.

## Route supporting documentation

The timeline record is the default historical artifact. Add or update other collections only when the change affects their purpose:

- `implementation-guides/`: repeatable subsystem workflow, safe modification procedure, or operational technique;
- `build-and-distribution/`: verified build, packaging, migration, signing, deployment, rollback, or distribution procedure;
- `structure-of-app/`: current product context, architecture, ownership, trust boundary, or accepted decision;
- `history/releases/`: curated release or architectural evolution spanning multiple implementation records;
- `audit/`: dated findings and evidence, kept separate from implemented remediation;
- `roadmap/`: accepted future work, never presented as shipped behavior.

Link related documents instead of duplicating their full content in the timeline entry.

Do not expand synchronization merely because implementation touched a documented subsystem. Update a current-state document only when a specific statement, boundary, command, or procedure in it became false or incomplete.

## Completion check

Before reporting the implementation complete, verify:

- the record describes the final repository state rather than an intermediate attempt;
- status matches the verification actually performed;
- paths and links resolve;
- current-state documents were updated only where their claims changed;
- no sensitive or invented information entered the docs;
- the record does not claim unrelated dirty-worktree or concurrent changes as part of the task;
- a user opt-out was honored without creating documentation artifacts.
