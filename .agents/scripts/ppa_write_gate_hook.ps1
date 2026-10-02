# .agents/scripts/ppa_write_gate_hook.ps1
# PreToolUse Lifecycle Hook — PPA Write Gate (Fail-Closed)
param()

function Send-FailClosedResponse($promptMessage, $reasonMessage) {
    $response = [ordered]@{
        decision = "force_ask"
        userPrompt = $promptMessage
        reason = $reasonMessage
        permissionOverrides = @()
    }
    $response | ConvertTo-Json -Depth 5 -Compress | Write-Output
    exit 0
}

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) {
    Send-FailClosedResponse "Write Gate: Hook input is leeg. Bevestiging vereist." "Fail-closed: empty stdin."
}

try {
    $payload = $rawInput | ConvertFrom-Json
} catch {
    Send-FailClosedResponse "Write Gate: Ongeldige JSON input. Bevestiging vereist." "Fail-closed: JSON parse failure: $_"
}

if ($null -eq $payload -or $null -eq $payload.toolCall -or $null -eq $payload.toolCall.args) {
    Send-FailClosedResponse "Write Gate: Tool call parameters ontbreken. Bevestiging vereist." "Fail-closed: missing toolCall or args."
}

$targetFile = ""
if ($payload.toolCall.args.TargetFile) {
    $targetFile = $payload.toolCall.args.TargetFile
} elseif ($payload.toolCall.args.targetFile) {
    $targetFile = $payload.toolCall.args.targetFile
} elseif ($payload.toolCall.args.TargetFilePath) {
    $targetFile = $payload.toolCall.args.TargetFilePath
}

if ([string]::IsNullOrWhiteSpace($targetFile)) {
    Send-FailClosedResponse "Write Gate: Doelbestand ontbreekt. Bevestiging vereist." "Fail-closed: missing TargetFile."
}

try {
    $fullPath = [System.IO.Path]::GetFullPath($targetFile)
} catch {
    $fullPath = $targetFile
}

$n = $fullPath.Replace('/', '\')
$isWorkspace = $n -like "*\workspace\*" -or $n -like "*\workspace"
$isRules = $n -like "*\.agents\rules\*"
$isSkills = $n -like "*\.agents\skills\*"
$isProtected = $isWorkspace -or $isRules -or $isSkills

if ($isProtected) {
    $scope = if ($isWorkspace) { "workspace/" } elseif ($isRules) { ".agents/rules/" } else { ".agents/skills/" }
    $response = [ordered]@{
        decision = "force_ask"
        userPrompt = "PPA Write Gate: Akkoord met mutatie in '$targetFile'? (ja/nee)"
        reason = "Write Gate (Rule 3): Bevestiging vereist voor '$scope' — $targetFile"
        permissionOverrides = @()
    }
    $response | ConvertTo-Json -Depth 5 -Compress | Write-Output
    exit 0
} else {
    $response = [ordered]@{
        decision = "allow"
        reason = "Niet-beschermd pad."
    }
    $response | ConvertTo-Json -Depth 5 -Compress | Write-Output
    exit 0
}
