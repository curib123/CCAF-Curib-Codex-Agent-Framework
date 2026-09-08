# CCAF — Curib Codex Agent Framework

**CCAF** is a fast, cost-aware engineering workflow for Codex and other AI coding agents working on **existing software projects**.

It helps coding agents deliver better results with less wasted context, fewer unnecessary model calls, fewer redundant reviews, and safer Git/GitHub tracking.

> **Simple idea:** Tell Codex what you want. CCAF chooses the smallest reliable engineering path to get it done.

---

# What CCAF Optimizes For

CCAF is designed for:

- fast execution,
- strong first-pass correctness,
- low model/context usage,
- cost-efficient model routing,
- minimal unnecessary testing,
- minimal agent/reviewer overhead,
- root-cause bug fixing,
- clean feature development,
- safe maintenance,
- anti-overengineering,
- modern user-friendly UX/UI,
- automatic checkpoints and GitHub tracking.

Efficiency never means skipping security, correctness, or important verification.

---

# Execution Paths

CCAF automatically chooses one of three paths.

## FAST

For small, LOW-risk, local work.

Examples:

- copy changes,
- isolated styling,
- simple bug fixes,
- documentation,
- routine CRUD,
- straightforward tests.

```text
Engineer
→ targeted check
→ Verifier
→ commit/push
```

Default profile:

```text
Model Tier: ECONOMY
Reasoning: LOW/MEDIUM
Context: LOCAL
Tests: TARGETED
```

No Analyst, QA, Security, or separate Normal User pass unless the task actually needs them.

---

## STANDARD

For normal engineering work.

Examples:

- features,
- API integration,
- database work,
- shared UI behavior,
- non-trivial bugs,
- cross-layer changes.

```text
Engineer
→ targeted/integration checks
→ QA when useful
→ Verifier
→ commit/push
```

Default profile:

```text
Model Tier: BALANCED
Reasoning: MEDIUM
Context: LOCAL/CROSS-LAYER
Tests: TARGETED/EXPANDED
```

---

## GUARDED

For high-risk work.

Examples:

- authentication,
- authorization,
- billing/payments,
- credits,
- migrations,
- concurrency,
- secrets,
- destructive operations,
- high-blast-radius changes.

```text
Engineer
→ Security
→ QA
→ Verifier
→ broader regression when justified
→ commit/push
```

Default profile:

```text
Model Tier: PREMIUM
Reasoning: HIGH+
Context: CROSS-LAYER/SYSTEM
Tests: EXPANDED/FULL when justified
```

CCAF does not use GUARDED just because more process looks safer.

---

# Adaptive Model + Reasoning Routing

See [`agent/MODEL_ROUTING.md`](agent/MODEL_ROUTING.md).

CCAF uses:

```text
ECONOMY   → simple/local/routine work
BALANCED  → normal implementation/integration/debugging
PREMIUM   → security, billing, concurrency, risky architecture, difficult bugs
```

Reasoning can scale through:

```text
LOW → MEDIUM → HIGH → XHIGH → MAX
```

Core rule:

> **Use the cheapest capable model and lowest effective reasoning first. Escalate only with evidence. De-escalate after the hard part.**

Example:

```text
Discovery       → ECONOMY + LOW
Implementation  → BALANCED + MEDIUM
Security review → PREMIUM + HIGH
Routine tests   → ECONOMY/BALANCED + LOW/MEDIUM
```

If the active Codex environment cannot actually switch models/reasoning automatically, CCAF records the recommended route instead of pretending it switched.

Manual user model choice always takes priority.

---

# Prompt Routing

CCAF automatically classifies development prompts.

```text
BUGFIX      → agent/workflows/bugfix.md
FEATURE     → agent/workflows/feature.md
MAINTENANCE → agent/workflows/maintenance.md
CONTINUE    → agent/workflows/resume.md
GENERAL     → agent/workflows/development-loop.md
```

Examples:

```text
fix this login error
add product search
update dependencies
make this responsive
continue
```

All route through CCAF automatically when the root `AGENTS.md` is active.

---

# Fast Bug Fixes

Bug fixing follows:

```text
Confirm failure
→ identify root cause
→ smallest safe fix
→ targeted regression check
→ verify
→ commit/push
```

CCAF avoids broad rewrites and does not fix unrelated issues unless they block the task or expose critical security/data risk.

---

# Efficient Feature Development

Feature work follows:

```text
Understand requested outcome
→ inspect existing patterns
→ define smallest coherent vertical slice
→ implement
→ targeted verification
→ user/security review only if needed
→ verify
→ commit/push
```

CCAF reuses existing components, services, APIs, database patterns, and architecture before creating anything new.

---

# Safe Maintenance

Maintenance follows:

```text
Define maintenance scope
→ assess impact
→ make minimum safe change
→ targeted regression
→ verify
→ commit/push
```

It is designed to avoid maintenance turning into an accidental redesign.

---

# Anti-Overengineering

CCAF follows:

