# CCAF Codex Entrypoint

This workspace/project uses **CCAF — Curib Codex Agent Framework**.

For **every user prompt that requests project work**, first load and follow the CCAF operating rules before planning, editing, testing, or committing.

## Required framework

Read:

`./agent/AGENTS.md`

If the shared CCAF folder is a sibling of the target project instead of inside it, use the actual relative path, for example:

`../agent/AGENTS.md`

## Per-prompt rule

Every implementation, bug fix, refactor, test, review, UI change, backend change, database change, infrastructure change, documentation change, or project-analysis prompt must be treated as a CCAF work unit.

Do not bypass CCAF because the user prompt is short.

For each prompt:

1. identify the target project,
2. load its `STATUS.md` and `TASK.md`,
3. inspect current Git status/diff,
4. map the prompt to existing requirements/plan or create a scoped task packet,
5. execute using CCAF risk/routing/quality rules,
6. verify the result,
7. checkpoint state,
8. commit only the changes belonging to the completed work unit,
9. push the commit to the configured GitHub remote when safe and authorized,
10. record branch + commit SHA + sync result in project state.

## Short prompts still use CCAF

Examples:

- `fix login bug`
- `make this responsive`
- `continue`
- `add search`
- `fix tests`

These are instructions for CCAF to create/continue the smallest correct work unit; they are not permission to skip project state, verification, or Git discipline.

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