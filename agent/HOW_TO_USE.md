# How to Use the Universal Agent System

## What This System Is

The `agent/` folder is a reusable professional engineering system designed to help **Codex work on any existing software project**.

It acts as a shared development framework that tells Codex how to:

* understand an existing codebase,
* compare it against Planning + Requirements Analysis,
* create an implementation plan,
* select the correct engineering role,
* implement missing or incorrect functionality,
* test changes,
* perform QA,
* review security-sensitive work,
* validate features from a normal user's perspective,
* verify requirements,
* save progress,
* and continue safely across new sessions or usage limits.

It is not tied to:

* Vrompt
* JavaScript
* TypeScript
* React
* Next.js
* NestJS
* Python
* PHP
* Flutter
* Docker
* any specific database
* any specific architecture

The system must first discover the target project's real technologies, architecture, conventions, and existing implementation.

It must adapt to the project instead of forcing the project to adapt to the agent system.

---

# 1. Recommended Workspace Structure

Keep the shared `agent/` folder beside your existing project.

```text
workspace/
├── agent/
└── YourProject/
```

For example:

```text
workspace/
├── agent/
└── Vrompt/
```

You may also use one shared agent system for multiple projects:

```text
workspace/
├── agent/
├── ProjectA/
├── ProjectB/
└── ProjectC/
```

Example:

```text
workspace/
├── agent/
├── Vrompt/
├── PocketPOS/
└── DocumentSystem/
```

Do **not** copy the entire agent framework for every project.

One shared `agent/` system can manage multiple projects.

---

# 2. Open Codex From the Workspace Root

Codex should be opened from the directory containing both:

```text
agent/
YourProject/
```

Example on Windows:

```powershell
cd C:\Projects\workspace
code .
```

Your editor/workspace should show:

```text
workspace/
├── agent/
└── YourProject/
```

This is important because Codex needs access to:

* the shared agent instructions,
* project requirements,
* project state,
* and the actual target source code.

---

# 3. Create a Project Profile

For every project, create a separate agent profile.

Copy:

```text
agent/projects/_example/
```

Rename the copy using a short project identifier.

Example:

```text
agent/projects/my-project/
```

For Vrompt:

```text
agent/projects/vrompt/
```

For PocketPOS:

```text
agent/projects/pocketpos/
```

The result should look like:

```text
agent/projects/my-project/
├── REQUIREMENTS.md
└── state/
    ├── STATUS.md
    ├── PLAN.md
    ├── FACTS.md
    └── DECISIONS.md
```

Each project's requirements and development state remain isolated.

---

# 4. Add Planning + Requirements Analysis

Open:

```text
agent/projects/my-project/REQUIREMENTS.md
```

Replace the example content with the approved specification for the target project.

You normally only need to provide:

## Planning

* Problem
* Proposed solution
* Goals
* Scope
* Target users
* Budget considerations
* Timeline/phases

## Requirements Analysis

* Functional requirements
* Non-functional requirements
* Security requirements
* Performance requirements
* Reliability requirements
* Scalability requirements
* Usability requirements
* Maintainability requirements
* Acceptance criteria

You do **not** need to manually create:

* the technical implementation plan,
* architecture plan,
* task list,
* testing plan,
* QA plan,
* agent assignments,
* migration plan.

The agent system generates these after analyzing the actual existing project.

---

# 5. Start Codex on an Existing Project

Once the project profile and requirements are ready, give Codex:

```text
Read ./agent/AGENTS.md.

Target project:
./YourProject

Requirements:
./agent/projects/my-project/REQUIREMENTS.md

This is an existing software project.

Start the professional existing-project development loop.

First inspect and understand the current implementation.

Discover the actual technology stack, architecture, project conventions,
existing features, tests, infrastructure, and relevant dependencies before
making significant changes.

Compare the existing system against the approved Planning and Requirements
Analysis.

Create and maintain project state under:

./agent/projects/my-project/state/

Then continue through:

analyze
→ plan
→ implement
→ targeted test
→ QA
→ security review when required
→ normal-user validation when user-facing
→ independent verification
→ checkpoint
→ next task.

Optimize for minimum Codex usage while maintaining production-quality work.

Reuse working code, components, services, architecture, APIs, database
structures, utilities, and established project patterns whenever appropriate.

Do not rebuild working functionality unnecessarily.

Do not stop after producing an audit, report, or implementation plan.

After planning, immediately begin the highest-priority actionable requirement.

Use the minimum effective reasoning level for each task.

Do not fake completion.

Do not mark requirements complete without meaningful verification.

After every meaningful work unit, save an exact checkpoint including NEXT ACTION
so another Codex session can resume without repeating completed work.

Continue through actionable requirements until the approved requirements are
implemented and verified, or remaining work is genuinely blocked.
```

