# -------------------------------------------------------------------
# logFunction2.ps1
# Logsuche für Log2 mit eigenen Such- und Ausschlussbegriffen
# C:\Macos\Macos.Services.Dms
# -------------------------------------------------------------------

function Search-Log2 {
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

    $excludeTerms = @(
        "DbName: PKSPAT",
        "connectionString: Server=S028004A;Database=PKSPAT;MultipleActiveResultSets=true;User Id=MACOS",
        "connectionStringMaster: Server=S028004A;Database=PKSPATMA;MultipleActiveResultSets=true;User Id=MACOS",
        "DbName: TKSPAT",
        "connectionString: Server=S028004A;Database=TKSPAT;MultipleActiveResultSets=true;User Id=MACOS",
        "connectionStringMaster: Server=S028004A;Database=TKSPATMA;MultipleActiveResultSets=true;User Id=MACOS",
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