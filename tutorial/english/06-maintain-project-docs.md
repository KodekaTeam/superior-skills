# 06 - Maintain Documentation After Changes

Every verified material implementation receives an outcome-oriented timeline record by default. The user may explicitly opt out. Supporting documents are updated only when their own durable claims or procedures change.

## Automatic implementation record

After a feature, fix, behavior change, security control, schema change, runtime configuration, or meaningful refactor:

1. Create or update one record in `docs/implementation-timeline/<feature-domain>/` using a specific name such as `2026-10-15-fix-login-validation.md`.
2. Create `docs/README.md`, the timeline index, and the feature-domain index when no documentation system exists.
3. Record the outcome, implementation mechanism, decisions, verification actually run, limitations, and related docs.
4. Skip prompts, chat transcripts, secrets, and file-by-file narration.
5. Do not create documentation when the user explicitly asks to skip it.

## Update docs when these change

- product purpose, boundaries, or capabilities;
- architecture, ownership, or data flow;
- technical decisions that constrain future work;
- environments, commands, builds, migrations, releases, rollbacks, or deployments;
- implementation limitations and maintenance risks;
- historically meaningful milestones or releases.

## Do not create an automatic record merely because

- formatting or an internal rename does not change how the system is understood;
- a refactor preserves every boundary and contract;
- a conversation produced an idea that has not been accepted;
- a commit has no durable impact.
- the task was read-only, unsuccessful, documentation-only, or left no material change.

## Synchronization prompt

```text
$superior-docs Synchronize only the documentation materially affected by
the changes in this working tree. Do not rewrite unrelated documents.
Separate current state from history and planned work, then check all links.
```

## Handoff prompt

```text
$superior-docs Create a maintenance handoff for the current work: outcomes,
changed owners, affected consumers, decisions, verification results,
known limitations, risks, and safe next steps. Follow the existing timeline
or history conventions; do not create a new format unless necessary.
```

## Synchronization principle

Correct current-state claims that are no longer true. Preserve history that remains useful. Do not add a verification date or commit marker unless the document was actually checked against that revision.
