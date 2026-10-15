# Evidence-driven diagnosis

Use this reference when the cause is not already proven. The objective is to reduce uncertainty through observations that distinguish competing explanations.

## Build a failure contract

Record the smallest useful matrix:

| Dimension | Evidence to establish |
| --- | --- |
| Expected | Specification, test, accepted behavior, or explicit user expectation |
| Observed | Exact output, state, error, timing, or side effect |
| Scope | Inputs, accounts, tenants, versions, platforms, and frequency |
| Reproduction | Minimal steps and whether each run fails consistently |
| Change window | Last known good and first known bad revision, release, or event |

Avoid copying large logs into the record. Preserve stable identifiers, timestamps, correlation IDs, or concise excerpts needed to retrieve authoritative evidence.

## Form discriminating hypotheses

A useful hypothesis predicts an observation that differs from alternatives. For each live hypothesis, state:

- the proposed causal mechanism;
- what evidence would support it;
- what evidence would falsify it;
- the cheapest safe check that distinguishes it.

Prefer checks that split the search space: compare working and failing inputs, environments, revisions, data states, or timing conditions. Change one relevant variable at a time. Do not accumulate speculative edits and infer causality from the final result.

## Trace ownership

Follow the value or event from its trusted origin to the symptom:

1. input parsing and normalization;
2. validation and authorization;
3. domain state transition;
4. persistence, cache, queue, or remote boundary;
5. serialization and presentation;
6. retries, recovery, and error mapping.

At each boundary, compare the actual contract with the actual value or state. Inspect callers and consumers before deciding where the contract is owned.

## Narrow regressions

When a last-known-good state exists, use history to identify the smallest relevant change window. A bisect is useful only when revisions can be tested reliably and the pass/fail criterion is stable. Account for schema, dependency, configuration, feature-flag, and data changes that source history alone cannot reproduce.

Do not revert a correlated commit blindly. First determine which behavioral change introduced the violated invariant and whether later work depends on it.

## Validate causality

A credible repair should satisfy more than disappearance of the symptom:

- the original reproduction no longer fails;
- a regression check fails without the repair and passes with it when practical;
- the repair explains every material observation, including why unaffected cases worked;
- nearby contracts remain intact;
- removing incidental changes does not restore the failure.

If several changes were required to obtain a result, isolate which one addresses the cause before delivery.
