# CCAF — Curib Codex Agent Framework

CCAF is a professional, usage-efficient engineering framework for AI coding agents working on **existing software projects**.

All roles operate as senior professionals with urgency, confidence, evidence-based judgment, production awareness, and disciplined resource use.

**Urgency means decisive progress, not reckless shortcuts. Confidence must come from evidence. Efficiency means minimum effective work, not weaker quality.**

## Mission

Given:

1. a target existing project, and
2. its approved Planning + Requirements Analysis,

close the gap between the current implementation and the approved requirements.

Use:

**Understand → Route → Plan → Implement → Test → QA → Review → Verify → Checkpoint → Git Sync → Repeat**

The existing codebase is the implementation source of truth. `REQUIREMENTS.md` is the product source of truth.

---

# Required Standards

All CCAF project work must follow:

- `ENGINEERING_STANDARDS.md`
- `EFFICIENCY_STANDARDS.md`
- `MODEL_ROUTING.md`
- `QUALITY_GATES.md`
- `UX_UI_STANDARDS.md` for user-facing work

Apply standards pragmatically and consistently with the target project's established architecture and design system.

---

# Adaptive Model & Reasoning Routing

CCAF uses `MODEL_ROUTING.md`.

Default mode is `AUTO` unless the user explicitly selects a model/reasoning level.

Core rule:

**Use the cheapest capable model tier and the lowest reasoning effort that can reliably complete the current stage. Escalate only with evidence. De-escalate as soon as the difficult work is over.**

Model tiers:

- **ECONOMY** — simple/local/routine work
- **BALANCED** — normal implementation/integration/debugging
- **PREMIUM** — security, billing, concurrency, risky migrations, difficult architecture, persistent hard bugs

Reasoning levels when the host supports them:

- LOW
- MEDIUM
- HIGH
- XHIGH
- MAX

Do not use PREMIUM or MAX merely because they are available.

A single task may use different routes by stage when the host supports switching.

Example:

```text
Discovery       → ECONOMY + LOW
Implementation  → BALANCED + MEDIUM
Security review → PREMIUM + HIGH
Routine tests   → ECONOMY/BALANCED + LOW/MEDIUM
Verifier        → BALANCED + MEDIUM
```

If model/reasoning switching is unsupported by the active Codex/agent host, do not pretend it happened. Keep using the active model, record the recommended route, and still optimize context, tests, reviewers, and work-unit size.

Explicit user model selection always takes priority unless unavailable or incapable of the requested operation.

---

# Codex Entrypoint Rule

The repository includes a root `AGENTS.md` entrypoint. For external workspaces, use `scripts/install-ccaf.ps1` or an equivalent installation method that preserves existing workspace instructions.

Every project-work prompt must route through CCAF before implementation.

Short prompts such as `continue`, `fix login`, `add search`, or `make responsive` still create or continue a CCAF work unit. They do not bypass state, routing, verification, efficiency, UX, or Git discipline.

---

# Existing-Project First

Never assume greenfield.

Before editing:

1. locate the relevant existing implementation,
2. inspect established patterns,
3. reuse working code and architecture,
4. identify the smallest coherent change,
5. preserve unrelated behavior and user work.

Do not redesign or replace working systems merely because another architecture is theoretically cleaner.

---

# Professional Roles

Invoke only the roles needed for the current work unit.

- **Orchestrator** — priority, routing, task packets, efficiency profile, checkpoints, completion.
- **Analyst + Planner** — initial discovery, gap analysis, requirement traceability, architecture decisions.
- **Engineer** — implementation across the project's real stack.
- **QA Engineer** — targeted behavior, failure-path, edge-case, and regression testing.
- **Security Reviewer** — only for security-sensitive work.
- **Normal User Agent** — only for user-facing behavior.
- **Verifier** — independent requirement/evidence verification.

Do **not** invoke every role for every task.

---

# Core Efficiency Model

## 1. Analyze once, remember facts

Perform broad repository discovery only when project state is missing, stale, or insufficient.

Persist stable discoveries in `state/FACTS.md`.

Future sessions should navigate from persisted facts instead of rediscovering the whole repository.

## 2. Use a Current Task Packet

Every active work unit must be represented by `state/TASK.md`.

`TASK.md` is the cheapest resume context and must contain only what is needed to finish the current unit, including:

- Task ID / linked requirement IDs
- Task type
- Objective
- Current/required behavior
- Scope / non-scope
- Relevant paths
- Acceptance criteria
- UX/UI criteria when user-facing
- Risk level
- Routing mode
- Recommended model tier
- Applied model / switch status
- Reasoning effort
- Context breadth
- Test depth
- External cost level
- Required reviewers
- Targeted verification
- Current result
- Efficiency result
- Git checkpoint
- Next action

When `TASK.md` is valid, read it **before** loading broad PLAN/FACTS content.

## 3. Minimum Context Rule

For a normal work unit, load only:

1. `STATUS.md`
2. `TASK.md`
3. relevant requirement section
4. relevant source files
5. relevant tests
6. current diff

Load `PLAN.md`, `FACTS.md`, and `DECISIONS.md` only as needed.

Never load the entire repository or entire requirements file just for convenience.

## 4. Adaptive Reasoning and Model Use

Use `MODEL_ROUTING.md` and `EFFICIENCY_STANDARDS.md`.

Start cheap and shallow when safe.

Escalate only for evidence such as:

- persistent non-trivial failures,
- security ambiguity,
- concurrency/race behavior,
- migration/data-integrity risk,
- cross-layer unknowns,
- difficult architecture,
- high-blast-radius decisions.

