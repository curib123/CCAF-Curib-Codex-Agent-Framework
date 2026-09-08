# CCAF — Curib Codex Agent Framework

**CCAF** is a reusable engineering workflow for Codex and other AI coding agents working on **existing software projects**.

It helps your coding agent:

- understand the project before changing it,
- avoid unnecessary rewrites and overengineering,
- fix bugs from the root cause,
- add features using existing project patterns,
- perform maintenance safely,
- follow good coding and engineering practices,
- build modern, user-friendly UI/UX using Jakob's Law,
- test and verify changes based on risk,
- save progress so new sessions can resume cheaply,
- commit verified work and keep GitHub in sync.

> **Simple idea:** You tell Codex **what you want**. CCAF helps Codex decide **how to implement it safely, efficiently, and professionally**.

---

# Start Here — Beginner Guide

If you are new to CCAF, this is the only section you need at first.

## 1. Recommended folder setup

Put CCAF beside your existing project:

```text
workspace/
├── AGENTS.md
├── agent/
└── YourProject/
```

`agent/` contains CCAF.

`YourProject/` contains your actual application.

The root `AGENTS.md` makes normal Codex prompts automatically follow CCAF.

You can use one shared CCAF folder for multiple projects:

```text
workspace/
├── AGENTS.md
├── agent/
├── ProjectA/
├── ProjectB/
└── ProjectC/
```

---

## 2. Install the Codex entrypoint

Copy:

```text
agent/templates/CODEX_ROOT_AGENTS.md
```

into your workspace root and rename it:

```text
AGENTS.md
```

Your workspace should now look like:

```text
workspace/
├── AGENTS.md
├── agent/
└── YourProject/
```

This is important because it tells Codex:

> Every project-work prompt should use CCAF.

Even short prompts such as:

```text
fix login error
```

```text
add search
```

```text
make this responsive
```

```text
update dependencies
```

```text
continue
```

still use the CCAF workflow.

---

## 3. Create a project profile

Create:

```text
agent/projects/my-project/
```

with:

```text
agent/projects/my-project/
├── REQUIREMENTS.md
└── state/
    ├── STATUS.md
    ├── TASK.md
    ├── PLAN.md
    ├── FACTS.md
    └── DECISIONS.md
```

You can copy the files from:

```text
agent/projects/_example/
```

or use the templates inside:

```text
agent/templates/
```

---

## 4. Put your requirements in REQUIREMENTS.md

You mainly provide:

- what problem you are solving,
- goals,
- scope,
- features,
- security requirements,
- performance/reliability needs,
- usability expectations,
- acceptance criteria.

You do **not** need to manually create the full technical implementation plan.

CCAF discovers the existing architecture and builds the implementation plan from the real project.

---

## 5. Open Codex from the workspace root

Example on Windows:

```powershell
cd C:\Projects\workspace
code .
```

Codex should be able to see both:

```text
agent/
YourProject/
```

---

## 6. First prompt

Use:

```text
Read ./agent/AGENTS.md.

Target project:
./YourProject

Requirements:
./agent/projects/my-project/REQUIREMENTS.md

Start CCAF for this existing project.
Analyze only what is necessary, create project state, then begin the highest-priority actionable requirement.
```

After setup, you normally do **not** need this long prompt again.

You can simply say:

```text
continue
```

or give a normal development request.

---

# What Happens When You Send a Prompt?

CCAF first identifies the type of work.

## Bug or error

Example:

```text
fix the login error when the token expires
```

CCAF uses the **BUGFIX** workflow:

```text
Confirm failure
→ Find root cause
→ Define expected behavior
→ Add/identify regression check
→ Make smallest safe fix
→ Test nearby behavior
→ Verify
→ Commit
→ Push
```

CCAF tries to fix the **cause**, not only hide the symptom.

See [`agent/workflows/bugfix.md`](agent/workflows/bugfix.md).

---

## New feature

Example:

```text
add product search with filters
```

CCAF uses the **FEATURE** workflow:

