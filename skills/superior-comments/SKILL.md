---
name: superior-comments
description: Add, revise, or remove source-code comments while preserving executable behavior. Use for comment-only cleanup, documentation comments, TODO quality, and reducing narration. Do not use when the requested change modifies logic.
---

# Superior Comments

Make comments carry information that the code cannot express clearly. In comment-only tasks, do not alter executable code, formatting beyond the comment, imports, configuration, or generated files.

## Keep comments that explain

- intent or a non-obvious invariant;
- why an apparently simpler approach is unsafe;
- protocol, compatibility, security, or legal constraints;
- units, coordinate systems, ownership, lifecycle, or ordering assumptions;
- a workaround with enough context to remove it safely;
- a public API contract that documentation tooling consumes;
- an actionable TODO with condition, owner/reference, or concrete next step when available.

Do not remove license headers, attribution, generated-file warnings, linter directives, migration notes, or operational instructions without proving they are obsolete.

## Remove or rewrite noise

- line-by-line narration of visible syntax;
- decorative separators and empty section labels;
- comments that announce the agent's workflow;
- vague TODOs such as “improve this later”;
- conclusions or signatures that mark where generated work ended;
- emoji or loud wording that adds no domain meaning;
- stale claims contradicted by the implementation.

Prefer one comment for the reason behind a coherent block over one comment per statement. Repeating the precise domain term is clearer than cycling through synonyms.

## Match the codebase

Preserve the repository's language, comment syntax, documentation format, and normal tone. Keep comments close to the behavior they constrain. When a comment is wrong but the code is in scope only for reading, correct the comment to describe current behavior; do not silently change the behavior to match it.

## Verify

Review the diff and confirm that only comments changed. Run a narrow formatter or parser only when comment syntax can affect compilation, generated documentation, directives, or tooling. Report any ambiguous comment you preserved because its operational role could not be disproved.
