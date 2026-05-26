# Grok Build Best Practices

Last reviewed: 2026-05-26

## The Four-Layer Setup

Use four distinct layers:

| Layer | File/location | Use for |
| --- | --- | --- |
| Instructions | `AGENTS.md` | Stable repo rules, commands, architecture, safety notes. |
| Skills | `.grok/skills/<name>/SKILL.md` | Reusable workflows invoked by task relevance or slash command. |
| Ignore | `.grokignore` | Secrets, generated files, build output, bulky assets. |
| Hooks | `.grok/hooks/` or user/plugin hooks | Deterministic checks on lifecycle events. |

## Plan Mode

Use Plan Mode when:

- requirements are ambiguous;
- multiple architectures are plausible;
- edits touch auth, data, migrations, payments, or infra;
- multiple files or subsystems are involved;
- you want to review before any write.

Prompt:

```text
Enter Plan Mode. Inspect the repo, identify risks, propose the smallest safe implementation plan, and wait for approval before edits.
```

Avoid Plan Mode for tiny, obvious fixes where planning would create more overhead than value.

## AGENTS.md

Good `AGENTS.md` files answer:

- What is this project?
- How do I build, test, lint, and run it?
- What files should not be touched?
- What patterns should be followed?
- What changes require a plan first?
- What security rules matter?

Keep it stable and short. Move long procedures into skills or docs.

## Skills

Use skills for workflows that repeat:

- code review;
- repo health checks;
- release notes;
- test generation;
- migration planning;
- security triage;
- documentation audits.

Skill checklist:

- narrow name;
- trigger-specific description;
- concise workflow;
- clear output format;
- safety guardrails;
- optional scripts or references.

## .grokignore

Always ignore:

- secrets and `.env` files;
- dependency directories;
- build output;
- cache directories;
- logs;
- generated media;
- bulky archives;
- local agent state.

Do not use ignore files to hide source code the agent genuinely needs.

## Hooks

Start with hooks that only report:

- lint output;
- formatter diff;
- test failure summaries;
- dangerous command warnings;
- completion notifications.

Only move to mutating hooks after the team trusts the behavior.

Good hook prompts:

```text
Design a low-risk hook that runs the existing linter after file edits and reports failures back to the session. Do not mutate files yet.
```

```text
Review these hook commands for security risks before I run /hooks-trust.
```

## Subagents

Use subagents for independent workstreams:

- one agent reads backend;
- one reads frontend;
- one reads tests;
- one checks docs;
- one checks deployment config.

Bad subagent use:

- multiple agents editing the same files without clear ownership;
- delegating a task whose result blocks the next immediate step;
- spawning agents for tiny single-file changes.

## Headless Mode

Use `grok -p` for repeatable tasks:

```bash
grok -p "Summarize this repo and list missing setup docs" --output-format plain
grok -p "Review the current diff for regressions" --output-format json
grok -p "Explain the architecture" --output-format streaming-json
```

Good use cases:

- CI comments;
- nightly docs drift checks;
- changelog drafts;
- issue triage;
- release readiness review.

## Review Loop

For every meaningful change:

1. Inspect plan.
2. Approve narrow scope.
3. Review diff.
4. Run tests.
5. Ask for a risk summary.
6. Commit only after verification.

Prompt:

```text
Before we finish, summarize changed files, tests run, known risks, and follow-up work. Be specific.
```
