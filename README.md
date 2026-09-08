# CCAF — Curib Codex Agent Framework

**CCAF** is a universal, usage-efficient professional engineering agent framework for Codex and other AI coding agents working on **existing software projects**.

Provide a target project and its **Planning + Requirements Analysis**. CCAF discovers the existing codebase, builds a technical implementation plan, implements changes, runs targeted QA and security checks, validates user-facing work from a normal user's perspective, verifies requirements, checkpoints progress, and resumes safely across sessions or usage limits.

## Core workflow

**Analyze → Plan → Implement → Targeted Test → QA → Security when needed → Normal User validation when user-facing → Verify → Checkpoint → Continue**

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
```

## Professional roles

- **Orchestrator** — priority, routing, checkpoints, completion
- **Analyst + Planner** — codebase discovery, gap analysis, implementation planning
- **Engineer** — implementation across the project's actual stack
- **QA Engineer** — targeted testing, edge cases, regressions
- **Security Reviewer** — security-sensitive reviews only when needed
- **Normal User Agent** — real-user usability validation for user-facing work
- **Verifier** — independent requirement verification

## Usage efficiency

CCAF is designed to reduce unnecessary model usage:

- analyze deeply only when necessary,
- persist stable architecture facts,
- inspect only relevant files for each task,
- use the minimum effective reasoning level,
- run targeted tests before broad suites,
- invoke specialized reviewers only when relevant,
- checkpoint every meaningful work unit.

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

Start the professional existing-project development loop.
```

For detailed instructions, see [`agent/HOW_TO_USE.md`](agent/HOW_TO_USE.md).

## Philosophy

**Reuse before rewriting. Inspect before assuming. Implement instead of only recommending. Test before claiming. Checkpoint before context is lost.**

## License

MIT License. See [`LICENSE`](LICENSE).
