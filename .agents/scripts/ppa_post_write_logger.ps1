# .agents/scripts/ppa_post_write_logger.ps1
# PostToolUse Lifecycle Hook — PPA Telemetrie Logging (Thread-Safe)
param()

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) { exit 0 }

try {
    $payload = $rawInput | ConvertFrom-Json
} catch {
    exit 0
}

$toolName = $payload.toolCall.name
$targetFile = $payload.toolCall.args.TargetFile
if (-not $targetFile) { $targetFile = $payload.toolCall.args.targetFile }
if (-not $targetFile) { $targetFile = $payload.toolCall.args.TargetFilePath }
if (-not $targetFile) { exit 0 }

try {
    $fullPath = [System.IO.Path]::GetFullPath($targetFile)
} catch {
    $fullPath = $targetFile
}

$n = $fullPath.Replace('/', '\')
$isWorkspace = $n -like "*\workspace\*" -or $n -like "*\workspace"
if (-not $isWorkspace) { exit 0 }

$eventsFile = Join-Path (Split-Path $PSScriptRoot -Parent | Split-Path -Parent) "workspace\ppa-events.jsonl"
$eventsDir = Split-Path $eventsFile -Parent
if (-not (Test-Path $eventsDir)) {
    New-Item -ItemType Directory -Path $eventsDir -Force | Out-Null
}

$entry = [ordered]@{
    timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    event_type = "workspace_mutation"
    tool_used = $toolName
    target_file = $targetFile
    conversation_id = $payload.conversationId
} | ConvertTo-Json -Compress

$mutex = New-Object System.Threading.Mutex($false, "PPAEventsFileMutex")
$hasMutex = $false
try {
    $hasMutex = $mutex.WaitOne(5000)
    if ($hasMutex) {
        Add-Content -Path $eventsFile -Value $entry -Encoding UTF8
    }
} catch {
    [Console]::Error.WriteLine("Telemetry log error: $_")
} finally {
    if ($hasMutex) { $mutex.ReleaseMutex() }
}
