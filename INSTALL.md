# Installing Superior Skills

Superior Skills is a skills-only portable Agent Plugin. It does not install an MCP server, lifecycle hooks, credentials, or external services.

## Package layout

- `plugin.json` is the portable entrypoint used by Agent Plugin-compatible hosts and the root marker used by Antigravity plugins.
- `gemini-extension.json` is the native Gemini CLI extension manifest.
- `kimi.plugin.json` is the native Kimi Code plugin manifest.
- `skills/` contains the canonical skill definitions.
- `.codex-plugin/`, `.cursor-plugin/`, and `.claude-plugin/` provide host-specific compatibility and marketplace metadata.
- `.agents/plugins/marketplace.json` exposes the package to a repository-scoped Codex marketplace.

## Skills CLI (skills.sh)

With Node.js and npm available, install Superior Skills directly into a supported agent through the [Skills CLI](https://www.skills.sh/docs/cli):

```shell
npx skills add KodekaTeam/superior-skills
```

The interactive flow lets you select individual skills, target agents, and project or global scope. Project scope is the default. To make the selected skills available across projects, use:

```shell
npx skills add KodekaTeam/superior-skills -g
```

This installs standalone skills into the selected agent directories. It does not install the host-specific plugin manifests or marketplace entry described below.

## Codex and ChatGPT Work

Add the GitHub repository as a Codex marketplace, then install the plugin:

```shell
codex plugin marketplace add KodekaTeam/superior-skills
codex plugin add superior-skills@superior-skills
```

For repository-local development, clone or copy the package into a trusted repository and keep `.agents/plugins/marketplace.json` at that repository root. The marketplace exposes the package at `./` as `superior-skills`.

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

For a Git-backed installation:

1. Open **Cursor Settings → Plugins**.
2. Paste `https://github.com/KodekaTeam/superior-skills` into the plugin search box.
3. Open **Superior Skills** and select **Install**.
4. Run **Developer: Reload Window** before testing the installed skills.

For local testing:

1. Copy this complete package directory to `~/.cursor/plugins/local/superior-skills/`.
2. Restart Cursor or run **Developer: Reload Window**.
3. Open **Customize**, locate **Superior Skills**, and confirm the packaged skills are listed.

Do not use a symlink to a directory outside `~/.cursor/plugins/local`; Cursor restricts those local plugin symlinks. For team repository import, use the included `.cursor-plugin/marketplace.json` from the repository root.

## Claude Code

For a Git-backed marketplace installation, run these commands inside Claude Code:

```text
/plugin marketplace add KodekaTeam/superior-skills
/plugin install superior-skills@superior-skills
```

During local development, load the package directory directly:

```text
claude --plugin-dir /absolute/path/to/superior-skills
```

Plugin skills are namespaced in Claude Code, for example:

```text
/superior-skills:superior-ui
/superior-skills:superior-api-security
/superior-skills:superior-docs
```

`CLAUDE.md` is the project-maintenance baseline for contributors working in this repository. Plugin-installed skills remain on demand.

## Gemini CLI

Install Superior Skills as a native extension from GitHub:

```shell
gemini extensions install https://github.com/KodekaTeam/superior-skills
```

Restart Gemini CLI, then confirm discovery with:

```text
/skills list
```

For local development without reinstalling after every edit, link the repository directory:

```shell
gemini extensions link /absolute/path/to/superior-skills
```

The extension loads the canonical root `skills/` directory. It does not add MCP servers, hooks, settings, or credentials.

## Google Antigravity

Antigravity CLI can install the complete repository as a plugin bundle:

```shell
agy plugin install https://github.com/KodekaTeam/superior-skills
agy plugin list
```

For Antigravity IDE, copy the complete package directory to one of the supported plugin locations:

- workspace: `<workspace>/.agents/plugins/superior-skills/`;
- global: `~/.gemini/config/plugins/superior-skills/`.

Keep `plugin.json` and `skills/` together at the plugin root. Antigravity also supports standalone workspace skills under `.agents/skills/` when the complete plugin is not required.

## Kimi Code

From the Kimi Code TUI, install the repository through the custom plugin flow:

```text
/plugins install https://github.com/KodekaTeam/superior-skills
/plugins info superior-skills
/reload
```

Kimi copies the installed repository into its managed plugin store. Editing the original checkout does not update that managed copy; reinstall or use the plugin manager's update action after local changes.

## Cline

Use Skills CLI and select Cline as the target:

```shell
npx skills add KodekaTeam/superior-skills
```

For a manual installation, copy selected `skills/superior-*` directories into `.cline/skills/` for workspace scope or `~/.cline/skills/` for user scope. Keep every referenced file inside each copied skill directory. Start a new conversation or reload the editor after installation.

## Muse Code

Muse Code reads project skills from `.agents/skills/` and personal skills from `~/.agents/skills/`. Copy selected canonical skill directories into the appropriate location.

If Superior Skills is already installed in a Codex user skill directory, Muse can import that installation:

```shell
muse skills import --from codex
```

Use `muse skills list` to confirm discovery. A Muse-specific plugin manifest is intentionally not included because the package is skills-only and Muse already imports or discovers the canonical skill directories.

## Hermes Agent

Hermes integrates with the skills.sh catalog. Search, inspect, and install the required Superior skills individually:

```shell
hermes skills search superior --source skills-sh
hermes skills inspect <result-id>
hermes skills install <result-id>
```

Use the exact identifier returned by the search command. Run `hermes skills list` afterward to confirm installation. Individual installation preserves progressive disclosure and avoids loading unrelated skills.

## User-scoped standalone skills

When a host supports standalone Agent Skills but not plugin installation, copy each folder under `skills/` to that host's user skill directory. Host-specific instruction files must be merged separately; do not blindly replace an existing `AGENTS.md` or `CLAUDE.md`.

## Updating

### Skills CLI

Update skills installed through `npx skills` with:

```shell
npx skills update
```

The CLI lets you choose the applicable project or global scope. Start a new agent session after the update.

### Codex

Refresh the Git marketplace snapshot:

```shell
codex plugin marketplace upgrade superior-skills
```

Restart the Codex client or start a new conversation so the refreshed skills are loaded. If an older cached installation remains active, reinstall it explicitly:

```shell
codex plugin remove superior-skills@superior-skills
codex plugin add superior-skills@superior-skills
```

### Cursor

Open **Cursor Settings → Plugins**, locate **Superior Skills**, then use the available update action. If no update action is shown, uninstall and reinstall the repository plugin. Run **Developer: Reload Window** afterward.

For local development copies under `~/.cursor/plugins/local/superior-skills/`, replace the old package contents with the latest repository contents before reloading Cursor.

### Claude Code

Refresh the marketplace and update the installed plugin from a terminal:

```shell
claude plugin marketplace update superior-skills
claude plugin update superior-skills@superior-skills
```

Start a new Claude Code session after the update.

### Gemini CLI

```shell
gemini extensions update superior-skills
```

Restart Gemini CLI after updating so the extension skill catalog is rebuilt.

### Google Antigravity

Use Antigravity's plugin manager to update or reinstall the Git-backed plugin. For a manually copied IDE plugin, replace only the existing `superior-skills` package directory and restart or reload Antigravity.

### Kimi Code

Open `/plugins`, select **Superior Skills**, and use the available update action. Run `/reload` or start a new session afterward.

### Cline, Muse Code, and Hermes Agent

- Skills CLI installations for Cline update through `npx skills update`.
- Manually copied Cline or Muse skills must be replaced from the latest canonical `skills/` directories.
- Hermes installations can be checked and refreshed with `hermes skills check` followed by `hermes skills update`.

### Standalone installation

Standalone copies do not update automatically. Replace the installed `superior-*` directories with the latest directories from `skills/`, while preserving unrelated skills and project instructions.

## Removing

For Skills CLI installations, remove skills interactively so only the intended agent and scope are affected:

```shell
npx skills remove
```

For Codex:

```shell
codex plugin remove superior-skills@superior-skills
codex plugin marketplace remove superior-skills
```

For Claude Code, uninstall the plugin through `/plugin`, then remove the `superior-skills` marketplace if it is no longer needed. For Cursor, remove **Superior Skills** from **Cursor Settings → Plugins**.

For Gemini CLI:

```shell
gemini extensions uninstall superior-skills
```

For Kimi Code, run `/plugins remove superior-skills`. For Antigravity, use its plugin manager or remove only the copied `superior-skills` plugin directory from the selected workspace or global plugin location.

For Cline, Muse Code, and Hermes Agent, use the installer that created the copy or remove only the installed `superior-*` directories. Do not delete the parent skills directory because it may contain unrelated packages.

For standalone installations, delete only the copied `superior-*` skill directories. Remove merged `AGENTS.md` or `CLAUDE.md` content manually and carefully; do not delete unrelated project instructions.

## Troubleshooting

- **Plugin not found:** verify that root `plugin.json` still uses `https://agent-plugins.org/schemas/1.0.0/plugin.schema.json`. The schema version is independent from the Superior release version.
- **An update is not visible:** refresh the marketplace, reload the host, and start a new session. Existing sessions may retain previously loaded skill instructions.
- **A skill does not trigger automatically:** invoke it explicitly, such as `$superior-ui` in compatible hosts or `/superior-skills:superior-ui` in Claude Code.
- **Gemini does not list the extension:** confirm `gemini-extension.json` is at the repository root, restart Gemini CLI, then run `/skills list`.
- **Antigravity does not discover the plugin:** confirm the complete package is under a supported plugin directory with `plugin.json` and `skills/` at the same root.
- **Kimi reports an invalid plugin:** run `/plugins info superior-skills` and confirm `kimi.plugin.json` still points to `./skills/`.
- **Cline or Muse does not discover a copied skill:** confirm each skill directory directly contains `SKILL.md` and its referenced resources.
- **Hermes cannot find a catalog result:** refresh its skills sources, repeat the `skills-sh` search, and install the exact returned identifier rather than guessing the slug.
- **Project instructions disappeared:** restore the project's original `AGENTS.md` or `CLAUDE.md`, then merge Superior's baseline instead of replacing the file.
- **Private repository access fails:** authenticate Git for the same operating-system account that runs the agent host.

## Maintainer validation

Edit canonical skills only under `skills/`. Validate all host manifests, versions, skill frontmatter, and marketplace catalogs before publishing:

```powershell
pwsh -File scripts/validate-plugin.ps1
```

The value in `VERSION` may include a leading `v`; plugin manifests use the normalized semantic version without that prefix.
