# -------------------------------------------------------------------
# logFunction7.ps1
# Logsuche für Log7 mit eigenen Such- und Ausschlussbegriffen
# neuer Shared Service, seit 09.09.25
# C:\Macos\Macos.Shared.Service.Dms
# -------------------------------------------------------------------

function Search-Log7 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[DBG]",
        #"[WRN]",
        "[ERR]",
        "[INF]"
        #"[INF] Now listening on"        
    )

    $excludeTerms = @(        
        "Heartbeat"
    )

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