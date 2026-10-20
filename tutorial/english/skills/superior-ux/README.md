# Using `superior-ux`

This skill designs or reviews how users understand and complete a goal across steps or surfaces. It owns journeys, information architecture, task flows, feedback, recovery, and cross-screen continuity.

## When to use it

Use it when the main question is how a product experience should work from entry to outcome: onboarding, checkout, authentication, multi-step forms, navigation structure, approval flows, empty-to-active journeys, or recovery after interruption. Use `superior-ui` when visual implementation is primary and `superior-logic` when the task is only about application behavior.

## Workflow

1. Identify the user, job, context, entry point, successful outcome, and available evidence.
2. Map required decisions, steps, alternate paths, interruptions, and re-entry.
3. Organize information around user decisions rather than internal teams or data structures.
4. Define observable pending, success, failure, cancellation, and recovery behavior where relevant.
5. Walk representative scenarios and report evidence, assumptions, unresolved risks, and validation.

The skill does not invent personas, research findings, or usability claims. When evidence is limited, it labels the proposed experience as a hypothesis and explains how to validate it.

## Prompt examples

```text
$superior-ux Review the account recovery journey from sign-in failure to restored access. Identify dead ends, unclear decisions, and missing recovery states without changing code.
```

```text
$superior-ux $superior-ui Redesign onboarding so a new workspace can reach its first successful import with fewer ambiguous decisions. Preserve required consent and security steps.
```

## Suitable combinations

- Add `superior-ui` for visual hierarchy, components, and interface implementation.
- Add `superior-logic` when state transitions, APIs, or persistence change.
- Add `superior-responsive` when the journey changes across viewport sizes.
- Add `superior-accessibility` for keyboard, focus, semantics, and assistive technology.
- Add `superior-copy` when labels, instructions, and error messages need dedicated work.
- Add `superior-testing` for substantial journey or regression test design.

## Result checks

The result should make entry, orientation, decisions, progress, completion, interruption, and recovery explicit. Each recommendation should connect to evidence or a clearly labeled assumption, and implementation ownership should remain with the relevant UI, logic, responsive, accessibility, copy, or testing skill.
