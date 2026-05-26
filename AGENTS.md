# AGENTS.md

## Mission

This repository is a community starter kit and skill pack for xAI Grok Build. Optimize for practical utility, source accuracy, reusable `.grok/skills`, and clear setup for developers trying Grok Build.

## Operating Principles

- Read the relevant docs before editing: `README.md`, `CONTRIBUTING.md`, and files under `docs/`.
- Keep claims about Grok Build grounded in official xAI sources or clearly label them as community observations.
- Prefer small, reviewable edits with clear diffs.
- Preserve the repo's positioning: `awesome list + starter kit + skill library + community registry`.
- Use concise English for public repo content unless a file is explicitly localized.
- Do not add affiliate links, tracking links, or overstated claims.
- Do not imply this project is official xAI software.

## Source Policy

For fast-moving Grok Build information:

- Verify official facts against `https://x.ai/cli` or `https://docs.x.ai/build/`.
- Community projects must be linked to their source repo or public demo.
- If a feature is reported by users but not in official docs, mark it as "community reported" or "experimental".
- Include dates when describing launch timing or beta availability.

## File Conventions

- `README.md` is the front page and should stay skimmable.
- `docs/analysis.md` holds longer market and feature analysis.
- `docs/best-practices.md` holds durable workflow advice.
- `docs/comparison.md` holds deeper tool comparisons.
- `.grok/skills/<name>/SKILL.md` files should be narrow, reusable, safe, and Grok-native.
- `templates/` should contain copy-pasteable project files.
- `examples/` should contain prompts and usage patterns.

## Ready-to-Use Skills

The repo currently ships these core skills:

| Skill | Purpose |
| --- | --- |
| `repo-health-check` | First-pass repo audit and smallest safe PR selection. |
| `agentic-code-review` | Senior review of diffs and PRs. |
| `python-expert` | Python, FastAPI/Django/Flask, pytest, typing, async, packaging. |
| `refactor-master` | Behavior-preserving refactors with characterization tests. |
| `git-github-flow` | Commits, PRs, review response, changelogs, merge readiness. |
| `research-agent` | Web/X research and source-backed docs updates. |
| `tdd-test-engineer` | Test-first fixes, regression tests, flaky test debugging. |
| `architecture-review` | Modular/clean/hexagonal architecture and ADR planning. |
| `security-audit` | Auth, secrets, injection, dependencies, hook safety. |
| `performance-optimizer` | Latency, queries, frontend perf, profiling, caching. |
| `frontend-ux-engineer` | Product UI, accessibility, responsive states, visual QA. |
| `nextjs-fullstack` | Next.js App Router, RSC, server actions, caching, auth. |
| `hooksmith` | Safe Grok Build hook design and review. |

When editing skills, keep them portable. They should work when copied into another repo's `.grok/skills/` directory.

## Quality Bar

Before finishing changes:

- Check Markdown links you touched.
- Make sure tables render correctly.
- Keep headings stable unless there is a clear reason to rename them.
- Remove dead links and stale claims.
- Add a short note to PRs explaining whether sources are official, community, or inferred.

## Skill Authoring Rules

When adding or editing skills:

- Start each `SKILL.md` with YAML frontmatter: `name`, `description`, `version`, and `author`.
- Keep the description trigger-specific.
- Include Grok Build behavior: Plan Mode, subagents, Arena-style comparison where useful, human approval, verification, and git discipline.
- Put long examples in a sibling `examples/` or `references/` directory.
- Avoid hidden destructive behavior.
- If a skill asks the agent to run commands, specify when to ask for user approval.
- Prefer "discover commands from the repo" over hardcoding `npm`/`pytest` unless the skill is stack-specific.

## Safety

- Never commit secrets, API keys, auth tokens, private logs, or `.env` files.
- Treat hook examples as security-sensitive. Explain what events trigger them and what commands they run.
- Do not add project hooks that mutate files silently.
- Prefer read-only checks or formatters with obvious output.
- Treat third-party skills as untrusted until reviewed.

## Review Stance

When asked to review changes, lead with bugs, broken links, incorrect claims, security risks, and missing tests. Keep style suggestions secondary.
