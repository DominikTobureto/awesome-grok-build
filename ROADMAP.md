# Roadmap

This document outlines the planned direction for `awesome-grok-build`. Priorities may shift based on Grok Build CLI updates, community contributions, and ecosystem changes.

---

## Q2–Q3 2026 (Now)

### Community Growth

- [ ] Reach 10+ community projects listed in README
- [ ] Add "Who uses this" section with real project examples
- [ ] Add visual demos and screenshots to README
- [ ] Set up `CONTRIBUTORS.md` Hall of Fame

### New Skills

From the community skill categories listed in README:

- [ ] `database-migration-reviewer` — validate schema migrations, flag risky changes
- [ ] `playwright-qa` — E2E testing workflows with Playwright
- [ ] `deploy-readiness` — pre-deployment checklist: env vars, migrations, health checks
- [ ] `docs-drift-detection` — detect stale docs, missing coverage, broken references

### Templates

- [ ] `templates/rust/` — AGENTS.md + .grokignore for Rust projects
- [ ] `templates/react-native/` — mobile development stack pack
- [ ] `templates/dotnet/` — .NET / C# project template

### Examples & References

- [ ] Add `examples/` subdirectories for `repo-health-check`, `agentic-code-review`, and `hooksmith`
- [ ] Add real-world audit report samples
- [ ] Add hook script examples (lint-on-save, test-on-commit)

---

## Q3–Q4 2026

### Advanced Patterns

- [ ] Multi-skill pipelines (e.g., `repo-health-check` → `architecture-review` → `tdd-test-engineer`)
- [ ] Grok Build headless mode patterns for CI/CD
- [ ] Grok Build + GitHub Actions integration recipes
- [ ] Plugin/marketplace packaging guide for skill bundles

### Tooling

- [ ] `grok-skill` CLI tool for scaffolding new skills with correct structure
- [ ] Skill marketplace integration (if Grok Build supports it)
- [ ] Automated changelog generation from skill version diffs

### Quality & Trust

- [ ] Skill review board / trusted skill badge
- [ ] Automated regression tests for skill prompts against sample repos
- [ ] Benchmarking: measure skill effectiveness (time-to-solution, diff quality)

---

## 2027+

- [ ] Full i18n support for skills (prompt templates in multiple languages)
- [ ] Integration with Grok Build's plugin marketplace
- [ ] Enterprise skill packs with compliance-focused templates
- [ ] Community skill ratings and feedback system

---

## How to Contribute

Pick an unchecked item above, open an issue to discuss, then submit a PR. See [`CONTRIBUTING.md`](CONTRIBUTING.md) for guidelines.

## Feedback

Have a different priority? Open a [discussion](https://github.com/DominikTobureto/awesome-grok-build/issues) with the `roadmap` label.
