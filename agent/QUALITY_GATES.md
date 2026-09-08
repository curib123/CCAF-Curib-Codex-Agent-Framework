# CCAF Quality Gates

Use the **cheapest reliable verification** that matches task risk. Broaden only when failure, uncertainty, dependency breadth, or risk requires it.

All implementation must follow:

- `agent/ENGINEERING_STANDARDS.md`
- `agent/EFFICIENCY_STANDARDS.md`
- `agent/UX_UI_STANDARDS.md` for user-facing work

Apply standards pragmatically and consistently with the target project's established architecture.

## Gate 0 — Scope and Traceability

- `TASK.md` has one coherent objective.
- Linked requirement/acceptance criteria are explicit.
- Scope and non-scope are clear.
- Risk and expected change surface are classified.
- Unrelated work is excluded.

## Gate 1 — Efficiency Profile

Before implementation verify `TASK.md` declares:

- Reasoning: FAST | STANDARD | DEEP
- Context: LOCAL | CROSS-LAYER | SYSTEM
- Test Depth: TARGETED | EXPANDED | FULL
- External Cost: NONE | LOW | MATERIAL

The selected levels must be the **minimum effective levels** for reliable completion.

Escalation requires evidence such as unexpected coupling, security risk, persistent failure, or broader regression impact.

## Gate 2 — Context and Usage Economy

- Resume from `STATUS.md` + `TASK.md`.
- Load only linked requirements/facts needed for the task.
- Prefer targeted repository navigation over full rescans.
- Reuse stable `FACTS.md` instead of rediscovering architecture.
- Reviewers begin from task + diff + evidence.
- No unnecessary parallel agents or duplicate analyses.
- State files remain compact and do not contain large logs/repeated requirements.

## Gate 3 — Architecture Fit

- Change follows existing module/layer boundaries.
- Existing project conventions are reused.
- No unnecessary framework, library, database, or architectural style is introduced.
- No parallel subsystem duplicates existing functionality.
- Public/backward compatibility is preserved or intentionally handled.

## Gate 4 — Code Quality

Check relevant changes for:

- clear intent-revealing naming,
- cohesive responsibilities,
- simple understandable control flow,
- reasonable function/module size,
- no meaningful duplicated business logic,
- no speculative abstractions,
- no unexplained magic values,
- comments that explain why rather than restating code,
- pragmatic SOLID, DRY, KISS, and YAGNI.

Do not fail work for subjective style preferences already governed by project formatting/lint rules.

## Gate 5 — Correctness and Trust Boundaries

When relevant verify:

- inputs are validated,
- client input is not trusted for server authority,
- authentication/authorization/ownership are enforced,
- data invariants remain valid,
- transactions/idempotency/concurrency are handled where needed,
- external-provider responses are treated safely.

## Gate 6 — Failure Handling

For relevant failure modes verify:

- errors are not silently swallowed,
- retries are bounded,
- repeated requests cannot create unsafe duplicate side effects,
- partial failure is handled appropriately,
- user-visible errors are useful and safe,
- logs preserve useful context without leaking secrets/private data.

## Gate 7 — Focused Verification

Run the smallest meaningful behavior check first:

- focused unit/component test,
- targeted API/integration test,
- targeted command/build check,
- direct behavior verification when automation is unavailable.

Tests should verify observable behavior rather than brittle implementation details.

Do not rerun expensive unaffected suites without a concrete reason.

## Gate 8 — Risk-Specific Review

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

## Gate 9 — UX/UI, Jakob's Law, and Accessibility

For `User-Facing: YES`, verify relevant criteria from `UX_UI_STANDARDS.md`:

- page purpose and primary action are clear,
- interaction patterns are familiar and follow Jakob's Law,
- existing design-system components/tokens are reused,
- loading/empty/error/success/disabled states are complete,
- responsive behavior works for intended devices,
- mobile/touch behavior does not depend on hover,
- keyboard/focus/labels/semantic controls are usable,
- dynamic behavior reflects real permissions/config/capabilities,
- unavailable options are explained when useful,
- visual hierarchy is modern, clean, restrained, and brand-consistent,
- progressive disclosure prevents unnecessary complexity,
- error recovery is clear,
- refresh/re-entry behavior is sensible.

