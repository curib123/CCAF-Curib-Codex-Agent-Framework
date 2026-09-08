# Professional Development Loop

## Loop

```text
LOAD REQUIREMENTS
      ↓
LOAD SAVED PROJECT STATE
      ↓
ANALYZE ONLY WHAT IS UNKNOWN
      ↓
SELECT HIGHEST-PRIORITY GAP
      ↓
IMPLEMENT SMALLEST COMPLETE CHANGE
      ↓
TARGETED TEST
      ↓
QA
      ↓
SECURITY REVIEW IF NEEDED
      ↓
NORMAL USER CHECK IF USER-FACING
      ↓
VERIFIER
      ↓
CHECKPOINT
      ↓
NEXT TASK
```

## Step 1 — Load

Read:

- `REQUIREMENTS.md`
- `state/STATUS.md`
- relevant `state/PLAN.md`
- relevant `state/FACTS.md`

Read `DECISIONS.md` only when relevant.

Inspect Git status/diff.

## Step 2 — Analyze

If architecture needed for the task is already known, do not re-run a broad analysis.

If unknown, Analyst + Planner inspects only the necessary area and updates facts.

## Step 3 — Select

Choose the highest-priority actionable gap.

Do not jump randomly between tasks.

## Step 4 — Implement

Engineer performs the smallest coherent implementation.

## Step 5 — Test

Run targeted checks first.

## Step 6 — QA

QA Engineer tries happy path + realistic failure/edge paths.

## Step 7 — Security

Only if the task is security-sensitive.

## Step 8 — Normal User

Only if user-facing behavior changed.

## Step 9 — Verify

Verifier checks code + requirement + evidence.

## Step 10 — Checkpoint

Update:

- `STATUS.md`
- `PLAN.md`
- `FACTS.md` only if stable facts changed
- `DECISIONS.md` only if important decisions were made

## Step 11 — Repeat

Continue while actionable required work remains.

## Stop Conditions

Stop only for:

- all requirements verified,
- genuine hard blocker,
- platform/session/usage interruption.

Before interruption, leave an exact `NEXT ACTION`.

## Stall Protection

If the same approach fails twice for the same root cause:

- stop repeating,
- diagnose,
- reduce scope,
- change approach,
- document blocker if unresolved.
