# Universal Engineering Workspace

Recommended structure:

```text
workspace/
├── agent/
└── YourProject/
```

- `agent/` is the reusable professional engineering agent system.
- `YourProject/` is any existing software project.

You may keep multiple projects beside the same shared agent system:

```text
workspace/
├── agent/
├── Vrompt/
├── PocketPOS/
├── DocumentSystem/
└── AnotherProject/
```

Each project gets its own profile under:

```text
agent/projects/<project-name>/
```

Example:

```text
agent/projects/vrompt/
agent/projects/pocketpos/
agent/projects/document-system/
```

Start from the workspace root and provide:

1. Target project path
2. Requirements file path

Example:

```text
Read ./agent/AGENTS.md.

Target project:
./YourProject

Requirements:
./agent/projects/your-project/REQUIREMENTS.md

Start the professional existing-project development loop.
```
"# ai-workplace-agents" 
"# ai-workplace-agents" 
