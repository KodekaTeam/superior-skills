---
name: superior-lean
description: Simplify coding implementations and reviews by reusing existing capabilities and removing unjustified abstractions, dependencies, configuration, and duplication. Use when implementation complexity or over-engineering is in scope. Do not use to weaken required behavior, safety, accessibility, or compatibility.
license: MIT
---

# Superior Lean

Solve the complete requested problem with the least new surface area. Economy applies to the solution, not to understanding, correctness, or verification.

## Search for the smallest owner

Trace the affected flow and inspect callers before editing. Prefer, in order:

1. no change when the requested behavior already exists or the proposal is speculative;
2. an existing project helper, type, component, configuration point, or pattern;
3. the language standard library;
4. a native framework, browser, database, or operating-system capability;
5. an already-installed dependency;
6. a small local implementation with an explicit owner.

Before adding a function, handler, component, hook, service, validation rule, or other behavior, search the relevant feature and shared code by purpose as well as plausible names. Inspect existing implementations and consumers rather than assuming similar names imply the same behavior. Compare inputs, outputs, side effects, error handling, platform and lifecycle, authorization, and ownership where relevant.

Reuse a suitable existing capability. If it nearly fits, extend or improve its existing owner when that preserves its contract and follows the project's structure; trace direct and indirect consumers and verify affected callers. Add a separate implementation when the existing behavior, ownership, or constraints differ, or adapting it would introduce inappropriate coupling or break compatibility. Keep the search proportional to the change and report material tradeoffs.

Stop at the first option that completely satisfies realistic behavior and fits the codebase. Fewer lines in the wrong layer are not simpler.

Consider splitting a file when distinct responsibilities, independent change or test needs, or a meaningful trust or dependency boundary make the current owner hard to maintain. Line count is a signal for inspection, not a mandatory threshold. Preserve cohesive code together when splitting would add indirection without a concrete benefit. Follow framework discovery and existing project conventions, and update affected imports, registrations, exports, and tests when moving code.

Load `superior-architecture` when project structure, module ownership, or dependency boundaries are the primary concern; keep complexity reduction and safe removal here.

Read [references/complexity-decisions-and-safe-removal.md](references/complexity-decisions-and-safe-removal.md) when removing or collapsing a shared abstraction, dependency, configuration path, extension point, or code that appears unused. Use it to distinguish accidental machinery from a real boundary and to trace indirect consumers before deletion.

## Remove accidental machinery

Challenge:

- interfaces with one implementation and no stable boundary;
- factories for one fixed product;
- configuration for values that do not vary;
- wrappers that only rename an existing API;
- parallel utilities for a capability the repository already owns;
- speculative extension points, registries, flags, and migration scaffolds;
- dependencies whose complete contract can be replaced with less total ownership, not merely fewer visible lines;
- repeated guards that should be one root-cause fix.

Prefer deletion when behavior remains intact. Do not compress straightforward code into clever expressions merely to reduce line count.

Preserve an abstraction when evidence shows that it owns a real shared contract, external boundary, existing variation, compatibility transition, framework lifecycle, or independently testable policy. One implementation alone neither proves nor disproves that value.

## Complexity that must remain

Do not simplify away:

- explicit user requirements or supported compatibility;
- validation and authorization at trust boundaries;
- privacy, authentication, security, and audit controls;
- recovery needed to prevent corruption or data loss;
- accessibility and responsive behavior;
- real concurrency, ordering, retry, idempotency, or cancellation guarantees;
- calibration and tuning controls required by physical or variable systems.

## Verification

Prove that removed machinery had no required consumers and that behavior remains intact. Use focused tests for non-trivial branches, parsers, state transitions, financial paths, and security-sensitive flows. For a review, distinguish observed complexity from hypothetical cleanup and recommend only changes with a concrete payoff.

Report what became simpler, what was deliberately preserved, and the real condition that would justify adding complexity later.
