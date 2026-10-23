## Summary

<!-- Explain the problem, the resulting behavior, and why this change belongs in Superior Skills. -->

## Related issue

<!-- Use "Closes #123" when this pull request should close an issue. Use "None" when there is no related issue. -->

## Change type

- [ ] Skill or reference
- [ ] Routing or shared agent guidance
- [ ] Plugin packaging, marketplace, or installation
- [ ] Documentation or tutorial
- [ ] Validation or maintenance tooling
- [ ] Bug fix
- [ ] Breaking change

## What changed

<!-- List the important outcomes, not every edited file. -->

-

## Scope and decisions

<!--
Identify the owning skill or subsystem. Explain non-obvious decisions, compatibility
effects, and why an existing skill or reference could not already solve the problem.
Remove this section when the change is self-explanatory.
-->

## Validation

<!-- List commands or realistic scenarios actually run and their observed results. Do not list planned checks as completed. -->

| Check | Result |
| --- | --- |
| `pwsh -File scripts/validate-plugin.ps1` | Not run |

## Integration checklist

<!-- Select applicable items. Mark non-applicable items only when reviewers might reasonably expect them. -->

- [ ] Skill names, frontmatter, directories, and local references are consistent.
- [ ] `AGENTS.md` routing is updated when skill ownership or selection changed.
- [ ] English and Indonesian tutorials remain aligned when user guidance changed.
- [ ] README, installation, manifest, or marketplace metadata is updated when packaging changed.
- [ ] Compatibility, migration, and release-note impact is explained when applicable.
- [ ] No integration updates are required for this change.

## Breaking changes and migration

<!-- Write "None" when existing installations and workflows remain compatible. Otherwise describe affected users and exact migration steps. -->

None.

## Remaining limitations

<!-- State unverified behavior, deferred follow-up, or known constraints. Write "None known" when supported by the evidence. -->

## Final checklist

- [ ] I read `CONTRIBUTING.md` and the affected `SKILL.md` files completely.
- [ ] This pull request contains one coherent change without unrelated cleanup.
- [ ] New rules are supported by a realistic use case and do not turn a local preference into a universal requirement.
- [ ] Required safety, security, accessibility, compatibility, and authorization boundaries remain intact.
- [ ] Changed links resolve, text remains valid UTF-8, and no unfinished placeholders remain.
- [ ] I reviewed the diff for credentials, personal data, private infrastructure details, and sensitive logs.
- [ ] I did not change `VERSION` or release metadata unless this pull request intentionally prepares a coordinated release.
