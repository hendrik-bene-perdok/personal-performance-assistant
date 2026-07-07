param(
    [string]$WorkspacePath = "workspace",
    [string]$BackupRoot = "backups"
)

$dateStr = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupDir = Join-Path $BackupRoot $dateStr

if (!(Test-Path $WorkspacePath)) {
    Write-Host "Workspace not found at $WorkspacePath. Nothing to backup." -ForegroundColor Yellow
    exit 0
}

if (!(Test-Path $BackupRoot)) {
    New-Item -ItemType Directory -Force -Path $BackupRoot | Out-Null
}

New-Item -ItemType Directory -Force -Path $backupDir | Out-Null

Copy-Item -Path "$WorkspacePath\*" -Destination $backupDir -Recurse -Force

Write-Host "Backup created at $backupDir" -ForegroundColor Green
