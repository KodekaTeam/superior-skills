# Security Policy

## Supported versions

Security updates are provided for the current release line.

| Version | Supported |
| --- | --- |
| `v1.0.x` | Yes |
| Earlier or unreleased copies | No guaranteed support |

Users should reproduce a report against the latest available revision before submitting it when doing so is safe.

## Reporting a vulnerability

Do not disclose a suspected vulnerability in a public issue, discussion, pull request, or implementation-timeline record.

Use the repository hosting platform's private vulnerability-reporting feature when available. If it is unavailable, contact the repository maintainers privately through the account or organization that owns the repository. Do not send working secrets, production data, or unnecessary personal information.

Include:

- the affected version, skill, reference, script, or installation path;
- the security impact and realistic threat scenario;
- the minimum steps or artifact needed to reproduce the problem safely;
- affected environments or configurations;
- known mitigations or workarounds;
- whether the issue is already public or actively exploited.

Use sanitized examples and test environments. Do not probe systems, accounts, integrations, or repositories that you do not own or have explicit permission to test.

## Relevant security issues

Reports may include:

- instructions that encourage unsafe destructive commands or bypass authorization boundaries;
- secret, credential, personal-data, or private-infrastructure disclosure;
- path traversal, unsafe archive extraction, or writes outside the intended workspace;
- prompt or content injection that can cross a documented trust boundary;
- insecure defaults in generated authentication, authorization, API, plugin, or deployment guidance;
- scripts that execute unintended commands or trust unvalidated input;
- dependency or supply-chain risks introduced by this package.

General feature requests, style disagreements, and ordinary documentation errors should use the normal contribution process unless they create a concrete security impact.

## Handling reports

Maintainers will assess reproducibility, impact, affected versions, and a safe remediation path. Response and release timing depend on severity, maintainer availability, and coordination requirements; this policy does not promise a fixed service-level agreement.

When appropriate, maintainers will:

1. acknowledge the report through the private channel;
2. reproduce and scope the issue;
3. prepare and validate a fix or mitigation;
4. coordinate disclosure with the reporter;
5. publish an updated version and security notes without exposing unnecessary exploit detail.

Please allow a reasonable opportunity to investigate and remediate before public disclosure. Good-faith reports that follow this policy are appreciated.
