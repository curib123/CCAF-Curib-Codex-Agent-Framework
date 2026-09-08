# CCAF Adaptive Model & Reasoning Routing

CCAF should use the **lowest-cost model and lowest reasoning effort that can reliably complete the current work unit**.

The goal is better results per unit of model usage without weakening correctness, security, or verification.

This policy is host-aware: CCAF may recommend or request a model/reasoning change only when the active Codex/agent environment exposes that capability. It must never pretend a switch occurred when the host does not support it.

---

# 1. Routing Modes

## AUTO

CCAF chooses the cheapest capable model tier and reasoning effort for the current task.

## MANUAL

If the user explicitly selects or requests a model/reasoning level, respect that choice unless it is unavailable or incapable of the required task. Do not silently downgrade a manual choice for cost savings.

---

# 2. Model Tiers

Do not hard-code one provider's product names into the core policy. Map the models available in the current environment into these tiers.

## ECONOMY

Use the cheapest/fastest capable coding model available.

Best for:

- repository navigation,
- simple bug fixes,
- documentation,
- naming/copy changes,
- isolated UI work,
- routine CRUD,
- straightforward tests,
- mechanical refactors,
- repetitive implementation with clear patterns.

## BALANCED

Use a stronger general engineering model when the task needs broader reasoning or integration ability.

Best for:

- normal feature implementation,
- API/database integration,
- multi-file debugging,
- shared state changes,
- cross-layer work,
- ordinary architecture decisions,
- non-trivial QA/verification.

## PREMIUM

Use the strongest available model only when the task's risk or complexity justifies it.

Best for:

- authentication/authorization/security,
- billing/credits/payments,
- concurrency/idempotency,
- risky migrations,
- difficult architecture,
- persistent hard bugs,
- system-wide changes,
- high-blast-radius incidents,
- final review of critical work when evidence is ambiguous.

---

# 3. Reasoning Effort

When the host supports explicit reasoning control, use:

- `LOW` — straightforward, local, well-understood work.
- `MEDIUM` — normal implementation/integration/debugging.
- `HIGH` — difficult debugging, architecture, security-sensitive reasoning.
- `XHIGH` — rare, high-risk or highly complex tasks where HIGH is insufficient.
- `MAX` — exceptional cases only; never the default.

If the host exposes different names, map them to the nearest equivalent.

Do not use `MAX` merely because it is available.

---

# 4. Default Routing Matrix

| Task | Model Tier | Reasoning | Context | Tests |
|---|---|---|---|---|
| Docs / naming / simple styling | ECONOMY | LOW | LOCAL | TARGETED |
| Simple bug with clear cause | ECONOMY | LOW-MEDIUM | LOCAL | TARGETED |
| Routine CRUD / component change | ECONOMY | MEDIUM | LOCAL | TARGETED |
| Normal feature | BALANCED | MEDIUM | CROSS-LAYER as needed | TARGETED/EXPANDED |
| API + DB integration | BALANCED | MEDIUM | CROSS-LAYER | EXPANDED |
| Non-trivial bug | BALANCED | MEDIUM-HIGH | CROSS-LAYER | EXPANDED |
| Auth / authorization | PREMIUM | HIGH | CROSS-LAYER | EXPANDED |
| Billing / credits / payments | PREMIUM | HIGH-XHIGH | CROSS-LAYER/SYSTEM | EXPANDED/FULL |
| Concurrency / idempotency | PREMIUM | HIGH-XHIGH | CROSS-LAYER/SYSTEM | EXPANDED |
| Risky migration | PREMIUM | HIGH-XHIGH | SYSTEM | EXPANDED/FULL |
| Persistent architecture issue | PREMIUM | HIGH-XHIGH | SYSTEM | EXPANDED |
| Routine final verification | BALANCED | MEDIUM | DIFF-FIRST | TARGETED/EXPANDED |
| Critical release verification | PREMIUM | HIGH | SYSTEM where required | FULL when justified |

The matrix is a starting point, not a rigid requirement.

---

# 5. Escalation Rules

Start with the minimum effective route.

Escalate one step only when evidence shows the current route is insufficient.

