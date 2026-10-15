# Using `superior-docs`

This skill maintains project memory across sessions. Its five primary modes are Bootstrap, Record, Synchronize, Reconstruct, and Handoff.

## Choose the right mode

- **Bootstrap**: establish a documentation foundation for a project that does not have one.
- **Record**: automatically capture a verified material implementation outcome unless the user opts out.
- **Synchronize**: align documentation after implementation changes.
- **Reconstruct**: recover context from code and distributed evidence.
- **Handoff**: record work status, decisions, risks, and next steps.

Keep current facts, accepted decisions, history, plans, and unknowns separate. Do not present plans as implemented state.

## Workflow

1. State the mode and project scope.
2. Read relevant code, configuration, tests, documentation, repository status, and the task's final diff as evidence.
3. For implementation work, create or update the outcome record in `docs/implementation-timeline/<feature-domain>/` with a specific dated filename and maintain the root and domain indexes.
4. Update the core documents in `docs/structure-of-app/` only when their current-state claims changed.
5. Create other specialized directories only when supported by evidence and a real need.
6. Validate links, terminology, implementation status, task attribution, and potential secret exposure.

## Prompt examples

```text
$superior-docs Bootstrap documentation for this project from the existing code. Mark uncertainty and do not invent decisions.
```

```text
$superior-docs Synchronize documentation after the authentication-flow changes on this branch.
```

## Suitable combinations

Use it automatically after `superior-ui`, `superior-logic`, or another skill produces a verified material implementation change. The user may explicitly opt out for the task. For complete procedures, continue to [documentation bootstrapping](../../04-bootstrap-project-docs.md), [new sessions](../../05-start-a-new-session.md), and [maintenance](../../06-maintain-project-docs.md).

## Result checks

Documentation should be traceable to evidence, navigable from its index, and honest about unknowns. In a dirty worktree, do not attribute pre-existing or concurrent user changes to the current task. Do not copy entire implementations into docs or create empty directories merely to decorate the structure.
