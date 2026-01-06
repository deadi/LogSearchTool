1. Analyse the project
2. summarize and update README.md and visualize project structure
3. update an reformat VERSION_2.5.md in a readable format
4. in every logFunctionX.ps1 eliminate reused codeblocks. Implement it in common.ps1 once for modular, reusable code
  foreach ($date in $logDatesyyyyMMdd) {
        $logPath = Join-Path $LogDir "$LogPrefix$date.txt"

        if (-not (Test-Path $logPath)) {
            $msg = "[!] Logdatei nicht gefunden: $logPath"
            Write-Host $msg -ForegroundColor DarkGray
            Add-Content -Path $outputPath -Value $msg
            continue
        }

        foreach ($term in $searchTerms) {
            if ($debugEnabled) {
                Write-Host "[*] Suche '$term' in $logPath" -ForegroundColor Cyan
            }
            Search-Log -LogPath $logPath -SearchTerm $term -ExcludeTerms $excludeTerms
        }
    }
}

