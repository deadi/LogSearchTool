# -------------------------------------------------------------------
# logFunction8.ps1
# Logsuche für Log8 mit eigenen Such- und Ausschlussbegriffen
# neuer WebApi Proxy, seit Okt 2025
# C:\Macos\Logs\WebApiProxy\Macos.WinPks.WebApi.Client.log20251002.txt
# -------------------------------------------------------------------

function Search-Log8 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[DBG]",
        "[WRN]",
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