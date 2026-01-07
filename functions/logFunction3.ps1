# -------------------------------------------------------------------
# logFunction3.ps1
# Logsuche fr Log mit eigenen Such- und Ausschlussbegriffen
# C:\Macos\Macos.WebPks.UI.WebApi
# -------------------------------------------------------------------

function Search-Log3 {
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
        "connectionString: Server=S028004A;Database=PKSPAT;MultipleActiveResultSets=true;",
        "connectionStringMaster: Server=S028004A;Database=PKSPATMA;MultipleActiveResultSets=true;",
        "DbName: TKSPAT",
        "connectionString: Server=S028004A;Database=TKSPAT;MultipleActiveResultSets=true;",
        "connectionStringMaster: Server=S028004A;Database=TKSPATMA;MultipleActiveResultSets=true;",
        "Heartbeat"
    )
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
