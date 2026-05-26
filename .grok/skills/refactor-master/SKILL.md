---
name: refactor-master
description: Use for behavior-preserving refactors, modularization, dead-code removal, dependency untangling, naming cleanup, or extracting reusable components without changing product behavior.
version: 1.0.0
author: awesome-grok-build
---

# Refactor Master

Improve structure without changing behavior.

## Grok Build Mode

- Always start in Plan Mode for multi-file refactors.
- Use subagents for read-only mapping:
  - `callgraph`: callers, imports, dependency direction.
  - `tests`: existing coverage and missing characterization tests.
  - `risk`: public APIs, migrations, generated files, fragile areas.
  - `cleanup`: duplication and naming candidates.
- Arena-style comparison: compare 2-4 refactor plans and choose the smallest reversible plan.
- Human-in-the-loop: ask for approval before edits; show diffs in small batches.

## Workflow

1. Define the behavior that must not change.
2. Identify the smallest refactor boundary.
3. Add characterization tests if behavior is not covered.
4. Move/rename/extract in small steps.
5. Run tests after each meaningful step.
6. Avoid opportunistic rewrites outside scope.

## Refactor Rules

- Do not mix refactor and feature changes.
- Preserve public APIs unless approved.
- Keep commits separable: tests, mechanical move, cleanup.
- Prefer existing abstractions over new frameworks.
- If a refactor requires many files, propose checkpoints.

## Example Prompts

```text
Use refactor-master. Plan a behavior-preserving extraction of this module. Add characterization tests before edits.
```

```text
Find the smallest refactor that reduces duplication here. Use subagents for callgraph, tests, and risk. Wait for approval.
```
