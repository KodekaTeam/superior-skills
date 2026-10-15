# Finding quality and severity

Use this reference to decide whether a candidate issue belongs in the final review and how strongly to present it.

## Admission criteria

A finding should satisfy all of the following:

- it is caused, exposed, or made materially worse by the reviewed change;
- a maintained execution or data path can reach it;
- the triggering condition is specific and plausible;
- the consequence is concrete;
- the repository does not already prevent, tolerate, or recover from it;
- a maintainer could act on the report without rediscovering the entire argument.

If evidence is incomplete, either perform another safe check, lower confidence explicitly, or present it as a question outside the findings list. Do not inflate uncertainty into severity.

## Severity model

Use repository-defined severity when one exists. Otherwise use:

| Severity | Meaning |
| --- | --- |
| **Blocker** | Likely catastrophic or release-blocking impact: broad data loss, critical security compromise, total unavailability, or an irreversible compatibility break on a maintained path |
| **High** | Material incorrectness, security exposure, corruption, or outage for a common or important path with no reasonable recovery |
| **Medium** | Real defect affecting a narrower scenario, degraded recovery, or significant regression with a practical workaround |
| **Low** | Limited but concrete defect or maintenance hazard whose impact is contained and worth correcting |

Severity combines impact and reach, not how easy the fix is or how strongly the reviewer feels. Do not label style, missing polish, or optional hardening as Low merely to keep it in the findings list.

## Location and scope

Point to the smallest changed line or range that explains the issue. When the consequence occurs elsewhere, cite the changed location and explain the downstream path. Avoid broad file-level locations unless no narrower source owns the defect.

Group symptoms with one root cause into a single finding. Split findings only when they require independent decisions or fixes.

## Finding structure

Use a concise title that states the broken contract, followed by a short explanation containing:

1. trigger;
2. observed or inevitable behavior;
3. consequence;
4. why existing protection does not apply;
5. correction direction when it is not obvious.

Example shape:

```text
[High] Preserve tenant scope during retry

When a retry is reconstructed from the queue payload, the new code loads the
record by global ID without the original tenant predicate. A worker processing
an ID collision can update another tenant's record. Carry the tenant identity
through the retry contract and enforce it in the update query.
```

Do not write a full patch in a finding. Avoid praise, rhetorical questions, vague warnings, and unsupported claims such as “might cause issues.”

## Confidence and verification

State confidence only when it changes how the maintainer should interpret the finding. High severity with low confidence usually means more investigation is required before reporting it as a blocker.

Mention the command or evidence that confirmed the issue when useful. If verification could not run, state the exact limitation without implying the finding was dynamically reproduced.

## No-findings result

When no candidate meets the admission criteria, report no actionable findings. Then summarize the reviewed target, checks performed, and material gaps such as an unavailable test environment, missing migration state, or unverified external contract. Do not invent a minor issue to make the review appear productive.
