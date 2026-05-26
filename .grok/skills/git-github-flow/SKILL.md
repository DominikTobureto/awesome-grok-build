---
name: git-github-flow
description: Use for branch prep, clean commits, PR descriptions, GitHub issue triage, changelogs, release notes, review response, merge readiness, or publishing a branch safely.
version: 1.0.0
author: awesome-grok-build
---

# Git GitHub Flow

Turn local changes into a clean, reviewable contribution.

## Grok Build Mode

- Use Plan Mode before rewriting commits, rebasing, force-pushing, or touching release branches.
- Use subagents for merge readiness:
  - `diff`: changed files and intent.
  - `tests`: verification status and gaps.
  - `docs`: README/changelog/release notes.
  - `risk`: risky files, migrations, auth, config.
- Arena-style PR description: generate 2-3 PR narratives and choose the clearest.
- Human-in-the-loop: never push, force-push, publish, or merge without explicit user approval.

## Workflow

1. Inspect `git status`, branch, remotes, and recent commits.
2. Separate unrelated changes.
3. Stage intentionally.
4. Write a concise commit message:
   - imperative subject;
   - why in body when useful;
   - tests run.
5. Draft PR description with:
   - summary;
   - screenshots/demo if relevant;
   - verification;
   - risks;
   - follow-ups.
6. Push only after approval.

## GitHub Best Practices

- Link issues when known.
- Keep PRs small and coherent.
- Do not include secrets or local config.
- Do not mark generated files for review unless necessary.
- Address review comments with targeted commits.

## Example Prompts

```text
Use git-github-flow. Prepare a clean commit and PR description from my current diff. Do not push yet.
```

```text
Use git-github-flow to respond to PR review comments. Preserve unrelated user changes.
```
