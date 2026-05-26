# Hooks

Project hooks can be powerful and should be trusted deliberately.

This repository intentionally does **not** ship active hook definitions because public Grok Build hook formats are still early and project hooks require `/hooks-trust`.

Use the patterns in:

- `examples/hooks.md`
- `.grok/skills/hooksmith/SKILL.md`

Recommended first hooks:

- read-only lint reporter;
- read-only dangerous-command warning;
- completion notification;
- post-edit test summary.

Before enabling any hook, document:

- trigger event;
- command;
- files touched;
- network access;
- failure behavior;
- how to disable it.
