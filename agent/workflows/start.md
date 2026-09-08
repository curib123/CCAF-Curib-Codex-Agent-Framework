# CCAF Start Workflow

Use this for a new target project.

```text
Read ./agent/AGENTS.md.

Target project:
./YOUR_PROJECT

Requirements:
./agent/projects/YOUR_PROJECT_NAME/REQUIREMENTS.md

Treat the target as an existing project.

Initialize project state if missing:
- STATUS.md
- TASK.md
- PLAN.md
- FACTS.md
- DECISIONS.md only when needed

Use Analyst + Planner for the minimum initial discovery required to:
1. understand the real stack and architecture,
2. map requirements to current implementation,
3. persist stable facts,
4. create a prioritized requirement-linked plan,
5. create the first compact TASK.md packet,
6. immediately begin the highest-priority actionable task.

Optimize for minimum usage:
- analyze broadly only once or when facts are stale,
- persist stable facts,
- resume from STATUS.md + TASK.md,
- inspect only relevant files,
- use minimum effective reasoning,
- run the cheapest meaningful test first,
- invoke Security only for high-risk/sensitive work,
- invoke Normal User only for user-facing work,
- make reviewers diff-first.

Do not stop after producing an audit or plan.

Implement → targeted evidence → QA/review as required by risk → verify → checkpoint → continue.

Preserve existing working code and unrelated user changes.
```
