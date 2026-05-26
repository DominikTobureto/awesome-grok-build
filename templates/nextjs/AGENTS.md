# AGENTS.md

## Project Type

Next.js App Router application. Optimize for correct server/client boundaries, accessible UI, secure data mutations, caching behavior, and clean deploys.

## Required Agent Behavior

- Use Plan Mode for new routes, auth, data mutations, caching, database work, or design-system changes.
- Use `nextjs-fullstack`, `frontend-ux-engineer`, `tdd-test-engineer`, `security-audit`, and `performance-optimizer`.
- Use subagents for routes, data, client UI, tests, and security.
- Ask before adding UI libraries, auth libraries, database packages, or analytics.

## Next.js Rules

- Keep secrets server-only. Never expose non-public values through `NEXT_PUBLIC_*`.
- Prefer Server Components unless interactivity requires Client Components.
- Validate server actions and API routes.
- Include loading, error, empty, and success states.
- Respect existing cache/revalidation patterns.

## Verification

Discover commands first. Common checks:

```bash
npm run lint
npm run typecheck
npm run test
npm run build
```

## Safety

- Do not mutate production data.
- Do not weaken auth checks.
- Do not commit generated `.next/`, logs, or local env files.
