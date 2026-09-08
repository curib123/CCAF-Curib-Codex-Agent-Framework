# CCAF Quality Gates

Use the **cheapest reliable verification** that matches task risk. Broaden only when failure, uncertainty, or risk requires it.

## Gate 0 — Scope

- Current `TASK.md` has one coherent objective.
- Acceptance criteria are explicit.
- Scope and non-scope are clear.
- Unrelated work is not being pulled in.

## Gate 1 — Implementation Integrity

- Change follows existing project conventions.
- No unnecessary rewrite or duplicate subsystem was introduced.
- No unrelated user changes were overwritten.
- Configuration/secrets remain appropriate for the project.

## Gate 2 — Focused Verification

Run the smallest meaningful check first:

- focused unit/component test,
- targeted API/integration test,
- targeted command or build step,
- direct behavior verification when automation is unavailable.

## Gate 3 — Risk-Specific Verification

### LOW risk
Required:

- targeted behavior check,
- diff review,
- verifier approval.

### MEDIUM risk
Required:

- targeted tests,
- relevant integration/type/build check,
- QA review,
- verifier approval,
- Normal User review if user-facing.

### HIGH risk
Required:

- targeted tests,
- failure-path/edge-case tests,
- security review,
- QA review,
- relevant integration/build checks,
- verifier approval,
- Normal User review if user-facing.

## Gate 4 — Regression Breadth

Run broader regression when one or more are true:

- authentication/authorization changed,
- billing/credits/payments changed,
- database schema or migration changed,
- shared/core infrastructure changed,
- multiple related work units completed,
- release/final verification is occurring.

Do not run a full repository suite after every trivial edit unless the project is small enough that this is actually cheaper.

## Gate 5 — Evidence

Before completion, `TASK.md` must record concise evidence:

- checks run,
- result,
- unresolved notes/risks,
- verifier result.

## Gate 6 — Requirement Traceability

A completed PLAN item must point to:

- requirement ID or requirement section,
- completed task ID,
- verification evidence.

## Gate 7 — Checkpoint

Update `STATUS.md` and `TASK.md` before moving to the next work unit.

Never mark a task complete solely because code compiles or the UI renders.