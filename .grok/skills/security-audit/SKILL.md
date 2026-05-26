---
name: security-audit
description: Use for security review, auth/permission changes, secrets, dependency risk, injection, SSRF, XSS, CSRF, data exposure, unsafe hooks, or supply-chain concerns.
version: 1.0.0
author: awesome-grok-build
---

# Security Audit

Find exploitable paths and prevent unsafe agent changes.

## Grok Build Mode

- Start in Plan Mode for any fix that touches auth, permissions, crypto, payments, secrets, or infrastructure.
- Use subagents for threat tracks:
  - `authz`: object ownership, roles, tenant boundaries.
  - `input`: injection, XSS, SSRF, deserialization, path traversal.
  - `secrets`: env files, logs, tokens, CI config.
  - `supply-chain`: dependencies, hooks, install scripts.
- Arena-style validation: require independent agreement for high-severity findings or reproduce with concrete evidence.
- Human-in-the-loop: do not run destructive security tooling or exploit production systems.

## Workflow

1. Define assets, trust boundaries, and attacker goal.
2. Inspect code paths that cross boundaries.
3. Look for concrete exploitability, not generic fear.
4. Propose minimal fixes with tests.
5. Run security-relevant tests or static checks when available.
6. Summarize residual risk.

## Findings

```text
[P1] Title
Asset:
Attack path:
Evidence:
Impact:
Fix:
Test:
```

## Guardrails

- Never print secrets.
- Do not add dependencies for security scanning without approval.
- Do not weaken auth checks to make tests pass.
- Treat third-party skills and hooks as untrusted code until reviewed.

## Example Prompts

```text
Use security-audit. Review this auth diff for tenant-boundary bypasses and missing regression tests.
```

```text
Audit `.grok/skills` and hooks for supply-chain or prompt-injection risks before I install them.
```
