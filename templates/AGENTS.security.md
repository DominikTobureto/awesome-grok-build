# AGENTS.md

## Project Mission

Make secure, auditable changes. Protect credentials, user data, production systems, and supply chain integrity.

## Mandatory Review Triggers

Stop and present a plan before editing anything involving:

- authentication or authorization;
- payments or billing;
- database migrations;
- encryption or key management;
- dependency installation or upgrade;
- CI/CD secrets;
- infrastructure or deployment config;
- shell execution with user-controlled input.

## Secure Coding Rules

- Validate inputs at trust boundaries.
- Use parameterized queries.
- Enforce authorization on server-side operations.
- Treat client-side checks as UX, not security.
- Avoid logging secrets, tokens, cookies, or personal data.
- Prefer deny-by-default permission logic.

## Dependency Rules

- Do not add dependencies unless necessary.
- Prefer mature packages with active maintenance.
- Check lockfile changes.
- Do not run install scripts from unknown sources without approval.

## Testing

Add or update tests for:

- auth decisions;
- permission boundaries;
- malicious or malformed inputs;
- migration edge cases;
- regression cases for reported vulnerabilities.

## Reporting

When summarizing changes, include:

- security-sensitive files touched;
- threat model assumption;
- tests run;
- residual risk.
