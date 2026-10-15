# Pipelines and environment promotion

Use this reference for CI/CD stages, reusable workflows, caches, credentials, gates, and movement between environments.

## Model the pipeline as a trust path

For each stage, identify inputs, executing identity, permissions, network access, secrets, produced artifacts, consumers, and failure behavior. Untrusted contributions must not gain access to release credentials through scripts, changed workflow files, cache poisoning, or artifact substitution.

Keep secret-bearing release jobs on reviewed source and trusted events. Use protected environments and approval gates where the project requires them.

## Make stage ownership explicit

Separate concerns when their evidence differs:

- source validation and static checks;
- tests and integration environments;
- build and package creation;
- security or policy gates;
- artifact publication;
- deployment and environment verification;
- promotion or release announcement.

Pass immutable artifacts and machine-readable results between stages. Do not rebuild silently after a gate that was meant to approve a specific artifact.

## Handle credentials safely

Prefer short-lived workload identity or scoped tokens over long-lived shared secrets. Restrict credentials by repository, environment, operation, and destination where supported. Masking output is not a substitute for avoiding secret exposure in arguments, files, artifacts, caches, or third-party steps.

Do not print full environments or credential-bearing configuration during troubleshooting.

## Use caches carefully

Cache keys should include every input that changes cached semantics and should not allow an untrusted job to populate content later restored by a privileged job. Treat restored caches as untrusted acceleration data, not authoritative release artifacts.

Measure whether a cache improves the pipeline enough to justify invalidation and storage complexity.

## Promote through environments

Define what each environment proves and which differences remain. Promotion should carry the same artifact identity plus approved configuration, not an assumption that two independently built outputs are equivalent.

Record required approvals, soak or observation period, compatibility constraints, and evidence needed to advance. Keep manual emergency paths authenticated, logged, narrow, and reconcilable with the normal system afterward.

## Diagnose pipeline failures

Preserve the first causal failure rather than retrying every stage blindly. Retry only transient, idempotent operations with a bound. Distinguish runner or provider failure, flaky test, invalid configuration, dependency outage, permission denial, and product defect so the correction occurs at the owning boundary.
