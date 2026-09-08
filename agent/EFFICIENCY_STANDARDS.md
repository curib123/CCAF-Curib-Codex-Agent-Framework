# CCAF Efficiency Standards

CCAF optimizes for **verified results per unit of model usage, developer time, CI time, and external-service cost**.

Efficiency must never weaken correctness, security, or required verification.

The goal is not to do the least work. The goal is to do the **minimum effective work that produces a reliable result**.

---

# 1. Efficiency Priority

For every task optimize in this order:

1. Correct result
2. Security and data integrity
3. Reliable verification
4. Minimum necessary context
5. Minimum necessary reasoning/model cost
6. Minimum necessary agent/reviewer calls
7. Minimum necessary test breadth
8. Minimum external/API/CI cost
9. Minimum implementation complexity
10. Minimum ceremony/state-writing overhead

Do not save tokens or API cost by skipping a check that materially protects correctness or security.

---

# 2. Execution Paths

Every task uses the cheapest safe execution path.

## FAST PATH

Use when all are true:

- risk is LOW,
- scope is local and clear,
- acceptance criteria are obvious,
- no security/auth/billing/data-migration/concurrency concern exists,
- no unknown architectural dependency is exposed,
- change is small and reversible.

Default flow:

```text
TASK → inspect relevant code → implement → targeted check → diff review → verifier → checkpoint/git sync
```

Defaults:

```text
Model Tier: ECONOMY
Reasoning: LOW or MEDIUM
Context: LOCAL
Test Depth: TARGETED
Roles: Engineer + Verifier
```

Do not invoke Analyst, QA, Security, or Normal User unless the change reveals a real need. For tiny user-facing copy/style changes, the Verifier may perform the necessary user-facing check without a separate Normal User pass.

## STANDARD PATH

Use for normal features, integrations, shared UI behavior, API/database work, or non-trivial bugs.

Default flow:

```text
TASK → targeted discovery → implement → targeted/integration checks → QA when useful → verifier → checkpoint/git sync
```

Defaults:

```text
Model Tier: BALANCED
Reasoning: MEDIUM
Context: LOCAL or CROSS-LAYER
Test Depth: TARGETED or EXPANDED
```

## GUARDED PATH

Use for HIGH-risk work such as security, authorization, billing, payments, migrations, concurrency, destructive operations, secrets, or high blast radius.

Default flow:

```text
TASK → focused deep analysis → implement → security/risk checks → QA → verifier → broader regression if justified → checkpoint/git sync
```

Defaults:

```text
Model Tier: PREMIUM
Reasoning: HIGH or higher only when needed
Context: CROSS-LAYER or SYSTEM
Test Depth: EXPANDED or FULL when justified
```

Do not use GUARDED for ordinary work merely because it appears more thorough.

---

# 3. Adaptive Task Profile

Every `TASK.md` declares only the fields needed to control cost and quality:

```text
Execution Path: FAST | STANDARD | GUARDED
Context: LOCAL | CROSS-LAYER | SYSTEM
Test Depth: TARGETED | EXPANDED | FULL
External Cost: NONE | LOW | MATERIAL
```

Model/reasoning are governed by `MODEL_ROUTING.md`.

Start at the lowest reliable level. Escalate only when evidence requires it. De-escalate after the hard part is finished.

---

# 4. Single-Pass Default

For ordinary tasks, prefer one strong execution cycle:

```text
understand → edit → test → review diff → verify
```

Do not repeatedly re-plan, re-read, re-review, or regenerate the same solution when evidence is already sufficient.

A second pass is justified only when:

- tests fail,
- acceptance criteria are not met,
- review finds a material defect,
- scope/risk changed,
- the implementation exposed a false assumption.

---

# 5. Context Economy

Default context for an active task:

1. `STATUS.md`
2. `TASK.md`
3. linked requirement section
4. relevant source files
5. relevant tests
6. current diff

Only load broader `PLAN.md`, `FACTS.md`, `DECISIONS.md`, or repository areas when the current task requires them.

Rules:

- Do not reread unchanged files without a reason.
- Search for the exact symbol, route, error, component, test, or config first.
- Expand outward only from evidence.
- Read exact functions/modules before whole large files when tooling permits.
- Prefer diffs for reviews after implementation.
- Persist stable discoveries in `FACTS.md` instead of rediscovering them.
- Keep state compact; summarize outcomes instead of pasting logs.
- Do not repeat large requirement text inside multiple state files.
- Do not carry obsolete discussion forward when repository state already captures it.

## Context Expansion Ladder

Use this order:

```text
current file/symbol
→ direct callers/dependencies
→ related module
→ cross-layer boundary
→ system-wide only if necessary
```

Never jump directly to a full repository scan for a local problem.

---

# 6. Tool-Call Efficiency

- Batch independent read-only discovery when practical.
- Avoid repeated equivalent searches.
- Do not call external/web tools for information already available in the repository.
- Do not invoke specialized reviewers unless risk/impact requires them.
- Avoid parallel agents by default because they duplicate context and can conflict.
- Parallelize only independent work with separate file ownership and clear integration points.
- Prefer one query that answers the next decision over broad exploratory queries.

One strong implementation pass plus targeted review is preferred over many speculative passes.

---

# 7. Repository Discovery Efficiency

On first project initialization, discover enough to understand:

- stack,
- architecture,
- build/test commands,
- key modules,
- auth/data/config patterns,
- Git conventions.

