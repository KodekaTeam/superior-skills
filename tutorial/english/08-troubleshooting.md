# 08 - Troubleshoot Discovery and Routing

## A skill does not appear

Check that:

1. the skill directory is at `.agents/skills/<skill-name>/`;
2. the entrypoint is named exactly `SKILL.md`;
3. its frontmatter contains `name` and `description`;
4. the `name` value matches the directory name;
5. Codex is opened from a directory on the path beneath the relevant `.agents/skills` location;
6. no configuration disables the skill.

Restart Codex if a recent change has not been detected.

## The wrong skill is selected

- Use explicit invocation with `$superior-...`.
- Ensure the prompt states the outcome and mode: build, audit, bootstrap, synchronize, or review.
- Avoid vague prompts such as "clean up everything."
- Check whether multiple local skills use the same `name`.

## Docs are not read in a new session

Check that:

- `AGENTS.md` is in the repository root or another scanned parent directory;
- the session bootstrap still exists and is not overridden by `AGENTS.override.md`;
- `docs/README.md` and the three core documents use the correct paths;
- Codex is opened in the correct repository;
- the combined project instructions do not exceed the applicable configuration limit.

Use this read-only diagnostic prompt:

```text
Summarize the active AGENTS.md instructions, the Superior skills that were
discovered, and the session-bootstrap documents that were found. Do not
change any files.
```

## Documentation is too large or stale

- Use `docs/README.md` as a router, not a summary of everything.
- Move conditional details into topic guides.
- Remove placeholders without an owner.
- Mark historical or proposed documents explicitly.
- Run `$superior-docs` in synchronize mode only for the affected scope.
