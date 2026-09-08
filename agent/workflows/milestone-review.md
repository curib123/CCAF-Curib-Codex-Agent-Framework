# Milestone Review Workflow

Use this after a meaningful group of related tasks is completed, before starting the next major area, and before final completion.

The goal is to catch integration failures that isolated task verification can miss without repeatedly running a full-project audit.

## Trigger

Run a milestone review when one or more are true:

- a complete requirement group is finished,
- authentication/authorization behavior changed across multiple tasks,
- a database migration or schema sequence is complete,
- billing/credits/usage work reaches an end-to-end usable state,
- a major user flow spans several completed tasks,
- several modules were changed to satisfy one acceptance criterion,
- before final release verification.

Do not run milestone review after every trivial task.

## Inputs

Read only:

1. relevant requirement IDs,
2. completed PLAN tasks for the milestone,
3. current STATUS/TASK,
4. changed areas since the milestone began,
5. recorded targeted evidence.

Do not re-analyze the full repository unless integration behavior exposes an unknown dependency.

## Review Sequence

### 1. Requirement Coverage

Confirm each requirement in the milestone has:

- implementation,
- verification evidence,
- no unresolved blocking finding.

Identify any requirement that was accidentally skipped or only partially satisfied.

### 2. Integration Path

Run the smallest end-to-end or cross-module scenario that proves the completed pieces work together.

Examples:

- login → protected operation → persistence → refresh,
- create → edit → retrieve → authorization,
- request → provider → usage record → credit deduction,
- upload → validation → storage → retrieval,
- form → API → database → UI success/error state.

### 3. Regression Selection

Run broader regression only in areas with plausible blast radius.

Do not automatically run unrelated suites.

### 4. Cross-Cutting Checks

When relevant verify:

- authentication/authorization still compose correctly,
- shared types/contracts match,
- migrations and code agree,
- configuration remains coherent,
- error handling is consistent,
- user state survives refresh/re-entry,
- usage/billing data remains internally consistent.

### 5. User Flow Check

If the milestone is user-facing, run Normal User Agent on the integrated flow—not every individual component again.

### 6. Result

Return:

- `MILESTONE VERIFIED`
- `MILESTONE VERIFIED WITH NON-BLOCKING NOTES`
- `MILESTONE NOT VERIFIED`
- `MILESTONE BLOCKED`

If not verified, create the smallest corrective PLAN tasks and resume normal work units.

## Efficiency Rule

Milestone review is a compression point: use it to replace repeated broad regressions during individual tasks.

Targeted tests prove local changes. Milestone review proves integration. Final verification proves the complete approved system.