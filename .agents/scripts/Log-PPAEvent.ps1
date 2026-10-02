param (
    [Parameter(Mandatory=$true)]
    [string]$EventType,
    
    [string]$SkillName = $null,
    [int]$EnergyScore = $null,
    [string]$GoalName = $null,
    [string]$Details = $null
)

$workspaceDir = Join-Path -Path $PSScriptRoot -ChildPath "..\..\workspace"
$logFile = Join-Path -Path $workspaceDir -ChildPath "ppa-events.jsonl"

# Zorg ervoor dat workspace map bestaat
if (-not (Test-Path -Path $workspaceDir)) {
    New-Item -ItemType Directory -Path $workspaceDir | Out-Null
}

$event = [ordered]@{
    timestamp = (Get-Date).ToString("o")
    event_type = $EventType
}

if ($SkillName) { $event["skill"] = $SkillName }
if ($EnergyScore -gt 0) { $event["score"] = $EnergyScore }
if ($GoalName) { $event["goal_name"] = $GoalName }
if ($Details) { $event["details"] = $Details }

$jsonLine = $event | ConvertTo-Json -Compress

Add-Content -Path $logFile -Value $jsonLine -Encoding UTF8
