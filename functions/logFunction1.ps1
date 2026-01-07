# -------------------------------------------------------------------
# logFunction1.ps1
# Logsuche fr Log mit eigenen Such- und Ausschlussbegriffen
# C:\Macos\Logs\DMSQueue
# -------------------------------------------------------------------

function Search-Log1 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[DBG]",
        "[WRN]",
        "[ERR]",
        "[INF] listenting"       
    )
    $excludeTerms = @(
        "DbName: PKSPAT",
        "connectionString: Server=S028004A;Database=PKSPAT;MultipleActiveResultSets=true;",
        "connectionStringMaster: Server=S028004A;Database=PKSPATMA;MultipleActiveResultSets=true;",
        "DbName: TKSPAT",
        "connectionString: Server=S028004A;Database=TKSPAT;MultipleActiveResultSets=true;",
        "connectionStringMaster: Server=S028004A;Database=TKSPATMA;MultipleActiveResultSets=true;",
        "HttpMessageHandler expired after",
        "Starting HttpMessageHandler cleanup cycle with",
        "Ending HttpMessageHandler cleanup cycle after",
        "Heartbeat"
    )
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
