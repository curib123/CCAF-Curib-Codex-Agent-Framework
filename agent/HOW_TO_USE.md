# How to Use CCAF — Curib Codex Agent Framework

## What This System Is

The `agent/` folder is a reusable professional engineering system designed to help **Codex work on any existing software project**.

CCAF tells Codex how to:

- understand an existing codebase,
- compare it against Planning + Requirements Analysis,
- create a technical implementation plan,
- select the correct engineering role,
- implement missing or incorrect functionality,
- test changes,
- perform QA,
- review security-sensitive work,
- validate user-facing features from a normal user's perspective,
- verify requirements,
- checkpoint state,
- commit verified changes safely,
- synchronize checkpoints to GitHub,
- and continue across new sessions or usage limits.

CCAF is stack-agnostic. It must discover and adapt to the target project's actual technologies, architecture, conventions, Git workflow, and existing implementation.

---

# 1. Recommended Workspace Structure

Keep one shared CCAF `agent/` folder beside one or more existing projects:

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

Do not copy the entire CCAF framework into every project.

---

# 2. Open Codex From the Workspace Root

Open the folder containing both `agent/` and the target project:

```powershell
cd C:\Projects\workspace
code .
```

Codex must be able to read:

- shared CCAF instructions,
- target project code,
- project requirements,
- project state,
- Git status/history/remotes.

---

# 3. Install the Codex Entrypoint Once

This step is what makes **normal Codex prompts automatically route through CCAF**.

Copy:

```text
agent/templates/CODEX_ROOT_AGENTS.md
```

to the workspace or target project as:

```text
AGENTS.md
```

Recommended shared-workspace layout:

```text
workspace/
├── AGENTS.md
├── agent/
├── ProjectA/
└── ProjectB/
```

The root `AGENTS.md` tells Codex that every project-work prompt must first follow:

```text
./agent/AGENTS.md
```

After this is installed, short prompts such as:

```text
fix login bug
```

```text
add search
```

```text
make this responsive
```

```text
continue
```

still run through the CCAF workflow.

If your target project is opened separately rather than from the shared workspace, place an `AGENTS.md` in that project's root and change the CCAF path to the real relative location, for example:

```text
../agent/AGENTS.md
```

---

# 4. Create a Project Profile

Copy:

```text
agent/projects/_example/
```

or create:

```text
agent/projects/my-project/
```

The state should contain:

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

Each project keeps independent requirements, tasks, architecture facts, decisions, and Git checkpoint metadata.

---

# 5. Add Planning + Requirements Analysis

Put the approved specification into:

```text
agent/projects/my-project/REQUIREMENTS.md
```

You normally provide only:

## Planning

- Problem
- Proposed solution
- Goals
- Scope
- Target users
- Budget considerations
- Timeline/phases

## Requirements Analysis

- Functional requirements
- Security requirements
- Reliability requirements
- Performance requirements
- Usability requirements
- Maintainability requirements
- Acceptance criteria

CCAF creates the technical plan, tasks, testing strategy, agent routing, and implementation approach from the real existing project.

---

# 6. Make Sure the Target Project Is Connected to GitHub

From the target project directory, check:

```bash
git status
git branch --show-current
git remote -v
```

A normal GitHub-connected project should show an `origin`, for example:

```text
origin  https://github.com/OWNER/REPOSITORY.git (fetch)
origin  https://github.com/OWNER/REPOSITORY.git (push)
```

If the project has no Git repository yet:

```bash
git init
git branch -M main
```

If it already has a GitHub repository but no remote:

```bash
git remote add origin https://github.com/OWNER/REPOSITORY.git
```

If the repository uses SSH, keep the existing SSH remote instead.

CCAF should **not** replace a working remote just to standardize the URL format.

---

# 7. Start CCAF on an Existing Project

Use this once for initialization:

```text
Read ./agent/AGENTS.md.

Target project:
./YourProject

Requirements:
./agent/projects/my-project/REQUIREMENTS.md

This is an existing software project.

Start the CCAF existing-project development loop.

Discover only the architecture needed to create an accurate requirement-linked plan.
Initialize STATUS.md, TASK.md, PLAN.md and FACTS.md.

Inspect the target project's Git repository, current branch, remote and dirty state.
Preserve unrelated user changes.

Then immediately begin the highest-priority actionable task.

For each work unit:
implement → targeted test → risk-based QA/security/user review → verify
→ checkpoint state → safely stage task-owned files → review staged diff
→ commit → push to the configured GitHub upstream when safe → next task.

Do not stop after producing an audit or plan.
Do not fake completion.
Do not include unrelated local work in commits.
Do not force push by default.
Always maintain an exact NEXT ACTION.
```

