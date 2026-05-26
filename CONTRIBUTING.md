# Contributing

Thanks for helping make Grok Build easier to use.

## What We Want

High-signal contributions:

- official xAI links and doc updates;
- working `.grok/skills`;
- safe hook patterns;
- AGENTS.md templates for real project types;
- stack packs under `templates/<stack>/`;
- concise examples of prompts that produced useful diffs;
- community projects with public code or demos;
- comparisons based on actual usage, not vibes.

## Contribution Rules

- Label sources as `official`, `community`, `experimental`, or `commercial`.
- Do not submit private Discord screenshots or paywalled content unless you have permission.
- Do not submit secrets, API keys, logs with tokens, or private repo data.
- Avoid generic "AI will change everything" prose. Show concrete workflow value.
- Keep Markdown tables readable on GitHub.

## Adding a Community Project

Add it to `README.md` with:

- project name;
- URL;
- one-line description;
- status: official, community, experimental, or commercial;
- why Grok Build users should care.

## Adding a Skill

Create:

```text
.grok/skills/<skill-name>/SKILL.md
```

Use this frontmatter:

```yaml
---
name: skill-name
description: Use when...
version: 1.0.0
author: your-name-or-org
---
```

Keep the skill narrow. Strong Grok Build skills include:

- Plan Mode guidance;
- subagent decomposition for larger tasks;
- Arena-style comparison when multiple approaches are useful;
- web/X search guidance when current information matters;
- human approval checkpoints before risky edits;
- lint/test verification guidance;
- git hygiene.

If it needs examples, add:

```text
.grok/skills/<skill-name>/examples/
```

## Skill Quality Checklist

- [ ] The description says exactly when the skill should trigger.
- [ ] The skill is useful outside your own repo.
- [ ] It does not hide destructive commands.
- [ ] It separates confirmed facts from community observations.
- [ ] It tells the agent how to verify work.
- [ ] It explains when to ask for human approval.
- [ ] It keeps `SKILL.md` concise and moves bulky material into `references/` or `examples/`.

## Pull Request Checklist

- [ ] I verified links I added or changed.
- [ ] I clearly marked unofficial or experimental projects.
- [ ] I did not add secrets or private data.
- [ ] I kept claims specific and dated where needed.
- [ ] I updated docs/examples if behavior changed.
- [ ] New skills include `name`, `description`, `version`, and `author`.
- [ ] New skills mention safety and verification when they run commands.

## Code of Conduct

Be useful, direct, and generous. Debate claims and evidence, not people.
