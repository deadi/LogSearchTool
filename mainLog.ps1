# ------------------------------------------------------------------------------
# mainLog.ps1
# LogSearchTool
# Einstiegspunkt für die Logsuche
# Lädt Konfiguration und Funktionen, ruft Logfunktionen auf
# ------------------------------------------------------------------------------

# Konfigurationsdateien einbinden (Pfaddefinitionen + Zeitbereich)
. "$PSScriptRoot\config.core.ps1"
. "$PSScriptRoot\config.ps1"

# Funktionen laden
. "$PSScriptRoot\functions\common.ps1"
. "$PSScriptRoot\functions\logFunction1.ps1"
. "$PSScriptRoot\functions\logFunction2.ps1"
. "$PSScriptRoot\functions\logFunction3.ps1"
. "$PSScriptRoot\functions\logFunction4.ps1"
. "$PSScriptRoot\functions\logFunction5.ps1"
. "$PSScriptRoot\functions\logFunction6.ps1"
. "$PSScriptRoot\functions\logFunction7.ps1"
. "$PSScriptRoot\functions\logFunction8.ps1"

#$outputPath leeren
if (Test-Path $outputPath) { Clear-Content $outputPath }

# Ausgabe des ausgewählten Datumsbereichs
Write-Host "`n--- START Logsuche: $($startDate.ToString('yyyy-MM-dd')) bis $($endDate.ToString('yyyy-MM-dd')) ---`n"

# Aufruf der jeweiligen Log-Funktionen
Search-Log1 -LogDir $logDir1 -LogPrefix $logPrefix1
Search-Log2 -LogDir $logDir2 -LogPrefix $logPrefix2
Search-Log3 -LogDir $logDir3 -LogPrefix $logPrefix3
Search-Log4 -LogDir $logDir4 -LogPrefix $logPrefix4
Search-Log5 -LogDir $logDir5 -LogPrefix $logPrefix5
Search-Log6 -LogDir $logDir6
Search-Log7 -LogDir $logDir7 -LogPrefix $logPrefix7
Search-Log8 -LogDir $logDir8 -LogPrefix $logPrefix8

# Abschlussmeldung
Write-Host "`n--- ENDE Logsuche: $($startDate.ToString('yyyy-MM-dd')) bis $($endDate.ToString('yyyy-MM-dd')) ---`n"

Write-Host "--- LOG Ergebnise werden temporär gespeichert  in $outputPath"

#sleep 10
#pause


