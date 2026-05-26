# AGENTS.md

## Project Mission

Maintain a small, stable, well-documented open-source library. Optimize for API clarity, compatibility, tests, and predictable releases.

## How To Work

- Preserve public APIs unless the user explicitly requests a breaking change.
- Read changelog, tests, and package metadata before editing.
- Prefer minimal dependencies.
- Keep examples runnable.
- Update docs when behavior changes.

## API Rules

- Treat exported names, CLI flags, config keys, and error shapes as contracts.
- Add deprecation notes before removing behavior.
- Prefer explicit errors over silent fallback.
- Keep types and docs aligned.

## Testing

Discover the repo's commands first. Common commands:

```bash
npm test
npm run typecheck
npm run lint
pytest
cargo test
go test ./...
```

Run the narrowest command that validates the changed behavior.

## Release Notes

For user-visible changes, include:

- what changed;
- why it changed;
- migration notes if needed;
- test coverage added.

## Safety

- Do not publish packages.
- Do not rotate versions unless requested.
- Do not rewrite history.
