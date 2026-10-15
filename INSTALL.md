# Installing Superior Skills

Superior Skills is a skills-only portable Agent Plugin. It does not install an MCP server, lifecycle hooks, credentials, or external services.

## Package layout

- `plugin.json` is the portable entrypoint used by Agent Plugin-compatible hosts.
- `skills/` contains the canonical skill definitions.
- `.codex-plugin/`, `.cursor-plugin/`, and `.claude-plugin/` provide host-specific compatibility and marketplace metadata.
- `.agents/plugins/marketplace.json` exposes the package to a repository-scoped Codex marketplace.

## Codex and ChatGPT Work

For repository-local discovery, clone or copy the package into a trusted repository and keep `.agents/plugins/marketplace.json` at that repository root. The marketplace exposes the package at `./` as `superior-skills`.

In supported Codex clients, refresh the plugin marketplace, select **Superior Skills**, and install it. The root portable manifest and `skills/` directory are the canonical package content.

For a direct project installation without the plugin marketplace, create `.agents/skills/` in the target repository and copy every folder from this package's root `skills/` directory into it. Copy or merge `AGENTS.md` separately:

```text
project/
|-- AGENTS.md
`-- .agents/
    `-- skills/
        `-- superior-*/
```

If the project already has `AGENTS.md`, merge the portable baseline without removing project-specific commands, architecture, domain rules, or nested instruction boundaries.

## Cursor

For local testing:

1. Copy this complete package directory to `~/.cursor/plugins/local/superior-skills/`.
2. Restart Cursor or run **Developer: Reload Window**.
3. Open **Customize**, locate **Superior Skills**, and confirm the packaged skills are listed.

Do not use a symlink to a directory outside `~/.cursor/plugins/local`; Cursor restricts those local plugin symlinks. For team repository import, use the included `.cursor-plugin/marketplace.json` from the repository root.

## Claude Code

During local development, load the package directory directly:

```text
claude --plugin-dir /absolute/path/to/superior-skills
```

For marketplace installation, add the repository or directory containing `.claude-plugin/marketplace.json`, then install `superior-skills@superior-skills`. Plugin skills are namespaced in Claude Code, for example:

```text
/superior-skills:superior-ui
/superior-skills:superior-api-security
/superior-skills:superior-docs
```

`CLAUDE.md` is the project-maintenance baseline for contributors working in this repository. Plugin-installed skills remain on demand.

## User-scoped standalone skills

When a host supports standalone Agent Skills but not plugin installation, copy each folder under `skills/` to that host's user skill directory. Host-specific instruction files must be merged separately; do not blindly replace an existing `AGENTS.md` or `CLAUDE.md`.

## Maintainer validation

Edit canonical skills only under `skills/`. Validate manifests, versions, skill frontmatter, and marketplace catalogs before publishing:

```powershell
pwsh -File scripts/validate-plugin.ps1
```

The value in `VERSION` may include a leading `v`; plugin manifests use the normalized semantic version without that prefix.
