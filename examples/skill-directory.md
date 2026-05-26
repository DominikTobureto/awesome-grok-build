# Skill Directory Pattern

Recommended structure:

```text
.grok/
  skills/
    repo-health-check/
      SKILL.md
      examples/
    agentic-code-review/
      SKILL.md
    release-notes/
      SKILL.md
      references/
```

`SKILL.md` should be the lightweight entry point. Put bulky examples, templates, and scripts next to it.

Example:

```markdown
---
name: release-notes
description: Use when drafting release notes from git history, changelog entries, or a pull request diff.
---

# Release Notes

1. Read the diff or commit range.
2. Group changes by Added, Changed, Fixed, Breaking, Migration.
3. Keep user-facing language concise.
4. Call out verification and known issues.
```
