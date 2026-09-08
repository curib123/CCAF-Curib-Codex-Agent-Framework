# CCAF Maintenance Workflow

Use for maintenance work such as dependency updates, cleanup, refactoring, technical debt, configuration updates, CI/build maintenance, documentation updates, deprecations, health checks, and routine project upkeep.

## Goal

Improve long-term maintainability, reliability, and operability **without turning maintenance into an unnecessary rewrite**.

## Default Profile

```text
Task Type: MAINTENANCE
Reasoning: FAST or STANDARD
Context: LOCAL initially
Test Depth: TARGETED
User-Facing: NO unless behavior/UI changes
```

Escalate only when maintenance affects critical infrastructure, security, migrations, shared architecture, or production behavior.

## Workflow

```text
IDENTIFY MAINTENANCE NEED
      ↓
CONFIRM CURRENT IMPACT / RISK
      ↓
DEFINE NARROW MAINTENANCE SCOPE
      ↓
CHECK FOR BREAKING/BEHAVIORAL CHANGE
      ↓
IMPLEMENT MINIMUM SAFE CHANGE
      ↓
TARGETED REGRESSION CHECKS
      ↓
BROADER CHECK ONLY IF SHARED/RISKY
      ↓
VERIFY
      ↓
COMMIT + SYNC
```

## Maintenance Categories

### Dependency Maintenance

- update only dependencies required by the task,
- prefer compatible/minor updates when they solve the need,
- inspect release/migration impact for major updates,
- avoid mass dependency churn without a requirement,
- verify lockfile and build/test behavior,
- remove obsolete dependencies only when safely proven unused.

### Refactoring / Technical Debt

Refactor when it:

- removes material duplication,
- reduces real complexity,
- enables required work,
- improves testability,
- resolves maintenance risk,
- removes obsolete code with evidence.

Do not refactor simply because another style is preferred.

Behavior should remain unchanged unless the task explicitly includes behavior change.

### Configuration / Infrastructure

- preserve environment compatibility,
- avoid embedding environment-specific values in code,
- validate changed config,
- update examples/docs when required,
- consider rollback/deployment impact.

### CI / Build

- keep checks deterministic,
- improve speed without weakening required verification,
- avoid adding redundant workflows,
- cache only where correct,
- preserve clear failure diagnostics.

### Documentation

Update only documentation affected by real changes or genuinely missing operational knowledge.

Do not generate excessive documentation for trivial code details.

## Maintenance Budget

Prefer incremental upkeep over large periodic rewrites.

When a maintenance request exposes many unrelated issues:

1. address the requested/highest-risk item,
2. record other meaningful debt separately,
3. do not expand the active task unless necessary.

## Preventive Maintenance

When relevant, maintain:

- tests around critical behavior,
- dependency/security health,
- migrations/config examples,
- useful logs/observability,
- build/CI reliability,
- stale/deprecated code removal,
- documentation for setup/deployment/public interfaces.

Do not create recurring maintenance machinery unless the project's scale justifies it.

## Done

Maintenance is complete when:

- the specific maintenance goal is achieved,
- behavior remains correct unless intentionally changed,
- appropriate regression evidence passes,
- no unnecessary architecture/dependency churn was introduced,
- state/docs are updated only where needed,
- the verified change is committed and synced.