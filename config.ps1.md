```powershell
# ------------------------------------------------------------------------------
# config.ps1
# Zentrale Konfiguration für das Logsuche-Tool
# ------------------------------------------------------------------------------

param (
    [datetime]$TestStartDate,
    [datetime]$TestEndDate
)

# Vorschlagswerte: gestern bis heute
$defaultStartDate = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
$defaultEndDate   = (Get-Date).ToString("yyyy-MM-dd")

if ($PSBoundVariables.ContainsKey('TestStartDate') -and $PSBoundVariables.ContainsKey('TestEndDate')) {
    $startDate = $TestStartDate
    $endDate   = $TestEndDate
    Write-Host "[INFO] Testzeitraum (Parameter) verwendet: $($startDate.ToString('yyyy-MM-dd')) – $($endDate.ToString('yyyy-MM-dd'))" -ForegroundColor Yellow
} else {
    $startDateInput = Read-Host "Startdatum (YYYY-MM-DD) [Vorschlag: $defaultStartDate]"
    $endDateInput   = Read-Host "Enddatum   (YYYY-MM-DD) [Vorschlag: $defaultEndDate]"

    if ([string]::IsNullOrWhiteSpace($startDateInput)) { $startDateInput = $defaultStartDate }
    if ([string]::IsNullOrWhiteSpace($endDateInput))   { $endDateInput   = $defaultEndDate }

    try {
        $startDate = [datetime]::ParseExact($startDateInput, "yyyy-MM-dd", $null)
        $endDate   = [datetime]::ParseExact($endDateInput, "yyyy-MM-dd", $null)
    } catch {
        Write-Error "Ungültiges Datum eingegeben. Abbruch."
        exit 1
    }
}

# Datums-Arrays
$logDatesyyyyMMdd   = @()  # für .txt-Logs
$logDatesyyyy_MM_dd = @()  # für .pdf.dmsqueue-Dateien

for ($dt = $startDate; $dt -le $endDate; $dt = $dt.AddDays(1)) {
    $logDatesyyyyMMdd   += $dt.ToString("yyyyMMdd")
    $logDatesyyyy_MM_dd += $dt.ToString("yyyy-MM-dd")
}

# Debug
$debugEnabled = $true

# Log-Verzeichnisse
$logDir1 = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\s028042\DMSQueue"
$logDir2 = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\s028042\Macos.Services.Dms"
$logDir3 = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\s028042\Macos.WebPks.UI.WebApi"
$logDir4 = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\s028042\Logs"
$logDir5 = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\s028042\Macos.Services.Deamon"
$logDir6 = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\s028042\Error"

# Dateipräfixe
$logPrefix1 = "Macos.Services.DmsQueue-Log"
$logPrefix2 = "Macos.Services.Dms-Log"
$logPrefix3 = "Macos.WebPks.UI.WebApi_"
$logPrefix4 = "Macos.Printing.WebApi_"
$logPrefix5 = "Macos.WebPks.Mutation.Deamon_"

# Ausgabeziel
$outputPath = "L:\Bereich_Mitarbeitende\Ordner_Mitarbeitende\AE\_logtest\resultsLogSearchTool.txt"


```