```text
Understand requested outcome
→ Inspect existing project patterns
→ Define smallest vertical slice
→ Implement
→ Test
→ Validate UX/security when relevant
→ Verify
→ Commit
→ Push
```

CCAF reuses existing components, APIs, database patterns, and architecture whenever possible.

See [`agent/workflows/feature.md`](agent/workflows/feature.md).

---

## Maintenance

Example:

```text
update dependencies and remove deprecated code
```

CCAF uses the **MAINTENANCE** workflow:

```text
Define maintenance scope
→ Check impact
→ Make minimum safe change
→ Run targeted regression
→ Verify
→ Commit
→ Push
```

Maintenance should improve the project without becoming an accidental rewrite.

See [`agent/workflows/maintenance.md`](agent/workflows/maintenance.md).

---

## Continue existing work

Example:

```text
continue
```

CCAF resumes from:

```text
STATUS.md
→ TASK.md
→ Git diff / branch state
→ relevant requirement/files only
→ NEXT ACTION
```

It should not restart the entire project analysis.

---

# Why CCAF Uses Project State

CCAF saves useful context inside the repository instead of depending on conversation memory.

## STATUS.md

Answers:

> Where are we now?

Contains things such as:

- current task,
- last completed work,
- blockers,
- last verification,
- Git branch/commit/sync status,
- NEXT ACTION.

## TASK.md

Answers:

> What exactly should Codex work on right now?

It is the main low-context resume packet.

## PLAN.md

Answers:

> What remains to be implemented?

Tasks should link back to requirement IDs.

## FACTS.md

Answers:

> What stable things have already been discovered about the project?

Examples:

- framework,
- database,
- authentication mechanism,
- important directories,
- build/test commands.

This prevents Codex from rediscovering the same architecture every session.

## DECISIONS.md

Answers:

> Which important technical decisions must future sessions remember?

It is not a development diary.

---

# CCAF Is Designed to Avoid Overengineering

CCAF follows a strong rule:

> **Use the simplest production-quality solution that satisfies the real requirement and fits the existing project.**

CCAF should **not** add extra architecture just because it looks sophisticated.

Before adding things such as:

- new abstraction layers,
- repositories,
- factories,
- interfaces,
- queues,
- caches,
- event buses,
- plugin systems,
- microservices,
- new frameworks,
- new databases,
- large dependencies,

there must be a concrete need.

CCAF follows:

- **KISS** — keep it simple,
- **YAGNI** — do not build hypothetical future features,
- **DRY** — avoid meaningful duplicated business logic,
- **SOLID** — apply when it actually improves maintainability/testing.

Small problem → small solution.

Complex architecture is justified only by real complexity.

---

# Modern UI/UX Rules

For user-facing work, CCAF follows [`agent/UX_UI_STANDARDS.md`](agent/UX_UI_STANDARDS.md).

The goal is:

**modern + familiar + accessible + responsive + flexible**

rather than visually impressive but confusing UI.

## Jakob's Law

Users spend most of their time using other products.

CCAF therefore prefers familiar patterns such as:

- recognizable navigation,
- standard form behavior,
- predictable buttons,
- conventional dialogs,
- familiar tables/lists,
- clear settings pages,
- expected mobile behavior.

> **Modern should still feel familiar.**

## User-facing work should consider

- loading states,
- empty states,
- success states,
- error states,
- disabled states,
- permission states,
- responsive layouts,
- keyboard navigation,
- focus states,
- accessibility,
- recovery after mistakes,
- refresh/re-entry behavior.

CCAF also uses a **Normal User Agent** for user-facing work when appropriate.

---

# Efficient and Cost-Aware by Design

See [`agent/EFFICIENCY_STANDARDS.md`](agent/EFFICIENCY_STANDARDS.md).

Every task can declare:

```text
Reasoning: FAST | STANDARD | DEEP
Context: LOCAL | CROSS-LAYER | SYSTEM
Test Depth: TARGETED | EXPANDED | FULL
External Cost: NONE | LOW | MATERIAL
User-Facing: YES | NO
```