Persist these facts.

After initialization:

**navigate from facts → inspect relevant area → implement**

Do not restart full-project analysis each session.

Persist high-value navigation shortcuts such as key directories and test/build commands. Do not persist transient details that will quickly become stale.

---

# 8. Work-Unit Efficiency

Prefer one coherent vertical slice that can be implemented and verified.

Avoid:

- giant multi-feature tasks,
- tiny meaningless microtasks,
- unrelated cleanup,
- speculative architecture,
- premature generalization.

A good task should create useful verified progress and a clean checkpoint.

## Safe Batching

Mechanical changes may be batched only when they:

- serve the same requirement/task,
- share the same risk level,
- have clear file ownership,
- can be verified together cheaply.

Do not batch unrelated bug fixes, features, and maintenance just to reduce commit count.

---

# 9. Test Efficiency

Use the cheapest reliable test ladder:

1. focused test for changed behavior,
2. affected integration/API/component test,
3. relevant typecheck/lint/build,
4. expanded regression when risk or dependency breadth requires it,
5. full suite at meaningful milestones/release or when the project is small enough that full is cheaper.

## Stop-When-Sufficient Rule

Stop broadening tests when all are true:

- acceptance criteria are proven,
- affected boundaries are covered,
- task risk is adequately addressed,
- no evidence suggests wider regression risk.

Do not run more tests merely to look thorough.

If a focused test already proves the implementation is wrong, fix it before spending on broader checks.

---

# 10. CI Efficiency

When the project supports it:

- use path/task-specific checks locally first,
- avoid unnecessary repeated full builds,
- keep CI deterministic,
- reuse dependency/build caches appropriately,
- separate fast required checks from expensive milestone checks where architecture permits,
- do not trigger duplicate CI runs for the same unchanged commit when avoidable.

Do not weaken required CI just to make it faster.

---

# 11. External Service and API Cost Efficiency

For paid or rate-limited services:

- use fixtures/mocks for routine deterministic tests when they accurately model the boundary,
- use real calls only when integration behavior itself must be validated,
- avoid duplicate requests,
- batch safely where supported,
- cache only when semantically correct,
- bound retries,
- avoid sending unnecessary payload/context,
- prevent duplicate billing/side effects,
- record material cost-sensitive behavior when requirements depend on it.

Never use production credentials or real billable operations when a safe test path exists.

---

# 12. AI / LLM Cost Efficiency

Use `MODEL_ROUTING.md`.

For AI-enabled target projects and for CCAF execution itself:

- use the cheapest capable model,
- use the lowest effective reasoning,
- escalate with evidence,
- de-escalate after the difficult stage,
- send relevant context only,
- bound output where appropriate,
- cache/summarize when semantically correct,
- avoid repeated expensive analysis for unchanged inputs,
- preserve explicit user model choices.

Do not keep a premium/max route active for routine follow-up work.

---

# 13. Failure Efficiency

When the same approach fails twice for the same root cause:

1. stop repeating it,
2. capture the evidence,
3. challenge the underlying assumption,
4. reduce the failing unit,
5. choose a materially different approach.

Do not burn usage on uncontrolled retry loops.

Distinguish reasoning failure from environment/tool/dependency failure before escalating the model.

---

# 14. Dependency Efficiency

Before adding a dependency ask:

1. Is equivalent functionality already present?
2. Can the framework/standard library do it cleanly?
3. Is the dependency maintained and secure?
4. Does its runtime/bundle/maintenance cost justify it?

Do not add large dependencies for trivial functionality.

---

# 15. State Efficiency

`STATUS.md` answers: **where are we?**

`TASK.md` answers: **what exactly should happen next?**

`PLAN.md` answers: **what work remains?**

`FACTS.md` answers: **what stable project facts should we not rediscover?**

`DECISIONS.md` answers: **what durable decision must future sessions understand?**

Do not duplicate the same long information across all five files.

State updates should be concise enough that resuming is cheaper than rereading the previous conversation.

---

# 16. Review Efficiency

Reviewer context starts with:

- task objective/acceptance criteria,
- diff,
- targeted evidence,
- risk classification.

Review changed behavior and relevant boundaries, not the entire repository by default.

For FAST PATH tasks, one independent Verifier pass is normally enough.

Escalate review breadth only when the change surface reveals additional risk.

---

# 17. Output Efficiency

Agent outputs should be decision-oriented and compact.

Prefer:

- what changed,
- evidence,
- blockers/risks,
- next action.

Avoid:

- long restatements of the prompt,
- verbose narration of obvious steps,
- repeated architecture summaries already in `FACTS.md`,
- dumping raw logs into state.

Use repository state as the durable record instead of repeating everything in chat.

---

# 18. Effectiveness Rule

Optimize for **first-pass correctness**, not raw speed alone.

Before editing, verify the key assumption that determines the solution. After editing, run the smallest check that can disprove the solution quickly.

The fastest workflow is the one that avoids rework.

---

# 19. Cost-Aware Definition of Success

A solution is efficient when it:

- satisfies the requirement,
- passes appropriate verification,
- avoids unnecessary code and dependencies,
- avoids unnecessary model/context usage,
- avoids unnecessary CI/external-service cost,
- avoids unnecessary agent/reviewer passes,
- leaves a compact resumable checkpoint,
- remains maintainable for the next engineer.

**Efficiency is a quality attribute, not permission to cut corners.**