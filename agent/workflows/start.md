# Start Workflow

Use this for a new target project.

```text
Read ./agent/AGENTS.md.

Target project:
./YOUR_PROJECT

Requirements:
./agent/projects/YOUR_PROJECT_NAME/REQUIREMENTS.md

Treat the target as an existing project.

Initialize project state if missing.

Use Analyst + Planner for the initial gap analysis, persist stable architecture
facts, create a prioritized implementation plan, and immediately begin the
highest-priority actionable task.

Optimize for minimum usage:
- analyze deeply once,
- reuse FACTS.md,
- inspect only relevant files,
- use minimum effective reasoning,
- run targeted tests first,
- invoke Security only for sensitive work,
- invoke Normal User Agent only for user-facing changes.

Do not stop after producing an audit or plan.

Implement → test → QA → security if needed → normal-user check if applicable
→ verify → checkpoint → continue.

Preserve existing working code and unrelated user changes.
```
