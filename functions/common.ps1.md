```bash
# ------------------------------------------------------------------------------
# common.ps1
# Zentrale Suchfunktion für Loganalyse-Tool
# Wird von LogFunction1–5 verwendet
# ------------------------------------------------------------------------------

function Search-Log {
    param(
        [string]$LogPath,
        [string]$SearchTerm,
        [string[]]$ExcludeTerms = @()
    )

    if (-not (Test-Path $LogPath)) {
        $msg = "[!] Logdatei nicht gefunden: $LogPath"
        Write-Host $msg -ForegroundColor Red
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
        $caller = (Get-PSCallStack)[1].FunctionName
        $header = "[+] Treffer in '$LogPath' für '$SearchTerm' ($caller):"

        Write-Host "`n$header" -ForegroundColor Green
        Add-Content -Path $outputPath -Value "`n$header"

        $filteredMatches | ForEach-Object {
            Write-Host $_.Line -ForegroundColor White
            Add-Content -Path $outputPath -Value $_.Line
        }
    }
}

```