You only need to change:

```text
./YourProject
```

and:

```text
./agent/projects/my-project/REQUIREMENTS.md
```

to match your actual project.

---

# 6. What Codex Should Do on the First Run

The first run should roughly follow:

```text
Read AGENTS.md
        ↓
Read REQUIREMENTS.md
        ↓
Inspect existing project
        ↓
Discover architecture
        ↓
Create FACTS.md
        ↓
Compare requirements
        ↓
Create PLAN.md
        ↓
Select highest-priority gap
        ↓
Implement
        ↓
Test
        ↓
QA
        ↓
Review
        ↓
Checkpoint STATUS.md
        ↓
Continue
```

The first analysis may require broader repository inspection because the agent system does not yet know the project.

After that initial discovery, it should avoid repeatedly analyzing the entire repository.

---

# 7. How the Professional Agent Roles Work

The shared system contains several engineering roles.

They are not separate projects.

They are professional responsibilities Codex should use according to the current task.

---

## Orchestrator

Acts as the senior engineering lead.

Responsibilities:

* determine current priority,
* select the next requirement,
* route work to the appropriate role,
* prevent duplicate work,
* maintain project state,
* prevent scope drift,
* decide when broader testing is necessary,
* determine whether work is actually complete.

The Orchestrator should remain lightweight.

It should not repeatedly inspect the entire repository.

---

## Analyst + Planner

Acts as a senior systems analyst and software architect.

Responsibilities:

* understand Planning + Requirements,
* discover the existing codebase,
* map architecture,
* identify existing functionality,
* identify missing or incorrect functionality,
* perform gap analysis,
* generate the technical implementation plan,
* update stable architecture facts.

This role should perform the deepest repository analysis primarily during initialization or when an unknown area is encountered.

---

## Engineer

Acts as a senior full-stack software engineer.

Depending on the project, this may include:

* frontend
* backend
* database
* APIs
* web applications
* mobile applications
* desktop applications
* infrastructure
* Docker
* integrations
* AI integrations
* migrations
* automated tests

The Engineer must follow the existing project's architecture and conventions.

It should modify the **smallest coherent area necessary** to satisfy the current requirement.

---

## QA Engineer

Acts as a senior QA engineer.

It should test more than the happy path.

Depending on the feature, QA should consider:

* normal usage
* invalid inputs
* missing data
* unauthorized access
* forbidden access
* duplicate actions
* refresh/reload
* retries
* network failures
* API failures
* empty states
* loading states
* error states
* edge cases
* regressions
* concurrency where relevant

QA should run **targeted tests first** instead of automatically running every test in the repository after every small change.

---

## Security Reviewer

Acts as a senior application-security engineer.

Use this role when work involves:

* authentication
* authorization
* sessions
* API keys
* secrets
* billing
* credits
* payments
* user data
* admin functionality
* uploads
* sensitive integrations
* ownership/access control

It should check for realistic issues such as:

* authentication bypass
* authorization bypass
* IDOR
* cross-user access
* exposed secrets
* unsafe input
* insecure uploads
* race conditions
* duplicate charging
* replay issues
* missing idempotency
* sensitive logging

Do not invoke this role unnecessarily for ordinary visual changes.

---

## Normal User Agent

Acts like a real user rather than a developer.

It should evaluate user-facing functionality without relying on internal implementation knowledge.

It should ask:

* Is the feature understandable?
* Is the next action obvious?
* Are labels clear?
* Is navigation familiar?
* Are errors understandable?
* Can the user recover from mistakes?
* Are loading states clear?
* Does the page work after refresh?
* Does mobile/responsive behavior make sense?
* Is the flow unnecessarily complicated?
* Does the feature actually deliver what the requirement promised?

This is especially useful for:

* onboarding
* dashboards
* chat interfaces
* forms
* settings
* checkout/billing flows
* navigation
* model selectors
* account management
* user workflows

---

## Verifier

Acts as an independent senior reviewer.

It should compare:

```text
Requirement
vs
Actual implementation
vs
Test evidence
```

It must not automatically trust:

* PLAN.md
* STATUS.md
* previous agents
* implementation claims

It independently confirms whether a requirement is actually complete.

---

# 8. Agent Routing

The system should **not invoke every role for every task**.

That would waste usage.

For ordinary implementation:

```text
Orchestrator
    ↓
Engineer
    ↓
QA
    ↓
Verifier
```

