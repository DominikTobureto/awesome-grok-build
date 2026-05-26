---
name: agentic-code-review
description: Use when reviewing a diff, pull request, branch, or AI-generated code for correctness, security, regression, test, performance, and maintainability risks before merge.
version: 2.0.0
author: awesome-grok-build
---

# Agentic Code Review

Review like a senior engineer who wants the change to ship safely.

## Grok Build Mode

- Use Plan Mode only if the review requires a fix plan. Pure review is read-only.
- Use subagents for independent passes on risky diffs:
  - `correctness`: behavior and edge cases.
  - `security`: auth, permissions, secrets, injection, dependency risk.
  - `tests`: coverage and missing regression tests.
  - `performance`: complexity, queries, caching, bundle size.
- Arena-style review: if Arena Mode is available, compare independent review outputs and keep only findings with concrete failure paths. Otherwise synthesize subagent findings and dedupe.
- Human-in-the-loop: never auto-apply fixes unless the user explicitly asks. Findings first, fixes after approval.

## Review Priority

1. Correctness bugs.
2. Security and privacy risks.
3. Data loss, migrations, auth, payments, permissions, and concurrency.
4. Missing or weak tests.
5. Performance regressions.
6. Developer experience and maintainability.
7. Style only when it blocks comprehension or violates repo conventions.

## Process

1. Read the diff and the surrounding code.
2. Identify the intended behavior from the issue, README, tests, or prompt.
3. Check whether the implementation actually satisfies that behavior.
4. Look for edge cases and failure modes.
5. Verify test coverage maps to the risk.
6. Run narrow verification only if the user asked for fix validation or the repo has cheap checks.
7. Produce findings first. Keep summary short.

## Finding Format

Use this format:

```text
[P1] Title
File: path/to/file.ext:line
Problem: ...
Why it matters: ...
Suggested fix: ...
```

Severity:

- `P0`: must fix before merge, production-breaking or data/security critical.
- `P1`: should fix before merge.
- `P2`: useful fix, not necessarily blocking.
- `P3`: polish or follow-up.

## Example Prompts

```text
Use agentic-code-review on the current diff. Findings first. Ignore style unless it creates real risk.
```

```text
Review this PR with subagents for correctness, security, tests, and performance. Dedupe findings and keep only actionable issues.
```

## Git Best Practices

- Review staged and unstaged changes separately when possible.
- Mention untracked files that affect the change.
- Do not recommend committing until verification is complete.
- If proposing fixes, keep each fix scoped to one finding.

## Guardrails

- Do not list style nits as findings unless they create real risk.
- Do not claim a bug without a concrete failure path.
- If the diff is safe, say so and name residual risks or missing verification.
- Prefer references to exact files and lines.
