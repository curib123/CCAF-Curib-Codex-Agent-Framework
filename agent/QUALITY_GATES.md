# CCAF Quality Gates

Use the **cheapest reliable verification** that matches task risk and execution path. Broaden only when failure, uncertainty, dependency breadth, or risk requires it.

All implementation must follow:

- `agent/ENGINEERING_STANDARDS.md`
- `agent/EFFICIENCY_STANDARDS.md`
- `agent/MODEL_ROUTING.md`
- `agent/UX_UI_STANDARDS.md` for user-facing work

Apply standards pragmatically and consistently with the target project's established architecture.

---

# Adaptive Gate Sets

## FAST PATH

Required only:

1. Scope is clear and LOW risk.
2. Existing architecture/pattern is respected.
3. Change is correct and does not introduce obvious security/data risk.
4. One targeted behavior check passes.
5. Diff review passes.
6. Verifier approves.
7. State + Git checkpoint are accurate.

Do not run the full gate list mechanically for trivial work.

## STANDARD PATH

Use relevant gates for:

- architecture,
- correctness,
- failure handling,
- testing,
- QA when useful,
- UX when user-facing,
- performance/cost where relevant,
- evidence,
- Git integrity.

Skip gates that have no relationship to the change.

## GUARDED PATH

Use the full relevant gate set, including security/data-integrity/failure-path/broader-regression checks as justified.

---

# Gate 0 — Scope and Traceability

- `TASK.md` has one coherent objective.
- Linked requirement/acceptance criteria are explicit.
- Scope and non-scope are clear.
- Risk and expected change surface are classified.
- Execution Path is FAST / STANDARD / GUARDED.
- Unrelated work is excluded.

---

# Gate 1 — Efficiency and Routing

Verify:

- model/reasoning route follows `MODEL_ROUTING.md`,
- context/test breadth is the minimum effective level,
- explicit user model choice is respected,
- escalation is evidence-based,
- de-escalation occurs after difficult stages,
- no unnecessary agent/reviewer passes are planned.

For FAST PATH, this gate should take seconds, not become a planning exercise.

---

# Gate 2 — Context and Usage Economy

- Resume from `STATUS.md` + `TASK.md`.
- Load only linked requirements/facts needed for the task.
- Prefer exact symbol/file navigation before broader scans.
- Reuse stable `FACTS.md` instead of rediscovering architecture.
- Reviewers begin from task + diff + evidence.
- No unnecessary parallel agents or duplicate analyses.
- State files remain compact and do not contain large logs/repeated requirements.

---

# Gate 3 — Architecture Fit

- Change follows existing module/layer boundaries.
- Existing project conventions are reused.
- No unnecessary framework, library, database, or architectural style is introduced.
- No parallel subsystem duplicates existing functionality.
- Public/backward compatibility is preserved or intentionally handled.

---

# Gate 4 — Code Quality

Check relevant changes only for:

- clear naming,
- cohesive responsibility,
- simple understandable control flow,
- no meaningful duplicated business logic,
- no speculative abstractions,
- no unexplained magic values,
- pragmatic SOLID, DRY, KISS, and YAGNI.

Do not turn review into subjective style policing.

---

# Gate 5 — Correctness and Trust Boundaries

When relevant verify:

- inputs are validated,
- client input is not trusted for server authority,
- authentication/authorization/ownership are enforced,
- data invariants remain valid,
- transactions/idempotency/concurrency are handled where needed,
- external-provider responses are treated safely.

For FAST non-sensitive work, skip irrelevant trust-boundary checks.

---

# Gate 6 — Failure Handling

For relevant failure modes verify:

- errors are not silently swallowed,
- retries are bounded,
- repeated requests cannot create unsafe duplicate side effects,
- partial failure is handled appropriately,
- user-visible errors are useful and safe,
- logs preserve useful context without leaking secrets/private data.

---

# Gate 7 — Focused Verification

Run the smallest behavior check most likely to disprove the implementation quickly:

- focused unit/component test,
- targeted API/integration test,
- targeted command/build check,
- direct behavior verification when automation is unavailable.

Do not rerun expensive unaffected suites without a concrete reason.

## Stop-When-Sufficient

Stop broadening when:

- acceptance criteria are proven,
- affected boundaries are covered,
- risk is adequately addressed,
- no evidence suggests wider regression risk.

---

# Gate 8 — Risk-Specific Review

## LOW / FAST

Required:

- targeted behavior check,
- diff review,
- verifier approval.

QA is optional and should normally be skipped for trivial work.

