---
name: superior-delivery
description: Design, implement, review, or repair CI/CD pipelines, release artifacts, environment promotion, deployment rollout, verification, and rollback workflows. Use when software delivery or release safety is a primary part of the task. Do not use merely to run an existing local build or to deploy without explicit authorization for the target environment.
---

# Superior Delivery

Move a verified change into an intended environment through a repeatable, attributable, and recoverable path. Preserve the project's existing delivery system and separate preparing a release from authorizing an external deployment.

## Establish the delivery contract

Before changing or running a delivery workflow, determine:

- the deployable unit, source revision, version, and target platform;
- authoritative pipeline, build, packaging, signing, and release configuration;
- environments, promotion order, approvals, credentials, and ownership;
- artifact registry, provenance, retention, and immutability expectations;
- runtime configuration, secrets, dependencies, migrations, and compatibility window;
- rollout, health verification, pause, rollback, and forward-recovery criteria;
- whether the user requested design, implementation, dry-run verification, packaging, publishing, or deployment.

Do not infer authorization for publishing, tagging, releasing, deploying, promoting, rolling back, or changing shared pipeline settings from a request to prepare or review delivery files.

## Build once and identify what moves

Read [references/artifacts-and-release-integrity.md](references/artifacts-and-release-integrity.md) when work involves versioning, dependency resolution, build outputs, containers, packages, checksums, signing, SBOMs, provenance, registries, or release metadata.

- Tie each artifact to an immutable source revision and reproducible configuration evidence.
- Prefer promoting the same verified artifact between environments instead of rebuilding environment-specific binaries.
- Keep runtime configuration and secrets out of distributable artifacts unless the platform contract explicitly requires safe public values.
- Fail on missing or ambiguous required inputs; do not silently publish a partially assembled release.
- Treat generated artifacts and lockfiles according to repository ownership rather than regenerating them casually.

## Keep pipelines deterministic and least-privileged

Read [references/pipelines-and-environment-promotion.md](references/pipelines-and-environment-promotion.md) when changing CI/CD stages, caches, matrices, credentials, approval gates, environment promotion, or reusable workflow components.

- Pin or constrain tools and actions according to the repository's supply-chain policy.
- Scope credentials to the smallest environment, operation, and duration that can complete the job.
- Separate untrusted pull-request execution from secret-bearing release work.
- Make stage dependencies and failure propagation explicit.
- Cache only content with a trustworthy key and restoration boundary; a cache is not an artifact source of truth.

Do not bypass a failing gate by weakening checks, broadening permissions, or marking a required step optional unless the accepted delivery contract changes explicitly.

## Roll out with evidence and a stop condition

Read [references/rollout-rollback-and-verification.md](references/rollout-rollback-and-verification.md) for deployment sequencing, migrations, feature flags, canaries, blue-green or rolling rollout, health checks, traffic shifts, rollback, and post-deployment verification.

- Define preconditions, observable success, failure thresholds, and the person or system authorized to continue.
- Keep readiness distinct from liveness and from business-level verification.
- Coordinate application and schema changes across versions; a successful migration command does not prove safe rollout.
- Pause when evidence is missing or thresholds are breached. Do not continue because earlier stages consumed time.
- Distinguish rollback from forward recovery when state or schema changes are irreversible.

Never test a rollout by sending production traffic, changing shared infrastructure, or invoking deployment commands without explicit authorization and a confirmed target.

## Verify and report

Use the repository's supported validation path. Verify proportionately:

- pipeline syntax and configuration;
- build and package success from a clean-enough supported state;
- artifact contents, version, checksums, signatures, or provenance when applicable;
- environment-specific configuration references without exposing secret values;
- migration and compatibility sequencing;
- dry-run, preview, isolated deployment, or target-environment health only when authorized;
- rollback or recovery procedure at the level actually exercised.

Report the revision and artifact evaluated, commands or jobs run, target environment if any, observed gates, external mutations performed, and unverified rollout conditions. Never say “deployed” when only a build, package, plan, or local simulation completed.

## Combine skills narrowly

- Use `superior-testing` when pipeline or release verification requires substantial test strategy or fixture design.
- Use `superior-database` for migration mechanics, data compatibility, backfills, and schema recovery.
- Use `superior-reliability` when availability objectives, degradation, failover, or operational recovery govern the rollout.
- Use `superior-api-security` for credential boundaries, supply-chain trust, public exposure, or security gates.
- Use `superior-performance` when release criteria require representative capacity or latency evidence.
- Use `superior-docs` for durable build, release, deployment, rollback, or operator procedures.

Do not broaden a focused pipeline change into a hosting migration, platform replacement, or live release without explicit scope.
