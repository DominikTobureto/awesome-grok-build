# AGENTS.md

## Project Type

Python full-stack application. Optimize for clear boundaries between UI, API, background jobs, data access, and tests.

## Required Agent Behavior

- Start in Plan Mode for new features, migrations, auth, background jobs, dependency upgrades, or broad refactors.
- Prefer existing framework patterns.
- Use `python-expert`, `tdd-test-engineer`, `security-audit`, `architecture-review`, and `performance-optimizer` when relevant.
- Use subagents for broad work: API, data, UI, tests, security.
- Ask for approval before adding dependencies or changing database schema.

## Discovery

Inspect these before edits:

- `pyproject.toml`
- `requirements*.txt`
- `package.json`
- `docker-compose.yml`
- CI workflow files
- existing tests

## Verification

Discover commands from config. Common checks:

```bash
pytest -q
ruff check .
ruff format --check .
mypy .
npm run lint
npm run build
```

## Safety

- Never print `.env` values.
- Do not run migrations against production.
- Validate inputs at API boundaries.
- Preserve auth and tenant boundaries.
