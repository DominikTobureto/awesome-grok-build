# AGENTS.md

## Project Type

FastAPI service. Optimize for explicit request/response schemas, auth boundaries, database safety, pytest coverage, and predictable API behavior.

## Required Agent Behavior

- Use Plan Mode for route design, auth, migrations, background jobs, caching, or dependency changes.
- Use `python-expert`, `tdd-test-engineer`, `security-audit`, `performance-optimizer`, and `architecture-review`.
- Use subagents for route/schema, data access, tests, and security review.
- Ask before changing OpenAPI contracts or database schemas.

## API Rules

- Validate inputs with existing Pydantic models or project validation patterns.
- Keep response schemas explicit.
- Do not trust client-side authorization.
- Treat async DB/session handling carefully.
- Add regression tests for every bug fix.

## Verification

Discover commands first. Common checks:

```bash
pytest -q
pytest tests/api -q
ruff check .
mypy .
```

## Safety

- Do not log tokens, cookies, headers, or secrets.
- Do not run destructive migrations.
- Do not weaken auth for tests.
