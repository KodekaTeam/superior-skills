# Using `superior-comments`

This skill refines code comments without changing executable behavior. Valuable comments explain rationale, invariants, risks, contracts, or workarounds that are not apparent from the code.

## When to use it

Use it to audit comments, remove narration that only repeats code, improve TODOs, or preserve security and legal context. Do not use it for refactoring, symbol renaming, whole-file formatting, or logic changes.

## Workflow

1. Define the files or directories that may be touched.
2. Distinguish high-value comments from decorative, stale, or purely narrational ones.
3. Edit comments only; preserve code, unrelated whitespace, and behavior.
4. Review the diff to confirm that every change is comment-only.
5. Run lightweight checks when comment formatting affects tooling.

## Prompt examples

```text
$superior-comments Audit comments in src/auth/. Preserve security rationale and remove comments that merely repeat the code.
```

```text
$superior-comments Refine TODOs in this file so each one has a clear action or completion condition. Do not change the code.
```

## Suitable combinations

This skill is usually best used alone so the comment-only boundary remains easy to verify. After a substantial `superior-logic` change, run it as a separate task if comments also need synchronization.

## Result checks

The diff should contain comments only. Every remaining comment should add information that is not obvious from the implementation. Do not remove security, licensing, legal, invariant, or workaround notes without evidence that they are obsolete.