---

# 8. What Happens for Every Prompt

With the root `AGENTS.md` entrypoint installed, each project-work prompt should follow approximately:

```text
USER PROMPT
    ↓
ROOT AGENTS.md
    ↓
CCAF AGENTS.md
    ↓
STATUS.md + TASK.md
    ↓
Git status / branch / diff
    ↓
Relevant requirement + code only
    ↓
Implement
    ↓
Targeted evidence
    ↓
Risk-based review
    ↓
Verifier
    ↓
State checkpoint
    ↓
Stage only task-owned files
    ↓
Review staged diff
    ↓
Commit
    ↓
Push / record LOCAL ONLY reason
    ↓
NEXT ACTION
```

The user should not need to paste the long CCAF prompt every time.

---

# 9. Git Commit and Sync Rules

CCAF uses:

```text
agent/workflows/github-sync.md
```

A verified task should normally end as:

```text
IMPLEMENTED
→ VERIFIED
→ STATE CHECKPOINTED
→ SAFE FILES STAGED
→ STAGED DIFF REVIEWED
→ COMMITTED
→ PUSHED
```

If push cannot be completed safely:

```text
Git Sync: LOCAL ONLY
```

must be recorded with the exact reason.

## Never automatically commit unrelated changes

Before staging, CCAF classifies dirty changes as:

- TASK OWNED
- STATE OWNED
- UNRELATED
- UNKNOWN

Only TASK OWNED and applicable STATE OWNED files are staged.

Avoid:

```bash
git add .
```

when unrelated dirty files exist.

Prefer explicit paths.

## Commit messages

Preferred format:

```text
<type>(<scope>): <summary> [<TASK-ID>]
```

Example:

```text
fix(auth): enforce ownership checks [P0-03]
```

---

# 10. Branch Strategy

CCAF should preserve the target repository's existing branch strategy.

If the project normally works directly on `main`, it may continue doing so when safe and intended.

If the project uses feature branches or protected branches, CCAF must respect that workflow.

A useful feature branch convention is:

```text
ccaf/<task-id>-<short-description>
```

Example:

```text
ccaf/p0-03-auth-ownership
```

Do not create unnecessary branches for every tiny edit if the repository does not use that workflow.

Do not force push by default.

---

# 11. GitHub Tracking in CCAF State

`STATUS.md` and `TASK.md` record:

```text
Git Repository:
Git Branch:
Git Commit:
Git Sync: NOT COMMITTED | LOCAL ONLY | PUSHED
```

This allows a new Codex session to verify progress against actual Git history instead of relying on conversation memory.

---

# 12. Resume After a Usage Limit / New Session

Normally you can simply say:

```text
continue
```

because the root `AGENTS.md` entrypoint routes the prompt through CCAF.

A more explicit resume prompt is:

```text
Read ./agent/AGENTS.md.

Resume target project:
./YourProject

Project state:
./agent/projects/my-project/state/

Read STATUS.md and TASK.md first.
Inspect Git status, current branch, latest recorded commit, and upstream state.
Verify the checkpoint against the current code and Git history.

Continue from NEXT ACTION.

Do not repeat completed analysis or implementation.
After verification, commit only task-owned changes and synchronize the checkpoint to GitHub when safe.
```

---

# 13. Important Limitation

CCAF can instruct Codex to commit and push, but successful GitHub synchronization still requires the local Codex environment to have working Git credentials/authorization for that target repository.

If credentials, network access, branch permissions, protected-branch rules, or conflicts prevent a push, CCAF must preserve the local commit and record:

```text
Git Sync: LOCAL ONLY
```

with the reason rather than pretending the remote is synchronized.

---

# 14. Multiple Projects

Example:

```text
workspace/
├── AGENTS.md
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

Each target project may have its own GitHub remote and branch strategy.

The shared CCAF system remains the same.

---

# Core Rule

The developer defines **WHAT** through Planning + Requirements Analysis.

CCAF discovers **HOW the existing project works**, determines **HOW to modify it**, verifies the result, checkpoints the state, and tracks completed work in Git/GitHub.

Always:

**Reuse before rewriting.**

**Inspect before assuming.**

**Test before claiming.**

**Commit only task-owned work.**

**Push verified checkpoints when safe.**

**Never overwrite unrelated work or remote history.**

**Checkpoint before context is lost.**