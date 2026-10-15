# Using `superior-delivery`

This skill handles CI/CD, release artifacts, environment promotion, rollout verification, rollback, and other work where delivery safety is the primary concern.

## When to use it

Use it to design or repair pipelines, package releases, verify artifact integrity, plan environment promotion, or perform an explicitly authorized deployment. Do not invoke it merely to run an existing local build, and do not treat release preparation as deployment authorization.

## Workflow

1. Identify the source revision, deployable unit, artifact, environments, owners, and requested level of external mutation.
2. Inspect authoritative pipeline, packaging, credential, migration, and release configuration.
3. Build once where possible and promote the same immutable verified artifact.
4. Define gates, compatibility, health evidence, pause thresholds, and rollback or forward recovery.
5. Confirm target and authorization immediately before publishing, deploying, promoting, or rolling back.
6. Report the artifact, environment, jobs or commands, external mutations, verification, and untested rollout conditions.

## Prompt examples

```text
$superior-delivery Prepare the release pipeline for this service. Build one immutable image, promote it through staging, and define production approval and rollback gates. Do not deploy.
```

```text
$superior-delivery Diagnose why the package publication job can release artifacts that differ from those tested. Repair the pipeline and verify artifact identity without publishing a release.
```

## Suitable combinations

- Pair with `superior-database` for migration and stored-data compatibility.
- Pair with `superior-reliability` for availability objectives, failover, and recovery readiness.
- Pair with `superior-testing` for substantial pipeline or release-test design.
- Pair with `superior-docs` for durable build, deployment, rollback, and operator procedures.

## Result checks

A useful result distinguishes build, package, publication, deployment, and promotion. It identifies the immutable artifact and source revision, records every external mutation, and does not claim rollout or rollback behavior that was not exercised.
