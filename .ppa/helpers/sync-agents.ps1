$SourceDir = "$PSScriptRoot\..\..\.github\agents"
$DestDir = "$PSScriptRoot\..\..\.agent\workflows"

# Ensure destination directory exists
if (-not (Test-Path -Path $DestDir)) {
    New-Item -ItemType Directory -Path $DestDir -Force
    Write-Host "Created directory: $DestDir"
}

# Copy files
Write-Host "Syncing agent definitions from '$SourceDir' to '$DestDir'..."
Get-ChildItem -Path $SourceDir -Filter "*.agent.md" | ForEach-Object {
    $DestFile = Join-Path -Path $DestDir -ChildPath $_.Name
    Copy-Item -Path $_.FullName -Destination $DestFile -Force
    Write-Host "Synced: $($_.Name)"
}

Write-Host "Sync complete."
