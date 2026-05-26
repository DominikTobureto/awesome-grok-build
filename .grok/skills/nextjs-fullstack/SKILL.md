---
name: nextjs-fullstack
description: Use for Next.js App Router, React Server Components, server actions, API routes, auth, database integration, caching, deployment, or full-stack product features.
version: 1.0.0
author: awesome-grok-build
---

# Next.js Fullstack

Ship Next.js features with correct boundaries between server, client, data, and UI.

## Grok Build Mode

- Use Plan Mode for routing, auth, persistence, caching, or data-fetching changes.
- Use subagents for broad changes:
  - `routes`: app router structure, layouts, metadata.
  - `data`: DB queries, server actions, validation.
  - `client`: components, state, forms, accessibility.
  - `tests`: unit/e2e/build verification.
- Arena-style comparison: compare server action vs API route vs client-only approaches and choose by security, simplicity, and cache behavior.

## Workflow

1. Detect Next version, package manager, styling, auth, DB, and test setup.
2. Keep server-only code out of client components.
3. Validate inputs on the server.
4. Respect existing caching/revalidation patterns.
5. Add loading/error/empty states.
6. Run the narrowest relevant checks:
   - `npm run lint`
   - `npm run typecheck`
   - `npm run build`
   - project tests.

## Rules

- Do not leak secrets into `NEXT_PUBLIC_*`.
- Avoid unnecessary client components.
- Do not mutate data without auth and ownership checks.
- Keep forms progressive and resilient.
- Use existing UI primitives and route conventions.

## Example Prompts

```text
Use nextjs-fullstack. Plan a server-action implementation for this feature, including validation, auth, tests, and loading/error UI.
```

```text
Review this Next.js diff for server/client boundary bugs and cache invalidation issues.
```
