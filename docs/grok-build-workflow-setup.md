# Grok Build Workflow Setup

This guide shows a small, practical setup for using Grok Build in a real repository.

It focuses on four files or folders:

```text
AGENTS.md
.grok/skills/
.grokignore
.grok/hooks/
```

## 1. Install Skills

From your project root:

```bash
rm -rf /tmp/awesome-grok-build
git clone --depth 1 https://github.com/DominikTobureto/awesome-grok-build.git /tmp/awesome-grok-build
mkdir -p .grok
cp -R /tmp/awesome-grok-build/.grok/skills .grok/
```

Windows PowerShell:

```powershell
Remove-Item -Recurse -Force "$env:TEMP\awesome-grok-build" -ErrorAction SilentlyContinue
git clone --depth 1 https://github.com/DominikTobureto/awesome-grok-build.git "$env:TEMP\awesome-grok-build"
New-Item -ItemType Directory -Force .grok
Copy-Item -Recurse -Force "$env:TEMP\awesome-grok-build\.grok\skills" ".grok\"
```

## 2. Add AGENTS.md

Choose the closest template:

| Project type | Template |
| --- | --- |
| Full-stack app | `templates/AGENTS.fullstack.md` |
| Library or SDK | `templates/AGENTS.library.md` |
| Documentation repo | `templates/AGENTS.docs.md` |
| Security-sensitive repo | `templates/AGENTS.security.md` |
| Next.js app | `templates/nextjs/AGENTS.md` |
| FastAPI service | `templates/fastapi/AGENTS.md` |
| Python full-stack app | `templates/python-fullstack/AGENTS.md` |

Example:

```bash
cp /tmp/awesome-grok-build/templates/AGENTS.fullstack.md AGENTS.md
```

Edit the copied file so it matches your actual commands, stack, and constraints.

## 3. Add .grokignore

Start with a safe default:

```bash
cp /tmp/awesome-grok-build/templates/grokignore.default .grokignore
```

Use stack-specific defaults when appropriate:

```bash
cp /tmp/awesome-grok-build/templates/grokignore.node .grokignore
cp /tmp/awesome-grok-build/templates/grokignore.python .grokignore
```

Always ignore secrets, dependency directories, build outputs, logs, generated media, and local agent state.

## 4. Inspect Discovery

Run:

```bash
grok inspect
```

Check that Grok sees:

- project instructions;
- skills;
- MCP servers, if configured;
- hooks, if configured;
- project trust state.

## 5. First Useful Prompt

```text
Use repo-health-check. Inspect this repo and propose the smallest safe PR. Do not edit yet.
```

For code review:

```text
Use agentic-code-review on the current diff. Findings first. Ignore style unless it creates real risk.
```

For tests:

```text
Use tdd-test-engineer. Add a failing regression test before fixing the bug.
```

## 6. Hooks

Do not enable hooks blindly. Start with read-only checks:

- lint report;
- test summary;
- dangerous command warning;
- completion notification.

Use the `hooksmith` skill to design and review hooks before trusting them.

## 7. Git Hygiene

Before committing:

```text
Use git-github-flow. Summarize the current diff, propose a commit message, and list verification commands. Do not push.
```

Good Grok Build workflows should leave small, reviewable diffs with clear verification notes.
