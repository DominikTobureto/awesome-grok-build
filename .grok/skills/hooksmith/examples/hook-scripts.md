# Example Hooks

Realistic Grok Build hook scripts you can adapt for your project.

---

## 1. Post-Edit Lint Hook (Read-Only)

Triggers after each file edit. Runs the repo's linter on the changed file only. Reports failures without blocking.

```bash
#!/usr/bin/env bash
# .grok/hooks/post-edit-lint.sh
# Trigger: PostToolUse (Edit/Write)
# Risk: Low
# Files touched: None (read-only)

CHANGED_FILE="${GROK_EDITED_FILE:-}"

if [ -z "$CHANGED_FILE" ]; then
  echo "[hook] No file to lint — skipping."
  exit 0
fi

# Only lint supported file types
case "$CHANGED_FILE" in
  *.ts|*.tsx|*.js|*.jsx) ;;
  *) echo "[hook] $CHANGED_FILE is not a lintable type — skipping."; exit 0 ;;
esac

# Discover lint command
LINT_CMD=""
if [ -f "node_modules/.bin/eslint" ]; then
  LINT_CMD="npx eslint --quiet $CHANGED_FILE"
elif [ -f ".eslintrc.js" ] || [ -f ".eslintrc.cjs" ] || [ -f "eslint.config.js" ]; then
  LINT_CMD="npx eslint --quiet $CHANGED_FILE"
fi

if [ -z "$LINT_CMD" ]; then
  echo "[hook] No linter found — skipping."
  exit 0
fi

echo "[hook] Running: $LINT_CMD"
OUTPUT=$($LINT_CMD 2>&1) || true

if [ -n "$OUTPUT" ]; then
  echo "[hook] Lint issues in $CHANGED_FILE:"
  echo "$OUTPUT"
else
  echo "[hook] $CHANGED_FILE — clean."
fi
```

---

## 2. Pre-Commit Test Gate

Triggers before git commit. Runs the full test suite. Blocks commit on failure.

```bash
#!/usr/bin/env bash
# .grok/hooks/pre-commit-test.sh
# Trigger: PreToolUse (Bash with git commit)
# Risk: Medium
# Files touched: None

echo "[hook] Running pre-commit tests..."

# Discover test command
TEST_CMD=""
if [ -f "package.json" ]; then
  TEST_CMD="npm test"
elif [ -f "pyproject.toml" ]; then
  TEST_CMD="python -m pytest"
elif [ -f "Cargo.toml" ]; then
  TEST_CMD="cargo test"
fi

if [ -z "$TEST_CMD" ]; then
  echo "[hook] No test command discovered — allowing commit."
  exit 0
fi

echo "[hook] $TEST_CMD"
if $TEST_CMD; then
  echo "[hook] All tests passed."
  exit 0
else
  echo "[hook] Tests failed. Commit blocked."
  echo "[hook] Fix tests or commit with --no-verify."
  exit 1
fi
```

---

## 3. Dangerous Command Guard

Blocks known-dangerous shell commands before execution.

```bash
#!/usr/bin/env bash
# .grok/hooks/command-guard.sh
# Trigger: PreToolUse (Bash)
# Risk: Low
# Files touched: None

COMMAND="${GROK_SHELL_COMMAND:-}"

if [ -z "$COMMAND" ]; then
  exit 0
fi

# Block destructive patterns
DANGEROUS_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "rm -rf ."
  "git push --force origin main"
  "git push --force origin master"
  "DROP DATABASE"
  "DROP TABLE"
  "kubectl delete"
  "aws s3 rm"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "[hook] ⛔ BLOCKED: Command matches dangerous pattern: $pattern"
    echo "[hook] Command was: $COMMAND"
    echo "[hook] If this is intentional, run it manually in your terminal."
    exit 1
  fi
done

exit 0
```

---

## 4. Stop-Event Summary

Triggers when the agent session ends. Summarizes what was changed.

```bash
#!/usr/bin/env bash
# .grok/hooks/stop-summary.sh
# Trigger: Stop
# Risk: Low
# Files touched: None

echo "[hook] Session summary:"
echo ""

# Changed files since session start
if git rev-parse --git-dir > /dev/null 2>&1; then
  echo "  Changed files:"
  git diff --name-only HEAD 2>/dev/null | while read -r file; do
    echo "    - $file"
  done

  echo ""
  echo "  Unstaged changes:"
  git diff --name-only 2>/dev/null | while read -r file; do
    echo "    - $file (unstaged)"
  done

  echo ""
  echo "  Untracked files:"
  git ls-files --others --exclude-standard 2>/dev/null | while read -r file; do
    echo "    - $file (new)"
  done
fi

echo ""
echo "[hook] Review changes before committing."
```

---

## Hook Trust Checklist

Before running `/hooks-trust` on project hooks, verify:

- [ ] Every hook has a documented trigger event
- [ ] Every shell command is visible and auditable
- [ ] No hook reads `.env`, `.env.local`, or credential files
- [ ] No hook makes network calls (unless explicitly documented as a notification hook)
- [ ] No hook auto-commits, auto-pushes, or modifies `.git/config`
- [ ] All hooks are tested on your OS (macOS/Linux/Windows WSL)
- [ ] Each hook has a documented disable mechanism
