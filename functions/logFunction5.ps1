# -------------------------------------------------------------------
# logFunction5.ps1
# Logsuche für Mutation.Deamon
# -------------------------------------------------------------------

function Search-Log5 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[WRN]",
        "[ERR]"
    )
    $excludeTerms = @(
        "Heartbeat"
    )

    Search-LogGeneric -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms -Caller $MyInvocation.MyCommand.Name
}
