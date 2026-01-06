# -------------------------------------------------------------------
# logFunction4.ps1
# Logsuche für Log mit eigenen Such- und Ausschlussbegriffen
# C:\Macos\Printing\Logs
# -------------------------------------------------------------------

function Search-Log4 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[DBG]",
        "[WRN]",
        "[ERR]",
        "[INF] Now listening on"
    )
    $excludeTerms = @("Heartbeat")

    foreach ($date in $logDatesyyyyMMdd) {
        $logPath = Join-Path $LogDir "$LogPrefix$date.txt"

        if (-not (Test-Path $logPath)) {
            $msg = "[!] Logdatei nicht gefunden: $logPath"
            Write-Host $msg -ForegroundColor DarkGray
            Add-Content -Path $outputPath -Value $msg
            continue
        }

        foreach ($term in $searchTerms) {
            if ($debugEnabled) {
                Write-Host "[*] Suche '$term' in $logPath" -ForegroundColor Cyan
            }
            Search-Log -LogPath $logPath -SearchTerm $term -ExcludeTerms $excludeTerms
        }
    }
}
