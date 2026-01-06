# -----------------------------------------------------
# Dynamische Konfig – config.ps1
# -----------------------------------------------------

# Testparameter bei Skript-Start übergeben mit:
# .\mainLog.ps1 -TestStartDate "2025-07-25" -TestEndDate "2025-07-29"
param (
    [datetime]$TestStartDate,
    [datetime]$TestEndDate
)

# Vorschlagswerte: gestern bis heute
$defaultStartDate = (Get-Date).AddDays(-1)
$defaultEndDate   = (Get-Date)

# Interaktiv nur, wenn keine Testwerte übergeben
if ($null -ne $TestStartDate -and $null -ne $TestEndDate) {
    $startDate = $TestStartDate
    $endDate   = $TestEndDate
}
else {
    $startDateInput = Read-Host "Startdatum (YYYY-MM-DD) [Vorschlag: $($defaultStartDate.ToString("yyyy-MM-dd"))]"
    $endDateInput   = Read-Host "Enddatum   (YYYY-MM-DD) [Vorschlag: $($defaultEndDate.ToString("yyyy-MM-dd"))]"

    if ([string]::IsNullOrWhiteSpace($startDateInput)) { $startDateInput = $defaultStartDate.ToString("yyyy-MM-dd") }
    if ([string]::IsNullOrWhiteSpace($endDateInput))   { $endDateInput   = $defaultEndDate.ToString("yyyy-MM-dd") }

    try {
        $startDate = [datetime]::ParseExact($startDateInput, "yyyy-MM-dd", $null)
        $endDate   = [datetime]::ParseExact($endDateInput, "yyyy-MM-dd", $null)
    } catch {
        Write-Error "Ungültiges Datum eingegeben. Abbruch."
        exit 1
    }
}

# Datums-Arrays
$logDatesyyyyMMdd   = @()
$logDatesyyyy_MM_dd = @()

for ($dt = $startDate; $dt -le $endDate; $dt = $dt.AddDays(1)) {
    $logDatesyyyyMMdd   += $dt.ToString("yyyyMMdd")
    $logDatesyyyy_MM_dd += $dt.ToString("yyyy-MM-dd")
}
