# Grok Build Prompt Recipes

## Explain A Repo

```text
Explain this repository for a new contributor. Identify the stack, entry points, test commands, risky areas, and the smallest useful first issue.
```

## Plan Before Editing

```text
Enter Plan Mode. Inspect the codebase and propose the smallest safe implementation plan. Include files likely to change, tests to run, and risks. Wait for approval before edits.
```

## Parallel Debugging

```text
Investigate this bug using parallel tracks: frontend state, backend API, database/data model, and tests. Summarize evidence from each track before proposing a fix.
```

## Code Review

```text
Review the current diff like a senior engineer. Findings first. Focus on correctness, security, data loss, missing tests, and regressions. Ignore style unless it creates risk.
```

## Docs Drift

```text
Compare README setup instructions against the actual package/config files. Update docs only where commands are stale or missing. Run the smallest verification command available.
```

## Test Gap

```text
Find the highest-risk behavior changed by this diff that lacks test coverage. Add one focused test that would fail before the change and pass after it.
```

## Migration Plan

```text
Plan this migration with rollback strategy, compatibility window, data validation, and tests. Do not edit files until the plan is approved.
```

## Release Notes

```text
Draft release notes from the current diff. Group by Added, Changed, Fixed, Breaking, Migration Notes, and Verification.
```