CCAF starts with the minimum effective level and escalates only when needed.

## Example

Small CSS issue:

```text
Reasoning: FAST
Context: LOCAL
Test Depth: TARGETED
External Cost: NONE
```

Authentication bug:

```text
Reasoning: DEEP
Context: CROSS-LAYER
Test Depth: EXPANDED
External Cost: NONE
```

CCAF tries to reduce waste from:

- repeated repository scans,
- unnecessary high reasoning,
- too many agent calls,
- repeated external API calls,
- excessive CI runs,
- full test suites after trivial changes,
- huge context windows containing irrelevant files.

Efficiency never means skipping important security or correctness checks.

---

# Risk-Based Reviews

CCAF does not run every specialist on every task.

## LOW risk

Examples:

- copy changes,
- isolated styling,
- documentation,
- simple non-sensitive edits.

```text
Engineer
→ focused verification
→ Verifier
```

## MEDIUM risk

Examples:

- ordinary features,
- APIs,
- shared UI behavior,
- normal database logic.

```text
Engineer
→ QA
→ Verifier
```

Add Normal User Agent for user-facing changes.

## HIGH risk

Examples:

- authentication,
- authorization,
- payments,
- billing/credits,
- permissions,
- migrations,
- concurrency,
- destructive data operations,
- secrets.

```text
Engineer
→ Security Reviewer
→ QA
→ Verifier
```

Add Normal User Agent when the behavior is user-facing.

---

# Professional Roles

CCAF uses specialized roles only when they are useful.

### Orchestrator

Selects the right task, risk, workflow, reviewers, and checkpoint strategy.

### Analyst + Planner

Discovers the existing architecture, compares it with requirements, and creates a requirement-linked plan.

### Engineer

Implements the smallest correct production-quality change using the project's real stack and conventions.

### QA Engineer

Tests expected behavior, failure paths, edge cases, and regressions.

### Security Reviewer

Reviews security-sensitive work such as authentication, authorization, billing, permissions, uploads, secrets, and user data.

### Normal User Agent

Evaluates user-facing work from the perspective of a normal user rather than an engineer.

### Verifier

Independently checks that the implementation, evidence, and acceptance criteria actually match.

---

# Coding and Engineering Standards

See [`agent/ENGINEERING_STANDARDS.md`](agent/ENGINEERING_STANDARDS.md).

CCAF expects production-minded practices such as:

- readable code,
- clear naming,
- cohesive responsibilities,
- validation at trust boundaries,
- secure defaults,
- explicit error handling,
- data integrity,
- compatibility awareness,
- focused tests,
- observability where needed,
- dependency discipline,
- safe migrations,
- performance awareness,
- cost awareness,
- maintainable Git history.

The framework values good engineering judgment over blindly following patterns.

---

# Quality Gates

See [`agent/QUALITY_GATES.md`](agent/QUALITY_GATES.md).

Depending on the task, CCAF checks:

```text
Scope
→ Efficiency profile
→ Architecture fit
→ Code quality
→ Correctness
→ Failure handling
→ Targeted testing
→ Risk review
→ UX / Jakob's Law
→ Accessibility
→ Dynamic/flexible behavior
→ Performance / cost
→ API/data safety
→ Dependencies/configuration
→ Regression
→ Evidence
→ Requirement traceability
→ Git integrity
→ Checkpoint
```

Not every gate requires an expensive test. The depth should match the task risk.

---

# Git and GitHub Tracking

CCAF includes a Git/GitHub checkpoint workflow:

[`agent/workflows/github-sync.md`](agent/workflows/github-sync.md)

After a verified work unit, CCAF should:

```text
Inspect diff
→ stage task-owned files only
→ review staged diff
→ commit
→ push
→ record branch + commit SHA + sync state
```

Example commit:

```text
fix(auth): handle expired sessions [P0-03]
```

CCAF should **not** blindly use `git add .` when unrelated changes exist.

It must preserve unrelated local user work.

If push cannot succeed safely, state should record:

```text
Git Sync: LOCAL ONLY
```

