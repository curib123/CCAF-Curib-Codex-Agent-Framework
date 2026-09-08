# CCAF UX/UI Standards

These standards apply to user-facing work unless the target product has stronger established design-system rules.

The goal is a **modern, familiar, user-friendly, accessible, responsive, flexible, and maintainable interface** that follows the product's identity and **Jakob's Law**.

Modern does not mean unfamiliar. Flexible does not mean inconsistent. Dynamic does not mean unpredictable.

---

# 1. Jakob's Law

Users spend most of their time using other products. Interfaces should behave in ways users already understand.

Prefer familiar conventions for:

- navigation,
- search,
- forms,
- tables,
- filters,
- dialogs,
- dropdowns,
- settings,
- authentication,
- pagination,
- destructive actions,
- notifications,
- loading states.

Do not invent unusual interaction patterns merely to appear unique.

Product identity should come from visual language, content, brand, motion, and thoughtful details—not by breaking familiar behavior.

---

# 2. Existing Design System First

Before creating UI:

1. inspect existing components,
2. inspect tokens/theme,
3. inspect spacing/typography/icon conventions,
4. inspect existing responsive patterns,
5. reuse established primitives.

Do not create duplicate buttons, modals, form fields, cards, toasts, or navigation systems when suitable components already exist.

If the project has no coherent system, improve incrementally rather than redesigning the entire product during an unrelated task.

---

# 3. Clear Information Hierarchy

Every screen should make these clear quickly:

1. Where am I?
2. What is this page for?
3. What is most important?
4. What can I do next?
5. What happened after I acted?

Use visual hierarchy through:

- typography,
- spacing,
- grouping,
- alignment,
- emphasis,
- progressive disclosure.

Avoid clutter, excessive boxes, competing CTAs, and unnecessary explanatory text.

---

# 4. Primary Action Clarity

A screen should usually have one visually dominant primary action for the user's main goal.

Secondary actions should be visually secondary.

Destructive actions should not compete with primary actions and should use confirmation/undo according to risk.

Do not hide common actions behind menus without a usability reason.

---

# 5. Progressive Disclosure

Show common/default controls first.

Place advanced or rarely used controls behind:

- expandable sections,
- menus,
- advanced settings,
- contextual controls.

Do not overwhelm new users with every possible option simultaneously.

Preserve expert efficiency with shortcuts and advanced paths where useful.

---

# 6. Dynamic and Flexible UI

Dynamic interfaces must respond to real system state rather than hard-coded assumptions.

When applicable, UI should adapt to:

- permissions,
- plans/features,
- configuration,
- available capabilities,
- viewport,
- content length,
- empty/non-empty data,
- loading/failure state.

Avoid duplicated hard-coded option lists when a backend/configuration source already owns them.

Dynamic behavior must remain predictable and explain why an option is unavailable when users need that context.

---

# 7. Responsive by Default

User-facing work should support the product's intended breakpoints and devices.

Avoid designing only for one desktop width.

Check relevant behavior on:

- narrow mobile,
- common mobile,
- tablet/small desktop,
- normal desktop,
- large screens when the app targets them.

Prefer fluid layouts, sensible max-widths, wrapping, responsive grids, and content-driven sizing.

Do not solve responsiveness by merely shrinking everything.

---

# 8. Mobile Interaction

On touch devices:

- interactive targets must be comfortably tappable,
- important actions should not depend on hover,
- menus/dialogs should fit the viewport,
- fixed elements should not obscure content,
- keyboards should not make forms unusable,
- dense desktop tables may require responsive alternatives.

---

# 9. State Completeness

For applicable UI, implement and verify:

- initial,
- loading,
- success,
- empty,
- validation error,
- server/provider error,
- disabled,
- permission denied,
- offline/retry,
- partial data,
- destructive confirmation,
- completion feedback.

Do not treat only the ideal populated state as the feature.

---

# 10. Perceived Performance

Use feedback that matches operation duration.

Prefer:

- immediate control feedback,
- skeletons/placeholders for meaningful content loading,
- local optimistic updates only when safe and recoverable,
- progress indicators for longer operations,
- streaming/progressive display where useful.

Avoid fake delays or excessive animation.

Prevent layout shifts where practical.

---

# 11. Forms

Forms should:

- use clear persistent labels,
- group related fields,
- choose appropriate input types,
- provide useful validation near the problem,
- preserve user input after recoverable errors,
- distinguish required vs optional fields,
- support keyboard navigation,
- prevent duplicate submissions when needed.

Do not use placeholder text as the only label.

Avoid asking for data the product does not need.

---

# 12. Errors and Recovery

Error messages should explain:

- what happened,
- what the user can do next,
- whether their data/action was preserved.

Avoid technical stack/provider details unless the target users need them.

Offer retry, correction, navigation, or support paths when appropriate.

Do not dead-end users unnecessarily.

---

# 13. Empty States

