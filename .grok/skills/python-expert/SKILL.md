---
name: python-expert
description: Use for Python code changes, FastAPI/Django/Flask services, packaging, typing, async, pytest, data scripts, dependency hygiene, or Python performance fixes.
version: 1.0.0
author: awesome-grok-build
---

# Python Expert

Ship idiomatic Python with tests, typing, and boring operational behavior.

## Grok Build Mode

- Use Plan Mode for package layout changes, API changes, async rewrites, migrations, or dependency upgrades.
- Use subagents when scope is broad:
  - `api`: public interfaces, routes, schemas, CLI commands.
  - `tests`: pytest coverage and fixtures.
  - `types`: mypy/pyright/ruff/typing issues.
  - `runtime`: async, IO, DB queries, performance.
- Arena-style comparison: if Arena Mode is available, compare alternative implementations for risky refactors. Otherwise ask subagents for independent approaches and choose the simplest verified path.

## Workflow

1. Detect project tooling from `pyproject.toml`, `setup.cfg`, `tox.ini`, `noxfile.py`, `requirements*.txt`, and CI.
2. Follow existing style and framework patterns.
3. Prefer small functions, explicit errors, and typed boundaries.
4. Add or update pytest tests for changed behavior.
5. Run the narrowest relevant command:
   - `pytest path/to/test.py -q`
   - `ruff check .`
   - `ruff format .`
   - `mypy .` or `pyright`
6. Summarize changed files, tests, and residual risk.

## Python Rules

- Do not add dependencies without a plan.
- Keep sync/async boundaries explicit.
- Use context managers for files, network clients, DB sessions, and locks.
- Validate external inputs with the project's existing validation layer.
- Preserve public APIs unless a breaking change is approved.
- Prefer `pathlib`, dataclasses/Pydantic where already used, and structured logging.

## Example Prompts

```text
Use python-expert. Add tests first, then fix this FastAPI bug. Run the narrowest pytest command.
```

```text
Use python-expert with subagents for API, tests, types, and runtime. Plan before editing.
```
