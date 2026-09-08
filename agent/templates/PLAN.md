# Implementation Plan

Every task should link to approved requirement/acceptance IDs where available.

Format:

```text
- <status> <task-id> [requirement-ids] <task title> | Risk: LOW/MEDIUM/HIGH | Surface: local/cross-module/cross-layer/system-wide
```

Example:

```text
- 🚧 P0-03 [FR-04, SEC-02] Protect sensitive API endpoint | Risk: HIGH | Surface: cross-layer
```

## Critical

- [ ] ...

## High

- [ ] ...

## Normal

- [ ] ...

## Enabling Work

Only include enabling tasks that are necessary for an approved requirement. Link the downstream requirement IDs.

- [ ] ...

## Requirement Coverage Check

Before final verification, ensure every required ID is either:

- mapped to one or more verified tasks,
- already compliant with recorded evidence,
- or explicitly blocked.

No required behavior should be silently omitted.

## Status Convention

- ✅ Complete and verified
- 🔧 Implemented, verification remaining
- 🚧 In progress
- ⚠️ Partial/problem found
- ❌ Missing
- ⛔ Blocked
