# Awesome Grok Build 🚀

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Skills Validated](https://img.shields.io/badge/skills-validated-brightgreen.svg)](.github/workflows/skill-validate.yml)
[![Made with Grok Build](https://img.shields.io/badge/made%20with-Grok%20Build-black)](https://x.ai/cli)

> A practical awesome list, starter kit, and skill library for xAI's Grok Build CLI.

**One repo to learn, configure, extend, and ship with Grok Build.**

Grok Build is xAI's terminal-first coding agent for planning, editing, testing, reviewing, and shipping software from your repo. This repository curates official docs, useful community projects, reusable `.grok/skills`, AGENTS.md templates, `.grokignore` patterns, hook ideas, and practical workflows.

> Independent community project. Not affiliated with, endorsed by, or sponsored by xAI Corp. Grok and xAI are trademarks of their respective owners.

## Quick Start

Install Grok Build:

```bash
# macOS / Linux / WSL
curl -fsSL https://x.ai/cli/install.sh | bash

# Windows PowerShell
irm https://x.ai/cli/install.ps1 | iex
```

Use this starter kit in a project:

```bash
git clone https://github.com/DominikTobureto/awesome-grok-build.git
cd awesome-grok-build

# Inspect what Grok discovers: instructions, skills, plugins, hooks, MCPs.
grok inspect

# Start the TUI.
grok
```

Copy the parts you need:

```bash
# Skills
cp -R .grok/skills /path/to/your-project/.grok/

# Agent instructions
cp templates/AGENTS.fullstack.md /path/to/your-project/AGENTS.md

# Ignore file
cp templates/grokignore.default /path/to/your-project/.grokignore
```

Then open Grok and try:

```text
/skills
/plan
Use the repo-health-check skill and tell me the smallest safe PR we should ship first.
```

Install all skills into any repo in one command:

```bash
# macOS / Linux / WSL
curl -fsSL https://raw.githubusercontent.com/DominikTobureto/awesome-grok-build/main/install.sh | bash

# Windows PowerShell
irm https://raw.githubusercontent.com/DominikTobureto/awesome-grok-build/main/install.ps1 | iex
```

Or install into a specific directory:

```bash
bash install.sh /path/to/your-project
```

Manual install (clone + copy):

```bash
rm -rf /tmp/awesome-grok-build && git clone --depth 1 https://github.com/DominikTobureto/awesome-grok-build.git /tmp/awesome-grok-build && mkdir -p .grok && cp -R /tmp/awesome-grok-build/.grok/skills .grok/
```

Windows PowerShell:

```powershell
Remove-Item -Recurse -Force "$env:TEMP\awesome-grok-build" -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/DominikTobureto/awesome-grok-build.git "$env:TEMP\awesome-grok-build"; New-Item -ItemType Directory -Force .grok; Copy-Item -Recurse -Force "$env:TEMP\awesome-grok-build\.grok\skills" ".grok\"
```

## Contents

- [Why This Repo Exists](#why-this-repo-exists)
- [Official Resources](#official-resources)
- [What Grok Build Does](#what-grok-build-does)
- [Setup Guide](#setup-guide)
- [Ready-to-Use Skills 12+](#ready-to-use-skills-12)
- [Skills & Hooks](#skills--hooks)
- [AGENTS.md Templates](#agentsmd-templates)
- [Project Templates](#project-templates)
- [Community Projects](#community-projects)
- [Community Skills](#community-skills)
- [Tips & Tricks](#tips--tricks)
- [Comparison](#comparison)
- [Roadmap](ROADMAP.md)
- [Changelog](CHANGELOG.md)
- [Contributing](#contributing)

## Why This Repo Exists

Grok Build launched into a category already crowded with Claude Code, Cursor, Codex, Aider, Cline, OpenCode, Windsurf, and Devin.

The obvious "awesome list" is useful, but not enough. Builders need:

- official links that stay current;
- copy-pasteable AGENTS.md files;
- small, high-leverage skills;
- `.grokignore` patterns that keep agents away from secrets and junk;
- hook patterns for formatting, testing, and guardrails;
- practical prompts that produce clean diffs instead of chaos.

This repo is a reference set for configuring and extending Grok Build in real projects.

## Official Resources

| Resource | Why it matters |
| --- | --- |
| [Introducing Grok Build](https://x.ai/news/grok-build-cli) | Launch post, availability, install command, Plan Mode, subagents, workflow positioning. |
| [Grok Build product page](https://x.ai/cli) | Feature overview: skills, plugins, Q&A, subagents, headless mode, code review, git integration. |
| [Getting Started](https://docs.x.ai/build/overview) | Install, auth, `grok`, headless `-p`, custom models, `grok inspect`, API model usage. |
| [Skills, Plugins & Marketplaces](https://docs.x.ai/build/features/skills-plugins-marketplaces) | Discovery paths for `.grok/skills`, `.grok/plugins`, hooks, marketplace sources, AGENTS.md compatibility. |
| [Modes and Commands](https://docs.x.ai/build/modes-and-commands) | Plan Mode, permission mode, core slash commands, skills as commands. |
| [Headless & Scripting](https://docs.x.ai/build/cli/headless-scripting) | `grok -p`, JSON/streaming JSON output, `grok agent stdio`, ACP integrations. |
| [Enterprise Deployments](https://docs.x.ai/build/enterprise) | Network requirements, managed config, policy controls, proxy support. |

## What Grok Build Does

Based on official xAI docs and launch pages, Grok Build is built around:

- **Terminal-native TUI** for mouse-interactive coding sessions.
- **Plan Mode** where write tools are blocked until a plan is approved.
- **Subagents** for parallel investigation, testing, and implementation.
- **Skills** discovered from `.grok/skills/`, `~/.grok/skills/`, plugins, and configured paths.
- **Plugins and marketplaces** that bundle skills, hooks, MCP servers, agents, and LSP servers.
- **Hooks** that run scripts on tool/session lifecycle events after trust is granted.
- **AGENTS.md compatibility** for repo-scoped instructions.
- **Claude Code compatibility** for existing Claude instruction, skill, plugin, MCP, and hook setups.
- **Headless mode** via `grok -p` for scripts, CI, bots, and automations.
- **ACP support** via `grok agent stdio` for IDEs and custom agent orchestration.

## Setup Guide

For a practical walkthrough, see [`docs/grok-build-workflow-setup.md`](docs/grok-build-workflow-setup.md).

It covers:

- installing reusable `.grok/skills`;
- choosing an AGENTS.md template;
- adding a safe `.grokignore`;
- checking what Grok Build discovers with `grok inspect`;
- using Plan Mode before risky edits;
- keeping hooks explicit and reviewable.

## Ready-to-Use Skills 12+

These are portable Grok Build skills you can copy into any project under `.grok/skills/`. Each skill includes YAML frontmatter (`name`, `description`, `version`, `author`), Plan Mode guidance, subagent/Arena-style workflows, human approval checkpoints, lint/test verification, and git hygiene.

| Skill | What it does | Best first prompt |
| --- | --- | --- |
| [`repo-health-check`](.grok/skills/repo-health-check/SKILL.md) | Audits an unfamiliar repo and finds the smallest safe first PR. | `Use repo-health-check. Propose the smallest safe PR. Do not edit yet.` |
| [`agentic-code-review`](.grok/skills/agentic-code-review/SKILL.md) | Reviews diffs for correctness, security, tests, perf, and regression risk. | `Use agentic-code-review on the current diff. Findings first.` |
| [`python-expert`](.grok/skills/python-expert/SKILL.md) | Python, FastAPI, Django, Flask, pytest, typing, async, packaging. | `Use python-expert. Add a failing pytest first, then fix.` |
| [`refactor-master`](.grok/skills/refactor-master/SKILL.md) | Behavior-preserving refactors with characterization tests and small diffs. | `Use refactor-master. Plan before editing.` |
| [`git-github-flow`](.grok/skills/git-github-flow/SKILL.md) | Clean commits, PR descriptions, review response, merge readiness. | `Use git-github-flow. Prepare commit and PR text. Do not push.` |
| [`research-agent`](.grok/skills/research-agent/SKILL.md) | Current web/X research, source-backed docs, ecosystem scanning. | `Use research-agent. Verify current facts and cite sources.` |
| [`tdd-test-engineer`](.grok/skills/tdd-test-engineer/SKILL.md) | Test-first implementation, regression tests, flaky test debugging. | `Use tdd-test-engineer. Write the failing test first.` |
| [`architecture-review`](.grok/skills/architecture-review/SKILL.md) | Clean/hexagonal/modular architecture, ADRs, data flow, boundaries. | `Use architecture-review. Compare options and recommend the smallest reversible plan.` |
| [`security-audit`](.grok/skills/security-audit/SKILL.md) | Auth, permissions, injection, secrets, dependencies, hook safety. | `Use security-audit. Review this diff for exploitable paths.` |
| [`performance-optimizer`](.grok/skills/performance-optimizer/SKILL.md) | p95/p99 latency, DB queries, frontend performance, profiling, caching. | `Use performance-optimizer. Measure first, then propose fixes.` |
| [`frontend-ux-engineer`](.grok/skills/frontend-ux-engineer/SKILL.md) | Product UI, accessibility, responsive layout, states, visual QA. | `Use frontend-ux-engineer. Build the actual workflow, not a landing page.` |
| [`nextjs-fullstack`](.grok/skills/nextjs-fullstack/SKILL.md) | Next.js App Router, RSC, server actions, auth, caching, full-stack features. | `Use nextjs-fullstack. Plan server/client boundaries before edits.` |
| [`hooksmith`](.grok/skills/hooksmith/SKILL.md) | Safe hooks for lint, tests, notifications, command guards, trust review. | `Use hooksmith. Design a read-only post-edit lint hook.` |

The skills are written to be copied into other projects and adapted to local conventions.

## Skills & Hooks

Skills in this repo are designed around Grok Build's strengths:

- **Plan Mode** for ambiguous or risky work.
- **Subagents** for parallel read-only investigation.
- **Arena-style comparison** when multiple implementation/review strategies are plausible.
- **X search and web search** for current information when enabled.
- **Human-in-the-loop** diff approval before risky edits.
- **Lint/test gates** discovered from the repo, not invented.
- **Git discipline**: small diffs, staged intentionally, no secret or generated junk.

Skill best practices:

- Keep `SKILL.md` small and task-specific.
- Put long examples under `references/` or `examples/` instead of bloating the skill entrypoint.
- Give the skill a narrow trigger description so Grok invokes it only when useful.
- Prefer deterministic scripts for repeatable checks.
- Never hide destructive behavior inside a skill.

Hook best practices:

- Treat hooks like CI jobs, not prompt text.
- Start with read-only or formatting hooks.
- Require trust for project hooks and document every command they run.
- Keep secrets out of hook logs.
- Use hooks to surface test/lint output back to the agent, not to silently mutate unrelated files.

See [`docs/best-practices.md`](docs/best-practices.md) and [`examples/hooks.md`](examples/hooks.md).

## AGENTS.md Templates

| Template | Best for |
| --- | --- |
| [`AGENTS.fullstack.md`](templates/AGENTS.fullstack.md) | SaaS apps, dashboards, product builds, full-stack repos. |
| [`AGENTS.library.md`](templates/AGENTS.library.md) | Open-source packages and SDKs. |
| [`AGENTS.docs.md`](templates/AGENTS.docs.md) | Docs-heavy repos, awesome lists, knowledge bases. |
| [`AGENTS.security.md`](templates/AGENTS.security.md) | Security-sensitive codebases and audit workflows. |

Rule of thumb:

- Put stable project rules in `AGENTS.md`.
- Put reusable workflows in `.grok/skills/<name>/SKILL.md`.
- Put generated or private junk in `.grokignore`.
- Put deterministic checks in hooks.

## Project Templates

| File | Purpose |
| --- | --- |
| [`templates/grokignore.default`](templates/grokignore.default) | Safe default ignore patterns for AI coding agents. |
| [`templates/grokignore.node`](templates/grokignore.node) | Node/TypeScript-heavy projects. |
| [`templates/grokignore.python`](templates/grokignore.python) | Python projects, virtualenvs, notebooks, cache folders. |
| [`templates/python-fullstack`](templates/python-fullstack) | Python full-stack starter pack with AGENTS.md and `.grokignore`. |
| [`templates/fastapi`](templates/fastapi) | FastAPI service pack with API, DB, testing, and security rules. |
| [`templates/nextjs`](templates/nextjs) | Next.js App Router pack with server/client and UI rules. |
| [`examples/one-prompt-saas.md`](examples/one-prompt-saas.md) | A production-minded one-prompt SaaS scaffold request. |
| [`examples/prompts.md`](examples/prompts.md) | High-signal prompts for planning, review, migration, tests, and docs. |

## Community Projects

Early ecosystem links worth watching:

| Project | Notes |
| --- | --- |
| [superagent-ai/grok-cli](https://github.com/superagent-ai/grok-cli) | Popular community-built Grok API coding agent. Not official xAI Grok Build, but useful for ecosystem patterns around TUI, subagents, web/X search, media generation, and schedules. |
| [AppleLamps/grok-build-web](https://github.com/AppleLamps/grok-build-web) | Local browser UI that bridges to `grok agent stdio` through ACP. Very early, but exactly the kind of wrapper category that will grow fast. |
| [grokbuildweb.com](https://grokbuildweb.com/) | Project site for the browser UI wrapper. |
| [parallelagents.live](https://parallelagents.live/) | Unofficial "arena" style demo around parallel agents. Treat as inspiration, not documentation. |

Submit more via PR. Include a one-line description, license, and whether it is official, community, experimental, or commercial.

## Community Skills

To add a skill, open a PR with:

- `.grok/skills/<skill-name>/SKILL.md`;
- frontmatter: `name`, `description`, `version`, `author`;
- a narrow trigger description;
- examples of when to use it;
- safety notes if it runs tools, scripts, hooks, network calls, or shell commands.

Good community skill categories:

- database migration reviewer;
- Playwright QA;
- React Native;
- Rust systems programming;
- data science notebooks;
- deployment readiness;
- docs drift detection;
- issue triage;
- release automation;
- incident postmortems.

## Tips & Tricks

Use Plan Mode first for ambiguous work:

```text
Start in Plan Mode. Inspect the repo, identify the risky files, propose the smallest shippable plan, and wait for approval before edits.
```

Use subagents for independent questions:

```text
Split this investigation into parallel tracks: backend errors, database queries, frontend regressions, and deployment changes. Summarize evidence before proposing a fix.
```

Use headless mode for repeatable checks:

```bash
grok -p "Review this diff for regressions and missing tests" --output-format json
```

Use `grok inspect` after changing config:

```bash
grok inspect
```

Use `AGENTS.md` as the repo contract:

```text
Read AGENTS.md first. Follow the test commands exactly. Do not introduce new frameworks unless the plan explains why.
```

## Comparison

| Tool | Sweet spot | Strengths | Tradeoffs |
| --- | --- | --- | --- |
| **Grok Build** | Terminal-first agent orchestration | Plan approval, subagents, skills/plugins/hooks, AGENTS.md compatibility, headless mode, ACP, xAI ecosystem. | Early beta, access gated by subscription, smaller ecosystem, docs and hook/plugin conventions still maturing. |
| **Claude Code** | Mature terminal agent for deep codebase work | Strong coding model, established skills/hooks/plugins/MCP ecosystem, widely adopted workflows. | Usage limits/cost can bite, vendor-specific conventions, parallel workflows depend on setup. |
| **Cursor** | IDE-native agentic editing | Great editor UX, codebase index, background agents, rules, model choice, strong adoption. | Less terminal-native, remote background agents may affect data policies, can be noisy in large repos without rules. |
| **Aider** | Open-source git-native pair programming | OSS, model-flexible, repo map, excellent git workflow, lint/test loop, scriptable. | Less "agent platform" out of the box, no native marketplace/subagent TUI experience like newer tools. |

The short version:

- Choose **Grok Build** when you want terminal-native multi-agent workflows and reusable agent capabilities.
- Choose **Claude Code** when you want the most battle-tested terminal coding agent ecosystem.
- Choose **Cursor** when you want the agent inside your editor all day.
- Choose **Aider** when you want open-source, git-first, BYO-model coding assistance.

## Contributing

PRs are welcome. High-signal contributions:

- official xAI links;
- working `.grok/skills`;
- AGENTS.md patterns that improved real projects;
- hook examples with clear safety notes;
- early community repos with working code;
- screenshots, demos, and measured comparisons.

Before opening a PR:

1. Read [`CONTRIBUTING.md`](CONTRIBUTING.md).
2. Verify links.
3. Mark sources as official or community.
4. Keep claims accurate.
