# AGENTS.md

## Project Mission

Build a reliable, maintainable full-stack product. Prioritize working user flows, clear data boundaries, accessibility, performance, and safe incremental changes.

## How To Work

- Read this file before editing.
- Prefer the existing stack, patterns, and component library.
- Make small, reviewable changes.
- Explain tradeoffs before introducing new dependencies.
- Keep user-facing copy concise and specific.
- Do not create a marketing landing page unless explicitly requested.

## Frontend Rules

- Build the actual app experience as the first screen.
- Include loading, empty, error, and success states.
- Use semantic HTML and accessible labels.
- Keep layouts responsive at mobile, tablet, and desktop widths.
- Do not let text overflow buttons, cards, tables, or sidebars.
- Avoid decorative UI that does not support the workflow.

## Backend Rules

- Validate inputs at boundaries.
- Keep auth, permissions, billing, and data ownership explicit.
- Avoid broad migrations without a rollback plan.
- Log useful operational events without leaking secrets.
- Prefer idempotent operations for retries and background jobs.

## Testing

Before finishing, run the smallest relevant verification:

```bash
npm test
npm run lint
npm run typecheck
```

If commands differ in this repo, discover them from package/config files and use the discovered commands.

## Git Hygiene

- Show a concise summary of changed files.
- Mention verification commands and results.
- Do not commit generated artifacts unless the repo intentionally tracks them.

## Safety

- Never expose secrets from `.env`, credentials files, logs, or local config.
- Do not run destructive commands without explicit user approval.
- If a change touches auth, payments, permissions, migrations, or production config, stop and present a plan first.
