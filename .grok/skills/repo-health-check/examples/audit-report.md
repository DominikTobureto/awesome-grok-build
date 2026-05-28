# Example Audit Report

This is a realistic output from `repo-health-check` run on a typical Next.js SaaS project.

---

## Bottom line

The repo is a healthy Next.js App Router SaaS with Prisma + PostgreSQL. The smallest safe PR is adding a `.grokignore` file to prevent Grok Build from reading `node_modules/` and `.env` files.

## Repo Type & Stack

- **Type:** Full-stack SaaS (multi-tenant dashboard)
- **Runtime:** Node.js 20, Next.js 14 (App Router)
- **Package manager:** pnpm (lockfile: `pnpm-lock.yaml`)
- **Database:** PostgreSQL via Prisma ORM
- **Auth:** NextAuth.js with GitHub + Google providers
- **Testing:** Vitest (unit) + Playwright (E2E)
- **CI:** GitHub Actions (lint, typecheck, test, build)

## Discovered Commands

| Command | Status |
|---------|--------|
| `pnpm lint` | runs ESLint — passes |
| `pnpm typecheck` | runs `tsc --noEmit` — passes |
| `pnpm test` | runs Vitest — 23/23 passing |
| `pnpm test:e2e` | runs Playwright — 8/8 passing |
| `pnpm build` | runs `next build` — succeeds |

## Top Risks

1. **Missing `.grokignore`** — Grok Build will scan `node_modules/` (12,000+ files) and could read `.env` files. Low effort, high impact fix.
2. **No API-level test coverage** — API routes under `src/app/api/` have no direct tests. Covered indirectly by E2E, but refactoring risk is elevated.
3. **Stale `CONTRIBUTING.md`** — references `yarn` as package manager, but the lockfile is `pnpm-lock.yaml`. Low risk, easy fix.
4. **Hardcoded Stripe test key in a comment** — `src/lib/stripe.ts` line 22 has a commented-out `sk_test_...`. Not a live key, but should be removed.

## Candidate PRs

### PR 1: Add `.grokignore` ✦✦✦✦✦ (Recommended)

- **Impact:** Prevents agent from scanning 12k+ vendor files
- **Size:** 1 new file, ~15 lines
- **Blast radius:** None
- **Verification:** `grok inspect` shows fewer discoverable files

### PR 2: Fix stale `CONTRIBUTING.md`

- **Impact:** Stops contributors from using wrong package manager
- **Size:** 3 line changes
- **Blast radius:** None
- **Verification:** Manual review

### PR 3: Remove commented-out Stripe test key

- **Impact:** Eliminates false-positive secret scanning alerts
- **Size:** 1 line deletion
- **Blast radius:** None
- **Verification:** `rg sk_test` returns zero results

## Recommended First PR

**PR 1 — Add `.grokignore`.** Highest impact-to-effort ratio. Zero risk. Enables safer agent operation immediately.

## Verification Plan

1. Copy `templates/grokignore.node` to `.grokignore`
2. Run `grok inspect` and confirm `node_modules/` is excluded
3. Optionally add project-specific ignores (`.vercel/`, `playwright-report/`)

## Residual Risks

- E2E tests rely on a seeded database — flaky if seed changes
- No CODEOWNERS file — unclear who reviews what
