# Curated Implementation Memory

Use this guide when completed work leaves intent, criteria, decisions, or maintenance knowledge that should survive beyond the current conversation. The goal is searchable repository memory grounded in accepted requirements and verified implementation, not a transcript of how the agent arrived there.

## Use the existing documentation owners

| Owner | Stores | Does not store |
| --- | --- | --- |
| `implementation-timeline/` | Dated outcome, accepted intent, relevant criteria, implementation summary, verification, and consequences | Current feature instructions duplicated on every change |
| `implementation-guides/` | Living feature contract, flow, invariants, safe extension path, verification, and known limitations | Chronological prompt or commit history |
| `structure-of-app/DECISIONS.md` | Accepted decisions that constrain future work, including status and supersession | Every local implementation choice |

Do not add a parallel `codebase-memory/` tree when these owners already cover the knowledge. A single indexed documentation system is easier for maintainers and agents to retrieve and keep current.

## Curate the source material

Build memory from the final accepted request, explicit user corrections, repository evidence, the final diff, tests, configuration, and accepted decisions. Prefer the latest instruction when the user replaced an earlier one.

Preserve:

- the user or product outcome in concise domain language;
- acceptance criteria that were explicit or verified;
- scope boundaries and non-goals that prevent accidental expansion;
- decisions and tradeoffs that constrain later work;
- observable implementation behavior and ownership;
- non-obvious invariants, affected consumers, and verification paths;
- known limitations and accepted follow-up work.

Exclude:

- raw prompts, chat transcripts, and conversation chronology;
- hidden reasoning, chain-of-thought, or speculative internal deliberation;
- superseded requests, failed drafts, and discarded alternatives unless their rejection is an accepted decision with maintenance value;
- secrets, credentials, private infrastructure, raw logs, unnecessary personal data, or copied proprietary material;
- plausible intent inferred only from code when the rationale is unknown.

Paraphrase instead of quoting by default. Preserve exact wording only when it defines a contract, legal requirement, user-facing term, or acceptance criterion whose wording matters.

## Choose what becomes durable

Add curated sections to a timeline record when they explain a verified material outcome. Useful optional sections are:

- **Curated intent:** the final accepted outcome and why it matters;
- **Acceptance criteria:** observable conditions that define success;
- **Scope and non-goals:** boundaries accepted for this change;
- **Maintenance notes:** invariants, consumers, safe extension points, and checks worth repeating.

Do not require every section for every record. A small fix may need only outcome, implementation, and verification.

Create or update an implementation guide only when at least one durable current-state concern exists:

- the feature spans several owners or has a non-obvious flow;
- future changes must preserve invariants or compatibility boundaries;
- the same operating, extension, or verification procedure will be repeated;
- several timeline entries would otherwise need to repeat the same current contract;
- incorrect maintenance would create meaningful security, data, availability, or user-facing risk.

A guide should normally contain purpose and scope, current flow and owners, invariants, extension points, verification, known limitations, and links to relevant decisions and timeline records. Do not create a guide for a one-line fix or a feature whose behavior is already obvious from maintained code and tests.

## Keep memory current without rewriting history

- Timeline records describe what became true at that point. Preserve them as history and link a corrective or superseding record when necessary.
- Implementation guides describe what is true now. Replace stale current-state instructions and update their verification marker only after checking the implementation.
- Decisions use explicit states such as `proposed`, `accepted`, `superseded`, or `rejected`, and link the decision that replaced them.
- Planned work remains planned until implementation evidence verifies it.

When code and memory conflict, verify that the code path is active, check for a pending accepted migration, and update the stale current-state document. Do not silently rewrite historical records to look as though the later behavior always existed.

## Make retrieval cheap

A future maintainer or AI agent should be able to:

1. start at `docs/README.md`;
2. read the relevant implementation guide for the current contract;
3. read accepted or superseding decisions that constrain the task; and
4. consult only the latest relevant timeline records when historical context is needed.

Keep indexes descriptive and links bidirectional where useful. Do not require reading the entire timeline or replaying prior conversations to understand one feature.
