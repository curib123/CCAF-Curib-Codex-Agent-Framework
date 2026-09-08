# CCAF Engineering Standards

These standards apply to all CCAF-managed project work unless the target project has a stronger established convention.

The goal is **production-quality, maintainable software with minimum unnecessary complexity**.

Do not apply patterns mechanically. Use engineering judgment.

---

# 1. Respect the Existing Architecture

- Understand the current architecture before changing it.
- Follow established module boundaries and conventions.
- Prefer extending existing abstractions over creating parallel systems.
- Do not introduce a new framework, database, state library, queue, or architectural style without concrete justification.
- Preserve backward compatibility unless the approved requirement explicitly permits a breaking change.

**Existing consistency usually beats theoretical purity.**

---

# 2. Keep Changes Small and Cohesive

Prefer changes that have:

- one clear responsibility,
- a narrow blast radius,
- explicit acceptance criteria,
- focused tests,
- reversible behavior when practical.

Avoid mixing:

- unrelated refactors,
- formatting-only sweeps,
- dependency upgrades,
- feature work,
- architecture changes

inside the same task unless they are truly inseparable.

---

# 3. Write Clear, Intent-Revealing Code

Prefer code that can be understood without excessive comments.

Use:

- descriptive names,
- small cohesive functions,
- explicit control flow,
- clear domain terminology,
- predictable structure.

Avoid:

- clever one-liners that reduce readability,
- misleading names,
- deeply nested logic when it can be simplified,
- boolean flag explosions,
- hidden side effects,
- unexplained magic values.

Comments should explain **why**, constraints, or non-obvious tradeoffs—not restate obvious code.

---

# 4. SOLID — Apply Pragmatically

Use SOLID principles when they reduce coupling or improve testability.

## Single Responsibility

A module/function/component should have a coherent reason to change.

## Open/Closed

Prefer extension points when variation is real and recurring. Do not build speculative plugin systems for one use case.

## Liskov Substitution

Implementations must honor the behavioral contract of the abstraction they replace.

## Interface Segregation

Prefer focused interfaces over giant general-purpose contracts.

## Dependency Inversion

Depend on stable domain/service boundaries when that genuinely improves isolation or testing.

**Do not add abstraction layers just to claim SOLID compliance.**

---

# 5. DRY, KISS, and YAGNI

## DRY

Do not duplicate meaningful business rules, validation, authorization logic, pricing logic, or complex behavior.

Small incidental duplication may be better than premature abstraction.

## KISS

Choose the simplest solution that correctly satisfies the requirement and existing architecture.

## YAGNI

Do not implement hypothetical future requirements without evidence they are needed.

---

# 6. Separate Concerns

Keep responsibilities at appropriate boundaries.

Examples:

- UI should not be the authority for authorization or billing.
- Controllers/routes should not accumulate all business logic.
- Domain/business logic should not depend unnecessarily on presentation details.
- Data-access details should not leak throughout unrelated modules.
- Validation should happen at trust boundaries.

Follow the target project's architectural style rather than imposing a new one.

---

# 7. Validate at Trust Boundaries

Treat external input as untrusted.

Validate where data enters the system:

- API requests,
- forms,
- file uploads,
- webhooks,
- provider responses,
- environment/configuration,
- database deserialization when needed.

Prefer explicit schemas/types/DTOs where supported by the project.

Never rely only on client-side validation for server-side correctness or security.

---

# 8. Secure by Default

Apply least privilege and secure defaults.

Always consider when relevant:

- authentication,
- authorization,
- ownership checks,
- IDOR/cross-user access,
- input injection,
- secret handling,
- session/cookie security,
- CSRF/XSS/SSRF depending on stack,
- file upload validation,
- rate limiting,
- replay/idempotency,
- sensitive logging,
- error disclosure.

Never place secrets in source code, browser bundles, logs, or committed environment files.

Security decisions must be enforced server-side when a server exists.

---

# 9. Design for Failure

External systems fail.

Handle realistic failures explicitly:

- network timeout,
- provider outage,
- database error,
- malformed provider response,
- unavailable dependency,
- partial operation,
- duplicate/replayed request.

Use transactions, retries, idempotency, compensation, or rollback only where justified.

Retries must be bounded and must not multiply side effects.

Do not swallow errors silently.

---

# 10. Error Handling

Errors should be:

- actionable for operators,
- understandable for users when surfaced,
- safe from sensitive-data leakage,
- consistent with project conventions.

Avoid generic catch-all handling that destroys useful context.

Preserve causes/context when the language supports it.

Do not use exceptions/errors as normal control flow when a clearer approach exists.

---

# 11. Data Integrity

For persistent data changes consider:

- constraints,
- uniqueness,
- transactions,
- race conditions,
- ownership,
- deletion semantics,
- migration safety,
- rollback/recovery,
- backward compatibility.

Do not assume application-level checks alone prevent concurrent data violations when the database can enforce the invariant.

Migrations should be deterministic and safe for the project's deployment model.

---

# 12. API Engineering

Maintain consistent:

- naming,
- status/error semantics,
- validation,
- pagination,
- versioning strategy,
- authorization,
- idempotency where appropriate,
- response contracts.

Avoid breaking API consumers unnecessarily.

