# CCAF — Curib Codex Agent Framework

A reusable, usage-efficient professional engineering framework for improving and completing **existing software projects** with Codex and other AI coding agents.

You provide only:

1. the target project path,
2. Planning,
3. Requirements Analysis.

CCAF handles:

**Analyze → Plan → Implement → Targeted Test → QA → Security/User Review when needed → Verify → Checkpoint → Repeat**

## Why CCAF is efficient

CCAF is built to minimize repeated context and unnecessary agent work:

- broad repository discovery happens only when needed,
- stable architecture knowledge is persisted in `FACTS.md`,
- the current work unit is persisted in a compact `TASK.md`,
- resume sessions start from `STATUS.md` + `TASK.md`,
- reviewers inspect task + diff + evidence first instead of re-analyzing the project,
- LOW / MEDIUM / HIGH risk determines how much QA/review is required,
- targeted tests run before broad suites,
- reasoning depth escalates only when complexity requires it,
- repeated failing approaches are bounded.

## Design goals

- Existing-project first
- Production-minded implementation
- Minimum necessary context and reasoning
- No unnecessary rewrites
- No fake completion
- Risk-based quality gates
- Persistent checkpoints for usage/session limits
- Professional specialist roles
- Urgent execution without reckless shortcuts

## Folder layout

```text
agent/
├── AGENTS.md
├── QUALITY_GATES.md
├── HOW_TO_USE.md
├── README.md
├── agents/
│   ├── orchestrator.md
│   ├── analyst-planner.md
│   ├── engineer.md
│   ├── qa-engineer.md
│   ├── verifier.md
│   ├── security.md
│   └── normal-user-agent.md
├── workflows/
│   ├── development-loop.md
│   ├── start.md
│   └── resume.md
├── templates/
│   ├── REQUIREMENTS.md
│   ├── STATUS.md
│   ├── TASK.md
│   ├── PLAN.md
│   ├── FACTS.md
│   └── DECISIONS.md
└── projects/
    └── _example/
        ├── REQUIREMENTS.md
        └── state/
```

## Per-project state

```text
agent/projects/my-project/
├── REQUIREMENTS.md
└── state/
    ├── STATUS.md
    ├── TASK.md
    ├── PLAN.md
    ├── FACTS.md
    └── DECISIONS.md
```

`TASK.md` is the key efficiency file. It contains only the context needed to finish the current work unit, including acceptance criteria, relevant paths, risk, required reviewers, targeted verification, evidence, and `NEXT ACTION`.

## Workspace

```text
workspace/
├── agent/
└── YourProject/
```

One shared CCAF folder can support multiple projects.

## Start

```text
Read ./agent/AGENTS.md.

Target project:
./YourProject

Requirements:
./agent/projects/my-project/REQUIREMENTS.md

Start the CCAF existing-project development loop.
Optimize for minimum usage while maintaining production-quality work.
```

## Resume

```text
Read ./agent/AGENTS.md.

Resume target project:
./YourProject

Project state:
./agent/projects/my-project/state/

Read STATUS.md and TASK.md first.
Verify the checkpoint against the current code and diff.
Continue from NEXT ACTION without restarting completed analysis.
```

## Core principle

**Read less, but read the right things. Reuse before rewriting. Use the cheapest reliable verification. Checkpoint before context is lost.**