For unknown architecture:

```text
Orchestrator
    ↓
Analyst + Planner
    ↓
Engineer
    ↓
QA
    ↓
Verifier
```

For user-facing features:

```text
Engineer
    ↓
QA
    ↓
Normal User Agent
    ↓
Verifier
```

For security-sensitive features:

```text
Engineer
    ↓
Security Reviewer
    ↓
QA
    ↓
Verifier
```

For security-sensitive user-facing features:

```text
Engineer
    ↓
Security Reviewer
    ↓
QA
    ↓
Normal User Agent
    ↓
Verifier
```

The goal is:

**use the minimum number of professional reviews necessary to confidently complete the task.**

---

# 9. Universal Project Discovery

The framework must never assume the target project's technology stack.

During initial analysis it should discover:

* programming languages
* frameworks
* package managers
* repository structure
* source directories
* frontend/backend boundaries
* database
* ORM/data access
* authentication
* authorization
* API conventions
* state management
* build system
* testing framework
* CI/CD
* Docker/infrastructure
* deployment patterns
* configuration
* environment variables
* existing architectural patterns
* coding conventions

Possible target projects include:

```text
React + Node.js
Next.js
Angular + NestJS
Vue
Nuxt
Svelte
SvelteKit
Python/Django
Python/FastAPI
Flask
PHP/Laravel
Java/Spring
Kotlin
C#/.NET
Go
Rust
Flutter
React Native
Electron
Tauri
monorepos
microservices
desktop applications
mobile applications
internal business systems
SaaS platforms
AI applications
legacy systems
```

The system should adapt to what already exists.

It should not force its preferred technology or architecture into the target project.

---

# 10. Usage-Efficient Workflow

The system is specifically designed to reduce unnecessary Codex usage.

Preferred process:

```text
Analyze deeply once
        ↓
Persist stable project facts
        ↓
Select small requirement
        ↓
Inspect only relevant files
        ↓
Implement
        ↓
Targeted tests
        ↓
QA
        ↓
Security / Normal User only when relevant
        ↓
Verify
        ↓
Checkpoint
        ↓
Next requirement
```

After initial analysis, agents should rely heavily on:

```text
state/FACTS.md
```

instead of repeatedly rediscovering architecture.

---

# 11. Project State Files

Each project keeps its own persistent state.

```text
agent/projects/my-project/state/
├── STATUS.md
├── PLAN.md
├── FACTS.md
└── DECISIONS.md
```

---

## STATUS.md

Current execution checkpoint.

It should remain compact.

Example:

```text
# Status

Project: MyProject

Phase: Implementation

Current Task:
P0-04 Protect API endpoint

Last Completed:
P0-03 Authentication middleware verified

Blockers:
None

Verification:
Authentication tests passing.

NEXT ACTION:
Add server-side authorization to the protected API route and add unauthorized-access tests.
```

---

## PLAN.md

Prioritized implementation tasks.

Example:

```text
# Implementation Plan

## Critical

- ✅ Authentication audit
- 🚧 Protect sensitive API endpoints
- ❌ Ownership authorization

## High

- ❌ Usage tracking
- ❌ Error reconciliation

## Normal

- ❌ UI polish
```

---

## FACTS.md

Stores stable architecture knowledge.

Example:

```text
Frontend:
Next.js

Backend:
NestJS

Database:
PostgreSQL

ORM:
Prisma

Authentication:
HTTP-only cookie session

Important paths:
frontend/src/...
backend/src/modules/auth/...
```

Future sessions should use this instead of rediscovering everything.

---

## DECISIONS.md

Stores only important architectural decisions.

Do not use it as a development diary.

---

# 12. Normal Developer Usage After Setup

Once the system is initialized, you should not need huge prompts.

You can simply tell Codex:

```text
Read ./agent/AGENTS.md and continue the current project from NEXT ACTION.
```

Or:

```text
Continue the professional development loop.
```

Or:

```text
Continue the highest-priority unfinished requirement.
```

Or:

```text
Focus on authentication requirements and continue until they are verified.
```

Or:

```text
Focus on the current UI requirement and include Normal User Agent validation.
```

Or:

```text
Run final verification against REQUIREMENTS.md.
```

The persistent state should provide the missing context.

---

# 13. Resume After Usage Limit / New Codex Session

If Codex reaches a usage/session/context limit, completed work should not need to be repeated.

Start the next session with:

