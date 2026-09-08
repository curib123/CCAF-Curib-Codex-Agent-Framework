# CCAF Codex Entrypoint

This workspace/project uses **CCAF — Curib Codex Agent Framework**.

For **every user prompt that requests project work**, first load and follow the CCAF operating rules before planning, editing, testing, or committing.

## Required framework

Read:

`./agent/AGENTS.md`

If the shared CCAF folder is a sibling of the target project instead of inside it, use the actual relative path, for example:

`../agent/AGENTS.md`

## Prompt Intent Routing

Classify each project-work prompt before execution.

### BUGFIX

Examples:

- `fix this error`
- `login is broken`
- `fix failing tests`
- `why does this crash? fix it`
- `this API returns the wrong result`

Use:

`agent/workflows/bugfix.md`

Default behavior: reproduce/confirm → root cause → smallest safe fix → regression evidence.

### FEATURE

Examples:

- `add search`
- `implement dark mode`
- `add user profile editing`
- `add a new API endpoint`
- `improve this workflow with X`

Use:

`agent/workflows/feature.md`

Default behavior: map requirement → reuse existing patterns → smallest coherent design → implement vertical slice → targeted verification.

### MAINTENANCE

Examples:

- `update dependencies`
- `refactor this module`
- `clean up technical debt`
- `fix CI`
- `update documentation`
- `remove deprecated code`

Use:

`agent/workflows/maintenance.md`

Default behavior: narrow maintenance scope → preserve behavior → targeted regression → no unnecessary rewrite.

### GENERAL / CONTINUE

Examples:

- `continue`
- `continue from next action`
- `finish the remaining requirements`
- `review this implementation`

Use the main CCAF development loop and current `STATUS.md` / `TASK.md`.

If a prompt mixes intents, identify one primary task or split into ordered work units. Do not bundle unrelated bug fixes, features, and maintenance into one large change unless they are inseparable.

## Per-prompt rule

Every implementation, bug fix, refactor, test, review, UI change, backend change, database change, infrastructure change, documentation change, or project-analysis prompt must be treated as a CCAF work unit.

Do not bypass CCAF because the user prompt is short.

For each prompt:

1. identify the target project,
2. classify prompt intent,
3. load its `STATUS.md` and `TASK.md`,
4. inspect current Git status/diff,
5. map the prompt to existing requirements/plan or create a scoped task packet,
6. choose the minimum effective Reasoning / Context / Test Depth profile,
7. execute the matching CCAF workflow,
8. verify the result,
9. checkpoint state,
10. commit only the changes belonging to the completed work unit,
11. push the commit to the configured GitHub remote when safe and authorized,
12. record branch + commit SHA + sync result in project state.

## Short prompts still use CCAF

Examples:

- `fix login bug`
- `make this responsive`
- `continue`
- `add search`
- `fix tests`

These are instructions for CCAF to create/continue the smallest correct work unit; they are not permission to skip project state, verification, engineering standards, UX rules, efficiency controls, or Git discipline.

## Anti-Overengineering

For every prompt, prefer the simplest production-quality solution that fits the existing architecture.

Do not create new abstractions, dependencies, architecture layers, services, or general-purpose systems unless the current requirement and real constraints justify them.

If the solution becomes much larger than the prompt/requirement, stop and reassess scope.

## Git safety

Never include unrelated pre-existing user changes in a CCAF commit.

Never force push unless the user explicitly requests it and the consequences are understood.

Never use destructive cleanup/reset operations to manufacture a clean tree.

If unrelated dirty files make a safe commit impossible, preserve them and report the exact blocker.

## Sync principle

A verified work unit is not considered fully checkpointed until its commit is either:

- pushed to its configured upstream GitHub branch, or
- explicitly recorded as `LOCAL ONLY` with the exact reason pushing was impossible.

Use `agent/workflows/github-sync.md` for the complete Git/GitHub procedure.