## MEDIUM / STANDARD

Required as relevant:

- targeted tests,
- relevant integration/type/build check,
- QA for meaningful behavior/regression risk,
- verifier approval,
- Normal User if user-facing interaction meaningfully changed.

## HIGH / GUARDED

Required:

- targeted tests,
- failure-path/edge-case tests,
- security review,
- QA review,
- relevant integration/build checks,
- verifier approval,
- Normal User if user-facing.

---

# Gate 9 — UX/UI, Jakob's Law, and Accessibility

For meaningful `User-Facing: YES` changes, verify relevant criteria from `UX_UI_STANDARDS.md`:

- page purpose and primary action are clear,
- familiar interaction patterns / Jakob's Law,
- existing design-system components/tokens reused,
- loading/empty/error/success/disabled states complete where needed,
- responsive behavior works for intended devices,
- keyboard/focus/labels/semantic controls usable,
- dynamic behavior reflects real permissions/config/capabilities,
- visual hierarchy is modern, restrained, and brand-consistent,
- error recovery is clear,
- refresh/re-entry behavior is sensible.

For a tiny copy/color/spacing fix, do not require a full UX audit.

---

# Gate 10 — Dynamic and Flexible Product Behavior

When runtime configuration/capabilities vary:

- avoid unnecessary hard-coded lists/limits/capabilities,
- use the existing source of truth,
- preserve sensible defaults,
- keep dynamic behavior predictable,
- avoid duplicated business authority.

Skip when unrelated.

---

# Gate 11 — Performance and Cost

Check only relevant risks:

- N+1 queries,
- unbounded queries,
- excessive API/provider calls,
- repeated expensive computation,
- unnecessary rerenders/network requests,
- unnecessarily large payload/context,
- duplicate paid API operations,
- uncontrolled retry loops,
- unnecessary dependencies/build cost.

For AI/API/cloud features also check minimum-cost capable routing and explicit user model choice.

Do not benchmark trivial work without evidence of a performance concern.

---

# Gate 12 — External Cost Discipline

If `External Cost: MATERIAL`:

- justify real paid/provider calls,
- prefer deterministic fixtures/mocks for routine tests,
- avoid production credentials/data,
- prevent duplicate side effects,
- record concise cost-sensitive evidence.

Skip otherwise.

---

# Gate 13 — Data, API, and Migration Safety

When relevant verify:

- database constraints support important invariants,
- migrations are deterministic and deployment-safe,
- rollback/recovery risk is understood,
- API contracts/error semantics remain valid,
- consumers are updated for intentional breaking changes,
- destructive behavior is explicit and protected.

---

# Gate 14 — Configuration, Dependencies, and Documentation

When relevant verify:

- environment-specific values are not hard-coded,
- new config is validated/documented,
- `.env.example` or equivalent updated without secrets,
- new dependencies are justified,
- unrelated dependency upgrades avoided,
- setup/API/deployment docs updated when behavior actually changed.

---

# Gate 15 — Regression Breadth

Broaden regression only when one or more are true:

- authentication/authorization changed,
- billing/credits/payments changed,
- database schema/migration changed,
- shared/core infrastructure changed,
- public API/shared contracts changed,
- several related work units completed,
- release/final verification is occurring.

Do not run the full repository suite after every trivial edit.

---

# Gate 16 — Evidence and Efficiency Result

Before completion, `TASK.md` records compactly:

- checks run and outcome,
- required review result,
- unresolved notes/risks,
- verifier result,
- route/context/test depth actually used,
- material cost notes.

Do not paste large logs or narrate every step.

---

# Gate 17 — Requirement Traceability

A completed PLAN item points to:

- requirement ID/section,
- completed task ID,
- verification evidence.

For standalone maintenance/bugfix prompts without a pre-existing requirement ID, the scoped TASK itself is acceptable traceability.

---

# Gate 18 — Git Integrity

Before commit/push:

- inspect current diff,
- stage only task-owned changes,
- review staged diff,
- ensure no secrets/generated junk/unrelated files,
- use a focused descriptive commit,
- push verified checkpoints when configured/authorized,
- record branch + commit SHA + sync status.

Never manufacture a clean tree with destructive commands.

---

# Gate 19 — Checkpoint

Update `STATUS.md` and `TASK.md` before moving to the next work unit.

For FAST tasks, keep the checkpoint compact.

A task is not fully checkpointed until its verified result and Git sync state are accurate.

Never mark a task complete solely because code compiles, lint passes, UI renders, or a commit exists.