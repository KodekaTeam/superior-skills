<p align="center">
  <img src="assets/profile.png" alt="Superior" width="240">
</p>

# Superior

**Current version:** [`v1.0.0`](VERSION) · [Changelog](CHANGELOG.md)

`superior-skills` is a reusable instruction package for producing software changes that are contextual, evidence-based, and free from a generic template feel. It is not a collection of stylistic prohibitions. Its core principle is to make decisions from project evidence, preserve real functionality, and verify the resulting changes.

## Key differences

- Routing is divided by type of work rather than overlapping lists of anti-patterns.
- UI creation and UI auditing are separate, preventing implementation requests from turning into read-only audits.
- Extensive visual guidance uses progressive disclosure through `references/`.
- Each skill has a specific name and description to improve implicit invocation accuracy.
- Shared baseline rules live in `AGENTS.md`; specialist details are loaded only when relevant.
- Verified material implementation work is recorded in an indexed `docs/implementation-timeline/` by default, unless the user opts out.

## Structure

```text
superior-skills/
|-- VERSION
|-- CHANGELOG.md
|-- CODE_OF_CONDUCT.md
|-- CONTRIBUTING.md
|-- SECURITY.md
|-- LICENSE
|-- AGENTS.md
|-- INSTALL.md
|-- principles/
|   |-- README.md
|   `-- documentation-continuity.md
`-- .agents/
    `-- skills/
        |-- superior-ui/
        |-- superior-ui-audit/
        |-- superior-responsive/
        |-- superior-accessibility/
        |-- superior-copy/
        |-- superior-comments/
        |-- superior-logic/
        |-- superior-api-security/
        |-- superior-lean/
        `-- superior-docs/
```

## Community and governance

- [Contributing guide](CONTRIBUTING.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Security policy](SECURITY.md)
- [MIT License](LICENSE)

## Usage

Copy `AGENTS.md` and `.agents/` into the target repository root. If the repository already has an `AGENTS.md`, merge the relevant sections without removing existing project commands, domain rules, or validation instructions.

Skills can be invoked explicitly, such as with `$superior-ui`, while their descriptions are also designed for automatic selection. Installation details are available in `INSTALL.md`.

Step-by-step guides are available in [`tutorial/english/`](tutorial/english/README.md), covering installation and routing as well as documentation bootstrapping and session continuity.

## Output principles

Superior prioritizes:

- local evidence over generic preferences;
- hierarchy and task flow before decoration;
- honest data and claims;
- controls and states that actually work;
- accessibility and responsive behavior as part of quality;
- small solutions that preserve correctness;
- verification proportionate to the risk of the change.

The briefs and rationale used to develop the documentation workflow live in `principles/`. That directory is intended for package maintainers; portable runtime instructions remain in `.agents/skills/superior-docs/`.

Explicit user instructions and more specific project rules always take precedence over this package's general preferences.
