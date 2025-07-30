# -------------------------------------------------------------------
# logFunction3.ps1
# Logsuche für Macos.WebPks.UI.WebApi
# -------------------------------------------------------------------

function Search-Log3 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[WRN]",
        "[ERR]",
        "[INF] Now listening on"
    )
    $excludeTerms = @("Heartbeat")

    Search-LogGeneric -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms -Caller $MyInvocation.MyCommand.Name
}
