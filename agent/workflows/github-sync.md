# CCAF GitHub Sync Workflow

Use this workflow after a CCAF work unit is implemented and verified.

## Goal

Make every completed CCAF work unit easy to track in GitHub without accidentally committing unrelated user work.

## Preconditions

Before committing:

1. The current task passes its required quality gates.
2. `TASK.md` accurately reflects the result.
3. `STATUS.md` points to the next action.
4. Current branch and remote are known.
5. The changed files belonging to this work unit are known.

## 1. Inspect repository state

Run or inspect the equivalent of:

```bash
git status --short
git branch --show-current
git remote -v
git diff --stat
git diff
```

Never assume every dirty file belongs to CCAF.

## 2. Separate CCAF-owned changes

Classify dirty files into:

- **TASK OWNED** — created/modified for the current CCAF task.
- **STATE OWNED** — project CCAF state updates for this task.
- **UNRELATED** — pre-existing or user-created work outside the task.
- **UNKNOWN** — ownership cannot be established safely.

Stage only TASK OWNED + STATE OWNED files.

Do not use broad staging such as `git add .` or `git add -A` when unrelated changes exist.

Prefer explicit paths:

```bash
git add path/to/file1 path/to/file2 agent/projects/<project>/state/TASK.md agent/projects/<project>/state/STATUS.md
```

If the CCAF state folder lives outside the target Git repository, do not try to commit those external files into the target repo. Record the target repo commit in the external state instead.

## 3. Review staged diff

Before commit:

```bash
git diff --cached --stat
git diff --cached
```

Confirm:

- no unrelated file is staged,
- no secret/API key is staged,
- no generated artifact is staged accidentally,
- no destructive/unintended change is present,
- staged content matches the verified task.

If staged content is wrong, unstage only the affected files safely; do not discard user changes.

## 4. Commit convention

Use a concise traceable commit message.

Preferred format:

```text
<type>(<scope>): <summary> [<TASK-ID>]
```

Examples:

```text
fix(auth): enforce server-side ownership [P0-03]
feat(chat): add model selector loading state [P1-04]
test(billing): cover duplicate usage reconciliation [P0-08]
docs(ccaf): update project checkpoint [P2-01]
```

Recommended types:

- `feat`
- `fix`
- `refactor`
- `test`
- `docs`
- `perf`
- `build`
- `ci`
- `chore`

One coherent work unit should normally produce one coherent commit.

Do not create noisy micro-commits for every file edit unless the project workflow explicitly requires them.

## 5. Record commit locally

After commit, capture:

```bash
git rev-parse HEAD
git branch --show-current
```

Record in project state:

```text
Git Branch:
Git Commit:
Git Sync:
```

Use the full SHA when available.

## 6. Synchronize safely

Before push, verify upstream status:

```bash
git status -sb
git fetch --prune
```

If the branch has an upstream and is not behind/conflicted:

```bash
git push
```

If no upstream exists and this is a normal working branch:

```bash
git push -u origin <current-branch>
```

Do not force push by default.

Do not silently push directly to a protected/default branch if the repository workflow requires a feature branch or PR.

If remote contains new commits, integrate according to the repository's existing workflow. Do not blindly overwrite remote history.

## 7. Sync status

Record one of:

- `PUSHED` — commit exists on configured GitHub upstream.
- `LOCAL ONLY` — commit created, push impossible/not authorized; include reason.
- `NOT COMMITTED` — task not verified or safe commit not possible; include reason.

Example:

```text
Git Branch: ccaf/p0-03-auth-ownership
Git Commit: 7f5d...
Git Sync: PUSHED
```

## 8. GitHub tracking

When GitHub CLI or a connected GitHub integration is available, verify the repository/branch is visible remotely.

Optionally track a pull request when the repository uses PR-based development.

Do not create a PR for every tiny local task unless that matches the project's workflow.

## Failure rules

### Authentication failure

Do not retry endlessly. Record `LOCAL ONLY` and the authentication error.

### Non-fast-forward push

Do not force push. Fetch and inspect remote divergence first.

### Merge conflict

Preserve both sides. Resolve only when the intended behavior is understood and verify again before push.

### Unrelated dirty work

Do not include it in the commit. If file-level changes are interleaved in the same file and cannot be safely separated, do not commit automatically; record the blocker.

## Completion

A normal verified CCAF work unit ends as:

```text
IMPLEMENTED
→ VERIFIED
→ STATE CHECKPOINTED
→ SAFE FILES STAGED
→ STAGED DIFF REVIEWED
→ COMMITTED
→ PUSHED / LOCAL ONLY WITH REASON
→ NEXT ACTION
```
