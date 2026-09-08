# CCAF Feature Workflow

Use when the user asks to add, implement, extend, improve, or change product functionality.

## Goal

Add the requested behavior with the **smallest production-quality design that fits the existing architecture and UX**.

## Default Profile

```text
Task Type: FEATURE
Reasoning: STANDARD
Context: LOCAL or CROSS-LAYER
Test Depth: TARGETED
User-Facing: YES when applicable
```

Use FAST for very small isolated additions. Use DEEP only for high-risk architecture/security/billing/concurrency work.

## Workflow

```text
UNDERSTAND REQUEST
      ↓
MAP TO REQUIREMENT / ACCEPTANCE CRITERIA
      ↓
INSPECT EXISTING IMPLEMENTATION + REUSABLE PATTERNS
      ↓
DEFINE SMALLEST COHERENT DESIGN
      ↓
CHECK UX/JAKOB'S LAW IF USER-FACING
      ↓
IMPLEMENT VERTICAL SLICE
      ↓
TARGETED TESTS
      ↓
RISK-BASED QA / SECURITY / NORMAL USER REVIEW
      ↓
VERIFY
      ↓
COMMIT + SYNC
```

## Design Rule

Before adding new architecture, ask:

1. Can an existing component/service/module support this?
2. Can the current data/API model be extended safely?
3. Is a new abstraction actually required by repeated variation or boundary isolation?
4. Is the proposed complexity proportional to the requirement?

Prefer extending existing patterns over building a new subsystem.

## Vertical Slice Rule

When practical, implement a complete thin slice:

- data/model changes if needed,
- backend logic/API if needed,
- frontend behavior if needed,
- validation/security,
- tests,
- UX states.

Do not build speculative infrastructure for future features before the requested feature needs it.

## User-Facing Feature Rule

Follow `UX_UI_STANDARDS.md`.

Prefer:

- familiar controls,
- obvious primary action,
- responsive layout,
- clear loading/error/empty/success states,
- progressive disclosure,
- existing design system,
- dynamic/config-driven behavior when the product genuinely needs flexibility.

Modern styling must remain consistent with the existing product instead of redesigning unrelated screens.

## Compatibility Rule

Preserve existing users, data, APIs, URLs, workflows, and configuration unless change is explicitly required.

If a breaking change is genuinely necessary, include migration/consumer updates in the same coordinated plan.

## Scope Guard

Do not bundle:

- unrelated refactoring,
- dependency upgrades,
- architecture replacement,
- cosmetic redesign of unrelated areas,
- hypothetical future features.

If the requested feature reveals a necessary enabling task, keep it minimal and mark it explicitly.

## Done

A feature is complete when:

- acceptance criteria work end to end,
- relevant states/failures are handled,
- appropriate tests pass,
- UX validation passes if user-facing,
- security review passes if sensitive,
- implementation fits the existing architecture,
- no unnecessary complexity was introduced,
- the verified change is checkpointed, committed, and synced.