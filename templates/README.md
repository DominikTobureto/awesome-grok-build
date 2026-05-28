# Templates

Copy a stack pack into your project, then adjust commands to match the repo.

```bash
cp templates/nextjs/AGENTS.md /path/to/project/AGENTS.md
cp templates/nextjs/.grokignore /path/to/project/.grokignore
```

Stack packs (AGENTS.md + .grokignore + README):

- `python-fullstack` — full-stack Python/JS project
- `fastapi` — FastAPI service with API, DB, and security rules
- `nextjs` — Next.js App Router with server/client boundaries

Generic AGENTS.md templates:

- [`AGENTS.fullstack.md`](AGENTS.fullstack.md) — SaaS, dashboards, full-stack repos
- [`AGENTS.library.md`](AGENTS.library.md) — open-source packages and SDKs
- [`AGENTS.docs.md`](AGENTS.docs.md) — docs repos, awesome lists, knowledge bases
- [`AGENTS.security.md`](AGENTS.security.md) — security-sensitive codebases

.grokignore variants:

- [`grokignore.default`](grokignore.default) — safe default patterns
- [`grokignore.node`](grokignore.node) — Node.js/TypeScript projects
- [`grokignore.python`](grokignore.python) — Python projects