with the reason.

Your local environment must still have valid GitHub authentication and a configured remote.

Useful checks:

```powershell
git remote -v
git branch --show-current
git status
git push
```

---

# Resume After a New Session or Usage Limit

Use:

```text
Read ./agent/AGENTS.md.

Resume target project:
./YourProject

Project state:
./agent/projects/my-project/state/

Read STATUS.md and TASK.md first.
Verify the checkpoint against current code and Git state.
Continue from NEXT ACTION.
Do not restart full-project analysis unless saved project facts are stale or missing.
```

In normal use, if the root `AGENTS.md` entrypoint is installed correctly, you can often simply say:

```text
continue
```

---

# Advanced: Core Execution Model

For experienced users, the core CCAF loop is:

```text
PROMPT
   ↓
CLASSIFY INTENT
   ↓
LOAD STATUS + TASK
   ↓
LOAD MINIMUM RELEVANT CONTEXT
   ↓
SELECT RISK + EFFICIENCY PROFILE
   ↓
IMPLEMENT SMALLEST COMPLETE CHANGE
   ↓
CHEAPEST RELIABLE TEST
   ↓
RISK-BASED REVIEW
   ↓
INDEPENDENT VERIFICATION
   ↓
UPDATE STATE
   ↓
SAFE COMMIT + GITHUB SYNC
   ↓
NEXT TASK
```

Intent routing:

```text
BUGFIX      → workflows/bugfix.md
FEATURE     → workflows/feature.md
MAINTENANCE → workflows/maintenance.md
CONTINUE    → workflows/resume.md
GENERAL     → workflows/development-loop.md
```

The framework intentionally minimizes repeated analysis, parallel-agent duplication, unnecessary abstractions, and expensive full regression runs.

---

# Important Files

```text
agent/
├── AGENTS.md                  # Master CCAF rules
├── ENGINEERING_STANDARDS.md   # Coding/engineering practices
├── EFFICIENCY_STANDARDS.md    # Context/cost/usage efficiency
├── UX_UI_STANDARDS.md         # Modern familiar UI/UX + Jakob's Law
├── QUALITY_GATES.md           # Completion and review gates
├── HOW_TO_USE.md              # Detailed usage guide
├── agents/                    # Specialist role instructions
├── workflows/
│   ├── development-loop.md
│   ├── bugfix.md
│   ├── feature.md
│   ├── maintenance.md
│   ├── milestone-review.md
│   ├── github-sync.md
│   ├── start.md
│   └── resume.md
├── templates/
│   ├── CODEX_ROOT_AGENTS.md
│   ├── REQUIREMENTS.md
│   ├── STATUS.md
│   ├── TASK.md
│   ├── PLAN.md
│   ├── FACTS.md
│   └── DECISIONS.md
└── projects/
    └── _example/
```

---

# CCAF Principles

**Understand before editing.**

**Reuse before rewriting.**

**Fix root causes, not only symptoms.**

**Small requirement → small implementation.**

**Do not overengineer.**

**Use the minimum effective reasoning and context.**

**Run the cheapest reliable verification first.**

**Modern UI should still feel familiar.**

**Follow Jakob's Law for user-facing experiences.**

**Protect existing user work.**

**Checkpoint before context is lost.**

**Commit only what the task owns.**

**Keep verified work tracked in GitHub.**

---

# Detailed Documentation

For the complete setup and operating guide, see:

[`agent/HOW_TO_USE.md`](agent/HOW_TO_USE.md)

For coding practices:

[`agent/ENGINEERING_STANDARDS.md`](agent/ENGINEERING_STANDARDS.md)

For efficiency:

[`agent/EFFICIENCY_STANDARDS.md`](agent/EFFICIENCY_STANDARDS.md)

For UX/UI:

[`agent/UX_UI_STANDARDS.md`](agent/UX_UI_STANDARDS.md)

For quality verification:

[`agent/QUALITY_GATES.md`](agent/QUALITY_GATES.md)

---

# License

MIT License. See [`LICENSE`](LICENSE).