Do not approve a UI solely because it looks visually modern.

## Gate 10 — Dynamic and Flexible Product Behavior

When requirements/configuration vary at runtime:

- avoid unnecessary hard-coded lists/limits/capabilities,
- use the backend/config/source-of-truth already established by the project,
- preserve sensible defaults,
- keep dynamic behavior predictable,
- do not expose internal configurability that users do not need.

Flexibility must not create inconsistent UX or duplicated business authority.

## Gate 11 — Performance and Cost

Check for obvious regressions relevant to the change:

- N+1 queries,
- unbounded list/query behavior,
- excessive API/provider calls,
- repeated expensive computation,
- unnecessary rerenders/network requests,
- unnecessarily large payload/context,
- duplicate paid API operations,
- uncontrolled retry loops,
- unnecessary large dependencies/build cost.

For AI/API/cloud features also check:

- relevant context only,
- bounded output/retries,
- safe caching/batching when semantically correct,
- lowest-cost capable automatic route when product requirements specify auto-routing,
- manual user choices remain respected,
- real usage/cost tracking when required.

Measure before/after only when performance/cost is a requirement, risk, or observed issue.

## Gate 12 — External Cost Discipline

If `External Cost: MATERIAL`:

- justify real paid/provider calls,
- prefer deterministic fixtures/mocks for routine testing,
- avoid production credentials/data,
- prevent duplicate side effects,
- record concise cost-sensitive evidence in `TASK.md`.

Do not optimize cost by weakening required integration verification.

## Gate 13 — Data, API, and Migration Safety

When relevant verify:

- database constraints support important invariants,
- migrations are deterministic and appropriate for deployment,
- rollback/recovery risk is understood,
- APIs retain expected contract/error semantics,
- consumers are updated for intentional breaking changes,
- destructive behavior is explicit and protected.

## Gate 14 — Configuration, Dependencies, and Documentation

When relevant verify:

- environment-specific values are not hard-coded,
- new config is validated/documented,
- `.env.example` or equivalent is updated without secrets,
- new dependencies are justified,
- unrelated dependency upgrades are avoided,
- setup/API/deployment docs are updated when behavior actually changed.

## Gate 15 — Regression Breadth

Run broader regression when one or more are true:

- authentication/authorization changed,
- billing/credits/payments changed,
- database schema/migration changed,
- shared/core infrastructure changed,
- public API/shared contracts changed,
- multiple related work units completed,
- release/final verification is occurring.

Do not run a full repository suite after every trivial edit unless the project is small enough that this is actually cheaper.

## Gate 16 — Evidence and Efficiency Result

Before completion, `TASK.md` must record concise evidence:

- checks run and outcome,
- QA/security/user-review result when required,
- unresolved notes/risks,
- verifier result,
- reasoning/context/test depth actually used,
- material external/API cost notes,
- meaningful unnecessary work avoided when relevant.

Do not paste large logs.

## Gate 17 — Requirement Traceability

A completed PLAN item must point to:

- requirement ID or requirement section,
- completed task ID,
- verification evidence.

## Gate 18 — Git Integrity

Before commit/push:

- inspect current diff,
- ensure only task-owned changes are staged,
- review staged diff,
- ensure no secrets/generated junk/unrelated files are included,
- use a focused descriptive commit message,
- push verified checkpoints when configured/authorized,
- record branch + commit SHA + sync status.

Never manufacture a clean working tree with destructive commands.

## Gate 19 — Checkpoint

Update `STATUS.md` and `TASK.md` before moving to the next work unit.

A task is not fully checkpointed until its verified result, efficiency profile/result, and Git sync state are accurately recorded.

Never mark a task complete solely because code compiles, lint passes, the UI renders, or a commit exists.