Examples:

- ECONOMY + LOW → ECONOMY + MEDIUM
- ECONOMY + MEDIUM → BALANCED + MEDIUM
- BALANCED + MEDIUM → BALANCED + HIGH
- BALANCED + HIGH → PREMIUM + HIGH
- PREMIUM + HIGH → PREMIUM + XHIGH/MAX only when truly necessary

Escalation triggers include:

- two failed attempts caused by insufficient reasoning/understanding,
- unknown cross-layer dependencies,
- security-sensitive ambiguity,
- concurrency/race behavior,
- migration/data-integrity risk,
- persistent complex test failures,
- high-cost decisions with materially different outcomes.

Do not escalate because of a typo, environment failure, missing dependency, or unrelated pre-existing test failure.

---

# 6. De-escalation Rules

After the difficult part is resolved, reduce model/reasoning for routine follow-up work.

Examples:

- architecture decision completed → use ECONOMY/BALANCED for repetitive implementation,
- root cause found → use lower effort for mechanical fixes,
- security design settled → use lower effort for ordinary test additions,
- high-risk migration plan verified → use lower effort for documentation/cleanup.

Do not keep a PREMIUM/MAX route active for the rest of the session without need.

---

# 7. Stage-Level Routing

A single task may use different routes by stage when the host supports it.

Example:

```text
Discovery        → ECONOMY + LOW
Implementation   → BALANCED + MEDIUM
Security review  → PREMIUM + HIGH
Routine tests    → ECONOMY/BALANCED + LOW/MEDIUM
Verifier         → BALANCED + MEDIUM
```

This is more cost-efficient than running the strongest model at maximum reasoning for the entire task.

---

# 8. Host Capability Detection

At project/session initialization, determine when possible:

- which models are available,
- which reasoning levels are supported,
- whether the host can switch model/reasoning during execution,
- whether the user's selected model must remain fixed.

Persist stable routing capability information in `FACTS.md` only when it is known and unlikely to change during the project session.

Use one of:

```text
Model Switching: SUPPORTED | MANUAL ONLY | UNSUPPORTED | UNKNOWN
Reasoning Control: SUPPORTED | MANUAL ONLY | UNSUPPORTED | UNKNOWN
```

If switching is unsupported:

- keep using the active model,
- still adapt context, tests, reviewers, and reasoning guidance as far as the host allows,
- record the recommended route rather than claiming it was applied.

---

# 9. Manual Selection Rule

User choice takes priority.

If the user says:

- `use Luna max`,
- `use the strongest model`,
- `stay on this model`,
- or explicitly selects a model in the UI,

CCAF must respect that selection unless the model is unavailable or cannot perform the required operation.

CCAF may recommend a cheaper route, but must not silently override the user's explicit choice.

---

# 10. Cost Protection

Avoid waste from:

- PREMIUM models for trivial work,
- MAX reasoning for routine tasks,
- repeatedly rerunning the same high-cost analysis,
- using strong models for mechanical edits after the hard reasoning is complete,
- duplicating specialist reviews,
- sending irrelevant repository context,
- expensive full regression before targeted failures are resolved.

Cost efficiency must never justify skipping required security or data-integrity checks.

---

# 11. Task Recording

`TASK.md` should record:

```text
Routing Mode: AUTO | MANUAL
Recommended Model Tier: ECONOMY | BALANCED | PREMIUM
Applied Model: <model name> | ACTIVE DEFAULT | UNKNOWN
Reasoning Effort: LOW | MEDIUM | HIGH | XHIGH | MAX | HOST DEFAULT
Switch Status: APPLIED | RECOMMENDED ONLY | MANUAL | NOT SUPPORTED
```

Keep this compact. Do not create long routing logs.

---

# 12. Routing Success Metric

Adaptive routing is working when:

- simple work stays on cheap/fast routes,
- difficult work escalates before quality collapses,
- high-cost routes are short-lived,
- critical work receives enough reasoning and review,
- sessions consume less unnecessary context and model effort,
- verification quality remains stable or improves.

**Use the cheapest capable route, escalate with evidence, and de-escalate as soon as the difficult work is over.**