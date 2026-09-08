# Universal Professional Engineering Agent System

A reusable, usage-efficient agent framework for improving and completing **existing software projects**.

You provide only:

1. The target project path.
2. Planning.
3. Requirements Analysis.

The agent system handles:

**Analyze → Plan → Implement → Test → QA → User Validation → Review → Checkpoint → Repeat**

## Design Goals

- Existing-project first.
- Production-minded implementation.
- Minimum necessary context and reasoning.
- No unnecessary rewrites.
- No fake completion.
- Persistent checkpoints for usage/session limits.
- Professional specialist roles.
- Clear ownership of each engineering responsibility.
- Urgent execution without reckless shortcuts.

## Folder Layout

```text
agent/
├── AGENTS.md
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
│   ├── PLAN.md
│   ├── FACTS.md
│   └── DECISIONS.md
└── projects/
    └── _example/
        ├── REQUIREMENTS.md
        └── state/
```

## How To Use

Place this folder beside one or more existing projects:

```text
workspace/
├── agent/
├── Vrompt/
├── PocketPOS/
└── AnotherProject/
```

Create a project state folder:

```text
agent/projects/vrompt/
├── REQUIREMENTS.md
└── state/
    ├── STATUS.md
    ├── PLAN.md
    ├── FACTS.md
    └── DECISIONS.md
```

Paste only the approved **Planning + Requirements Analysis** into `REQUIREMENTS.md`.

Then start Codex/your coding agent with:

```text
Read ./agent/AGENTS.md.

Target project: ./Vrompt
Requirements: ./agent/projects/vrompt/REQUIREMENTS.md

Start the professional existing-project development loop.
Optimize for minimum usage while maintaining production-quality work.
```

## Resume After Usage Limit / New Session

```text
Read ./agent/AGENTS.md.

Resume target project: ./Vrompt
Project state: ./agent/projects/vrompt/state/

Do not restart completed work.
Verify the saved checkpoint against the current code, continue from NEXT ACTION,
and keep using the professional development loop.
```

## Core Principle

**Move with urgency. Think with discipline. Verify before claiming success.**
