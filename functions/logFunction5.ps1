# -------------------------------------------------------------------
# logFunction5.ps1
# Logsuche fr Log5 mit eigenen Such- und Ausschlussbegriffen
# Services.Deamon
# -------------------------------------------------------------------

function Search-Log5 {
    param(
        [string]$LogDir,
        [string]$LogPrefix
    )

    $searchTerms = @(
        "[DBG]",
        #"[WRN]",
        "[WRN] Macos Mutations Service Version",
        "[ERR]",
        "[INF]"       
    )
    $excludeTerms = @(
        "In GetForFaktTextNoAndValidDate konnten keine Werte zu Berechnung des BVG Mindestlohn ermittelt werden",
        "Warning in ConfigurationService => GetBvgMindestlohn - ",
        "BvgExchangeConnectorService",     
        "Heartbeat"
    )
    Invoke-LogSearchForDates -LogDir $LogDir -LogPrefix $LogPrefix -SearchTerms $searchTerms -ExcludeTerms $excludeTerms
}
