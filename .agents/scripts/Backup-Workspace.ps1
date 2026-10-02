# .agents/scripts/Backup-Workspace.ps1
# Backup utility — workspace/ + .agents/ (excl. backups)
[CmdletBinding()]
param(
    [switch]$Silent,
    [string]$BackupDir = ".agents/backups"
)

$mutex = New-Object System.Threading.Mutex($false, "PPABackupMutex")
$hasMutex = $false

try {
    $hasMutex = $mutex.WaitOne(10000)
    if (-not $hasMutex) {
        if (-not $Silent) { Write-Warning "Backup mutex timeout." }
        return
    }

    $timestamp = (Get-Date).ToString("yyyyMMdd_HHmmss")

    if (-not (Test-Path $BackupDir)) {
        New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
    }

    if (Test-Path "workspace") {
        $wsBackup = Join-Path $BackupDir "workspace_backup_$timestamp"
        Copy-Item -Path "workspace" -Destination $wsBackup -Recurse -Force
        if (-not $Silent) { Write-Host "Workspace backup: $wsBackup" -ForegroundColor Green }
    } else {
        if (-not $Silent) { Write-Warning "workspace/ not found, skipping." }
    }

    if (Test-Path ".agents") {
        $agentsBackup = Join-Path $BackupDir "agents_backup_$timestamp"
        # Exclude backups dir to prevent recursive backup
        $exclude = @("backups", "workspace_staging")
        Copy-Item -Path ".agents" -Destination $agentsBackup -Recurse -Force
        # Remove excluded dirs from backup
        foreach ($ex in $exclude) {
            $exPath = Join-Path $agentsBackup $ex
            if (Test-Path $exPath) { Remove-Item $exPath -Recurse -Force }
        }
        if (-not $Silent) { Write-Host "Agents backup: $agentsBackup" -ForegroundColor Green }
    } else {
        if (-not $Silent) { Write-Warning ".agents/ not found, skipping." }
    }
} catch {
    if (-not $Silent) { Write-Error "Backup failed: $_" }
} finally {
    if ($hasMutex) { $mutex.ReleaseMutex() }
}
