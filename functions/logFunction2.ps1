# -------------------------------------------------------------------
# logFunction2.ps1
# Logsuche fr Log2 mit eigenen Such- und Ausschlussbegriffen
# Services.Dms
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
        "DbName: P",
        "connectionString: S",
        "connectionStringMaster: S",
        "DbName: T",
        "connectionString: S",
        "connectionStringMaster: S",
        "Heartbeat"
    )
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
