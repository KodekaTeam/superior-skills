<p align="center">
  <img src="assets/profile.png" alt="Superior" width="240">
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/KodekaTeam/superior-skills.svg" alt="License: MIT"></a>
  <a href="https://github.com/KodekaTeam/superior-skills/releases"><img src="https://img.shields.io/github/v/release/KodekaTeam/superior-skills?label=version&color=1f6feb" alt="Version"></a>
</p>

<h1 align="center">Superior Skills</h1>

<p align="center">
`superior-skills` is a reusable instruction package for producing software changes that are contextual, evidence-based, and free from a generic template feel. It is not a collection of stylistic prohibitions. Its core principle is to make decisions from project evidence, preserve real functionality, and verify the resulting changes.
</p>

## Key differences

- Routing is divided by type of work rather than overlapping lists of anti-patterns.
- UI creation and UI auditing are separate, preventing implementation requests from turning into read-only audits.
- Extensive visual guidance uses progressive disclosure through `references/`.
- Each skill has a specific name and description to improve implicit invocation accuracy.
- One canonical `skills/` tree is packaged for Codex, Cursor, and Claude Code.
- Shared baseline rules live in `AGENTS.md`; specialist details are loaded only when relevant.
- Verified material implementation work is recorded in an indexed `docs/implementation-timeline/` by default, unless the user opts out.

## Structure

```text
superior-skills/
|-- VERSION
|-- CODE_OF_CONDUCT.md
|-- CONTRIBUTING.md
|-- SECURITY.md
|-- LICENSE
|-- AGENTS.md
|-- CLAUDE.md
|-- INSTALL.md
|-- plugin.json
|-- skills/                    # Canonical portable skills
|-- scripts/                   # Package validation
|-- .codex-plugin/             # Codex compatibility manifest
|-- .cursor-plugin/            # Cursor manifest and repository marketplace
|-- .claude-plugin/            # Claude Code manifest and marketplace
|-- principles/
|   |-- README.md
|   `-- documentation-continuity.md
`-- .agents/
    `-- plugins/               # Codex repository marketplace
```

## Community and governance

- [Contributing guide](CONTRIBUTING.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Security policy](SECURITY.md)
- [MIT License](LICENSE)

## Install

Superior ships as a portable, skills-only plugin. Choose the host you use, then start a new agent session after installation.

### Codex

```shell
codex plugin marketplace add KodekaTeam/superior-skills
codex plugin add superior-skills@superior-skills
```

You can also add the repository from the Codex plugin marketplace UI and select **Superior Skills**.

### Cursor

Open **Cursor Settings → Plugins**, paste the repository URL below into the plugin search box, then install **Superior Skills**:

```text
https://github.com/KodekaTeam/superior-skills
```

### Claude Code

Run these commands inside Claude Code:

```text
/plugin marketplace add KodekaTeam/superior-skills
/plugin install superior-skills@superior-skills
```

### Standalone Agent Skills

For agents without plugin support, copy the folders inside `skills/` into the agent's project-level or user-level skills directory. For Codex-compatible project layouts, that directory is commonly `.agents/skills/`.

If the target already has an `AGENTS.md` or `CLAUDE.md`, merge the relevant sections instead of replacing project-specific commands and rules.

See [`INSTALL.md`](INSTALL.md) for local development, update, removal, and troubleshooting instructions. Step-by-step guides are also available in [`tutorial/english/`](tutorial/english/README.md).

## Update

Plugin installations keep their own cached copy. Refresh the marketplace, update the plugin when the host provides a separate update command, then start a new session.

### Codex

```shell
codex plugin marketplace upgrade superior-skills
```

### Claude Code

```shell
claude plugin marketplace update superior-skills
claude plugin update superior-skills@superior-skills
```

### Cursor

Open **Cursor Settings → Plugins**, locate **Superior Skills**, and select the available update or reinstall action. Run **Developer: Reload Window** afterward.

Standalone copies do not update automatically; replace the installed `superior-*` skill folders with the latest folders from this repository.

## Usage

Skills are selected automatically from the task context or can be invoked explicitly, for example with `$superior-ui`, `$superior-testing`, `$superior-api-security`, or `$superior-docs`. The portable entrypoint is [`plugin.json`](plugin.json), and canonical skill definitions live under [`skills/`](skills/).

## FAQ

### Does Superior install an MCP server or require credentials?

No. Superior is currently a skills-only plugin. It does not install an MCP server, lifecycle hook, credential, or external service.

### Where are the skills installed?

Plugin hosts normally install a cached plugin package and read its root `skills/` directory. They do not need to create `.agents/skills/` inside every target project. The `.agents/skills/` path is only a standalone fallback.

### Why is an updated skill not active yet?

Refresh or update the marketplace and start a new conversation or agent session. Existing sessions may retain the skill version loaded when the session began.

### Does Superior write implementation documentation automatically?

For material, verified implementation work, `superior-docs` records a focused entry under `docs/implementation-timeline/<feature>/` when appropriate. An explicit request not to create documentation always takes precedence.

### Can I install only one skill?

The plugin installs the complete package so routing and shared references remain consistent. For a standalone setup, individual `superior-*` folders can be copied, but any referenced files must be copied with them.

## Output principles

Superior prioritizes:

- local evidence over generic preferences;
- hierarchy and task flow before decoration;
- honest data and claims;
- controls and states that actually work;
- accessibility and responsive behavior as part of quality;
- small solutions that preserve correctness;
- verification proportionate to the risk of the change.

The briefs and rationale used to develop the documentation workflow live in `principles/`. That directory is intended for package maintainers; portable runtime instructions live in `skills/superior-docs/`.

## Package validation

Run `pwsh -File scripts/validate-plugin.ps1` before publishing.

When `superior-docs` records implementation work, it creates and maintains the indexed `docs/implementation-timeline/` structure inside the target repository. Internal maintainer records in this package are intentionally not published.

Explicit user instructions and more specific project rules always take precedence over this package's general preferences.
