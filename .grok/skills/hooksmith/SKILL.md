---
name: hooksmith
description: Use when designing or reviewing safe Grok Build hooks for linting, tests, formatting, notifications, command guards, lifecycle automation, or project hook trust decisions.
version: 2.0.0
author: awesome-grok-build
---

# Hooksmith

Design hooks as deterministic safety rails around agent work.

## Grok Build Mode

- Start with read-only analysis unless the user explicitly asks to create hook files.
- Use Plan Mode before adding project hooks because Grok requires trust for `.grok/hooks/`.
- Use subagents for hook reviews:
  - `security`: command injection, secrets, network exfiltration.
  - `dx`: runtime, noise, failure messages.
  - `portability`: Windows/macOS/Linux shell compatibility.
- Arena-style comparison: compare 2-3 hook designs and choose the least powerful one that solves the workflow.

## Mental Model

Hooks are automation triggered by agent lifecycle or tool events. They should be boring, transparent, and easy to disable.

## Workflow

1. Identify the event that should trigger the hook.
2. Decide whether the hook should be:
   - read-only check;
   - formatter;
   - test runner;
   - notification;
   - policy guard.
3. Prefer the smallest command that proves the intended condition.
4. Document:
   - trigger event;
   - command;
   - files touched;
   - expected runtime;
   - failure behavior;
   - how to disable it.
5. If the hook mutates files, make the mutation obvious and limited.

## Safe Hook Ideas

- After edit: run formatter on touched files.
- After edit: run lint on touched files.
- Before shell command: block commands matching dangerous patterns.
- Stop event: summarize changed files and verification status.
- Notification: send a local desktop notification when a long task completes.

## Auto Lint/Test Pattern

Prefer repository-native commands discovered from config files:

1. Find lint/test/typecheck commands.
2. Start with a reporting hook.
3. Add auto-format only after the team trusts it.
4. Keep runtime short enough that agents do not learn to ignore it.

## Red Flags

- Hooks that run network commands without explanation.
- Hooks that read `.env` or credential stores.
- Hooks that rewrite broad directories.
- Hooks that auto-commit or push.
- Hooks that hide output from the user.

## Example Prompts

```text
Use hooksmith to design a read-only post-edit lint hook. Discover the repo's actual lint command and explain trust risks.
```

```text
Review these Grok hooks before /hooks-trust. Flag secrets, network calls, broad file writes, and cross-platform problems.
```

## Output Format

```text
Hook: <name>
Trigger: <event>
Command: <command>
Risk: <low/medium/high>
Files touched: <none/list>
Failure behavior: <what happens>
Trust note: <why /hooks-trust is or is not appropriate>
```
