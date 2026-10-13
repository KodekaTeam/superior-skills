# History and Maintenance Handoff

## Evidence hierarchy

Use, in descending confidence:

1. signed or annotated releases and current release notes;
2. migrations, manifests, and code changes tied to stable commits;
3. tests and configuration proving shipped behavior;
4. accepted decision records and contemporaneous documentation;
5. commit messages and issue references;
6. inference, explicitly labeled and kept out of factual ledgers when avoidable.

Working tree contents describe current state but do not prove when or why it changed. A commit message describes intent but may not describe the final runtime result.

## Curate history

Group commits by user-visible outcome, migration, architectural boundary, or release. For each entry, record:

- revision or version;
- time range when available;
- shipped outcome;
- important architectural or operational consequence;
- current limitation or follow-up;
- supporting source paths and identifiers.

Exclude formatting-only churn, merges with no unique outcome, reverted experiments, and repeated fixups unless they explain an enduring constraint.

## Implementation timeline

A timeline should help answer:

- What exists now?
- In what sequence did major capabilities become real?
- Which boundaries remain intentional or temporary?
- What maintenance work is safe to continue next?

Do not use chat sessions as the primary unit. A session may produce several outcomes or none.

## Handoff snapshot

At the end of substantial work, capture:

- objective and delivered outcome;
- changed owners and affected consumers;
- decisions accepted during the work;
- verification performed and exact results;
- known limitations and unresolved risks;
- safe next actions and prerequisites;
- links to current code, decisions, guides, and related history.

Write the snapshot into an existing timeline or history convention. Do not create a new handoff format for every task.

## Secrets and operational detail

Document secret names, ownership, acquisition process, and required permissions—not secret values. Avoid private hostnames, access tokens, raw logs, personal data, internal addresses, and recovery material that should live in a protected system. Link to the approved secret manager or runbook when available.
