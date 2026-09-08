# Resume Workflow

Use this after a new session, usage reset, context reset, or interruption.

```text
Read ./agent/AGENTS.md.

Resume target project:
./YOUR_PROJECT

Project state:
./agent/projects/YOUR_PROJECT_NAME/state/

Do NOT restart the full project analysis.

Read STATUS.md, the relevant PLAN.md section, and relevant FACTS.md.
Read DECISIONS.md only when necessary.

Inspect current Git status/diff and verify the saved checkpoint against actual code.

Continue from NEXT ACTION.

Use only the code/context necessary for the current task.

Implement → targeted test → QA → security if needed → normal-user check if
user-facing → verify → checkpoint → continue.

Only perform deeper analysis when persisted facts are missing, wrong, or stale.
```