For breaking changes, document migration impact and update consumers in the same coordinated plan.

---

# 13. Frontend Engineering

User-facing features should handle applicable states:

- loading,
- success,
- empty,
- error,
- disabled,
- permission denied,
- offline/retry where relevant.

Prefer reusable design-system components already present.

Avoid unnecessary component state duplication.

Keep business/security authority out of client-only logic.

Preserve familiar interaction patterns and existing product identity.

---

# 14. Accessibility

For user-facing work, preserve or improve accessibility.

Consider:

- semantic elements,
- keyboard navigation,
- visible focus,
- form labels,
- accessible names,
- error association,
- contrast,
- meaningful alt text,
- reduced-motion preferences where applicable.

Do not sacrifice accessibility for cosmetic convenience.

---

# 15. Performance Engineering

Do not optimize blindly.

First avoid obvious inefficiencies such as:

- N+1 database queries,
- unbounded reads,
- repeated expensive computation,
- unnecessary network requests,
- excessive rerenders,
- loading massive unused dependencies,
- sending irrelevant AI/context data.

When performance is a requirement or suspected bottleneck, measure before and after where practical.

Prefer correctness and maintainability over micro-optimization without evidence.

---

# 16. Resource and Cost Awareness

For systems using paid APIs, cloud resources, AI models, storage, queues, or third-party services:

- avoid unnecessary calls,
- bound retries,
- cache where correct,
- batch safely when useful,
- limit payload/context size,
- track actual usage when required,
- prevent duplicate billing/side effects.

Cost efficiency must not weaken correctness or security.

---

# 17. Testing Practices

Test behavior, not implementation trivia.

Use the smallest appropriate layer:

- unit tests for isolated business logic,
- component tests for UI behavior,
- integration tests for boundaries,
- API tests for contracts/auth,
- end-to-end tests for critical workflows.

Tests should be:

- deterministic,
- readable,
- independent where practical,
- focused on meaningful behavior.

Always include failure/edge cases when risk justifies them.

Never delete or weaken a valid test merely to make CI green.

---

# 18. Testability

New logic should be structured so important behavior can be tested without unreasonable setup.

Avoid unnecessary hidden global state and hard-wired dependencies when the existing architecture provides clean seams.

Do not introduce dependency injection ceremony if the project does not need it.

---

# 19. Observability

For production-relevant backend/infrastructure work, preserve useful observability.

Consider:

- structured logs,
- meaningful error context,
- metrics,
- tracing/correlation IDs,
- audit logs for sensitive operations.

Do not log:

- passwords,
- API keys,
- auth tokens,
- payment secrets,
- private user data unless explicitly necessary and safely handled.

Avoid noisy logging that makes real failures harder to find.

---

# 20. Configuration

Environment-specific values belong in appropriate configuration, not source constants.

- fail clearly for missing required config,
- provide safe defaults only where truly safe,
- document new required variables,
- update `.env.example` or equivalent without real secrets.

---

# 21. Dependencies

Before adding a dependency:

1. check whether the project already solves the problem,
2. check whether the standard library/framework is sufficient,
3. evaluate maintenance/security/bundle/runtime cost,
4. add only if the value justifies the dependency.

Avoid dependency churn for trivial functionality.

Do not perform unrelated dependency upgrades inside feature work.

---

# 22. Concurrency and Idempotency

When operations can run concurrently or repeat, explicitly consider:

- duplicate creation,
- double charging,
- lost updates,
- race conditions,
- stale reads,
- replayed webhooks,
- repeated user submissions.

Use database constraints, transactions, locks, optimistic concurrency, idempotency keys, or deduplication according to the actual risk and architecture.

---

# 23. Documentation

Update documentation when a change affects:

- setup,
- environment variables,
- public APIs,
- architecture assumptions,
- deployment,
- operational procedures,
- non-obvious behavior.

Do not generate large documentation files for trivial implementation details.

Prefer documentation near the source of truth.

---

# 24. Git and Change History

Commits should be:

- focused,
- buildable/verifiable when practical,
- free of unrelated changes,
- clearly named,
- traceable to the task/requirement.

Review the staged diff before commit.

Never commit secrets, generated junk, or unrelated user changes.

Do not rewrite shared Git history without explicit authorization.

---

# 25. Refactoring Rule

Refactor when needed to safely implement the requirement or remove material risk.

Do not perform broad cleanup merely because code could be prettier.

A refactor performed alongside behavior change should preserve existing behavior outside the approved requirement and remain testable.

---

# 26. Compatibility and Migration

When changing schemas, APIs, config, persisted formats, or public behavior:

- identify consumers,
- preserve compatibility where practical,
- provide migration steps when needed,
- avoid irreversible changes without recovery planning.

---

# 27. Definition of High-Quality Code

High-quality CCAF work is:

- correct,
- secure,
- understandable,
- cohesive,
- appropriately tested,
- consistent with the existing project,
- observable where needed,
- resilient to realistic failure,
- appropriately performant,
- easy for the next engineer to maintain.

It is **not** code with the most abstractions, patterns, files, or comments.

---

# Final Rule

**Prefer the simplest production-quality solution that satisfies the approved requirement, fits the existing architecture, and can be proven with evidence.**