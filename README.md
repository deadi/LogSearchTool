# LogSearchTool

LogSearchTool durchsucht mehrere Windows-Logverzeichnisse in einem definierten Zeitraum und schreibt Treffer gesammelt in eine Ergebnisdatei. Die Logik ist in modulare `logFunctionX.ps1`-Dateien aufgeteilt und wird zentral über `mainLog.ps1` gestartet.

## Projektüberblick

- **Einstiegspunkt:** `mainLog.ps1`
- **Zeitbereich:** `config.ps1` (interaktiv oder per Testparameter)
- **Pfaddefinitionen:** `config.core.ps1`
- **Suchlogik:** `functions/common.ps1`
- **Logquellen:** `functions/logFunction1.ps1` bis `functions/logFunction8.ps1`

## Voraussetzungen

- Windows PowerShell
- Zugriff auf die definierten Log-Verzeichnisse
- Schreibrechte für das Ausgabeverzeichnis (`$outputPath` in `config.core.ps1`)

## Schnellstart

1. Pfade und Präfixe in `config.core.ps1` prüfen/anpassen.
2. Zeitraum in `config.ps1` interaktiv eingeben oder über Parameter setzen.
3. Tool starten:

```powershell
.\mainLog.ps1
```

Optional mit Testparametern (kein interaktiver Prompt):

```powershell
.\mainLog.ps1 -TestStartDate "2025-07-25" -TestEndDate "2025-07-29"
```

## Ausgabe

Treffer werden in die Datei geschrieben, die in `config.core.ps1` unter `$outputPath` definiert ist. Zusätzlich erfolgt eine Konsolenausgabe, die im Debug-Modus (`$debugEnabled = $true`) detaillierter ist.

## Projektstruktur

```text
LogSearchTool/
├── mainLog.ps1                # Einstiegspunkt
├── config.ps1                 # Zeitbereich (interaktiv oder per Param)
├── config.core.ps1            # Pfade, Präfixe, Debug, Ausgabeziel
├── functions/
│   ├── common.ps1             # Zentrale Suchlogik
│   ├── logFunction1.ps1       # DMSQueue
│   ├── logFunction2.ps1       # Macos.Services.Dms
│   ├── logFunction3.ps1       # Macos.WebPks.UI.WebApi
│   ├── logFunction4.ps1       # Printing Logs
│   ├── logFunction5.ps1       # Macos.Services.Deamon
│   ├── logFunction6.ps1       # DMSQueue Fehlerdateien (.pdf.dmsqueue)
│   ├── logFunction7.ps1       # Macos.Shared.Service.Dms
│   └── logFunction8.ps1       # WebApiProxy
└── VERSION_2.5.md             # Änderungsübersicht
```
