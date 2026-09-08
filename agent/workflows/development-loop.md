# CCAF Professional Development Loop

## Primary Loop

```text
LOAD STATUS + TASK
      ↓
VERIFY CHECKPOINT AGAINST CODE
      ↓
LOAD ONLY NEEDED REQUIREMENT / FACTS
      ↓
SELECT OR CONFIRM CURRENT GAP
      ↓
CLASSIFY RISK
      ↓
IMPLEMENT SMALLEST COMPLETE CHANGE
      ↓
RUN CHEAPEST MEANINGFUL TEST
      ↓
QA / SECURITY / NORMAL USER AS REQUIRED
      ↓
VERIFIER
      ↓
CHECKPOINT TASK + STATUS + PLAN
      ↓
NEXT TASK
```

## Step 1 — Resume Cheaply

Read in this order:

1. `state/STATUS.md`
2. `state/TASK.md`
3. current Git status/diff
4. relevant requirement section
5. only relevant `FACTS.md` / `DECISIONS.md`

Do not start with a broad repository scan when valid state exists.

## Step 2 — Validate the Task Packet

`TASK.md` must contain:

- task ID,
- requirement link,
- objective,
- current vs required behavior,
- scope/non-scope,
- relevant paths,
- acceptance criteria,
- risk level,
- required reviewers,
- targeted verification,
- next action.

If it is already sufficient, implement immediately.

If not, Analyst + Planner fills only the missing knowledge.

## Step 3 — Risk Classify

### LOW
Isolated, reversible, non-sensitive work.

Typical route:

`Engineer → focused verification → Verifier`

### MEDIUM
Normal product/data/integration behavior.

Typical route:

`Engineer → QA → Verifier`

Add Normal User if user-facing.

### HIGH
Auth, permissions, payments, credits, migrations, secrets, destructive operations, concurrency, sensitive data.

Typical route:

`Engineer → Security → QA → Verifier`

Add Normal User if user-facing.

## Step 4 — Implement

Engineer changes the smallest coherent unit that can satisfy the current acceptance criteria.

Do not combine unrelated backlog items merely because nearby files are open.

## Step 5 — Targeted Verification

Use `../QUALITY_GATES.md`.

Run the cheapest meaningful check first.

Broaden only when:

- risk requires it,
- focused checks fail,
- behavior crosses boundaries,
- milestone/final regression is due.

## Step 6 — Diff-First Review

QA, Security, Normal User, and Verifier begin from:

- `TASK.md`,
- changed files/diff,
- focused test evidence.

They should not perform independent full-project rediscovery unless a material unknown is exposed.

## Step 7 — Failure Handling

Classify failure:

- new regression,
- pre-existing failure,
- environment failure,
- external dependency failure.

If the same approach fails twice for the same root cause:

1. stop repeating it,
2. update `TASK.md` with the failure,
3. reassess assumptions,
4. reduce the failing unit,
5. choose a materially different approach.

Do not create endless retry loops.

## Step 8 — Checkpoint

After every meaningful work unit update:

- `TASK.md` — exact current result/evidence/next action,
- `STATUS.md` — compact pointer,
- `PLAN.md` — task status and requirement traceability,
- `FACTS.md` — only if stable project facts changed,
- `DECISIONS.md` — only if a durable decision was made.

## Step 9 — Continue

Continue while approved actionable requirements remain.

Stop only when:

- requirements are verified,
- the remaining work is genuinely blocked,
- the platform/session/usage limit interrupts execution.

Before interruption, leave an exact `NEXT ACTION` in both `TASK.md` and `STATUS.md`.

## Context Budget Rule

If active context becomes large, checkpoint first, then resume from files rather than carrying historical discussion forward.

The repository state must be sufficient for a fresh agent session to continue.