# CCAF Bug Fix Workflow

Use when the user asks to fix an error, bug, regression, failing test, crash, broken behavior, incorrect result, or similar defect.

## Goal

Restore the intended behavior with the **smallest safe root-cause fix**, not a broad rewrite.

## Default Profile

```text
Task Type: BUGFIX
Reasoning: FAST initially; STANDARD if cause is non-obvious; DEEP only for high-risk/complex root causes
Context: LOCAL initially
Test Depth: TARGETED initially
```

Escalate only when evidence requires it.

## Workflow

```text
REPRODUCE / CONFIRM
      ↓
CLASSIFY FAILURE
      ↓
LOCATE ROOT CAUSE
      ↓
DEFINE EXPECTED BEHAVIOR
      ↓
ADD/IDENTIFY FAILING REGRESSION CHECK
      ↓
IMPLEMENT SMALLEST ROOT-CAUSE FIX
      ↓
RUN TARGETED CHECK
      ↓
RUN NEARBY REGRESSION CHECKS
      ↓
QA / SECURITY / USER REVIEW ONLY IF RISK REQUIRES
      ↓
VERIFY
      ↓
COMMIT + SYNC
```

## Failure Classification

Classify as one of:

- new regression,
- pre-existing defect,
- invalid input/data issue,
- environment/configuration issue,
- dependency/provider issue,
- race/concurrency issue,
- security/authorization issue,
- test-only issue,
- unknown — investigate minimally.

## Root-Cause Rule

Do not patch only the visible symptom when evidence shows a deeper root cause.

But do not expand into unrelated redesign.

Prefer:

- one corrected condition,
- one corrected query,
- one missing validation/ownership check,
- one state transition fix,
- one compatibility fix,
- one bounded retry/error fix

over replacing an entire module.

## Regression Test Rule

When practical, add or update a test that would fail before the fix and pass after it.

Do not add large test infrastructure just for a tiny bug if a reliable existing verification path is available.

## Debugging Efficiency

1. Reproduce the narrow failure first.
2. Read the error/stack trace/log nearest the failure.
3. Inspect the smallest relevant execution path.
4. Form one evidence-based hypothesis at a time.
5. Test the hypothesis cheaply.
6. Stop repeating an approach after two failures with the same root cause.

Avoid speculative repository-wide searches unless the local path cannot explain the defect.

## Scope Guard

A bug fix should not silently become:

- a redesign,
- framework migration,
- broad cleanup,
- unrelated dependency upgrade,
- visual redesign,
- new feature.

Record newly discovered unrelated defects separately unless they block the fix or are critical security/data-integrity issues.

## Done

A bug is fixed when:

- intended behavior is restored,
- the root cause is addressed sufficiently,
- regression evidence passes,
- nearby affected behavior remains correct,
- no new material risk was introduced,
- the verified task is checkpointed, committed, and synced according to CCAF Git rules.