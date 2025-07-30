```powershell
# ------------------------------------------------------------------------------
# mainLog.ps1
# Einstiegspunkt für die Logsuche
# Lädt Konfiguration und Funktionen, ruft Logfunktionen auf
# ------------------------------------------------------------------------------

param (
    [datetime]$TestStartDate,
    [datetime]$TestEndDate
)

# Konfiguration einbinden
. "$PSScriptRoot\config.ps1"

# Funktionen laden
. "$PSScriptRoot\functions\common.ps1"
. "$PSScriptRoot\functions\logFunction1.ps1"
. "$PSScriptRoot\functions\logFunction2.ps1"
. "$PSScriptRoot\functions\logFunction3.ps1"
. "$PSScriptRoot\functions\logFunction4.ps1"
. "$PSScriptRoot\functions\logFunction5.ps1"
. "$PSScriptRoot\functions\logFunction6.ps1"

# Log-Datei leeren
if (Test-Path $outputPath) { Clear-Content $outputPath }

# Startmeldung
Write-Host "`n--- START Logsuche: $($startDate.ToString('yyyy-MM-dd')) bis $($endDate.ToString('yyyy-MM-dd')) ---`n" -ForegroundColor Cyan

# Logfunktionen aufrufen
Search-Log1 -LogDir $logDir1 -LogPrefix $logPrefix1
Search-Log2 -LogDir $logDir2 -LogPrefix $logPrefix2
Search-Log3 -LogDir $logDir3 -LogPrefix $logPrefix3
Search-Log4 -LogDir $logDir4 -LogPrefix $logPrefix4
Search-Log5 -LogDir $logDir5 -LogPrefix $logPrefix5
Search-Log6 -LogDir $logDir6

# Endmeldung
Write-Host "`n--- ENDE Logsuche: $($startDate.ToString('yyyy-MM-dd')) bis $($endDate.ToString('yyyy-MM-dd')) ---`n" -ForegroundColor Cyan
Write-Host "--- LOG Ergebnisse werden temporär gespeichert in $outputPath" -ForegroundColor Cyan

```