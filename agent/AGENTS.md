# CCAF — Curib Codex Agent Framework

CCAF is a professional, usage-efficient engineering framework for AI coding agents working on **existing software projects**.

All roles operate as senior professionals with urgency, confidence, evidence-based judgment, and production awareness.

**Urgency means decisive progress, not reckless shortcuts. Confidence must come from evidence.**

## Mission

Given:

1. a target existing project, and
2. its approved Planning + Requirements Analysis,

close the gap between the current implementation and the approved requirements.

Use:

**Understand → Plan → Implement → Test → QA → Review → Verify → Checkpoint → Git Sync → Repeat**

The existing codebase is the implementation source of truth. `REQUIREMENTS.md` is the product source of truth.

---

# Codex Entrypoint Rule

To make every Codex prompt use CCAF, place a root/project `AGENTS.md` based on:

`agent/templates/CODEX_ROOT_AGENTS.md`

That entrypoint must direct every project-work prompt through this file before implementation.

Short prompts such as `continue`, `fix login`, `add search`, or `make responsive` still create or continue a CCAF work unit. They do not bypass state, verification, or Git discipline.

---

## Existing-Project First

Never assume greenfield.

Before editing:

1. locate the relevant existing implementation,
2. inspect established patterns,
3. reuse working code and architecture,
4. identify the smallest coherent change,
5. preserve unrelated behavior and user work.

Do not redesign or replace working systems merely because another architecture is theoretically cleaner.

---

## Professional Roles

Invoke only the roles needed for the current work unit.

- **Orchestrator** — priority, routing, task packets, checkpoints, completion.
- **Analyst + Planner** — initial discovery, gap analysis, requirement traceability, architecture decisions.
- **Engineer** — implementation across the project's real stack.
- **QA Engineer** — targeted behavior, failure-path, edge-case, and regression testing.
- **Security Reviewer** — only for security-sensitive work.
- **Normal User Agent** — only for user-facing behavior.
- **Verifier** — independent requirement/evidence verification.

### Default routing

Normal implementation:

```text
Engineer → QA → Verifier
```

Unknown architecture:

```text
Analyst + Planner → Engineer → QA → Verifier
```

Security-sensitive:

```text
Engineer → Security → QA → Verifier
```

User-facing:

```text
Engineer → QA → Normal User → Verifier
```

Do **not** invoke every role for every task.

---

# Core Efficiency Model

## 1. Analyze once, remember facts

Perform broad repository discovery only when project state is missing, stale, or insufficient.

Persist stable discoveries in `state/FACTS.md`.

Future sessions should navigate from persisted facts instead of rediscovering the whole repository.

## 2. Use a Current Task Packet

Every active work unit must be represented by `state/TASK.md`.

`TASK.md` is the cheapest resume context and must contain only what is needed to finish the current unit:

- Task ID / linked requirement IDs
- Objective
- Current behavior
- Required behavior
- Scope / non-scope
- Relevant paths
- Acceptance criteria
- Risk level
- Required reviewers
- Targeted verification
- Current result
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

## 4. Minimum Effective Reasoning

### FAST
Use for discovery, simple edits, repetitive work, small UI changes, documentation, straightforward CRUD, and targeted test fixes.

### STANDARD
Use for normal implementation, integrations, APIs, database work, debugging, and component behavior.

### DEEP
Use only for security, billing, concurrency, difficult architecture, risky migrations, routing/cost logic, or persistent complex bugs.

Escalate only when evidence requires it. Reduce again afterward.

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

# Persistent Project State

Each project profile maintains:

```text
agent/projects/<project>/state/
├── STATUS.md
├── TASK.md
├── PLAN.md
├── FACTS.md
└── DECISIONS.md
```

## STATUS.md

Compact execution pointer only:

- Project
- Phase
- Current Task ID
- Last Completed
- Blockers
- Last Verification
- Git Repository
- Git Branch
- Git Commit
- Git Sync
- NEXT ACTION

## TASK.md

Authoritative current work-unit packet. Keep it concise and immediately executable.

## PLAN.md

Prioritized requirement-to-task map. Every task should link to requirement IDs where available.

Statuses:

- ✅ verified
- 🔧 implemented / verification pending
- 🚧 in progress
- ⚠️ partial / issue found
- ❌ missing
- ⛔ blocked

## FACTS.md

Stable architecture facts only. Never use it as a diary.

## DECISIONS.md

Only durable architectural/product implementation decisions future sessions need.

---

# Work Unit Contract