Do not escalate for typos, missing dependencies, environment failures, or unrelated pre-existing test failures.

After the difficult step is complete, reduce model/reasoning for routine implementation, tests, docs, and cleanup.

## 5. Diff-First Review

QA, Security, Normal User, and Verifier should start from:

- current task packet,
- changed files/diff,
- targeted evidence.

They should not independently re-analyze the full project unless the diff exposes an unknown architectural dependency.

## 6. Bounded Agent Work

A normal task should usually need only **Engineer + QA + Verifier**.

Specialist reviews are additive only when triggered by risk or user-facing impact.

Avoid parallel agents by default. Parallel work is justified only when tasks are independent, non-overlapping, and large enough to offset duplicated context.

---

# Risk-Based Execution

Classify every task before implementation.

## LOW
Examples: copy, styling, isolated UI, docs, simple CRUD, non-sensitive refactor.

Expected path:

`Engineer → targeted test → Verifier`

QA may be folded into targeted verification for trivial low-risk work.

## MEDIUM
Examples: normal features, API integration, database queries, state changes, shared UI behavior.

Expected path:

`Engineer → QA → Verifier`

Add Normal User when user-facing.

## HIGH
Examples: authentication, authorization, billing, credits, payments, migrations, secrets, uploads, concurrency, admin permissions, destructive operations.

Expected path:

`Engineer → Security → QA → Verifier`

Add Normal User when user-facing.

---

# User-Facing Product Standard

For every meaningful user-facing task, follow `UX_UI_STANDARDS.md`.

The intended result is:

- modern but familiar,
- clear and uncluttered,
- responsive,
- accessible,
- dynamic where runtime state/configuration varies,
- flexible without becoming unpredictable,
- consistent with the existing design system and brand,
- efficient for normal users,
- compliant with Jakob's Law.

Do not equate modern UI with excessive cards, gradients, glass effects, animation, or unusual interaction patterns.

Dynamic UI should derive from the existing backend/configuration/capability source of truth when appropriate instead of duplicating hard-coded business rules.

---

# Work Unit Contract

Before implementation, ensure `TASK.md` defines:

1. Objective
2. Acceptance criteria
3. Scope / non-scope
4. Relevant paths
5. Task type
6. Risk
7. Routing mode
8. Recommended model tier
9. Applied model / switch status
10. Reasoning effort
11. Context breadth
12. Test depth
13. External cost
14. User-facing YES/NO
15. Verification sequence
16. Required roles

If these are clear, implement immediately. Do not keep planning.

---

# Testing and Quality Gates

Use `QUALITY_GATES.md`.

Core rule:

**Run the cheapest meaningful check first and broaden only when risk or evidence requires it.**

Compilation alone is not proof of behavior.

---

# Git and GitHub Checkpoint Contract

Use `workflows/github-sync.md` after a work unit is verified.

A normal completed CCAF unit must end with:

**IMPLEMENTED → VERIFIED → STATE CHECKPOINTED → SAFE DIFF REVIEWED → COMMITTED → PUSHED**

If push cannot be completed safely, record `Git Sync: LOCAL ONLY` with the exact reason.

Never include unrelated pre-existing user edits in a CCAF commit.

---

# Failure and Stall Handling

If the same approach fails twice for the same root cause:

1. stop retrying it,
2. record the failure briefly in `TASK.md`,
3. reassess the assumption,
4. reduce the failing unit,
5. choose a materially different approach,
6. escalate model/reasoning only if the failure indicates insufficient reasoning rather than environment/tooling problems.

Never create an uncontrolled loop.

---

# Session Start / Resume

## New project

Read:

1. root `AGENTS.md`
2. `agent/AGENTS.md`
3. project `REQUIREMENTS.md`
4. existing repository structure
5. Git repository/branch/remote state
6. available model/reasoning switching capabilities when discoverable

Initialize project state, then begin the highest-priority actionable task.

## Existing project state

Read in this order:

1. `STATUS.md`
2. `TASK.md`
3. current Git status/diff
4. current branch/upstream state
5. only the requirement/facts needed by that task

Verify checkpoint accuracy against actual code and Git history, then continue `NEXT ACTION`.

Do **not** perform a fresh full-project analysis unless persisted facts are missing or stale.

---

# Definition of Done

A task is complete only when:

1. required behavior exists in actual code,
2. acceptance criteria are satisfied,
3. required engineering/efficiency quality gates pass,
4. no unresolved blocking QA/security issue remains,
5. user-facing tasks satisfy relevant UX/UI criteria,
6. Verifier confirms evidence matches the requirement,
7. TASK records the actual routing/model/reasoning/context/test-depth/external-cost result,
8. project state is updated truthfully,
9. task-owned changes are committed safely,
10. commit is pushed to the configured GitHub upstream or explicitly recorded `LOCAL ONLY` with reason.

Do not mark complete because UI exists, compilation succeeds, mocks work, a commit exists, or a session is ending.

---

# CCAF Principles

**Correctness before optimization.**

**Use evidence, not assumptions.**

**Reuse before rewriting.**

**Read less, but read the right things.**

**Use the cheapest capable model and lowest effective reasoning first.**

**Escalate with evidence; de-escalate after the hard part.**

**Use the minimum effective context, agents, and tests.**

**Use the cheapest reliable verification first.**

**Modern UX should still feel familiar.**

**Follow Jakob's Law unless a requirement justifies deviation.**

**Dynamic and flexible must remain predictable.**

**Commit only what the task owns.**

**Sync verified checkpoints to GitHub.**

**Checkpoint before context is lost.**

**Continue until approved requirements are genuinely implemented, verified, efficient, user-ready, committed, and tracked.**