# Contributing to Superior Skills

Thank you for helping improve `superior-skills`. Contributions should make agent behavior more accurate, contextual, safe, and maintainable without turning isolated preferences into universal rules.

By contributing, you agree that your contribution is licensed under the repository's [MIT License](LICENSE) and that you will follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Ways to contribute

- report a reproducible problem or routing failure;
- improve an existing skill or supporting reference;
- propose a narrowly scoped new skill;
- improve English or Indonesian tutorials;
- fix broken links, unclear examples, or inaccurate documentation;
- add validation evidence from a realistic use case.

For suspected vulnerabilities, do not open a public issue. Follow [SECURITY.md](SECURITY.md).

## Before making a change

1. Read `README.md`, `AGENTS.md`, and the affected `SKILL.md` completely.
2. Follow references linked by that skill only when they are relevant to the change.
3. Check whether an existing skill already owns the requested capability.
4. Keep the contribution focused; separate unrelated cleanup.
5. For substantial or breaking changes, align with maintainers before investing in a large implementation.

## Skill design requirements

- Use lowercase letters, digits, and hyphens for skill directory names.
- Keep `SKILL.md` frontmatter concise and include the required `name` and `description`.
- Make the description discriminating enough for reliable automatic selection.
- Keep essential workflow and routing in `SKILL.md`; move conditional detail into `references/`.
- Add scripts only when deterministic reusable execution materially improves reliability.
- Preserve user intent, authorization boundaries, established project architecture, and existing invocation policy.
- Avoid generic checklists, speculative edge cases, duplicated guidance, arbitrary absolute rules, and unfinished placeholders.
- Do not add a new skill when a focused reference or correction to an existing skill is sufficient.

## Package integration

When adding or renaming a skill, update every affected integration point:

- routing in `AGENTS.md`;
- the canonical skill under `skills/`;
- the structure and usage information in both package READMEs;
- English and Indonesian per-skill indexes and tutorials;
- combination guidance when the skill has meaningful collaborators;
- `CHANGELOG.md` under `Unreleased`.

Do not change `VERSION` unless a maintainer explicitly requests a release. Release version, changelog date, and Git tag must be coordinated rather than updated independently.

## Documentation changes

- Keep English and Indonesian navigation structurally aligned where both exist.
- Preserve the established UTF-8 encoding and verify punctuation after writing.
- Use relative links and confirm every changed link resolves.
- Record current behavior as fact only when supported by code, tests, configuration, or accepted project decisions.
- Keep plans, historical facts, current state, and unknowns visibly separate.
- Never include credentials, private infrastructure details, personal data, or raw sensitive logs.

## Validation

Before submitting:

1. run `pwsh -File scripts/validate-plugin.ps1` and validate each substantially changed skill with the available skill validator;
2. inspect frontmatter, name-directory consistency, and reference paths;
3. search for placeholders, stale skill names, broken links, and encoding artifacts;
4. exercise changed scripts and meaningful behavior when applicable;
5. verify tutorials and routing describe the implemented behavior;
6. review the final diff for unrelated changes and sensitive information.

If a validator or dependency is unavailable, report that limitation and provide the manual checks performed.

## Pull request guidance

A pull request should explain:

- the problem and intended outcome;
- why the selected skill or reference owns the change;
- important design decisions and compatibility effects;
- validation performed and observed results;
- documentation or migration work included;
- remaining limitations or follow-up.

Small, coherent changes are easier to review than broad rewrites. Maintainers may request changes when instructions are overly prescriptive, duplicate existing guidance, weaken safety boundaries, or cannot be validated against a realistic task.
