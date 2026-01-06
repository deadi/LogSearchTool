#####################################################################################################################
# V_2.4/2.5
# 2025-10-08
# AE
¦   +-- logFunction7.ps1          # Funktion für Log 7  neuer Shared Service DMS, seit 09.09.25
¦   +-- logFunction8.ps1          # Funktion für Log 8  neuer webApiProxy seit Okt 2025

#####################################################################################################################
# V_2.3
# 2025-07-30
# AE
1. Testparameter
# Testparameter bei Skript-Start übergeben mit:
# .\mainLog.ps1 -TestStartDate "2025-07-25" -TestEndDate "2025-07-29"
param (
    [datetime]$TestStartDate,
    [datetime]$TestEndDate
)
# -----------------------------------------------------
2. Function caller in common.ps1
# Zusatz: Aufrufende Datei anzeigen
        $caller = $MyInvocation.PSCommandPath
        $callerName = Split-Path $caller -Leaf

        $origin = "[Info] Aufgerufen durch: $callerName"
#####################################################################################################################
# V_2.2
# 2025-07-30
# AE
1. Splitten für Übersichtlichkeit
+-- config.ps1                    # Zeitbereich
¦
+-- config.core.ps1               # Pfaddefinitionen
2. Konsistenz in Logging und Write-Host bzw. [DEBUG]
	Write-Host $msg -ForegroundColor DarkGray
	Add-Content -Path $outputPath -Value $msg

#####################################################################################################################
# V_2.1
# 2025-07-29
# AE
1. Neue LogDir-Variable mit .pdf / .pdf.dmsqueue files  $logDir6 = "C:\Macos\DMSQueue\Error"
¦   +-- logFunction6.ps1          # Funktion für Log 6  .pdf.dmsqueue
2. # Reusable Datums-Arrays
	$logDatesyyyyMMdd   = @()  # für TXT-Logs: 20250729
	$logDatesyyyy_MM_dd = @()  # für DMSQueue: 2025-07-29
3.# Vorschlagswerte: gestern bis heute
	$defaultStartDate = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
	$defaultEndDate   = (Get-Date).ToString("yyyy-MM-dd")

#####################################################################################################################
# V_2.0
# 2025-06-19
# AE
1. $daysBack		ermöglich Zeitspannen von heute an gerechnet
2. $excludeTerms	pro logFunctionX.ps1 kann ein Array gepflegt werden, welche Strings ausgeschlossen werden sollen
3. $debugEnabled 	[DEBUG] Mode hinzugefügt