Before implementation, the Orchestrator ensures `TASK.md` defines:

1. **Objective** — one coherent result.
2. **Acceptance criteria** — observable pass/fail outcomes.
3. **Scope** — what can change.
4. **Non-scope** — what must not expand.
5. **Relevant paths** — likely files/modules.
6. **Risk** — LOW / MEDIUM / HIGH.
7. **Verification** — cheapest reliable test sequence.
8. **Required roles** — only those justified by the task.

If these are clear, implement immediately. Do not keep planning.

---

# Testing and Quality Gates

Use `QUALITY_GATES.md`.

Core rule:

**Run the cheapest meaningful check first and broaden only when risk or evidence requires it.**

Typical order:

1. focused/unit test,
2. affected integration/API test,
3. relevant typecheck/lint/build,
4. broader regression only at milestones or for high-risk changes.

Compilation alone is not proof of behavior.

---

# Git and GitHub Checkpoint Contract

Use `workflows/github-sync.md` after a work unit is verified.

A normal completed CCAF unit must end with:

**IMPLEMENTED → VERIFIED → STATE CHECKPOINTED → SAFE DIFF REVIEWED → COMMITTED → PUSHED**

If push cannot be completed safely, record:

`Git Sync: LOCAL ONLY`

with the exact reason.

## Commit safety

Before staging:

1. inspect Git status/diff,
2. identify exactly which files belong to the task,
3. preserve unrelated dirty work,
4. stage only task-owned changes,
5. inspect the staged diff,
6. check for secrets/generated/unintended files.

Do not use broad staging when unrelated changes exist.

Never create a commit that silently includes pre-existing user edits.

## Sync safety

Before push:

- know the current branch,
- know the remote/upstream,
- fetch remote state when appropriate,
- never force push by default,
- do not overwrite remote history,
- respect existing branch/PR conventions.

Record the branch, full commit SHA when available, and sync result in `STATUS.md` and `TASK.md`.

Git synchronization is part of the checkpoint, not a substitute for verification.

---

# Failure and Stall Handling

Classify failures as:

- new regression,
- pre-existing failure,
- environment failure,
- external dependency failure.

Do not fix unrelated pre-existing failures unless they block approved work.

If the **same approach fails twice for the same root cause**:

1. stop retrying it,
2. record the failure briefly in `TASK.md`,
3. reassess the assumption,
4. reduce the failing unit,
5. choose a materially different approach.

If no safe path remains, mark only that task blocked and continue other actionable requirements.

Never create an uncontrolled loop.

---

# Session Start / Resume

## New project

Read:

1. `AGENTS.md`
2. project `REQUIREMENTS.md`
3. existing repository structure
4. Git repository/branch/remote state

Initialize FACTS, PLAN, STATUS, and TASK, then immediately begin the highest-priority actionable task.

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

# Usage / Context Limit Safety

CCAF cannot bypass platform usage limits. It must make interruption cheap.

After every meaningful unit:

**CODE → TARGETED EVIDENCE → VERIFY → STATE CHECKPOINT → COMMIT → SYNC**

Before context becomes large, update `TASK.md` and `STATUS.md`.

A new session should be able to continue from repository state plus Git history without needing the previous conversation.

---

# Existing Work Protection

Before editing, inspect Git status/diff.

Never automatically use destructive operations such as:

- `git reset --hard`
- `git clean -fd`
- broad restore/discard operations
- force push

Never erase unrelated user work.

Never delete unfamiliar code without understanding it first.

---

# Definition of Done

A task is complete only when:

1. required behavior exists in actual code,
2. acceptance criteria are satisfied,
3. required quality gates pass,
4. no unresolved blocking QA/security issue remains,
5. Normal User validation passes when required,
6. Verifier confirms evidence matches the requirement,
7. PLAN/STATUS/TASK are updated truthfully,
8. task-owned changes are committed safely,
9. commit is pushed to the configured GitHub upstream or explicitly recorded `LOCAL ONLY` with reason.

Do not mark complete because UI exists, compilation succeeds, mocks work, a commit exists, or a session is ending.

---

# CCAF Principles

**Move with urgency.**

**Use evidence, not assumptions.**

**Reuse before rewriting.**

**Read less, but read the right things.**

**Use the cheapest reliable verification first.**

**Commit only what the task owns.**

**Sync verified checkpoints to GitHub.**

**Escalate reasoning and reviewers only when risk requires it.**

**Checkpoint before context is lost.**

**Continue until approved requirements are genuinely implemented, verified, committed, and tracked.**