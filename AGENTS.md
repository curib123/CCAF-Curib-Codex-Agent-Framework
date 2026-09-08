# CCAF Workspace Entrypoint

This repository/workspace uses **CCAF — Curib Codex Agent Framework**.

For every prompt that requests work on a software project in this workspace, you MUST load and follow:

`./agent/AGENTS.md`

before planning, editing, testing, reviewing, committing, or pushing changes.

This applies even to short prompts such as:

- `continue`
- `fix this error`
- `fix failing tests`
- `add search`
- `make this responsive`
- `refactor this module`
- `update dependencies`
- `review this implementation`

## Prompt routing

Classify the request and use the matching CCAF workflow:

- **BUGFIX** → `agent/workflows/bugfix.md`
- **FEATURE** → `agent/workflows/feature.md`
- **MAINTENANCE** → `agent/workflows/maintenance.md`
- **CONTINUE / RESUME** → `agent/workflows/resume.md`
- **GENERAL PROJECT WORK** → `agent/workflows/development-loop.md`

If a prompt mixes unrelated intents, split it into ordered work units instead of creating one oversized change.

## Required behavior

For each project-work prompt:

1. Identify the target project and project profile.
2. Read `STATUS.md` and `TASK.md` first when state exists.
3. Inspect Git status/diff before editing.
4. Choose the minimum effective reasoning, context, test depth, and reviewers.
5. Follow CCAF engineering, efficiency, UX/UI, quality, and anti-overengineering standards.
6. Implement the smallest complete production-quality change.
7. Verify with evidence appropriate to task risk.
8. Update project state accurately.
9. Commit only task-owned changes.
10. Push the verified checkpoint when safe and authorized.
11. Record branch, commit SHA, and sync status.

## Anti-overengineering

Small requirement → small implementation.

Prefer existing project patterns and abstractions. Do not introduce new architecture, dependencies, services, layers, queues, caches, factories, interfaces, repositories, plugin systems, or migrations unless the current requirement and real constraints justify them.

If the implementation becomes materially larger than the task, stop and reassess before continuing.

## Existing work protection

Never erase unrelated user changes.

Never use destructive Git cleanup/reset or force-push by default.

Never include unrelated dirty files in a CCAF commit.

## Source of truth

The detailed operating contract is:

`./agent/AGENTS.md`

If this root entrypoint and the detailed CCAF rules differ, follow the stricter safety/verification rule and treat `./agent/AGENTS.md` as the authoritative framework specification.