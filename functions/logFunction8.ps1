# -------------------------------------------------------------------
# logFunction8.ps1
# Logsuche fr Log8 mit eigenen Such- und Ausschlussbegriffen
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
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
