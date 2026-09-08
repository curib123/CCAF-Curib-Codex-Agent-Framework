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
5. Minimum necessary reasoning depth
6. Minimum necessary agent/reviewer calls
7. Minimum necessary test breadth
8. Minimum external/API/CI cost
9. Minimum implementation complexity

Do not save tokens or API cost by skipping a check that materially protects correctness or security.

---

# 2. Task Efficiency Profile

Every `TASK.md` must declare:

```text
Reasoning: FAST | STANDARD | DEEP
Context: LOCAL | CROSS-LAYER | SYSTEM
Test Depth: TARGETED | EXPANDED | FULL
External Cost: NONE | LOW | MATERIAL
```

Use the lowest level that can reliably complete the work.

## FAST

Use for:

- simple discovery,
- isolated edits,
- copy/styling,
- routine CRUD,
- straightforward tests,
- documentation,
- mechanical changes with clear patterns.

## STANDARD

Use for:

- normal feature implementation,
- APIs,
- database behavior,
- integrations,
- state management,
- ordinary debugging,
- multi-file user-facing work.

## DEEP

Use only when justified by:

- security,
- authorization,
- billing/credits/payments,
- concurrency/idempotency,
- risky migrations,
- architecture changes,
- difficult persistent bugs,
- high-cost routing decisions,
- high blast-radius failures.

Escalate when evidence requires it. Reduce again after the difficult part is resolved.

---

# 3. Context Economy

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
- Prefer targeted search/navigation over broad scanning.
- Read exact functions/modules before whole large files when tooling permits.
- Prefer diffs for reviews after implementation.
- Persist stable discoveries in `FACTS.md` instead of rediscovering them.
- Keep state compact; summarize outcomes instead of pasting logs.
- Do not repeat large requirement text inside multiple state files.
- Do not carry obsolete discussion forward when repository state already captures it.

---

# 4. Tool-Call Efficiency

- Batch independent read-only discovery when practical.
- Avoid repeated equivalent searches.
- Do not call external/web tools for information already available in the repository.
- Do not invoke specialized reviewers unless risk/impact requires them.
- Avoid parallel agents by default because they duplicate context and can conflict.
- Parallelize only independent work with separate file ownership and clear integration points.

One strong implementation pass plus targeted review is preferred over many speculative passes.

---

# 5. Repository Discovery Efficiency

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

---

# 6. Work-Unit Efficiency

Prefer one coherent vertical slice that can be implemented and verified.

Avoid:

- giant multi-feature tasks,
- tiny meaningless microtasks,
- unrelated cleanup,
- speculative architecture,
- premature generalization.

A good task should create useful verified progress and a clean checkpoint.

---

# 7. Test Efficiency

Use the cheapest reliable test sequence.

Typical progression:

1. focused test for changed behavior,
2. affected integration/API/component test,
3. relevant typecheck/lint/build,
4. expanded regression when risk or dependency breadth requires it,
5. full suite at meaningful milestones/release or when the project is small enough that full is cheaper.

Do not rerun expensive unaffected suites after every trivial edit.

If a test failure clearly proves the change is wrong, fix it before running broader tests.

---

# 8. CI Efficiency

When the project supports it:

- use path/task-specific checks locally first,
- avoid unnecessary repeated full builds,
- keep CI deterministic,
- reuse dependency/build caches appropriately,
- separate quick required checks from expensive milestone checks where architecture permits.

Do not weaken required CI just to make it faster.

---

# 9. External Service and API Cost Efficiency

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

# 10. AI / LLM Cost Efficiency

For AI-enabled target projects, prefer:

- relevant context only,
- conversation/project summarization when needed,
- bounded output,
- caching when provider semantics support it,
- lowest-cost capable model for automatic routing when required by product design,
- explicit capability checks before expensive calls,
- no repeated provider calls for unchanged deterministic inputs unless necessary,
- usage/cost tracking when required.

Cost optimization must preserve user-requested model selection and required quality.

---

# 11. Failure Efficiency

When the same approach fails twice for the same root cause:

1. stop repeating it,
2. capture the evidence,
3. challenge the underlying assumption,
4. reduce the failing unit,
5. choose a materially different approach.

Do not burn usage on uncontrolled retry loops.

---

# 12. Dependency Efficiency

Before adding a dependency ask:

1. Is equivalent functionality already present?
2. Can the framework/standard library do it cleanly?
3. Is the dependency maintained and secure?
4. Does its runtime/bundle/maintenance cost justify it?

Do not add large dependencies for trivial functionality.

---

# 13. State Efficiency

`STATUS.md` answers: **where are we?**

`TASK.md` answers: **what exactly should happen next?**

`PLAN.md` answers: **what work remains?**

`FACTS.md` answers: **what stable project facts should we not rediscover?**

`DECISIONS.md` answers: **what durable decision must future sessions understand?**

Do not duplicate the same long information across all five files.

---

# 14. Review Efficiency

Reviewer context should start with:

- task objective/acceptance criteria,
- diff,
- targeted evidence,
- risk classification.

Review the changed behavior and relevant boundaries, not the entire repository by default.

Escalate review breadth when the change surface reveals additional risk.

---

# 15. Cost-Aware Definition of Success

A solution is efficient when it:

- satisfies the requirement,
- passes appropriate verification,
- avoids unnecessary code and dependencies,
- avoids unnecessary model/context usage,
- avoids unnecessary CI/external-service cost,
- leaves a compact resumable checkpoint,
- remains maintainable for the next engineer.

**Efficiency is a quality attribute, not permission to cut corners.**