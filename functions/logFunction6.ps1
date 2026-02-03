# -------------------------------------------------------------------
# logFunction6.ps1
# Prüfung von DMSQueue-Fehlerdateien (.pdf.dmsqueue)
# \DMSQueue\Error
# -------------------------------------------------------------------

function Search-Log6 {
    param(
        [string]$LogDir
    )

    if (-not (Test-Path $LogDir)) {
        $msg = "[!] Verzeichnis nicht gefunden: $LogDir"
        Write-Host $msg -ForegroundColor Red
        Add-Content -Path $outputPath -Value $msg
        return
    }

    $files = Get-ChildItem -Path $LogDir -Filter "*.pdf.dmsqueue" -File

    foreach ($file in $files) {
        if ($file.Name -match '^(\d{4}-\d{2}-\d{2})') {
            $fileDateString = $matches[1]

            if ($logDatesyyyy_MM_dd -contains $fileDateString) {
                $msg = "[+] Fehlerdatei für ${fileDateString}: $($file.Name)"
                Write-Host "`n$msg" -ForegroundColor Yellow
                Add-Content -Path $outputPath -Value $msg

                try {
                    $content = Get-Content -Path $file.FullName -ErrorAction Stop
                    if ($debugEnabled) {
                        Write-Host "[*] Inhalt von $($file.Name):" -ForegroundColor Cyan
                        Write-Host ($content -join "`n") -ForegroundColor Gray
                    }
                } catch {
                    $errMsg = "[!] Fehler beim Lesen der Datei: $($file.FullName)"
                    Write-Host $errMsg -ForegroundColor Red
                    Add-Content -Path $outputPath -Value $errMsg
                }
            }
        } else {
            $msg = "[!] Kein Datum im Dateinamen erkannt: $($file.Name)"
            Write-Host "`n$msg" -ForegroundColor DarkGray
            Add-Content -Path $outputPath -Value $msg
        }
    }
}

