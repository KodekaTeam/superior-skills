# Complexity Decisions and Safe Removal

Use this reference when simplifying or removing shared abstractions, dependencies, configuration, extension points, or code that appears unused. The goal is less owned complexity, not merely fewer files or lines.

## Decide whether complexity earns its cost

Preserve complexity when repository evidence shows that it owns at least one real responsibility:

- multiple current consumers share a stable contract;
- an external service, datastore, platform, or volatile vendor API needs an isolation boundary;
- policy, authorization, validation, transactions, retries, or compatibility must remain centralized;
- supported implementations, environments, or product variants already differ;
- public API, migration, deprecation, or rollout commitments require an intermediate state;
- generated code, framework conventions, or lifecycle ownership depend on the structure;
- independent testing or replacement is materially safer at that boundary.

One implementation does not automatically make an interface wasteful, and several call sites do not automatically justify a new abstraction. Identify the responsibility, current consumers, and concrete change pressure. If none can be shown, prefer the direct design.

## Find indirect consumers

Before deleting or collapsing a symbol, file, registration, or configuration path, search beyond ordinary imports and calls:

- dependency injection, service containers, registries, and plugin discovery;
- reflection, dynamic imports, naming conventions, annotations, and decorators;
- routes, commands, scheduled jobs, events, queues, hooks, and callbacks;
- environment variables, configuration files, feature flags, and deployment manifests;
- templates, migrations, seeds, code generation, build scripts, and package exports;
- public APIs, documented extension points, and downstream consumers outside the repository.

Treat absence of a direct reference as incomplete evidence when the runtime supports dynamic wiring. Use the project's supported discovery, build, test, and runtime checks before claiming code is unused.

## Compare total dependency ownership

Replace a dependency only when the local alternative reduces total ownership while preserving behavior. Compare:

- transitive packages, install and bundle cost, security maintenance, release stability, and platform support;
- standards compliance, malformed input handling, localization, performance, and compatibility edge cases;
- the new local code, tests, documentation, monitoring, upgrades, and long-term maintainer responsibility.

Do not locally reimplement cryptography, authentication protocols, security sanitization, complex parsers or serializers, date and time-zone rules, currency or localization behavior, or other standards-heavy functionality merely because the happy path is short. Prefer a maintained platform capability or established library unless evidence proves the project can safely own the complete contract.

## Remove safely

1. State the behavior and compatibility contract that must remain.
2. Identify direct and indirect consumers plus the boundary that currently owns the behavior.
3. Compare the existing and proposed designs by concepts, ownership, failure modes, and maintenance—not line count alone.
4. Remove the smallest coherent unit and update affected callers, registrations, configuration, tests, and documentation together.
5. Verify representative behavior and the mechanisms that discover or activate the removed path.

Stop when the requested outcome is complete and the remaining complexity has a demonstrated owner. Do not turn a focused simplification into a repository-wide cleanup campaign.

## Report the decision

Explain what was removed or retained, the evidence for its consumers and ownership, the resulting contract, checks performed, and the concrete future condition that would justify adding the complexity back.
