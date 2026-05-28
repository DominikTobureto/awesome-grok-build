# Example Review Findings

These are realistic outputs from `agentic-code-review` run on a typical feature PR.

---

## Example 1: Auth middleware bypass

```text
[P0] Auth middleware skipped for admin API routes
File: src/middleware.ts:34
Problem: The matcher config excludes /api/admin/* from auth middleware,
meaning any unauthenticated request can reach admin endpoints.
Why it matters: Publicly exposed admin API without auth. Data exfiltration,
privilege escalation, or account takeover risk.
Suggested fix: Add "/api/admin/:path*" to the matcher array. Verify with
an unauthenticated request to /api/admin/users returns 401.
```

---

## Example 2: Missing test for payment edge case

```text
[P1] No test for zero-amount Stripe payment intent
File: src/lib/billing.ts:67-89
Problem: The createPaymentIntent function handles a free trial case
(amount === 0) by short-circuiting, but no test covers this branch.
Why it matters: The free trial flow is the primary onboarding path.
A regression here silently breaks new user signups.
Suggested fix: Add a Vitest case: "returns null payment intent for
zero-amount trial" asserting the early return and no Stripe API call.
```

---

## Example 3: N+1 query in dashboard

```text
[P2] N+1 query when loading team members
File: src/app/dashboard/team/page.tsx:42
Problem: The component maps over team members and calls
getUserById() inside the loop body, producing one query per member.
Why it matters: For teams with 20+ members, this adds ~400ms to page load.
Not breaking, but degrades UX at scale.
Suggested fix: Batch the lookup: collect all member IDs, call
getUsersByIds(ids) once, then map results. Verify with Prisma query log.
```

---

## Example 4: No findings — clean diff

```text
[No P0/P1 findings]

This diff is clean. Changes are scoped to updating the README
quick-start section and bumping a patch dependency (eslint-config
from 8.1.0 to 8.1.1 — changelog shows only a typo fix).

Residual risks:
- docs/grok-build-workflow-setup.md still references the old `grok init`
  command. Should be updated in a follow-up PR.
- The eslint-config bump should trigger a lint re-run to confirm no
  new rules fire. Currently not verified.
```

---

## Review Output Template

When producing a final review summary, `agentic-code-review` should output:

```text
## Review Summary

- Files changed: 7
- Lines added: +143, removed: -28
- Findings: 1 P0, 2 P1, 1 P2
- Verdict: BLOCK (P0 must be resolved)

### Findings

[P0] ... (see format above)
[P1] ...
[P1] ...
[P2] ...

### What's Good

- Component decomposition is clean
- Error states are handled
- Types are strict (no `any` usage)

### Residual Risks

- E2E coverage for the new flow is pending
- Mobile layout not tested
```
