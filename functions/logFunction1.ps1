# -------------------------------------------------------------------
# logFunction1.ps1
# Logsuche für DMSQueue-Log
# -------------------------------------------------------------------

function Search-Log1 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[WRN]",
        "[ERR]",
        "[INF] listening",
        "[DBG]"
    )
    $excludeTerms = @(
        "DbName: PKSPAT",
        "HttpMessageHandler expired after",
        "Starting HttpMessageHandler cleanup cycle with",
        "Ending HttpMessageHandler cleanup cycle after",
        "Heartbeat"
    )

    foreach ($date in $logDatesyyyyMMdd) {
        $logPath = Join-Path $LogDir "$LogPrefix$date.txt"

        if (-not (Test-Path $logPath)) {
            $msg = "[!] Logdatei nicht gefunden: $logPath"
            Write-Host $msg -ForegroundColor Gray
            Add-Content -Path $outputPath -Value $msg
            continue
        }

        foreach ($term in $searchTerms) {
            if ($debugEnabled) {
                Write-Host "[*] Suche '$term' in $logPath" -ForegroundColor Cyan
            }
            Search-Log -LogPath $logPath -SearchTerm $term -ExcludeTerms $excludeTerms -Caller "Search-Log1"
        }
    }
}
