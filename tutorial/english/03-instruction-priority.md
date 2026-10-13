# 03 - Understand Instruction Precedence

Superior does not replace user requests or project-specific rules.

## Practical order

When instructions conflict, use this order:

1. explicit user instructions for the current task;
2. environment safety and permission rules;
3. the `AGENTS.md` closest to the files being changed;
4. the repository-root `AGENTS.md`;
5. instructions from the selected skill;
6. general preferences and tutorial examples.

Tutorials are not runtime instructions. Examples in this directory do not override `AGENTS.md`, `SKILL.md`, or project contracts.

## Examples

If `superior-ui` recommends preserving the design system but the user explicitly requests migration to a new one, the agent should perform that migration while preserving scope and verification requirements.

If `superior-lean` favors a small solution but a payment system requires idempotency and an audit trail, those correctness requirements must not be simplified away.

## Nested instructions

A project can have additional `AGENTS.md` files in subdirectories:

```text
project/
|-- AGENTS.md
`-- services/
    |-- AGENTS.md
    `-- billing/
```

Rules in `services/AGENTS.md` apply more specifically to work in that subtree. Do not copy every subtree rule into the root when it does not apply to the entire project.
