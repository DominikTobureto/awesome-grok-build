---
name: architecture-review
description: Use for clean architecture, modular monoliths, hexagonal boundaries, service boundaries, data flow, dependency direction, ADRs, or large feature planning.
version: 1.0.0
author: awesome-grok-build
---

# Architecture Review

Design the smallest architecture that can survive the next real change.

## Grok Build Mode

- Start in Plan Mode. Architecture work should not begin with edits.
- Use subagents for parallel discovery:
  - `domain`: core entities, use cases, invariants.
  - `data`: persistence, schemas, migrations, ownership.
  - `interfaces`: APIs, UI boundaries, jobs, integrations.
  - `risk`: coupling, circular dependencies, deployment constraints.
- Arena-style design: compare 2-3 architecture options and rank by reversibility, simplicity, and testability.
- Human-in-the-loop: ask for approval before introducing new layers, packages, services, or dependencies.

## Workflow

1. Clarify the product/job-to-be-done.
2. Map current modules and data flow.
3. Identify constraints: runtime, team, deploy, scale, compliance.
4. Propose options:
   - minimal change;
   - modular boundary;
   - larger redesign if justified.
5. Recommend one path with migration steps.
6. Define tests and observability needed.

## Architecture Rules

- Prefer modular boundaries over premature microservices.
- Keep dependency direction explicit.
- Put business rules where they can be tested without infrastructure.
- Avoid abstract factories/layers unless they remove real coupling.
- Write an ADR for major choices.

## Example Prompts

```text
Use architecture-review. Compare clean/hexagonal/modular approaches for this feature and recommend the smallest reversible plan.
```

```text
Map the current data flow with subagents, identify coupling risks, and propose an ADR before edits.
```
