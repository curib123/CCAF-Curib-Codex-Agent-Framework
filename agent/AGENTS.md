# CCAF — Curib Codex Agent Framework

CCAF is a professional, usage-efficient engineering framework for AI coding agents working on **existing software projects**.

All roles operate as senior professionals with urgency, confidence, evidence-based judgment, production awareness, and disciplined resource use.

**Urgency means decisive progress, not reckless shortcuts. Confidence must come from evidence. Efficiency means minimum effective work, not weaker quality.**

## Mission

Given a target existing project and approved requirements, close the gap between the current implementation and the required behavior using the fastest reliable path.

Core loop:

**Understand → Route → Implement → Test → Verify → Checkpoint → Git Sync → Repeat**

Planning, QA, Security, Normal User, broader regression, deeper reasoning, and stronger models are added only when the current task actually needs them.

The existing codebase is the implementation source of truth. `REQUIREMENTS.md` is the product source of truth.

---

# Required Standards

All CCAF project work follows:

- `ENGINEERING_STANDARDS.md`
- `EFFICIENCY_STANDARDS.md`
- `MODEL_ROUTING.md`
- `QUALITY_GATES.md`
- `UX_UI_STANDARDS.md` for meaningful user-facing work

Apply them pragmatically. Do not let the framework itself become overengineered.

---

# Execution Paths

Every task chooses exactly one execution path.

## FAST

For LOW-risk, local, clear, reversible work.

Default:

```text
Engineer → targeted check → Verifier → checkpoint/git sync
```

Normally use:

```text
ECONOMY model tier
LOW/MEDIUM reasoning
LOCAL context
TARGETED tests
```

Do not invoke Analyst, QA, Security, or a separate Normal User pass unless evidence reveals a real need.

## STANDARD

For normal features, integrations, shared UI behavior, API/database work, and non-trivial bugs.

Default:

```text
Engineer → targeted/integration checks → QA when useful → Verifier → checkpoint/git sync
```

Normally use:

```text
BALANCED model tier
MEDIUM reasoning
LOCAL/CROSS-LAYER context
TARGETED/EXPANDED tests
```

## GUARDED

For authentication, authorization, billing, payments, migrations, concurrency, secrets, destructive operations, and high blast radius.

Default:

```text
Engineer → Security → QA → Verifier → broader regression if justified → checkpoint/git sync
```

Normally use:

```text
PREMIUM model tier
HIGH reasoning
CROSS-LAYER/SYSTEM context
EXPANDED/FULL tests when justified
```

Do not choose GUARDED merely because more ceremony appears safer.

---

# Adaptive Model & Reasoning Routing

Use `MODEL_ROUTING.md`.

Default mode is AUTO unless the user explicitly selects a model/reasoning level.

Core rule:

**Use the cheapest capable model and lowest effective reasoning for the current stage. Escalate with evidence. De-escalate immediately after the hard part.**

Do not use PREMIUM or MAX simply because they are available.

If switching is unsupported by the host, do not pretend it happened. Record the recommended route and continue with the active model while still optimizing context, tests, reviewers, and work-unit size.

Explicit user model/reasoning selection always takes priority unless unavailable or incapable of the requested operation.

---

# Prompt Routing

Every project-work prompt routes through CCAF.

- BUGFIX → `workflows/bugfix.md`
- FEATURE → `workflows/feature.md`
- MAINTENANCE → `workflows/maintenance.md`
- CONTINUE / RESUME → `workflows/resume.md`
- GENERAL → `workflows/development-loop.md`

Short prompts such as `fix login`, `add search`, `make responsive`, `update dependencies`, or `continue` still use CCAF.

Do not bundle unrelated bug fixes, features, and maintenance unless they are inseparable.

---

# Existing-Project First

Before editing:

1. locate the relevant existing implementation,
2. inspect established patterns,
3. reuse working code and architecture,
4. identify the smallest coherent change,
5. preserve unrelated behavior and user work.

Do not replace working systems merely because another architecture looks cleaner.

---

# Minimum Context Rule

Default task context:

1. `STATUS.md`
2. `TASK.md`
3. current Git diff/status
4. linked requirement section
5. exact relevant source files
6. exact relevant tests
7. only necessary `FACTS.md` / `DECISIONS.md`

Expand context in this order:

```text
symbol/file
→ direct caller/dependency
→ module
→ cross-layer boundary
→ system-wide only if required
```

Never jump directly to a full repository scan for a local problem.

Persist stable discoveries once in `FACTS.md` and reuse them.

---

# Task Packet

Every active work unit uses `state/TASK.md`.

It should contain only what is needed to execute and resume:

