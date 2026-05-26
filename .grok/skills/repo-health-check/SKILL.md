---
name: repo-health-check
description: Use when auditing a repo before changes to find the smallest safe PR, quality risks, stale docs, missing tests, ignored-file gaps, or agent setup issues. Best first skill for unfamiliar codebases.
version: 2.0.0
author: awesome-grok-build
---

# Repo Health Check

Find the smallest useful change with the best risk/reward ratio.

## Grok Build Mode

- Start in Plan Mode for unfamiliar repos or when changes may touch multiple subsystems.
- Use subagents for parallel read-only discovery when the repo is medium/large:
  - `structure`: map stack, entry points, and package managers.
  - `quality`: find test, lint, typecheck, CI, and coverage signals.
  - `docs`: compare README commands with real config.
  - `safety`: inspect `.gitignore`, `.grokignore`, secrets patterns, hooks, and AGENTS.md.
- Arena-style comparison: if Grok Build exposes Arena Mode, run candidate-first-PR proposals against 3-5 agents and rank by verification confidence. Otherwise simulate by asking subagents for independent candidates.

## Workflow

1. Read repo instructions: `AGENTS.md`, `README.md`, package/config files, CI files.
2. Identify project type, main runtime, package manager, and quality gates.
3. Look for high-signal risks:
   - stale or missing setup docs;
   - absent tests around core behavior;
   - failing lint/type/test commands;
   - generated output committed unexpectedly;
   - missing `.grokignore` or obvious secret exposure;
   - dependency and lockfile mismatch;
   - unsafe hooks or unclear agent instructions.
4. Produce 3 candidate PRs ranked by impact, size, blast radius, and verification confidence.
5. Ask for human approval before edits.
6. Implement only the chosen candidate.
7. Run the smallest relevant lint/test/type/docs check.
8. Summarize changed files and residual risks.

## Git Discipline

- Never commit generated junk, secrets, or local agent state.
- Keep the first PR tiny.
- If tests fail for unrelated reasons, capture the exact failure and avoid broad cleanup.

## Example Prompts

```text
Use repo-health-check. Inspect this repo and propose the smallest safe PR we should ship first. Do not edit yet.
```

```text
Run repo-health-check with subagents for structure, tests, docs, and safety. Rank the top 3 fixes and wait for my approval.
```

## Output

Start with:

```text
Bottom line: <one sentence>
```

Then provide:

- repo type and stack;
- discovered commands;
- top risks;
- 3 candidate PRs;
- recommended first PR;
- verification plan;
- whether edits require Plan Mode approval.

## Guardrails

- Do not invent test commands. Read package/config files first.
- Do not edit generated files unless the repo intentionally tracks them.
- Do not upgrade dependencies unless explicitly requested.
- If no safe command is available, explain what could not be verified.
