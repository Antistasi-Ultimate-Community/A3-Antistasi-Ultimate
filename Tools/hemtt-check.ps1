<#
.SYNOPSIS
    Wrapper around hemtt check to identify new warnings, errors, and other issues compared to a baseline.

.DESCRIPTION
    This script compares the current HEMTT diagnostics against a baseline to identify new warnings, errors, and other issues.

.NOTES
    Maintainer: jwoodruff40

.PARAMETER ProjectPath
    The HEMTT basepath (where .hemtt configuration is located).
.PARAMETER BaselinePath
    The path to the HEMTT output baseline file.
.PARAMETER Hemtt
    The path to the HEMTT executable.
.PARAMETER ReportDirectory
    The directory where the HEMTT check report will be saved.
#>

#Requires -Version 7.0
[CmdletBinding()]
param (
    [string]$ProjectPath = (Join-Path $PSScriptRoot '..\A3A'),
    [string]$BaselinePath = (Join-Path $PSScriptRoot '..\A3A\.hemtt\baseline.txt'),
    [string]$Hemtt = 'hemtt',
    [string]$ReportDirectory = (Join-Path $PSScriptRoot '..\A3A\.hemttout\baseline-check')
)

function Get-HemttDiagnostics {
    param ([AllowEmptyString()][string]$Text)

    $text = $Text -replace '\x1b\[[0-?]*[ -/]*[@-~]', '' -replace '\r', ''
    $headers = [regex]::Matches(
        $text,
        '(?m)^(?<severity>error|warning|help|note)(?:\[(?<code>[^\]]+)\])?:\s*(?<message>[^\n]*)|^\s*(?<logSeverity>ERROR|WARN)\s+(?<logMessage>[^\n]+)'
    )
    for ($i = 0; $i -lt $headers.Count; $i++) {
        $header = $headers[$i]
        $end = if ($i + 1 -lt $headers.Count) { $headers[$i + 1].Index } else { $text.Length }
        $body = $text.Substring($header.Index, $end - $header.Index).Trim()
        $severity = $header.Groups['severity'].Value
        $message = $header.Groups['message'].Value
        if ($header.Groups['logSeverity'].Success) {
            $severity = if ($header.Groups['logSeverity'].Value -eq 'ERROR') { 'error' } else { 'warning' }
            $message = $header.Groups['logMessage'].Value
        }
        $locations = @(
            [regex]::Matches($body, '(?m)(?<path>/?(?:addons|include)[\\/][^\n]*?):(?<line>\d+):(?<column>\d+)\s*$') |
                ForEach-Object {
                    [ordered]@{
                        path = $_.Groups['path'].Value.Replace('\', '/').TrimStart('/')
                        column = [int]$_.Groups['column'].Value
                    }
                }
        )
        $source = @(
            [regex]::Matches($body, '(?m)^\s*\d+\s+(?:\u2502|\u0393\u00f6\u00e9|\|)\s?(?<source>[^\n]*)') |
                ForEach-Object {
                    $_.Groups['source'].Value.Trim() -replace '^(?:[\u2500-\u257f]|\u0393[\u00f2\u00f6].)\s*', ''
                }
        )
        # Ignore shifting line numbers and terminal gutters, but retain macro locations
        # and columns so separate arguments on the same line remain separate findings.
        $key = [ordered]@{
            severity = $severity
            code = $header.Groups['code'].Value
            message = $message.Replace('\', '/').Replace('`/addons/', '`addons/')
            locations = $locations
            source = $source
        } | ConvertTo-Json -Depth 6 -Compress
        [pscustomobject]@{
            Severity = $severity
            Key = $key
            Text = $body
        }
    }
}

function Compare-HemttDiagnostics {
    param (
        [object[]]$Baseline,
        [object[]]$Current
    )

    $remaining = [System.Collections.Generic.Dictionary[string, int]]::new([System.StringComparer]::Ordinal)
    foreach ($diagnostic in $Baseline) {
        if (-not $remaining.ContainsKey($diagnostic.Key)) { $remaining[$diagnostic.Key] = 0 }
        $remaining[$diagnostic.Key]++
    }
    foreach ($diagnostic in $Current) {
        if ($remaining.ContainsKey($diagnostic.Key) -and $remaining[$diagnostic.Key] -gt 0) {
            $remaining[$diagnostic.Key]--
        } else {
            $diagnostic
        }
    }
}

function New-HemttCheckResult {
    param (
        [AllowEmptyString()][string]$BaselineText,
        [AllowEmptyString()][string]$CurrentText,
        [int]$ExitCode
    )

    $baseline = @(Get-HemttDiagnostics $BaselineText)
    if ($BaselineText -notmatch '\bChecked \d+ stringtables\b') {
        throw 'The HEMTT baseline does not contain a completed check.'
    }
    if (@($baseline | Where-Object Severity -eq 'error').Count -gt 0) {
        throw 'The HEMTT baseline must not contain errors.'
    }
    $current = @(Get-HemttDiagnostics $CurrentText)
    $new = @(Compare-HemttDiagnostics $baseline $current)
    $errors = @($current | Where-Object Severity -eq 'error')
    $completed = $CurrentText -match '\bChecked \d+ stringtables\b'
    [pscustomobject]@{
        schemaVersion = 1
        hemttExitCode = $ExitCode
        failed = ($ExitCode -ne 0 -or $errors.Count -gt 0 -or -not $completed)
        checkCompleted = $completed
        baselineCount = $baseline.Count
        newWarnings = @($new | Where-Object Severity -eq 'warning' | ForEach-Object Text)
        newHelp = @($new | Where-Object { $_.Severity -in 'help', 'note' } | ForEach-Object Text)
        newErrors = @($new | Where-Object Severity -eq 'error' | ForEach-Object Text)
    }
}

function Invoke-HemttBaselineCheck {
    param (
        [string]$ProjectPath,
        [string]$BaselinePath,
        [string]$Hemtt,
        [string]$ReportDirectory
    )

    $ErrorActionPreference = 'Stop'
    $PSNativeCommandUseErrorActionPreference = $false
    $baselineText = Get-Content -LiteralPath $BaselinePath -Raw -Encoding utf8
    $project = (Resolve-Path -LiteralPath $ProjectPath).Path
    $reportPath = [System.IO.Path]::GetFullPath($ReportDirectory)
    $command = (Get-Command $Hemtt -CommandType Application -ErrorAction Stop).Source
    New-Item -ItemType Directory -Path $reportPath -Force | Out-Null
    Push-Location $project
    try {
        $output = @(& $command check --no-color 2>&1 | ForEach-Object { $_.ToString() })
        $exitCode = $LASTEXITCODE
    } finally {
        Pop-Location
    }
    $currentText = $output -join "`n"
    $currentText | Set-Content -LiteralPath (Join-Path $reportPath 'hemtt-output.txt') -Encoding utf8
    $result = New-HemttCheckResult $baselineText $currentText $exitCode
    $result | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $reportPath 'result.json') -Encoding utf8
    $newCount = $result.newWarnings.Count + $result.newHelp.Count + $result.newErrors.Count
    if ($result.failed) {
        Write-Host 'HEMTT check FAILED. Fix the errors below before merging.'
    } elseif ($newCount -eq 0) {
        Write-Host 'HEMTT check passed. No new warnings or errors were introduced.'
    } else {
        Write-Host 'HEMTT check passed with new warnings. Please review them below.'
    }
    Write-Host "HEMTT exit code: $exitCode; new warnings: $($result.newWarnings.Count); new help: $($result.newHelp.Count); new errors: $($result.newErrors.Count)"
    if (-not $result.checkCompleted) { Write-Host 'HEMTT did not complete all expected checks.' }
    foreach ($diagnostic in @($result.newErrors) + @($result.newWarnings) + @($result.newHelp)) {
        Write-Host "`n$diagnostic"
    }
    if ($result.failed -and $result.newErrors.Count -eq 0) {
        Write-Host "`nLast lines of HEMTT output:"
        $output | Select-Object -Last 40 | ForEach-Object { Write-Host $_ }
    }
    # Write-Host "`nFull output and comparison: $reportPath"
    return $result
}

if ($MyInvocation.InvocationName -ne '.') {
    $ErrorActionPreference = 'Stop'
    $result = Invoke-HemttBaselineCheck $ProjectPath $BaselinePath $Hemtt $ReportDirectory
    if ($result.failed) { exit 1 }
    exit 0
}
