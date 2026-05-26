# Skill Market Analysis

Last reviewed: 2026-05-26

## Bottom Line

The agent-skill market is converging around practical software delivery workflows, not novelty prompts. The most useful and most copied skills are the ones that make agents safer and more repeatable: code review, TDD, GitHub flow, architecture planning, security, frontend quality, performance, research, and language/framework expertise.

## Signals Reviewed

- xAI Grok Build docs: `.grok/skills`, hooks, plugins, subagents, AGENTS.md compatibility, Plan Mode, headless mode.
- Claude Code docs: SKILL.md frontmatter, skill discovery, supporting files, commands, project/personal/plugin locations.
- Public skill directories: Awesome Agent Skills, ClaudSkills, and GitHub skill collections.
- Community patterns: test-driven development, subagent-driven development, systematic debugging, root cause tracing, git worktrees, code review, UI/UX skills, research skills, and security/supply-chain concerns.

## Most In-Demand Skill Categories

| Category | Why it is popular | Grok Build adaptation |
| --- | --- | --- |
| Best-practices / workflow | Agents need repeatable operating loops. | `repo-health-check`, Plan Mode first, verification before completion. |
| Language-specific | Python, TypeScript, React, Next.js are constant daily work. | `python-expert`, `nextjs-fullstack`, stack-specific tests. |
| Refactor / code review | AI changes need review and safe cleanup. | `agentic-code-review`, `refactor-master`, diff approval. |
| Git / GitHub | Shipping requires commits, PRs, review response, changelogs. | `git-github-flow`, human approval before push/merge. |
| Research agent | Fast-moving docs and libraries require current sources. | `research-agent` with web/X search and source hierarchy. |
| TDD / testing | High ROI for agent reliability. | `tdd-test-engineer`, failing test first, narrow verification. |
| Architecture | Bigger agent tasks need boundaries and ADRs. | `architecture-review`, subagent discovery, option ranking. |
| Security / safety | Skills and hooks increase supply-chain risk. | `security-audit`, hook review, secrets and auth checks. |
| Performance | Agents often change code without measuring. | `performance-optimizer`, baseline-first workflow. |
| Frontend-specific | UI quality is highly visible and easy to get wrong. | `frontend-ux-engineer`, accessibility and responsive state checks. |
| Hooks / automation | Teams want lint/test guardrails. | `hooksmith`, low-power hooks and trust checklist. |

## Design Choices For This Repo

The included skills are intentionally:

- task-specific enough to auto-trigger well;
- stack-aware without being locked to one framework;
- explicit about Plan Mode and approval gates;
- written for parallel subagent investigation;
- careful about "Arena Mode" by supporting Arena-style comparison without assuming every Grok Build build exposes the same UI;
- strict about verification and git hygiene.

## What We Did Not Include Yet

Potential future community skills:

- Playwright QA;
- database migration reviewer;
- React Native;
- Rust systems programming;
- Docker/Kubernetes deploy readiness;
- incident postmortem writer;
- API contract tester;
- docs drift detector.

These should be added when someone contributes a concrete, tested workflow rather than a generic prompt.
