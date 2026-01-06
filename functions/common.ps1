# -------------------------------------------------------------------
# common.ps1
# Zentrale Suchfunktion für Loganalyse-Tool
# Wird von LogFunctionX verwendet
# -------------------------------------------------------------------

function Search-Log {
    param(
        [string]$LogPath,
        [string]$SearchTerm,
        [string[]]$ExcludeTerms = @()
    )

    if (-not (Test-Path $LogPath)) {
        $msg = "[!] Logdatei nicht gefunden: $LogPath"
        Write-Host "`n$msg" -ForegroundColor Red
        Add-Content -Path $outputPath -Value $msg
        return
    }

    $matches = Select-String -Path $LogPath -Pattern $SearchTerm -SimpleMatch

    if ($debugEnabled) {
        Write-Host "[DEBUG] Alle Treffer vor Filter:" -ForegroundColor Cyan
        $matches | ForEach-Object {
            Write-Host $_.Line -ForegroundColor DarkGray
        }
    }

    $filteredMatches = $matches | Where-Object {
        $line = $_.Line
        -not ($ExcludeTerms | Where-Object { $line -like "*$_*" })
    }

    if ($debugEnabled) {
        Write-Host "[DEBUG] Nach ExcludeTerms gefiltert:" -ForegroundColor Cyan
        $filteredMatches | ForEach-Object {
            Write-Host $_.Line -ForegroundColor Gray
        }
    }

    if ($filteredMatches) {
        $header = "[+] Treffer in '$LogPath' für '$SearchTerm':"
        Write-Host "`n$header" -ForegroundColor Green
        Add-Content -Path $outputPath -Value "`n$header"

        # Zusatz: Aufrufende Datei anzeigen
        $caller = $MyInvocation.PSCommandPath
        $callerName = Split-Path $caller -Leaf

        $origin = "[Info] Aufgerufen durch: $callerName"
        Write-Host $origin -ForegroundColor DarkYellow
        Add-Content -Path $outputPath -Value $origin

        $filteredMatches | ForEach-Object {
            Write-Host $_.Line -ForegroundColor White
            Add-Content -Path $outputPath -Value $_.Line
        }
    }
}
