param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath
)

$ErrorActionPreference = 'Stop'

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$SourceAgent = Join-Path $RepoRoot 'agent'
$SourceRootAgents = Join-Path $RepoRoot 'AGENTS.md'

if (-not (Test-Path $WorkspacePath)) {
    New-Item -ItemType Directory -Path $WorkspacePath -Force | Out-Null
}

$WorkspacePath = (Resolve-Path $WorkspacePath).Path
$TargetAgent = Join-Path $WorkspacePath 'agent'
$TargetRootAgents = Join-Path $WorkspacePath 'AGENTS.md'

Write-Host "Installing CCAF into: $WorkspacePath"

# Copy/update the shared framework without deleting unrelated workspace files.
if (-not (Test-Path $TargetAgent)) {
    Copy-Item -Path $SourceAgent -Destination $TargetAgent -Recurse
} else {
    Copy-Item -Path (Join-Path $SourceAgent '*') -Destination $TargetAgent -Recurse -Force
}

$CcafMarkerStart = '<!-- CCAF:START -->'
$CcafMarkerEnd = '<!-- CCAF:END -->'
$CcafBlock = @"
$CcafMarkerStart
## CCAF — Curib Codex Agent Framework

For every software-project work prompt in this workspace, read and follow `./agent/AGENTS.md` before planning, editing, testing, reviewing, committing, or pushing changes.

Route prompts through CCAF:
- BUGFIX → `agent/workflows/bugfix.md`
- FEATURE → `agent/workflows/feature.md`
- MAINTENANCE → `agent/workflows/maintenance.md`
- CONTINUE / RESUME → `agent/workflows/resume.md`
- GENERAL → `agent/workflows/development-loop.md`

Use the minimum effective reasoning/context/test depth, avoid overengineering, preserve unrelated work, verify before completion, and safely commit/sync verified checkpoints.
$CcafMarkerEnd
"@

if (-not (Test-Path $TargetRootAgents)) {
    Copy-Item -Path $SourceRootAgents -Destination $TargetRootAgents
    Write-Host 'Created root AGENTS.md'
} else {
    $Existing = Get-Content -Path $TargetRootAgents -Raw

    if ($Existing.Contains($CcafMarkerStart) -and $Existing.Contains($CcafMarkerEnd)) {
        $Pattern = [regex]::Escape($CcafMarkerStart) + '.*?' + [regex]::Escape($CcafMarkerEnd)
        $Updated = [regex]::Replace($Existing, $Pattern, $CcafBlock, [System.Text.RegularExpressions.RegexOptions]::Singleline)
        Set-Content -Path $TargetRootAgents -Value $Updated -Encoding UTF8
        Write-Host 'Updated existing CCAF section in root AGENTS.md'
    } elseif ($Existing -match 'CCAF|Curib Codex Agent Framework') {
        Write-Host 'Existing AGENTS.md already references CCAF; left unchanged.'
    } else {
        Add-Content -Path $TargetRootAgents -Value "`r`n$CcafBlock" -Encoding UTF8
        Write-Host 'Preserved existing AGENTS.md and appended CCAF entrypoint.'
    }
}

Write-Host ''
Write-Host 'CCAF installed successfully.'
Write-Host 'Open Codex/your editor from the workspace root.'
Write-Host 'Normal prompts such as "fix this error", "add search", or "continue" will now route through CCAF.'