```text
Read ./agent/AGENTS.md.

Resume target project:
./YourProject

Project state:
./agent/projects/my-project/state/

Read STATUS.md first.

Verify the saved checkpoint against the actual current code and Git diff.

Continue from NEXT ACTION.

Do not perform a fresh full-project analysis unless FACTS.md is missing,
incorrect, or stale.

Use FACTS.md and PLAN.md instead of rediscovering completed work.

Continue:

implement
→ targeted test
→ QA
→ security review if needed
→ normal-user validation if user-facing
→ verify
→ checkpoint
→ next task.

Optimize for minimum usage while preserving production-quality implementation.
```

This protects development progress from:

* usage limits
* session limits
* context limits
* IDE restarts
* new Codex sessions
* interrupted work

---

# 14. Example: Vrompt

Workspace:

```text
workspace/
├── agent/
└── Vrompt/
```

Project profile:

```text
agent/projects/vrompt/
├── REQUIREMENTS.md
└── state/
```

Start Codex:

```text
Read ./agent/AGENTS.md.

Target project:
./Vrompt

Requirements:
./agent/projects/vrompt/REQUIREMENTS.md

Start the professional existing-project development loop.
```

---

# 15. Example: PocketPOS

Workspace:

```text
workspace/
├── agent/
└── PocketPOS/
```

Profile:

```text
agent/projects/pocketpos/
```

Start:

```text
Read ./agent/AGENTS.md.

Target project:
./PocketPOS

Requirements:
./agent/projects/pocketpos/REQUIREMENTS.md

Start the professional existing-project development loop.
```

---

# 16. Example: Python Project

```text
workspace/
├── agent/
└── InventoryAPI/
```

Profile:

```text
agent/projects/inventory-api/
```

Start:

```text
Read ./agent/AGENTS.md.

Target project:
./InventoryAPI

Requirements:
./agent/projects/inventory-api/REQUIREMENTS.md

Start the professional existing-project development loop.

Discover the stack yourself.
Do not assume JavaScript or any specific framework.
```

If the project turns out to use FastAPI + PostgreSQL, the agent adapts to FastAPI + PostgreSQL.

No changes to the shared agent framework are necessary.

---

# 17. Example: Multiple Projects

```text
workspace/
├── agent/
├── Vrompt/
├── PocketPOS/
└── DocumentSystem/
```

Profiles:

```text
agent/projects/vrompt/
agent/projects/pocketpos/
agent/projects/document-system/
```

To work on Vrompt:

```text
Read ./agent/AGENTS.md.

Target: ./Vrompt
Project profile: ./agent/projects/vrompt/

Continue the project loop.
```

To switch to PocketPOS:

```text
Read ./agent/AGENTS.md.

Target: ./PocketPOS
Project profile: ./agent/projects/pocketpos/

Continue the project loop.
```

Each project maintains independent:

* requirements,
* facts,
* implementation plans,
* decisions,
* checkpoints.

The professional engineering system remains shared.

---

# 18. When to Use a Fresh Analysis

Do **not** perform a full analysis on every Codex session.

Perform deeper analysis only when:

* this is the first run,
* `FACTS.md` does not exist,
* project architecture changed significantly,
* existing facts are incorrect,
* the task touches an unknown area,
* a major dependency/framework migration occurred.

Otherwise:

```text
STATUS
→ PLAN
→ FACTS
→ relevant files
→ continue
```

This is substantially more usage-efficient.

---

# 19. Important Rules for Developers

Do not continuously give Codex the same huge requirements prompt.

Store it once in:

```text
REQUIREMENTS.md
```

Do not ask Codex to re-analyze the whole project every session.

Use:

```text
STATUS.md
FACTS.md
PLAN.md
```

Do not manually call all agents for every feature.

Allow the Orchestrator to select the necessary roles.

Do not treat an audit report as implementation.

The system should continue from:

```text
audit
→ implementation
→ testing
→ verification
```

Do not rely on conversation memory for long projects.

Use repository checkpoints.

---

# 20. Core Universal Rule

The developer defines:

**WHAT the software should do**

through:

```text
Planning
+
Requirements Analysis
```

The shared agent system discovers:

**HOW the existing project currently works**

and determines:

**HOW to modify that existing project correctly, safely, and efficiently.**

The development loop is:

**Understand → Plan → Implement → Test → QA → Review → Verify → Checkpoint → Improve**

Always prioritize:

**Correctness → Security → Reliability → Maintainability → User Experience → Performance**

Always:

**Reuse before rewriting.**

**Inspect before assuming.**

**Implement instead of only recommending.**

**Test before claiming.**

**Use the minimum effective reasoning and context.**

**Checkpoint before context is lost.**

**Continue until the approved requirements are genuinely implemented and verified.**
