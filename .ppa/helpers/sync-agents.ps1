$SourceDir = "$PSScriptRoot\..\..\.github\agents"
$DestDir = "$PSScriptRoot\..\..\.agent\workflows"

# Ensure destination directory exists
if (-not (Test-Path -Path $DestDir)) {
    New-Item -ItemType Directory -Path $DestDir -Force
    Write-Host "Created directory: $DestDir"
}

# Copy files from source to destination
Write-Host "Syncing agent definitions from '$SourceDir' to '$DestDir'..."
Get-ChildItem -Path $SourceDir -Filter "*.agent.md" | ForEach-Object {
    $DestFile = Join-Path -Path $DestDir -ChildPath $_.Name
    Copy-Item -Path $_.FullName -Destination $DestFile -Force
    Write-Host "Synced: $($_.Name)"
}

# Prune files in destination that are not in source
Get-ChildItem -Path $DestDir -Filter "*.agent.md" | ForEach-Object {
    $SourceFile = Join-Path -Path $SourceDir -ChildPath $_.Name
    if (-not (Test-Path -Path $SourceFile)) {
        Remove-Item -Path $_.FullName -Force
        Write-Host "Pruned: $($_.Name) (not in source)"
    }
}

Write-Host "Sync complete."
