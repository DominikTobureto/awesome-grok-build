# Install awesome-grok-build skills into your project.
# Usage: irm https://raw.githubusercontent.com/DominikTobureto/awesome-grok-build/main/install.ps1 | iex
# Or:    .\install.ps1 [-Target <path>]

param(
    [string]$Target = "."
)

$ErrorActionPreference = "Stop"
$RepoUrl = "https://github.com/DominikTobureto/awesome-grok-build.git"
$TmpDir = Join-Path $env:TEMP "awesome-grok-build-install-$(Get-Random)"

function Write-Step($msg) { Write-Host "`n$msg" -ForegroundColor Cyan }
function Write-Ok($msg)   { Write-Host "  ✓ $msg" -ForegroundColor Green }
function Write-Warn($msg) { Write-Host "  ⚠ $msg" -ForegroundColor Yellow }
function Write-Err($msg)  { Write-Host "  ✗ $msg" -ForegroundColor Red }

try {
    Write-Host "`n🚀 awesome-grok-build installer`n" -ForegroundColor Magenta

    # --- Clone ---
    Write-Step "Cloning awesome-grok-build..."
    Remove-Item -Recurse -Force $TmpDir -ErrorAction SilentlyContinue | Out-Null
    git clone --depth 1 $RepoUrl $TmpDir 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Err "Failed to clone. Check your git installation and network."
        exit 1
    }
    Write-Ok "Cloned successfully"

    # --- Skills ---
    Write-Step "Installing skills..."
    $SkillsDir = Join-Path $Target ".grok\skills"
    New-Item -ItemType Directory -Force $SkillsDir | Out-Null
    $SkillCount = 0
    Get-ChildItem "$TmpDir\.grok\skills" -Directory | ForEach-Object {
        $skillName = $_.Name
        $skillFile = Join-Path $_.FullName "SKILL.md"
        if (Test-Path $skillFile) {
            Copy-Item -Recurse -Force $_.FullName (Join-Path $SkillsDir $skillName)
            Write-Ok $skillName
            $script:SkillCount++
        }
    }
    Write-Host "  → $SkillCount skills installed to $SkillsDir"

    # --- AGENTS.md ---
    Write-Step "AGENTS.md"
    $AgentsFile = Join-Path $Target "AGENTS.md"
    if (Test-Path $AgentsFile) {
        Write-Warn "AGENTS.md already exists — skipping."
    } else {
        Write-Host ""
        Write-Host "  Pick an AGENTS.md template:"
        Write-Host "    1) Full-stack (SaaS, dashboards)"
        Write-Host "    2) Library / SDK"
        Write-Host "    3) Documentation / awesome list"
        Write-Host "    4) Security-sensitive"
        Write-Host "    5) Skip"
        Write-Host ""
        $choice = Read-Host "  Choice [1-5]"
        switch ($choice) {
            "1" { Copy-Item "$TmpDir\templates\AGENTS.fullstack.md" $AgentsFile; Write-Ok "Installed AGENTS.fullstack.md" }
            "2" { Copy-Item "$TmpDir\templates\AGENTS.library.md"   $AgentsFile; Write-Ok "Installed AGENTS.library.md" }
            "3" { Copy-Item "$TmpDir\templates\AGENTS.docs.md"      $AgentsFile; Write-Ok "Installed AGENTS.docs.md" }
            "4" { Copy-Item "$TmpDir\templates\AGENTS.security.md"  $AgentsFile; Write-Ok "Installed AGENTS.security.md" }
            "5" { Write-Warn "Skipped AGENTS.md" }
            default { Write-Warn "Invalid choice — skipped AGENTS.md" }
        }
    }

    # --- .grokignore ---
    Write-Step ".grokignore"
    $IgnoreFile = Join-Path $Target ".grokignore"
    if (Test-Path $IgnoreFile) {
        Write-Warn ".grokignore already exists — skipping."
    } else {
        Write-Host ""
        Write-Host "  Pick a .grokignore variant:"
        Write-Host "    1) Default (universal)"
        Write-Host "    2) Node.js / TypeScript"
        Write-Host "    3) Python"
        Write-Host "    4) Skip"
        Write-Host ""
        $choice = Read-Host "  Choice [1-4]"
        switch ($choice) {
            "1" { Copy-Item "$TmpDir\templates\grokignore.default" $IgnoreFile; Write-Ok "Installed grokignore.default" }
            "2" { Copy-Item "$TmpDir\templates\grokignore.node"    $IgnoreFile; Write-Ok "Installed grokignore.node" }
            "3" { Copy-Item "$TmpDir\templates\grokignore.python"  $IgnoreFile; Write-Ok "Installed grokignore.python" }
            "4" { Write-Warn "Skipped .grokignore" }
            default { Write-Warn "Invalid choice — skipped .grokignore" }
        }
    }

    # --- Done ---
    Write-Host "`n✅ Done!`n" -ForegroundColor Green
    Write-Host "  Next steps:"
    Write-Host "    cd $Target"
    Write-Host "    grok inspect"
    Write-Host "    grok"
    Write-Host ""
    Write-Host "  Try your first prompt:"
    Write-Host "    Use repo-health-check. Find the smallest safe PR."
    Write-Host ""

} finally {
    Remove-Item -Recurse -Force $TmpDir -ErrorAction SilentlyContinue | Out-Null
}
