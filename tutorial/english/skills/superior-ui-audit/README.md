# Using `superior-ui-audit`

This skill performs read-only visual audits. Its output is a small set of strong, prioritized findings with clear correction paths, not direct code changes.

## When to use it

Use it to assess an existing interface before redesign or implementation. Do not use it when the user directly requests code changes. Functional and accessibility problems remain out of scope unless explicitly requested.

## Workflow

1. Establish the pages, viewports, states, and visual evidence to assess.
2. For each candidate finding, require an observation, a violated contract or design expectation, a causal connection, and an actionable correction.
3. Prioritize by impact on user tasks, hierarchy, clarity, and consistency.
4. Limit the report to the five strongest findings.
5. Keep any implementation plan optional and do not edit files.

## Prompt examples

```text
$superior-ui-audit Audit this checkout page as read-only work. Report no more than five major visual issues with specific corrections.
```

```text
$superior-ui-audit Compare this dashboard with the project's design system. Do not change code or assess the backend.
```

## Suitable combinations

Run the audit as a separate stage before `superior-ui`. Add `superior-accessibility` or `superior-responsive` scope only when requested, and clearly identify which findings come from the additional scope.

## Result checks

The report should not become a long list of subjective preferences. Every finding must be demonstrable from the interface and connected to user impact. Confirm that no files changed during the audit.
