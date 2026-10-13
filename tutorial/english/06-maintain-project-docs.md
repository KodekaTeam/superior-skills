# 06 - Maintain Documentation After Changes

Not every code edit requires a documentation update. Update documentation when a change affects knowledge that must persist across sessions.

## Update docs when these change

- product purpose, boundaries, or capabilities;
- architecture, ownership, or data flow;
- technical decisions that constrain future work;
- environments, commands, builds, migrations, releases, rollbacks, or deployments;
- implementation limitations and maintenance risks;
- historically meaningful milestones or releases.

## Do not update docs merely because

- formatting or an internal rename does not change how the system is understood;
- a refactor preserves every boundary and contract;
- a conversation produced an idea that has not been accepted;
- a commit has no durable impact.

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