A useful empty state should communicate:

- why there is no content,
- whether that is expected,
- the most useful next action.

Avoid decorative empty states with no guidance when users are expected to act.

---

# 14. Navigation

Navigation should be:

- predictable,
- consistent across pages,
- clear about current location,
- scalable as features grow.

Use familiar patterns appropriate to the product: header, sidebar, tabs, breadcrumbs, back navigation, etc.

Do not duplicate navigation systems for the same hierarchy without a clear reason.

---

# 15. Search, Filter, and Sort

For data-heavy interfaces:

- use search when users know what they are looking for,
- use filters for meaningful categories,
- show active filters clearly,
- make reset/clear easy,
- preserve/filter state appropriately,
- use sorting where it improves retrieval.

When option lists become large, prefer searchable selection rather than unwieldy static dropdowns.

---

# 16. Tables and Dense Data

Use tables for genuinely tabular comparison.

Keep:

- headers clear,
- important columns prioritized,
- actions discoverable,
- empty/loading/error states complete,
- pagination/virtualization appropriate to dataset size.

For narrow screens, use responsive prioritization, horizontal scrolling when suitable, or an alternate card/detail representation when that improves usability.

---

# 17. Feedback and Notifications

Use feedback proportionate to importance.

- Inline feedback for local validation/state.
- Toasts for transient non-blocking results.
- Dialogs for decisions needing focused attention.
- Persistent banners for important ongoing conditions.

Do not use modal dialogs for routine information.

Do not show redundant notifications for an already obvious visual state change.

---

# 18. Icons

Use familiar, consistent icons from the project's icon system.

Icons should support comprehension, not replace essential labels when meaning is ambiguous.

Avoid mixing unrelated icon styles.

Use tooltips/accessibility labels for icon-only controls.

---

# 19. Visual Consistency

Maintain consistent:

- spacing rhythm,
- radius system,
- shadows/elevation,
- typography scale,
- color roles,
- icon sizes,
- component density,
- focus/hover/pressed states.

Avoid one-off arbitrary values when tokens/design-system values exist.

---

# 20. Modern Aesthetic

A modern professional UI typically favors:

- clear typography,
- strong spacing,
- restrained decoration,
- meaningful hierarchy,
- lightweight surfaces,
- clear states,
- subtle purposeful motion,
- responsive layouts,
- consistent tokens.

Do not equate modern design with glassmorphism, gradients, excessive cards, giant rounded corners, or animation everywhere.

Follow the existing brand identity.

---

# 21. Accessibility

Target accessible interaction by default.

When relevant verify:

- semantic HTML/native controls,
- logical keyboard order,
- visible focus,
- accessible names,
- form label association,
- sufficient contrast,
- meaningful alt text,
- status/error announcements where needed,
- reduced-motion preferences,
- no keyboard traps.

Use ARIA to fill semantic gaps, not to replace native semantics unnecessarily.

---

# 22. Content and Microcopy

Use concise, plain-language labels users recognize.

Prefer task-oriented language.

Avoid internal engineering terminology, ambiguous labels, and unnecessary marketing prose inside functional workflows.

Button labels should usually describe the action rather than generic `OK` when a more specific label is useful.

---

# 23. Confirmation and Undo

Match protection to risk.

- Low-risk reversible action: prefer immediate action/undo when appropriate.
- Destructive or high-impact action: confirmation may be required.
- Very high-impact action: explicit typed/strong confirmation may be justified.

Do not add confirmation dialogs to every harmless action.

---

# 24. Personalization and Flexibility

When product requirements support it, allow users to control meaningful preferences such as:

- layout density,
- theme,
- defaults,
- model/provider choices,
- sorting/filtering,
- notification behavior.

Do not expose configuration merely because it exists internally.

Provide sensible defaults so customization is optional, not required.

---

# 25. User Control and Transparency

Users should understand consequential system behavior.

For dynamic/AI/automated features, when relevant show:

- selected mode/model/provider,
- limits/credits/plan restrictions,
- operation status,
- fallback behavior where user-impacting,
- clear manual override where product requirements allow it.

Avoid surprising hidden automation when it changes outcomes users care about.

---

# 26. UX Validation

For meaningful user-facing work, the Normal User Agent should validate the primary flow from the actual entry point.

At minimum verify relevant:

1. discoverability,
2. primary action,
3. one realistic error/mistake,
4. loading/empty/error state,
5. navigation/refresh,
6. responsive behavior,
7. accessibility basics,
8. familiarity with Jakob's Law,
9. whether the requirement feels complete.

---

# 27. UX Definition of Done

A user-facing task is not complete merely because the component renders.

It should be:

- understandable,
- familiar,
- responsive,
- accessible,
- state-complete,
- consistent with the design system,
- efficient to use,
- flexible where requirements require flexibility,
- visually polished without unnecessary complexity.

**The best interface is usually the one users can understand without being taught.**