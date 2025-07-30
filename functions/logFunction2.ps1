# -------------------------------------------------------------------
# logFunction2.ps1
# Logsuche für Macos.Services.Dms-Log
# -------------------------------------------------------------------

function Search-Log2 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[WRN]",
        "[ERR]",
        "[FTL]"
    )
    $excludeTerms = @(
        "Heartbeat"
    )

    Search-LogGeneric -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms -Caller $MyInvocation.MyCommand.Name
}
