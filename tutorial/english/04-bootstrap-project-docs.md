# 04 - Bootstrap Project Documentation

## When to use this guide

Use this tutorial when a repository has no persistent documentation system or when its documentation must be reconstructed from the implementation.

## Suggested prompt

```text
$superior-docs

Bootstrap a persistent documentation system for this repository.
Inspect active code, configuration, tests, scripts, deployment files,
existing documentation, and Git history. Create docs/README.md and:

- docs/structure-of-app/PROJECT_CONTEXT.md
- docs/structure-of-app/ARCHITECTURE.md
- docs/structure-of-app/DECISIONS.md

Add timelines, implementation guides, build-and-distribution docs,
history, audits, roadmaps, or research only when the repository provides
evidence and a real maintenance need. Do not create placeholders.
```

## What the skill does

1. Determines the repository's current facts.
2. Separates facts, decisions, history, plans, and unknowns.
3. Creates `docs/README.md` as a retrieval index.
4. Creates the three core documents.
5. Adds other collections only when their content can be supported by evidence.
6. Checks links, commands, paths, revisions, and potentially sensitive information.

## Review the result

Confirm that:

- unimplemented features are not described as active capabilities;
- decisions without recorded rationale are not given invented explanations;
- build commands come from configuration or have been verified;
- commit history is summarized by outcome rather than copied verbatim;
- the documentation index links to every document that is actually maintained.
