---
name: superior-docs
description: Create, reconstruct, or synchronize durable repository documentation from current code, configuration, tests, existing docs, and Git history. Use for project context, architecture, decisions, implementation timelines, build and distribution guides, maintenance handoffs, or cross-session continuity. Do not use for incidental comments or documentation that did not materially change.
---

# Superior Docs

Build documentation that lets a future maintainer recover the project's current shape, important decisions, and safe operating procedures without relying on chat history. Documentation is a maintained view of evidence, not a second source of invented truth.

## Select the mode

- **Bootstrap:** establish a useful `docs/` system where none exists.
- **Synchronize:** update affected documents after verified project changes.
- **Reconstruct:** derive architectural evolution, releases, or maintenance history from repository evidence.
- **Handoff:** capture the current implementation, boundaries, risks, and next work at the end of a substantial effort.

Do not ask the user to choose when the request already determines the mode.

## Establish evidence

Inspect the relevant code paths, configuration, tests, scripts, deployment files, existing documentation, and repository instructions. Use Git history when historical sequence or releases are in scope.

Classify statements as:

- **Current fact:** proven by the present repository or runtime evidence;
- **Accepted decision:** recorded in an authoritative decision source or explicitly confirmed by the user;
- **Historical fact:** supported by a commit, tag, release, migration, or dated artifact;
- **Planned work:** explicitly proposed but not yet implemented;
- **Unknown:** unresolved and stated as such.

Never turn a commit message, stale document, unused file, or plausible architecture into a current fact without corroboration.

## Build the smallest useful documentation map

Read [references/documentation-map.md](references/documentation-map.md) when bootstrapping or reorganizing `docs/`. Always create an index and the three core documents when the user requests the full continuity system. Add specialized sections only when the repository has corresponding evidence and maintenance value.

Do not create empty directories, placeholder guides, or one file per imagined subsystem. A smaller linked set that stays accurate is better than an impressive tree nobody can trust.

## Write for retrieval

- Put one durable subject in each document and give it a stable path.
- Start each document with purpose, scope, and last verified revision or date.
- Link to authoritative code, configuration, commands, decisions, and related docs.
- Record ownership and boundaries, not exhaustive file inventories that immediately go stale.
- Use exact commands only after verifying them in repository sources or by safe execution.
- Separate current state from history and future work.
- Prefer concise tables for mappings, decisions, interfaces, or commands; use prose for rationale and constraints.

Read [references/core-files.md](references/core-files.md) when writing the documentation index, project context, architecture, or decisions ledger.

## Reconstruct history carefully

Read [references/history-and-handoff.md](references/history-and-handoff.md) when using commits, releases, migrations, or earlier documentation to build timelines and handoffs.

Summarize change by outcome and architectural consequence. Do not dump every commit, treat commit order as causality, or claim a feature shipped because a branch once contained related code. Link facts to commits or tags when stable identifiers are available.

## Synchronize without rewriting everything

After a change, update only documents whose claims became incomplete or false. Preserve useful history and append decisions when the repository follows an append-oriented record. Replace current-state descriptions when reality changed; do not retain both versions as if both remain active.

If documentation conflicts with working code or configuration:

1. verify that the code path is active;
2. check for an accepted pending migration or exception;
3. update the stale document when authorized;
4. report unresolved conflicts rather than choosing a preferred story.

## Verify

- Re-open every changed document and follow its relative links.
- Confirm commands, paths, names, versions, and ownership against current sources.
- Check that the root index reaches every maintained document and does not point to placeholders.
- Review the diff for secrets, credentials, private infrastructure details, personal data, or copied logs.
- Report the evidence inspected, documents changed, historical limits, and unresolved unknowns.