- **KISS** — keep solutions simple,
- **YAGNI** — do not build hypothetical future needs,
- **DRY** — avoid meaningful duplicated business logic,
- **SOLID** — apply only when it improves maintainability/testability.

Before adding a new abstraction, framework, service, queue, cache, plugin system, database, dependency, or architecture layer, there must be a concrete need.

> **Small problem → small solution.**

---

# Minimum Context Strategy

CCAF resumes from:

```text
STATUS.md
→ TASK.md
→ Git diff/status
→ linked requirement
→ exact relevant source/test files
```

It expands outward only when needed:

```text
symbol/file
→ direct dependency
→ module
→ cross-layer boundary
→ system-wide only if required
```

Stable project knowledge is persisted in `FACTS.md` so Codex does not repeatedly rediscover the repository.

---

# Single-Pass Default

CCAF prefers one strong execution cycle:

```text
understand → edit → test → diff review → verify
```

A second pass happens only when:

- tests fail,
- acceptance criteria are not met,
- review finds a material problem,
- risk/scope changes,
- a key assumption is wrong.

This reduces repeated planning and unnecessary model usage.

---

# Stop-When-Sufficient Testing

CCAF starts with the cheapest meaningful test.

```text
focused test
→ affected integration/component/API check
→ relevant typecheck/lint/build
→ expanded regression only when justified
→ full suite at milestones/releases or high risk
```

Testing stops when:

- acceptance criteria are proven,
- affected boundaries are covered,
- risk is adequately addressed,
- no evidence suggests broader regression.

---

# Modern UX/UI

See [`agent/UX_UI_STANDARDS.md`](agent/UX_UI_STANDARDS.md).

CCAF targets:

**modern + familiar + accessible + responsive + flexible**

It follows **Jakob's Law** and prefers familiar navigation, forms, dialogs, tables, settings, search/filter behavior, and mobile patterns.

Meaningful user-facing work considers:

- loading,
- empty,
- success,
- error,
- disabled,
- permission states,
- responsive behavior,
- accessibility,
- keyboard/focus behavior,
- refresh/re-entry,
- clear recovery paths.

Tiny copy/spacing/color fixes do not trigger a full UX audit.

---

# Project State

Each project profile uses:

```text
agent/projects/<project>/
├── REQUIREMENTS.md
└── state/
    ├── STATUS.md
    ├── TASK.md
    ├── PLAN.md
    ├── FACTS.md
    └── DECISIONS.md
```

Purpose:

- `STATUS.md` → where are we?
- `TASK.md` → what should happen next?
- `PLAN.md` → what work remains?
- `FACTS.md` → what stable project knowledge should not be rediscovered?
- `DECISIONS.md` → what durable technical decisions matter later?

FAST tasks keep state extremely compact.

---

# Git + GitHub Tracking

See [`agent/workflows/github-sync.md`](agent/workflows/github-sync.md).

Verified work follows:

```text
inspect diff
→ stage only task-owned changes
→ review staged diff
→ commit
→ push
→ record branch + commit SHA + sync state
```

CCAF does not blindly use `git add .` when unrelated work exists.

If push fails safely:

```text
Git Sync: LOCAL ONLY
```

with the exact reason.

---

# Quick Start

This repository already includes a root `AGENTS.md`.

For another Windows workspace:

```powershell
.\scripts\install-ccaf.ps1 -WorkspacePath "C:\Projects\workspace"
```

Then initialize a project:

```text
Target project:
./YourProject

Requirements:
./agent/projects/my-project/REQUIREMENTS.md

Initialize CCAF and begin the highest-priority actionable requirement.
```

After initialization, ordinary prompts are enough:

```text
continue
fix the login bug
add search
update dependencies
```

---

# Important Files

```text
AGENTS.md                         # Root Codex entrypoint
scripts/install-ccaf.ps1         # Windows workspace installer
agent/
├── AGENTS.md                    # Master execution rules
├── MODEL_ROUTING.md             # Adaptive model/reasoning routing
├── EFFICIENCY_STANDARDS.md      # Speed, context, cost, usage controls
├── ENGINEERING_STANDARDS.md     # Coding/engineering practices
├── UX_UI_STANDARDS.md           # Modern UX + Jakob's Law
├── QUALITY_GATES.md             # Adaptive verification gates
├── HOW_TO_USE.md                # Detailed guide
├── agents/
├── workflows/
├── templates/
└── projects/
```

---

# Core Principles

**Correctness before optimization.**

**First-pass correctness beats repeated rework.**

**Use FAST PATH whenever safely possible.**

**Reuse before rewriting.**

**Small problem → small solution.**

**Read less, but read the right things.**

**Use the cheapest capable model first.**

**Use the lowest effective reasoning first.**

**Escalate with evidence and de-escalate afterward.**

**Use the minimum effective context, agents, and tests.**

**Stop verification when evidence is sufficient.**

**Do not overengineer the project or the framework.**

**Keep verified work tracked in GitHub.**

---

# License

MIT License. See [`LICENSE`](LICENSE).