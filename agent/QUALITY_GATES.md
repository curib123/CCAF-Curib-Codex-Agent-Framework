# CCAF Quality Gates

Use the **cheapest reliable verification** that matches task risk. Broaden only when failure, uncertainty, or risk requires it.

All implementation must follow:

`agent/ENGINEERING_STANDARDS.md`

Apply standards pragmatically and consistently with the target project's established architecture.

## Gate 0 — Scope and Traceability

- Current `TASK.md` has one coherent objective.
- Linked requirement/acceptance criteria are explicit.
- Scope and non-scope are clear.
- Risk and expected change surface are classified.
- Unrelated work is not being pulled in.

## Gate 1 — Architecture Fit

- Change follows existing module/layer boundaries.
- Existing project conventions are reused.
- No unnecessary framework, library, database, or architectural style is introduced.
- No parallel subsystem duplicates existing functionality.
- Public/backward compatibility is preserved or intentionally handled.

## Gate 2 — Code Quality

Check relevant changes for:

- clear intent-revealing naming,
- cohesive responsibilities,
- simple understandable control flow,
- reasonable function/module size,
- no meaningful duplicated business logic,
- no speculative abstractions,
- no unexplained magic values,
- comments that explain why rather than restating code,
- appropriate use of SOLID, DRY, KISS, and YAGNI.

Do not fail work for subjective style preferences already governed by project formatting/lint rules.

## Gate 3 — Correctness and Trust Boundaries

When relevant verify:

- inputs are validated,
- client input is not trusted for server authority,
- authentication/authorization/ownership are enforced,
- data invariants remain valid,
- transactions/idempotency/concurrency are handled where needed,
- external-provider responses are treated safely.

## Gate 4 — Failure Handling

For relevant failure modes verify:

- errors are not silently swallowed,
- retries are bounded,
- repeated requests cannot create unsafe duplicate side effects,
- partial failure is handled appropriately,
- user-visible errors are useful and safe,
- logs preserve useful context without leaking secrets/private data.

## Gate 5 — Focused Verification

Run the smallest meaningful behavior check first:

- focused unit/component test,
- targeted API/integration test,
- targeted command/build check,
- direct behavior verification when automation is unavailable.

Tests should verify observable behavior rather than brittle implementation details.

## Gate 6 — Risk-Specific Review

### LOW risk
Required:

- targeted behavior check,
- implementation/diff review,
- verifier approval.

QA may be folded into verification for genuinely trivial work.

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

## Gate 7 — User Experience and Accessibility

For user-facing changes, when relevant verify:

- loading/empty/error/success/disabled states,
- keyboard use,
- visible focus,
- labels and accessible names,
- semantic/native controls where appropriate,
- responsive behavior,
- error recovery,
- familiar interaction patterns,
- refresh/re-entry behavior.

## Gate 8 — Performance and Cost

Check for obvious regressions relevant to the change:

- N+1 queries,
- unbounded list/query behavior,
- excessive API/provider calls,
- repeated expensive computation,
- unnecessary rerenders or network requests,
- unnecessarily large payload/context,
- duplicate paid API operations.

Measure before/after only when performance is a requirement, risk, or observed issue. Do not require micro-benchmarks for routine work.

## Gate 9 — Data, API, and Migration Safety

When relevant verify:

- database constraints support important invariants,
- migrations are deterministic and appropriate for deployment,
- rollback/recovery risk is understood,
- APIs retain expected contract/error semantics,
- consumers are updated for intentional breaking changes,
- destructive behavior is explicit and protected.

## Gate 10 — Configuration, Dependencies, and Documentation

When relevant verify:

- environment-specific values are not hard-coded,
- new config is validated/documented,
- `.env.example` or equivalent is updated without secrets,
- new dependencies are justified,
- unrelated dependency upgrades are avoided,
- setup/API/deployment docs are updated when behavior actually changed.

## Gate 11 — Regression Breadth

Run broader regression when one or more are true:

- authentication/authorization changed,
- billing/credits/payments changed,
- database schema/migration changed,
- shared/core infrastructure changed,
- public API/shared contracts changed,
- multiple related work units completed,
- release/final verification is occurring.

Do not run a full repository suite after every trivial edit unless the project is small enough that this is actually cheaper.

## Gate 12 — Evidence

Before completion, `TASK.md` must record concise evidence:

- checks run,
- outcome,
- QA/security/user-review result when required,
- unresolved notes/risks,
- verifier result.

Do not paste large logs.

## Gate 13 — Requirement Traceability

A completed PLAN item must point to:

- requirement ID or requirement section,
- completed task ID,
- verification evidence.

## Gate 14 — Git Integrity

Before commit/push:

- inspect current diff,
- ensure only task-owned changes are staged,
- review staged diff,
- ensure no secrets/generated junk/unrelated files are included,
- use a focused descriptive commit message,
- push verified checkpoints when configured/authorized,
- record branch + commit SHA + sync status.

Never manufacture a clean working tree with destructive commands.

## Gate 15 — Checkpoint

Update `STATUS.md` and `TASK.md` before moving to the next work unit.

A task is not fully checkpointed until its verified result and Git sync state are accurately recorded.

Never mark a task complete solely because code compiles, lint passes, or the UI renders.