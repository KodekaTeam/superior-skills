# Artifacts and release integrity

Use this reference when delivery depends on what is built, versioned, stored, signed, or published.

## Identify an artifact unambiguously

Associate each artifact with:

- immutable source revision;
- package or image name and version;
- build workflow and toolchain version;
- dependency lock state;
- target platform or architecture;
- checksum or registry digest;
- build timestamp only when useful and reproducibility permits it;
- provenance, signature, or attestation required by project policy.

A mutable tag or filename is not sufficient identity. Record the digest or immutable version used for promotion and rollback.

## Separate artifact from environment

Build environment-neutral artifacts when the platform supports it, then inject authorized runtime configuration at deployment. Do not embed credentials, private endpoints, or environment-only policy in a package intended for broader distribution.

When environment-specific compilation is unavoidable, treat each output as a distinct artifact with its own identity and verification. Do not claim that staging tested the production artifact when production was rebuilt differently.

## Control inputs and dependencies

Use the repository's lockfiles, registries, vendoring, and dependency policy. Detect unresolved, yanked, substituted, or unexpectedly updated inputs. Pin third-party pipeline actions or builders according to the project's trust policy and review transitive execution where practical.

Do not refresh every dependency as a side effect of a release unless dependency updates are in scope.

## Inspect package contents

Check that the artifact includes required runtime files and excludes secrets, local caches, test credentials, source maps or debug assets that violate policy, unrelated repository content, and duplicate package roots.

For containers, verify entrypoint, user, exposed ports, base image policy, labels, filesystem permissions, and architecture. A small image is useful only if it remains supportable and secure.

## Version and release metadata

Follow the repository's version authority and update every required manifest atomically. Preserve schema URLs and unrelated metadata. Align release notes and tags with the version actually packaged; do not claim a tag, release, or publication exists before it is created.

## Publishing boundary

Publishing creates external state. Confirm destination, package identity, version availability, credentials, visibility, and immutability immediately before execution. Avoid overwriting an existing release unless the registry and project explicitly support that policy.

After publication, retrieve or inspect the immutable result when possible and compare its digest or metadata with the verified local artifact.
