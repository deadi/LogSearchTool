# Version 2.5 / 2.4

**Datum:** 2025-10-08  \
**Autor:** AE

- `logFunction7.ps1` hinzugefügt (Shared Service DMS, seit 09.09.25).
- `logFunction8.ps1` hinzugefügt (WebApiProxy, seit Okt 2025).

# Version 2.3

**Datum:** 2025-07-30  \
**Autor:** AE

- Testparameter für Skript-Start ergänzt:

  ```powershell
  .\mainLog.ps1 -TestStartDate "2025-07-25" -TestEndDate "2025-07-29"
  ```

- Aufrufende Datei wird in `common.ps1` ausgewiesen:

  ```powershell
  $caller = $MyInvocation.PSCommandPath
  $callerName = Split-Path $caller -Leaf
  $origin = "[Info] Aufgerufen durch: $callerName"
  ```

# Version 2.2

**Datum:** 2025-07-30  \
**Autor:** AE

- Konfiguration in `config.ps1` (Zeitraum) und `config.core.ps1` (Pfade) aufgeteilt.
- Konsistentes Logging für `Write-Host` und `Add-Content`.

# Version 2.1

**Datum:** 2025-07-29  \
**Autor:** AE

- Neue LogDir-Variable für `.pdf.dmsqueue`-Dateien: `$logDir6 = "C:\Macos\DMSQueue\Error"`.
- Wiederverwendbare Datums-Arrays eingeführt:
  - `$logDatesyyyyMMdd` (z. B. `20250729`)
  - `$logDatesyyyy_MM_dd` (z. B. `2025-07-29`)
- Vorschlagswerte: Standardmäßig gestern bis heute.

# Version 2.0

**Datum:** 2025-06-19  \
**Autor:** AE

- `$daysBack` ermöglicht Zeitspannen relativ zu heute.
- `$excludeTerms` pro `logFunctionX.ps1` ergänzbar.
- `[DEBUG]`-Modus mit `$debugEnabled` ergänzt.
