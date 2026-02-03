# -------------------------------------------------------------------
# logFunction4.ps1
# Logsuche fr Log mit eigenen Such- und Ausschlussbegriffen
# \Printing\Logs
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
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
