# -------------------------------------------------------------------
# logFunction5.ps1
# Logsuche für Mutation.Deamon
# -------------------------------------------------------------------

function Search-Log5 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[WRN]",
        "[ERR]"
    )
    $excludeTerms = @(
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
            Search-Log -LogPath $logPath -SearchTerm $term -ExcludeTerms $excludeTerms -Caller "Search-Log5"
        }
    }
}
