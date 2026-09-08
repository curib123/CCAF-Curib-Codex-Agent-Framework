# CCAF Resume Workflow

Use this after a new session, usage reset, context reset, IDE restart, or interruption.

```text
Read ./agent/AGENTS.md.

Resume target project:
./YOUR_PROJECT

Project state:
./agent/projects/YOUR_PROJECT_NAME/state/

Do NOT restart the full project analysis.

Read in this order:
1. STATUS.md
2. TASK.md
3. current Git status/diff
4. only the requirement section needed by TASK.md
5. only the relevant FACTS.md / DECISIONS.md if needed

Verify the saved checkpoint against actual code.

Continue from NEXT ACTION.

Use TASK.md as the primary current-context packet.
Do not reload the entire PLAN.md or FACTS.md unless the task genuinely needs broader context.

Continue:
implement → cheapest meaningful test → QA/security/normal-user review only as required by risk → verify → checkpoint → next task.

Only perform deeper analysis when persisted facts are missing, wrong, stale, or insufficient for the current task.

If context starts growing large, update TASK.md + STATUS.md and continue from persisted state rather than carrying historical discussion forward.
```
