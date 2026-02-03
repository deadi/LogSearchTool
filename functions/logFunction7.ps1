# -------------------------------------------------------------------
# logFunction7.ps1
# Logsuche fr Log7 mit eigenen Such- und Ausschlussbegriffen
# Shared.Service.Dms
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
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
