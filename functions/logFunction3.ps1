# -------------------------------------------------------------------
# logFunction3.ps1
# Logsuche fr Log mit eigenen Such- und Ausschlussbegriffen
# WebPks.UI.WebApi
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
        "DbName: P",
        "connectionString: S",
        "connectionStringMaster: S",
        "DbName: T",
        "connectionString: Server=S",
        "connectionStringMaster: S",
        "Heartbeat"
    )
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
