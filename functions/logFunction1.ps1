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

    Search-LogGeneric -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms -Caller $MyInvocation.MyCommand.Name
}