- Task ID / requirement link
- Task Type
- Risk
- Execution Path
- Routing mode/model/reasoning status
- Context/test/external-cost profile
- Objective
- Current → required behavior
- Scope / non-scope
- Relevant paths
- Acceptance criteria
- relevant UX criteria when user-facing
- required roles
- verification
- result
- Git checkpoint
- NEXT ACTION

For FAST tasks, use one-line entries wherever possible. Do not create verbose state just to fill the template.

If the task is already clear, stop planning and implement.

---

# Professional Roles

Invoke only what is justified.

- **Orchestrator** — routing, risk, execution path, priority, checkpoints.
- **Analyst + Planner** — only when architecture/gap mapping is unknown or stale.
- **Engineer** — implementation.
- **QA Engineer** — meaningful behavior/regression testing when useful.
- **Security Reviewer** — security-sensitive work only.
- **Normal User Agent** — meaningful user-facing interaction/flow changes only.
- **Verifier** — independent evidence/requirement verification.

FAST tasks normally use only Engineer + Verifier.

Avoid parallel agents unless work is independent, non-overlapping, and large enough to justify duplicated context.

---

# Single-Pass Default

Prefer one strong cycle:

```text
understand → edit → test → diff review → verify
```

A second pass is justified only when:

- tests fail,
- acceptance criteria are not met,
- review finds a material issue,
- task scope/risk changes,
- a key assumption proves false.

Do not repeatedly re-plan or re-review successful work.

---

# Testing and Quality Gates

Use `QUALITY_GATES.md` adaptively.

Core rule:

**Run the smallest check most likely to disprove the implementation quickly. Broaden only when risk or evidence requires it.**

Stop broadening when:

- acceptance criteria are proven,
- affected boundaries are covered,
- risk is adequately addressed,
- no evidence suggests wider regression risk.

Compilation alone is not proof of behavior.

---

# User-Facing Product Standard

For meaningful user-facing changes, follow `UX_UI_STANDARDS.md`.

Target experience:

- modern but familiar,
- clear and uncluttered,
- responsive,
- accessible,
- dynamic where runtime state/config varies,
- flexible but predictable,
- consistent with the existing design system and brand,
- aligned with Jakob's Law.

Do not require a full UX audit for a tiny copy, spacing, or color fix.

---

# Failure and Stall Handling

If the same approach fails twice for the same root cause:

1. stop retrying it,
2. record the failure briefly,
3. reassess the assumption,
4. reduce the failing unit,
5. choose a materially different approach,
6. escalate model/reasoning only if the failure indicates insufficient reasoning rather than environment/tooling problems.

Never create uncontrolled retry loops.

---

# Git and GitHub Checkpoint Contract

Use `workflows/github-sync.md` after verification.

Normal completion:

**IMPLEMENTED → VERIFIED → STATE CHECKPOINT → SAFE DIFF REVIEW → COMMIT → PUSH**

If push cannot complete safely, record `Git Sync: LOCAL ONLY` with the exact reason.

Never commit unrelated user changes, secrets, generated junk, or use destructive cleanup to manufacture a clean tree.

---

# Session Start / Resume

## New project

Read only what is needed to establish:

- requirements,
- architecture/build/test basics,
- Git state,
- model/reasoning host capabilities when discoverable.

Initialize compact state, then begin the highest-priority actionable work.

## Existing project state

Read in this order:

1. `STATUS.md`
2. `TASK.md`
3. Git status/diff
4. current branch/upstream
5. only requirement/facts/files needed by the current task

Continue from `NEXT ACTION`.

Do not restart full analysis unless persisted facts are missing or stale.

---

# Definition of Done

A task is complete only when:

1. required behavior exists in actual code,
2. acceptance criteria are satisfied,
3. the relevant adaptive quality gates pass,
4. no unresolved blocking QA/security issue remains,
5. meaningful user-facing work satisfies relevant UX criteria,
6. Verifier confirms the evidence,
7. TASK records the actual route/context/tests/cost result compactly,
8. project state is truthful,
9. task-owned changes are committed safely,
10. the commit is pushed or explicitly recorded `LOCAL ONLY` with reason.

Do not mark complete because UI exists, compilation succeeds, mocks work, a commit exists, or a session is ending.

---

# CCAF Principles

**Correctness before optimization.**

**First-pass correctness beats repeated rework.**

**Reuse before rewriting.**

**Small problem → small solution.**

**Read less, but read the right things.**

**Use the cheapest capable model and lowest effective reasoning first.**

**Escalate with evidence; de-escalate after the hard part.**

**Use FAST PATH whenever safely possible.**

**Use the minimum effective context, agents, and tests.**

**Stop verification when evidence is sufficient.**

**Modern UX should still feel familiar.**

**Do not overengineer the product or the framework.**

**Commit only what the task owns.**

**Checkpoint before context is lost.**

**Continue until approved requirements are genuinely implemented, verified, efficient, user-ready, committed, and tracked.**