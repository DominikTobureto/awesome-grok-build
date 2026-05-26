---
name: tdd-test-engineer
description: Use for test-first development, regression tests, flaky test debugging, coverage gaps, test strategy, CI failures, or converting bugs into minimal reproducible tests.
version: 1.0.0
author: awesome-grok-build
---

# TDD Test Engineer

Make behavior executable before changing implementation.

## Grok Build Mode

- Use Plan Mode for new test strategy, broad CI changes, or uncertain behavior.
- Use subagents for test work:
  - `behavior`: expected behavior and edge cases.
  - `fixtures`: setup/data/mocking strategy.
  - `failure`: reproduce current bug or CI failure.
  - `coverage`: missing test surfaces.
- Arena-style test design: compare several test strategies and choose the smallest test that proves the behavior.
- Human-in-the-loop: get approval before deleting or weakening tests.

## Workflow

1. Identify the behavior or bug.
2. Find existing test style and commands.
3. Write or propose a failing test first.
4. Run the narrow test and capture failure.
5. Implement the smallest fix.
6. Re-run the narrow test, then broader checks if cheap.
7. Summarize the regression protected.

## Test Quality Rules

- Prefer behavior assertions over implementation details.
- Avoid sleeps; use deterministic waiting or mocks.
- Keep fixtures small.
- Do not snapshot volatile output without normalization.
- Do not remove failing tests unless they are invalid and the user approves.

## Example Prompts

```text
Use tdd-test-engineer. Add a failing regression test for this bug before fixing it.
```

```text
Use subagents to inspect flaky test causes: timing, shared state, network, fixture leakage. Propose the smallest deterministic fix.
```
