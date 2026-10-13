# Using `superior-docs`

This skill maintains project memory across sessions. Its four primary modes are Bootstrap, Synchronize, Reconstruct, and Handoff.

## Choose the right mode

- **Bootstrap**: establish a documentation foundation for a project that does not have one.
- **Synchronize**: align documentation after implementation changes.
- **Reconstruct**: recover context from code and distributed evidence.
- **Handoff**: record work status, decisions, risks, and next steps.

Keep current facts, accepted decisions, history, plans, and unknowns separate. Do not present plans as implemented state.

## Workflow

1. State the mode and project scope.
2. Read relevant code, configuration, tests, and documentation as evidence.
3. Update the `docs/README.md` index and core documents in `docs/structure-of-app/` as needed.
4. Create specialized directories only when supported by evidence and a real need.
5. Validate links, terminology, implementation status, and potential secret exposure.

## Prompt examples

```text
$superior-docs Bootstrap documentation for this project from the existing code. Mark uncertainty and do not invent decisions.
```

```text
$superior-docs Synchronize documentation after the authentication-flow changes on this branch.
```

## Suitable combinations

Use it after `superior-ui`, `superior-logic`, or another durable change when architecture, decisions, contracts, or project operation also changes. For complete procedures, continue to [documentation bootstrapping](../../04-bootstrap-project-docs.md), [new sessions](../../05-start-a-new-session.md), and [maintenance](../../06-maintain-project-docs.md).

## Result checks

Documentation should be traceable to evidence, navigable from its index, and honest about unknowns. Do not copy entire implementations into docs or create empty directories merely to decorate the structure.
