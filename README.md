# CCAF — Curib Codex Agent Framework

**CCAF** is a universal, usage-efficient professional engineering framework for Codex and other AI coding agents working on **existing software projects**.

Provide a target project and its **Planning + Requirements Analysis**. CCAF discovers the existing codebase, creates a requirement-linked technical plan, implements changes, applies risk-based QA/security/user validation, verifies evidence, checkpoints progress, and resumes safely across sessions or usage limits.

## Core workflow

**Analyze only what is needed → Plan a small work unit → Implement → Cheapest reliable test → Risk-based review → Verify → Checkpoint → Continue**

## What makes CCAF efficient

CCAF is optimized to avoid the biggest sources of coding-agent waste:

- **Analyze once, remember facts** — stable architecture knowledge lives in `FACTS.md`.
- **Compact task packets** — the current work unit lives in `TASK.md`, so resume sessions do not need to reread the whole project.
- **Minimal-context resume** — start from `STATUS.md` + `TASK.md` + current diff.
- **Risk-based routing** — LOW, MEDIUM, and HIGH risk decide which reviewers are actually needed.
- **Diff-first review** — QA, Security, Normal User, and Verifier start from the task, changed files, and evidence instead of independently rediscovering the repository.
- **Targeted tests first** — broad suites run only when risk, failures, milestones, or release verification justify them.
- **Minimum effective reasoning** — deeper reasoning is reserved for security, billing, concurrency, difficult architecture, migrations, and persistent hard bugs.
- **Bounded retries** — repeated failing approaches stop after two attempts with the same root cause and must change strategy.

## Workspace

```text
workspace/
├── agent/
└── YourProject/
```

One shared `agent/` folder can support multiple projects:

```text
workspace/
├── agent/
├── ProjectA/
├── ProjectB/
└── ProjectC/
```

Each project keeps independent requirements and state under:

```text
agent/projects/<project-name>/
├── REQUIREMENTS.md
└── state/
    ├── STATUS.md
    ├── TASK.md
    ├── PLAN.md
    ├── FACTS.md
    └── DECISIONS.md
```

## Professional roles

- **Orchestrator** — priority, routing, task packets, checkpoints, completion
- **Analyst + Planner** — discovery, gap analysis, requirement traceability, planning
- **Engineer** — implementation across the project's actual stack
- **QA Engineer** — targeted behavior, edge cases, failure paths, regressions
- **Security Reviewer** — only for sensitive/high-risk work
- **Normal User Agent** — user-facing usability validation
- **Verifier** — independent requirement/evidence verification

The framework intentionally avoids invoking every role for every task.

## Risk routing

### LOW

```text
Engineer → focused verification → Verifier
```

### MEDIUM

```text
Engineer → QA → Verifier
```

Add Normal User when user-facing.

### HIGH

```text
Engineer → Security → QA → Verifier
```

Add Normal User when user-facing.

## Quick start

1. Put `agent/` beside your existing project.
2. Copy `agent/projects/_example/` or create `agent/projects/<project-name>/`.
3. Put your Planning + Requirements Analysis into `REQUIREMENTS.md`.
4. Open your coding environment from the workspace root.
5. Start with:

```text
Read ./agent/AGENTS.md.

Target project:
./YourProject

Requirements:
./agent/projects/my-project/REQUIREMENTS.md

Start the CCAF existing-project development loop.
Optimize for minimum usage while maintaining production-quality work.
```

## Resume after a limit or new session

```text
Read ./agent/AGENTS.md.

Resume target project:
./YourProject

Project state:
./agent/projects/my-project/state/

Read STATUS.md and TASK.md first.
Verify them against the current code and Git diff.
Continue from NEXT ACTION without restarting completed analysis.
```

## Quality gates

See [`agent/QUALITY_GATES.md`](agent/QUALITY_GATES.md) for the risk-based verification model.

For detailed developer instructions, see [`agent/HOW_TO_USE.md`](agent/HOW_TO_USE.md).

## Philosophy

**Read less, but read the right things. Reuse before rewriting. Use the cheapest reliable verification. Escalate only when risk requires it. Checkpoint before context is lost.**

## License

MIT License. See [`LICENSE`](LICENSE).
