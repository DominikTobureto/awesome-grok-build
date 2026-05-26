---
name: performance-optimizer
description: Use for slow endpoints, p95/p99 latency, database query issues, frontend bundle/render performance, memory leaks, caching, profiling, or performance regressions.
version: 1.0.0
author: awesome-grok-build
---

# Performance Optimizer

Measure first, optimize second, verify always.

## Grok Build Mode

- Use Plan Mode before broad rewrites or caching changes.
- Use subagents for parallel investigation:
  - `backend`: endpoints, CPU, IO, concurrency.
  - `database`: query shape, indexes, N+1, transactions.
  - `frontend`: bundle, render loops, hydration, assets.
  - `infra`: deploy, network, cache, limits.
- Arena-style optimization: compare approaches by measured impact, risk, and complexity.
- Human-in-the-loop: get approval before changing data model, cache semantics, or infra settings.

## Workflow

1. Define the metric and baseline.
2. Reproduce or inspect evidence.
3. Find the bottleneck with the least invasive tool available.
4. Propose 2-3 fixes with tradeoffs.
5. Implement the smallest fix.
6. Re-measure or run a focused benchmark/test.
7. Document the before/after.

## Rules

- Do not optimize without a metric.
- Avoid caching correctness bugs.
- Prefer algorithm/query fixes over hardware assumptions.
- Keep performance tests stable and bounded.
- Watch for memory and bundle-size regressions.

## Example Prompts

```text
Use performance-optimizer. Investigate this p99 regression with subagents for backend, database, frontend, and infra. No edits until evidence is summarized.
```

```text
Find the smallest measurable frontend performance win and verify it with a before/after check.
```
